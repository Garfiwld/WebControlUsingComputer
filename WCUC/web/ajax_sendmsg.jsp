<%@page import="java.util.Arrays"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
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
    Gson gson = new Gson();

    String SELECT_ALL_COMPUTER = "SELECT IPv4 FROM computer WHERE IPv4 IS NOT NULL";

    String ipv4, action, casesend, room;
    ipv4 = request.getParameter("IPv4");
    action = request.getParameter("Action");
    casesend = request.getParameter("casesend");
    room = request.getParameter("room");
    switch (casesend) {
        case "single":
            out.println(sendMssage.Send(ipv4, action));
            break;
        case "all":
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement ps = connection.prepareStatement(SELECT_ALL_COMPUTER);) {
                System.out.println(ps);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    sendMssage.Send(rs.getString("IPv4"), action);
                }
                out.println(true);
                ps.close();
                connection.close();
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
                out.println(false);
            }
            break;
        case "InternetOn":
            out.println(sendMssage.SendInternetContol(casesend, room));
            break;
        case "InternetOff":
            out.println(sendMssage.SendInternetContol(casesend, room));
            break;
    }
%>