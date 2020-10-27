<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!

%>
<%
    int roomX = 13;
    int roomY = 13;
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body {
                white-space: nowrap;
                margin-top: 10px;
                margin-left: 0px;
            }
            * {
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
                background: white;
            }
            img:hover {
                -webkit-transform: scale(0.9);
                transform: scale(0.9);
            }
        </style>
    </head>
    <body onload="listseat()">
        <div class="text-center" style="height: 55px;">
            <div>
                <h3 style=" margin-bottom: -15px; ">--- WHITEBOARD ---</h3>
                <input type="range" id="imgsize" name="imgsize"
                       min="25" max="75" value="50" step="5" style="height:40px">
            </div>
        </div>
        <div id="seat" class="text-center">
            <%                for (int y = 0; y < roomY; y++) {
                    for (int x = 0; x < roomX; x++) {
                        out.print("<img id=" + x + "-" + y + " src=\"img/Floor.png\">");
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
                    <div id="seatcontrol">
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
        </div>
        <%@include file="/includes/body.jsp" %>
        <script>
            // --- ปรับขนาด ICON บยเว็บ ---
            var imgsize = document.getElementById("imgsize");
            imgsize.oninput = function () {
                var allimg = <% out.println(roomX * roomY);%>;
                for (var i = 0; i < allimg; i++) {
                    document.images[i].style.width = this.value + "px";
                    document.images[i].style.height = this.value + "px";
                }
            };
            // --- รับค่าจาก ajax มาอัพเดทสถานะคอมพิวเตอร์ ---
            function listseat() {
                $.ajax({
                    url: "ajax_seat.jsp",
                    type: "GET",
                    data: "action=ajlist",
                    success: function (response) {
                        $.each(response, function (index, value) {
                            var atSeatID = document.getElementById(value.SeatID);
                            if (value.cStatus === 'Login') {
                                atSeatID.src = 'img/Login.png';
                                atSeatID.addEventListener('click', setinfo, false);
                            } else if (value.cStatus === 'Online') {
                                atSeatID.src = 'img/Online.png';
                                atSeatID.addEventListener('click', setinfo, false);
                            } else {
                                atSeatID.src = 'img/Offline.png';
                                atSeatID.addEventListener('click', setinfo, false);
                            }
                        });
                    }
                });
            }
            // --- ทำการเรียกใช้ฟังก์ชั่น listseat ทุก 10 วินาที
            setInterval(listseat, 10 * 1000);
            // --- ajax รับข้อมูลของ SeatID ที่เลือกมาแสดง
            function setinfo(event) {
                var seatid = event.target.attributes['id'].value;
                document.getElementById("seatidform").value = seatid;
                var stdinfo = document.getElementById("studentinfo");
                stdinfo.style.display = "none";
                var seatcontrol = document.getElementById('seatcontrol');
                seatcontrol.style.display = "none";
                $.ajax({
                    url: "ajax_seat.jsp",
                    type: "GET",
                    data: "action=ajinfo&SeatID=" + seatid,
                    success: function (response) {
                        document.getElementById("macaddress").value = response.MacAddress;
                        document.getElementById("ipv4").value = response.IPv4;
                        if (response.IPv4 !== undefined) {
                            seatcontrol.style.display = "block";
                        }
                        if (response.StudentID !== undefined) {
                            stdinfo.style.display = "block";
                            document.getElementById("studentid").value = response.StudentID;
                            document.getElementById("sname").value = response.sFirstname + ' ' + response.sLastname;
                        }
                    }
                });
                $('#exampleModal').modal('toggle');
                $('#exampleModal').modal('show');
            }
            // --- ส่งการควยคุมจาก SeatID ที่เลือก ---
            function singleSeat(action) {
                var str = ' SeatID ' + document.getElementById("seatidform").value + ' : ' + document.getElementById(action).innerHTML;
                toastr.success(str + 'Sended please wait...');
                $.ajax({
                    url: "ajax_sendmsg.jsp",
                    type: "GET",
                    data: "casesend=single&Action=" + document.getElementById(action).name + "&IPv4=" + document.getElementById("ipv4").value,
                    success: function (response) {
                        response ? toastr.success(str + ' Success.') : toastr.error(str + ' Fail.');
                    }
                });
            }
            // --- ตั้งค่า toastr ---
            $('#btnTopLeft').on('click', );
            // --- jQuery click and drag scroll ---
            const slider = document.querySelector('#seat');
            var curDown = false,
                    curYPos = 0,
                    curXPos = 0;
            slider.addEventListener('mousemove', (m) => {
                if (curDown) {
                    window.scrollBy(curXPos - m.pageX, curYPos - m.pageY)
                }
            });
            slider.addEventListener('mousedown', (m) => {
                curYPos = m.pageY;
                curXPos = m.pageX;
                curDown = true;
            });
            slider.addEventListener('mouseup', () => {
                curDown = false;
            });
        </script>
    </body>
</html>
