<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="websocket.SendMssage"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.net.Socket"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connect.SqlConnect"%>

<%
    SqlConnect sqlConnect = new SqlConnect();
    SendMssage sendMssage = new SendMssage();
    String SELECT_ALL_COMPUTER = "SELECT IPv4 FROM computer WHERE IPv4 IS NOT NULL";

    String ipv4, action, casesend, room;
    ipv4 = request.getParameter("IPv4");
    action = request.getParameter("Action");
    casesend = request.getParameter("casesend");
    room = request.getParameter("room");
    switch (casesend) {
        case "single":
            sendMssage.Send(ipv4, action);
            break;
        case "all":
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement ps = connection.prepareStatement(SELECT_ALL_COMPUTER);) {
                System.out.println(ps);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    sendMssage.Send(rs.getString("IPv4"), action);
                }
                ps.close();
                connection.close();
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
        case "InternetOn":
            sendMssage.SendInternetContol(casesend, room);
            break;
        case "InternetOff":
            sendMssage.SendInternetContol(casesend, room);
            break;
    }
%>