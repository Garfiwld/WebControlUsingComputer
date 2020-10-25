<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connect.SqlConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int roomX = 20;
    int roomY = 20;

    String MacAddress = request.getParameter("MacAddress");
    String oldMac = request.getParameter("oldMac");
    if (oldMac == null) {
        oldMac = "New";
    }
    String SeatID = request.getParameter("SeatID");
    String action = request.getParameter("action");
    System.out.println(action + " : " + MacAddress + " : " + SeatID);
    if (action != null) {
        action(action, oldMac, MacAddress, SeatID);
    }

%>
<%!
    public void action(String action, String oldMac, String MacAddress, String SeatID) {

        String UPDATE_SEATID_NULL = "UPDATE computer SET SeatID = NULL WHERE MacAddress = ?";
        String UPDATE_SEATID_VALUE = "UPDATE computer SET SeatID = ? WHERE  MacAddress  = ?";
        String UPDATE_SEAT_DELETE = "UPDATE computer SET SeatID = NULL WHERE SeatID = ?";

        SqlConnect sqlConnect = new SqlConnect();
        switch (action) {
            case "edit":
                try (Connection connection = sqlConnect.getConnect()) {
                    PreparedStatement ps = connection.prepareStatement(UPDATE_SEATID_NULL);
                    ps.setString(1, oldMac);
                    System.out.println(ps);
                    ps.executeUpdate();
                    ps.close();
                    PreparedStatement ps2 = connection.prepareStatement(UPDATE_SEATID_VALUE);
                    ps2.setString(1, SeatID);
                    ps2.setString(2, MacAddress);
                    System.out.println(ps);
                    ps2.executeUpdate();
                    ps2.close();
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
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <style>
            body {
                white-space: nowrap;
                margin-top: 10px;
                margin-left: 10px;
            }
            .noselect {
                -webkit-touch-callout: none; 
                -webkit-user-select: none; 
                -khtml-user-select: none; 
                -moz-user-select: none; 
                -ms-user-select: none; 
                user-select: none; 
            }
            img {
                -webkit-user-drag: none;
                -khtml-user-drag: none;
                -moz-user-drag: none;
                -o-user-drag: none;
                user-drag: none;
                width: 50px;
                height: 50px;
                margin: 0.5px;
            }
            img:hover {
                -webkit-transform: scale(0.9);
                transform: scale(0.9);
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
                        out.print("<img id=" + x + "-" + y + " src=\"img/floor.png\">");
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
                        <form id="formAction" action="seat_618_1_edit.jsp?action=edit" method="post">
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
                            if (value.cStatus === 'Login') {
                                document.getElementById(value.SeatID).src = 'img/user.png';
                            } else if(value.cStatus === 'Online') {
                                document.getElementById(value.SeatID).src = 'img/on.png';
                            }else{
                                document.getElementById(value.SeatID).src = 'img/off.png';
                            }
                        });
                    }
                });
            }
            ;

            var divs = document.querySelectorAll("#seat");
            var clickFunction = function (event) {
                var seatid = event.target.attributes['id'].value;
                document.getElementById("SeatID").value = seatid;
                // setAttribute > href > ปุ่ม Delete
                var delbtn = document.getElementById("deletebtn");
                delbtn.setAttribute("href", "seat_618_1_edit.jsp?action=delete&SeatID=" + seatid);
                var select = $('#MacAddress');
                select.find('option').remove();
                $.ajax({
                    url: "ajax_seat.jsp",
                    type: "GET",
                    data: "action=ajinfo&SeatID=" + seatid,
                    success: function (response) {
                        document.getElementById("formAction").action += '&oldMac=' + response.MacAddress;
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
