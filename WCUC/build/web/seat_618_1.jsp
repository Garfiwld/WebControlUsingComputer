<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!

%>
<%
    int roomX = 20;
    int roomY = 20;
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                white-space: nowrap;
                margin-top: 10px;
                margin-left: 0px;
            }
            c:link {text-decoration: none;}
            c:hover span {display:none}
            c:hover:before {content:"✅"}
            c,b{
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
        </style>
    </head>
    <body onload="listseat()">
        <h3 class="text-center">--- WHITEBOARD ---</h3>
        <div id="seat" class="noselect">
            <%                for (int y = 0; y < roomY; y++) {
                    for (int x = 0; x < roomX; x++) {
                        out.print("<b id=" + x + "-" + y + ">⬜</b>");
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
                        <div id="studentinfo">
                            <div class="md-form form-sm"><input type="text" id="studentid" class="form-control form-control-sm" placeholder=" " readonly><label for="studentid">StudentID</label></div>
                            <div class="md-form form-sm"><input type="text" id="sname" class="form-control form-control-sm" placeholder=" " readonly><label for="sname">Name</label></div>
                        </div>
                        <div class="md-form form-sm">
                            <input type="text" id="seatidform" class="form-control form-control-sm" placeholder=" " readonly>
                            <label for="seatidform">SeatID</label>
                        </div>

                        <div class="md-form form-sm">
                            <input type="text" id="macaddress" class="form-control form-control-sm" placeholder=" " readonly>
                            <label for="macaddress">MacAddress</label>
                        </div>

                        <div class="md-form form-sm">
                            <input type="text" id="ipv4" class="form-control form-control-sm" placeholder=" " readonly>
                            <label for="ipv4">IPv4</label>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <div class="mx-auto">
                            <a id="shutdownbtn" name="Shutdown" role="button" class="btn btn-danger" onclick="singleSeat('shutdownbtn')"><i class="fas fa-power-off"></i></a>
                            <a id="restartbtn" name="Restart" role="button" class="btn btn-warning" onclick="singleSeat('restartbtn')"><i class="fas fa-sync"></i></a>
                            <a id="lockbtn" name="LockScreen" role="button" class="btn btn-dark" onclick="singleSeat('lockbtn')"><i class="fas fa-user-lock"></i></a>
                            <a id="unlockbtn" name="UnlockScreen" role="button" class="btn btn-dark-green" onclick="singleSeat('unlockbtn')"><i class="fas fa-user-unlock"></i></a>
                        </div>
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
                                var el = document.getElementById(value.SeatID);
                                el.outerHTML = '<c id="' + value.SeatID + '" onclick="seatinfo(event)"><span>👨‍💻</span></c>';
//                                document.getElementById(value.SeatID).innerHTML = '<span>👨‍💻</span>';
                            } else {
                                var el = document.getElementById(value.SeatID);
                                el.outerHTML = '<c id="' + value.SeatID + '" onclick="seatinfo(event)"><span>🖥️</span></c>';
//                                document.getElementById(value.SeatID).innerHTML = '<span>🖥️</span>';
                            }
                        });
                    }
                });
            }
            ;


            function seatinfo(event) {
                var seatid = event.target.attributes['id'].value;
                document.getElementById("seatidform").value = seatid;
//                var select = $('#studentinfo');
//                select.find('div').remove();
                var z = document.getElementById("studentinfo");
                z.style.display = "none";
                $.ajax({
                    url: "ajax_seat.jsp",
                    type: "GET",
                    data: "action=ajinfo&SeatID=" + seatid,
                    success: function (response) {
                        document.getElementById("macaddress").value = response.MacAddress;
                        document.getElementById("ipv4").value = response.IPv4;
                        if (response.StudentID !== "") {
                            z.style.display = "block";
//                            select.append('<div class="md-form form-sm"><input value="' + response.StudentID + '" type="text" id="studentid" class="form-control form-control-sm" readonly><label for="studentid">StudentID</label></div>');
//                            select.append('<div class="md-form form-sm"><input value="' + response.sFirstname + ' ' + response.sLastname + '" type="text" id="sname" class="form-control form-control-sm" readonly><label for="sname">Name</label></div>');
                            document.getElementById("studentid").value = response.StudentID;
                            document.getElementById("sname").value = response.sFirstname + ' ' + response.sLastname;
                        }
                    }
                });
                $('#exampleModal').modal('toggle');
                $('#exampleModal').modal('show');
            }
            ;


            function singleSeat(action) {
                var str = ' SeatID ' + document.getElementById("seatidform").value + ' : ' + document.getElementById(action).innerHTML;
                toastr.success(str + ' Send success.');
                $.ajax({
                    url: "ajax_sendmsg.jsp",
                    type: "GET",
                    data: "volume=single&Action=" + document.getElementById(action).name + "&IPv4=" + document.getElementById("ipv4").value,
                    success: function (response) {

                    }
                });
            }

            function net(action) {
                console.log(action);
            }

            //popup buttons
            $('#btnTopLeft').on('click', );
        </script>
    </body>
</html>
