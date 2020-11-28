<%@page import="Server.Server"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Server.SendMessage"%>
<%@page import="Server.SqlConnect"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.net.Socket"%>
<%
    SqlConnect sqlConnect = new SqlConnect();
    SendMessage sendMssage = new SendMessage();

    String SELECT_ALL_COMPUTER = "SELECT IPv4 FROM computer WHERE IPv4 IS NOT NULL";

    String ipv4, action, casesend, room = "621";
    ipv4 = request.getParameter("IPv4");
    action = request.getParameter("Action");
    casesend = request.getParameter("casesend");
    switch (casesend) {
        case "single":
            out.println(sendMssage.Send(ipv4, action));
            break;
        case "all":
            if (action.equals("LockScreen") || action.equals("UnlockScreen")) {
                Server.screenStatus = action;
            }
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement ps = connection.prepareStatement(SELECT_ALL_COMPUTER);) {
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