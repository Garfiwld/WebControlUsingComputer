<%@page import="Server.Server"%>
<%

    if (!Server.started) {
        Server server = new Server();
        server.Start();
        Server.started = true;
    }
    response.sendRedirect("login.jsp");
%>