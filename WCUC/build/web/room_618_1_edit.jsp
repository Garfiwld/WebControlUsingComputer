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
                            <div class="col-md-7">
                                <div class="form-row">

                                    <div class="form-group col-sm-4">                
                                        <a name="shutdownbtn" id="shutdownbtn" class="btn btn-danger btn-block" href="#" role="button"><i class="fas fa-power-off"></i> Shutdown</a>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <a name="restartbtn" id="restartbtn" class="btn btn-warning btn-block" href="#" role="button"><i class="fas fa-sync"></i> Restart</a>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <a name="lockbtn" id="lockbtn" class="btn btn-primary btn-block" href="#" role="button"><i class="fas fa-user-lock"></i> Lock Screen</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-row">
                                    <div class="form-group col-sm-6">
                                        <a name="internetonbtn" id="internetbtn" class="btn btn-primary btn-block" href="#" role="button"><i class="fas fa-signal-alt"></i> Internet : ON</a>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <a name="internetoffbtn" id="internetbtn" class="btn btn-primary btn-block" href="#" role="button"><i class="fas fa-signal-alt-slash"></i> Internet : OFF</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="row">
                    <iframe src="seat_618_1_edit.jsp"/>"></iframe>
                </div>
            </div>
        </main>
        <%@include file="/includes/body.jsp" %>
    </body>
</html>