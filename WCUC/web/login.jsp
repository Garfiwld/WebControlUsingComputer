<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Server.SqlConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Room Control</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="img/favicon.png" type="image/png" rel="icon">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <style>
            html,
            body,
            header,
            .view {
                height: 100%;
            }
            @media (min-width: 560px) and (max-width: 740px) {
                html,
                body,
                header,
                .view {
                    height: 650px;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                html,
                body,
                header,
                .view  {
                    height: 650px;
                }
            }
            .login-page .intro-2 {
                background: url(img/loginbg.jpg) center center no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body class="login-page">
        <!-- Intro Section -->
        <section class="view intro-2">
            <div class="mask rgba-stylish-strong h-100 d-flex justify-content-center align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-6 col-md-10 col-sm-12 mx-auto mt-5">

                            <!-- Form with header -->
                            <div class="card wow fadeIn" data-wow-delay="0.3s">
                                <div class="card-body">
                                    <!-- Header -->
                                    <div class="form-header purple-gradient">
                                        <h3 class="font-weight-500 my-2 py-1"><i class="fas fa-sign-in-alt"></i> Login</h3>
                                    </div>
                                    <form action="login.jsp" method="POST">
                                        <!-- Body -->
                                        <div class="md-form">
                                            <i class="fas fa-user prefix white-text"></i>
                                            <input type="text" name="teacherid" id="orangeForm-name" class="form-control" required>
                                            <label for="orangeForm-name">Your name</label>
                                        </div>

                                        <div class="md-form">
                                            <i class="fas fa-lock prefix white-text"></i>
                                            <input type="password" name="tpassword" id="orangeForm-pass" class="form-control">
                                            <label for="orangeForm-pass">Your password</label>
                                        </div>
                                        <div class="text-center">
                                            <a style="color: white;" onclick="shownewpass()">New Password</a>
                                        </div>
                                        <div id="newpassworddiv" style="display: none;">
                                            <div class="md-form form-sm">
                                                <i class="fas fa-key prefix white-text"></i>
                                                <input type="password" id="newpassword" name="newpassword" class="form-control form-control-sm" onchange="validatePassword()">
                                                <label for="newpassword">New Password</label>
                                            </div>
                                            <div class="md-form form-sm">
                                                <i class="fas fa-key prefix white-text"></i>
                                                <input type="password" id="confirm_password" class="form-control form-control-sm" onkeyup="validatePassword()">
                                                <label for="confirm_password">Confirm New Password</label>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn purple-gradient btn-lg mb-4">Submit</button>
                                        </div>
                                    </form>

                                    <%
                                        if (null != session.getAttribute("errorMessage")) {
                                    %>

                                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <%
                                            out.print(session.getAttribute("errorMessage"));
                                        %>
                                    </div>

                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <!-- Form with header -->

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Intro Section -->

        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script>

                                                    new WOW().init();

                                                    function shownewpass() {

                                                        var stdinfo = document.getElementById("newpassworddiv");
                                                        stdinfo.style.display = "block";
                                                    }


                                                    function validatePassword() {
                                                        var newpassword = document.getElementById("newpassword")
                                                        var confirm_password = document.getElementById("confirm_password");
                                                        if (newpassword.value != confirm_password.value) {
                                                            confirm_password.setCustomValidity("Passwords Don't Match");
                                                        } else {
                                                            confirm_password.setCustomValidity('');
                                                        }
                                                    }
        </script>
    </body>
</html>

<%
    if (session.getAttribute("teacherid") == null) {
        session.setAttribute("errorMessage", null);
        if (request.getParameter("teacherid") != null) {
            String teacherid = request.getParameter("teacherid");
            String tpassword = request.getParameter("tpassword");
            String newpassword = request.getParameter("newpassword");
            teacherid = teacherid.toUpperCase();

            if (validate(teacherid, tpassword)) {
                session.setAttribute("tfirstname", gettFirstname());
                session.setAttribute("tlastname", gettLastname());
                session.setAttribute("trole", gettRole());
                response.sendRedirect("WebFilter/room.jsp");
                if (newpassword != "") {
                    newpassword(teacherid, newpassword);
                }
            } else {
                session.setAttribute("errorMessage", "Invalid Username or Password");
                response.sendRedirect("login.jsp");
            }
        }
    } else {
        response.sendRedirect("room.jsp");
    }
%>

<%!
    SqlConnect sqlcon = new SqlConnect();

    private final String SELECT_TEACHER = "SELECT * FROM teacher WHERE TeacherID = ? and tPassword = ? ";
    private final String UPDATE_PASSWORD_TEACHER = "UPDATE teacher SET tPassword=? WHERE TeacherID=?";

    public void newpassword(String teacherid, String newpassword) {
        try (Connection connection = sqlcon.getConnect();
                PreparedStatement ps = connection.prepareStatement(UPDATE_PASSWORD_TEACHER)) {
            ps.setString(1, newpassword);
            ps.setString(2, teacherid);
            ps.executeUpdate();
        } catch (SQLException e) {
            sqlcon.printSQLException(e);
        }
    }

    public boolean validate(String teacherid, String tpassword) {
        boolean status = false;
        try (Connection connection = sqlcon.getConnect();
                PreparedStatement ps = connection.prepareStatement(SELECT_TEACHER)) {
            ps.setString(1, teacherid);
            ps.setString(2, tpassword);
            ResultSet rs = ps.executeQuery();
            if (status = rs.next()) {
                tFirstname = rs.getString("tFirstname");
                tLastname = rs.getString("tLastname");
                tRole = rs.getString("tRole");
            }
        } catch (SQLException e) {
            sqlcon.printSQLException(e);
        }
        return status;
    }

    String tFirstname, tLastname, tRole;

    public String gettFirstname() {
        return tFirstname;
    }

    public String gettLastname() {
        return tLastname;
    }

    public String gettRole() {
        return tRole;
    }
%>