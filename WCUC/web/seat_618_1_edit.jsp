<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connect.SqlConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    public void action(String action, String MacAddress, String SeatID) {
        String INSERT_SEAT = "INSERT INTO computer(MacAddress, SeatID) VALUES (?,?) ON DUPLICATE KEY UPDATE MacAddress=?, SeatID=?";
        String UPDATE_SEAT_DELETE = "UPDATE computer SET SeatID= NULL WHERE SeatID = ?";

        SqlConnect sqlConnect = new SqlConnect();
        switch (action) {
            case "edit":
                try (Connection connection = sqlConnect.getConnect();
                        PreparedStatement ps = connection.prepareStatement(INSERT_SEAT)) {
                    ps.setString(1, MacAddress);
                    ps.setString(2, SeatID);
                    ps.setString(3, MacAddress);
                    ps.setString(4, SeatID);
                    System.out.println(ps);
                    ps.executeUpdate();
                    ps.close();
                    connection.close();
                } catch (SQLException e) {
                    sqlConnect.printSQLException(e);
                }
                break;
            case "delete":
                try (Connection connection = sqlConnect.getConnect();
                        PreparedStatement ps = connection.prepareStatement(UPDATE_SEAT_DELETE)) {
                    ps.setString(1, SeatID);
                    System.out.println(ps);
                    ps.executeUpdate();
                    ps.close();
                    connection.close();
                } catch (SQLException e) {
                    sqlConnect.printSQLException(e);
                }
                break;
        }
    }

%>
<%
    int roomX = 20;
    int roomY = 20;

    String MacAddress = request.getParameter("MacAddress");
    String SeatID = request.getParameter("SeatID");
    String action = request.getParameter("action");
    System.out.println(action + " : " + MacAddress + " : " + SeatID);
    if (action != null) {
        action(action, MacAddress, SeatID);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <title>JSP Page</title>
        <style>
            body {
                white-space: nowrap;
                margin-top: 10px;
                margin-left: 0px;
            }
            b:link {text-decoration: none;}
            b:hover span {display:none}
            b:hover:before {content:"✅"}
            b{
                font-size: 50px;
                letter-spacing: -15px;
                line-height: 1;
            }
            .noselect {
                -webkit-touch-callout: none; /* iOS Safari */
                -webkit-user-select: none; /* Safari */
                -khtml-user-select: none; /* Konqueror HTML */
                -moz-user-select: none; /* Old versions of Firefox */
                -ms-user-select: none; /* Internet Explorer/Edge */
                user-select: none; /* Non-prefixed version, currently
                                      supported by Chrome, Edge, Opera and Firefox */
            }
            .modal-footer {
                display: flex;
                justify-content: space-between;
            }
        </style>
    </head>
    <body onload="listseat()">



        <h3 class="text-center">--- WHITEBOARD ---</h3>
        <div id="seat" class="noselect">
            <%                for (int y = 0; y < roomY; y++) {
                    for (int x = 0; x < roomX; x++) {
                        out.print("<b id=" + x + "-" + y + "><span>⬜</span></b>");
                    }
                    out.print("<br>");
                }
            %>
        </div>

        <!-- Modal -->
        <div
            class="modal"
            id="exampleModal"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body mb-0">
                        <form action="seat_618_1_edit.jsp?action=edit" method="post">
                            <div class="md-form form-sm">
                                <input type="text" id="SeatID" name="SeatID" class="form-control form-control-sm" placeholder=" " readonly>
                                <label for="SeatID">SeatID</label>
                            </div>

                            <select id="MacAddress" name="MacAddress" class="mdb-select colorful-select dropdown-secondary md-form" searchable="Search here.." required>
                            </select>
                            <label class="mdb-main-label">MacAddress</label>

                            <div class="text-center mt-1-half">
                                <button type="submit" class="btn btn-secondary mb-2 btn-block">Submit</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div class="align-baseline">
                            <a id="deletebtn" role="button" class="btn btn-danger" aria-pressed="true"><i class="fas fa-trash-alt"></i> Delete</a>
                        </div>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fas fa-times"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/includes/body.jsp" %>
        <script>

            setInterval(listseat, 10 * 1000);
            function listseat() {
                $.ajax({
                    url: "ajax_seat.jsp",
                    type: "GET",
                    data: "action=ajlist",
                    success: function (response) {
                        $.each(response, function (index, value) {
                            if (value.cStatus === 'Online') {
                                document.getElementById(value.SeatID).innerHTML = "<span>👨‍💻</span>";
                            } else {
                                document.getElementById(value.SeatID).innerHTML = "<span>🖥️</span>";
                            }
                        });
                    }
                });
            };

            var divs = document.querySelectorAll("#seat");
            var clickFunction = function (event) {
                var seatid = event.target.attributes['id'].value;
                document.getElementById("SeatID").value = seatid;
                var delbtn = document.getElementById("deletebtn");
                delbtn.setAttribute("href", "seat_618_1_edit.jsp?action=delete&SeatID=" + seatid);
                var select = $('#MacAddress');
                select.find('option').remove();
                $.ajax({
                    url: "ajax_seat.jsp",
                    type: "GET",
                    data: "action=ajinfo&SeatID=" + seatid,
                    success: function (response) {
                        if (response.MacAddress !== null) {
                            select.append('<option disabled selected>' + response.MacAddress + '</option>');
                        }
                    }
                });
                $.ajax({
                    url: "ajax_seat.jsp",
                    type: "GET",
                    data: "action=ajmac",
                    success: function (response) {
                        $.each(response, function (index, value) {
                            $('<option>').text(value).appendTo(select);
                        });
                    }
                });
                $('#exampleModal').modal('toggle');
                $('#exampleModal').modal('show');
            };
            for (var i = 0; i < divs.length; i++) {
                divs[i].addEventListener('click', clickFunction, false);
            }

            // Material Select Initialization
            $(document).ready(function () {
                $('.mdb-select').materialSelect();
            });

        </script>
    </body>
</html>
