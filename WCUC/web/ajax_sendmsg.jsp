<%@page contentType="application/json" pageEncoding="UTF-8"%>
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
    String SELECT_ALL_COMPUTER = "SELECT IPv4 FROM computer WHERE IPv4 IS NOT NULL";

    String ipv4, action, casesend, room;
    ipv4 = request.getParameter("IPv4");
    action = request.getParameter("Action");
    casesend = request.getParameter("casesend");
    room = request.getParameter("room");
    switch (casesend) {
        case "single":
            SendMsg(ipv4, action);
            break;
        case "all":
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement ps = connection.prepareStatement(SELECT_ALL_COMPUTER);) {
                System.out.println(ps);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    SendMsg(rs.getString("IPv4"), action);
                }
                ps.close();
                connection.close();
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
        case "InternetOn":
            SendInternetContol(casesend, room);
            break;
        case "InternetOff":
            SendInternetContol(casesend, room);
            break;
    }
%>

<%!
    public void SendMsg(String ipv4, String msg) {

        try {
            Socket send = new Socket(ipv4, 26103);
            PrintWriter out = new PrintWriter(send.getOutputStream());
            out.println(msg);
            out.flush();
        } catch (IOException ex) {
            System.out.println("Client Offline IPv4 : " + ipv4);
        }
    }

    public boolean SendInternetContol(String msg, String room) {
        try {
            Socket send = new Socket("192.168.1.112", 26104);
            PrintWriter out = new PrintWriter(send.getOutputStream());
            out.println(msg);
            out.println(room);
            out.flush();
            return true;
        } catch (IOException ex) {
            System.out.println("SendInternetContol Offline");
            return false;
        }
    }
%>