<%@page import="Server.Server"%>
<%
    Server server = new Server();
    server.Start();
    response.sendRedirect("login.jsp");
%>