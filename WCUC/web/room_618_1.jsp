<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <title>Room Control</title>
        <style>
            iframe {
                margin-top: 5px;
                height: 93vh;
                width: 100%;
                border: 5px solid #000;
            }
        </style>
    </head>
    <body class="fixed-sn">
        <%@include file="/includes/navbar.jsp" %>
        <main>
            <div class="container-fluid mt-3">
                <div class="card">

                    <div class="card-body">
                        <!--Header -->
                        <div class="form-header purple-gradient accent-1">
                            <h3>ROOM 618/1</h3>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group mb-1">
                                    <a id="shutdownbtn" name="Shutdown" role="button" class="btn btn-danger btn-block" onclick="allSeat('shutdownbtn')"><i class="fas fa-power-off"></i> Shutdown</a>
                                </div>
                                <div class="form-group">
                                    <a id="restartbtn" name="Restart" role="button" class="btn btn-warning btn-block" onclick="allSeat('restartbtn')"><i class="fas fa-sync"></i> Restart</a>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group mb-1">
                                    <a id="netonbtn" name="InternetOn" role="button" class="btn btn-primary btn-block" onclick="net('netonbtn')"><i class="fas fa-signal-alt"></i> Internet : ON</a>
                                </div>
                                <div class="form-group">
                                    <a id="neroffbtn" name="InternetOff" role="button" class="btn btn-primary btn-block" onclick="net('neroffbtn')"><i class="fas fa-signal-alt-slash"></i> Internet : OFF</a>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group mb-1">
                                    <a id="lockbtn" name="LockScreen" role="button" class="btn btn-dark btn-block" onclick="allSeat('lockbtn')"><i class="fas fa-user-lock"></i> Lock Screen</a>
                                </div>
                                <div class="form-group">
                                    <a id="unlockbtn" name="UnlockScreen" role="button" class="btn btn-dark-green btn-block" onclick="allSeat('unlockbtn')"><i class="fas fa-user-unlock"></i> Unlock Screen</a>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="row">
                    <iframe src="seat_618_1.jsp"/>"></iframe>
                </div>
            </div>
        </main>
        <%@include file="/includes/body.jsp" %>
        <script>
            function allSeat(action) {
                var action = document.getElementById(action);
                toastr.success(action.innerHTML + 'Sended please wait...');
                $.ajax({
                    url: "ajax_sendmsg.jsp",
                    type: "GET",
                    data: "casesend=all&Action=" + action.name,
                    success: function (response) {
                        response ? toastr.success(action.innerHTML + ' Success.') : toastr.error(action.innerHTML + ' Fail.');
                    }
                });
            }

            function net(action) {
                var action = document.getElementById(action);
                toastr.success(action.innerHTML + 'Sended please wait...');
                $.ajax({
                    url: "ajax_sendmsg.jsp",
                    type: "GET",
                    data: "&casesend=" + action.name + "&room=618_1",
                    success: function (response) {
                        response ? toastr.success(action.innerHTML + ' Success.') : toastr.error(action.innerHTML + ' Fail.');
                    }
                });
            }

            //popup buttons
            $('#btnTopLeft').on('click', );
        </script>
    </body>
</html>