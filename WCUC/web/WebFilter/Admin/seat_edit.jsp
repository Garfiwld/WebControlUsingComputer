<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // --- ตั้งค่าขนาดของห้อง ---
    int roomX = 13, roomY = 14;
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/head.jsp" %>
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
            .modal-footer {
                display: flex;
                justify-content: space-between;
            }
        </style>
    </head>
    <body onload="listseat()">
        <div id="seat" class="text-center">
            <div>
                <input type="range" id="imgsize" name="imgsize"
                       min="25" max="75" value="50" step="5">
            </div>
            <%                for (int y = 0; y < roomY; y++) {
                    for (int x = 0; x < roomX; x++) {
                        out.print("<img id=" + x + "-" + y + " src=\"../img/Floor.png\">");
                    }
                    out.print("<br>");
                }
            %>
            <h3>--- WHITEBOARD ---</h3>
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
                        <div class="md-form form-sm">
                            <input type="text" id="SeatID" name="SeatID" class="form-control form-control-sm" placeholder=" " readonly>
                            <label for="SeatID">SeatID</label>
                        </div>
                        <select id="MacAddress" name="MacAddress" class="mdb-select colorful-select dropdown-secondary md-form" searchable="Search here.." required>
                        </select>
                        <label class="mdb-main-label">MacAddress</label>

                        <div class="text-center mt-1-half">
                            <button type="submit" class="btn btn-secondary mb-2 btn-block" onclick="ajedit()">Submit</button>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="align-baseline">
                            <a id="deletebtn" role="button" class="btn btn-danger" aria-pressed="true" onclick="ajdelete()"><i class="fas fa-trash-alt"></i> Delete</a>
                        </div>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fas fa-times"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="includes/body.jsp" %>
        <script>

            // --- อัพเดทสถานะ cStatus และแสดงผลบนเว็บ ---
            setInterval(listseat, 10 * 1000);
            function listseat() {
                $.ajax({
                    url: "../ajax_seat.jsp",
                    type: "GET",
                    data: "action=ajlist",
                    success: function (response) {
                        $.each(response, function (index, value) {
                            document.getElementById(value.SeatID).src = '../img/' + value.cStatus + '.png';
                        });
                    }
                });
            }

            // --- ปรับขนาด ICON บยเว็บ ---
            var imgsize = document.getElementById("imgsize");
            imgsize.oninput = function () {
                var allimg = <% out.println(roomX * roomY);%>;
                for (var i = 0; i < allimg; i++) {
                    document.images[i].style.width = this.value + "px";
                    document.images[i].style.height = this.value + "px";
                }
            };

            // --- แสดงหน้าตางการตั้งค่าตอมพิวเตอร์ ---
            var oldMac;
            var clickFunction = function (event) {
                var seatid = event.target.attributes['id'].value;
                document.getElementById("SeatID").value = seatid;
                var select = $('#MacAddress');
                select.find('option').remove();
                // --- รับค่า MacAddress ที่ถูกใช้งานมาแสดงผล ---
                oldMac = null;
                $.ajax({
                    url: "../ajax_seat.jsp",
                    type: "GET",
                    data: "action=ajinfo&SeatID=" + seatid,
                    success: function (response) {
                        oldMac = response.MacAddress;
                        if (response.MacAddress !== null) {
                            select.append('<option selected disabled value="' + oldMac + '">' + oldMac + '</option>');
                        }
                    }
                });
                // --- รับค่า MacAddress ที่ยังไม่ถูกใช้งานมาแสดงผล
                $.ajax({
                    url: "../ajax_seat.jsp",
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
            for (var i = 0; i < document.images.length; i++) {
                document.images[i].addEventListener('click', clickFunction, false);
            }

            // Material Select Initialization
            $(document).ready(function () {
                $('.mdb-select').materialSelect();
            });

            function ajedit() {
                var SeatID = document.getElementById("SeatID").value;
                var MacAddress = document.getElementById("MacAddress").value;
                console.log(oldMac + ' : ' + MacAddress + ' : ' + SeatID);
                $.ajax({
                    url: "../ajax_seat.jsp",
                    type: "GET",
                    data: {action: 'ajedit', oldMac: oldMac, MacAddress: MacAddress, SeatID: SeatID}
                });
                document.getElementById(SeatID).src = '../img/Offline.png';
                $('#exampleModal').modal('hide');
            }
            function ajdelete() {
                var SeatID = document.getElementById("SeatID").value;
                $.ajax({
                    url: "../ajax_seat.jsp",
                    type: "GET",
                    data: {action: 'ajdelete', SeatID: SeatID}
                });
                document.getElementById(SeatID).src = '../img/Floor.png';
                $('#exampleModal').modal('hide');
            }

        </script>
    </body>
</html>
