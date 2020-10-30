<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.TimerTask"%>
<%@page import="java.util.Timer"%>
<%@include file="SendMessage.jsp" %>
<%@include file="ReciveMessage.jsp" %>
<%@include file="SqlConnect.jsp" %>
<%
    StartServer start = new StartServer();
    start.openServer();
    response.sendRedirect("login.jsp");
%>
<%!    public class StartServer {

        public void openServer() {
            ReciveMessage reciveMessage = new ReciveMessage();
            reciveMessage.start();

            Timer t = new Timer();
            t.schedule(new TimerTask() {
                @Override
                public void run() {
                    HeartBeat();
                }
            }, 0, 5 * 1000);
        }

        SendMessage sendMessage = new SendMessage();
        SqlConnect sqlcon = new SqlConnect();
        private static final String SELECT_COMPUTER_ONLINE = "SELECT MacAddress, IPv4 FROM computer WHERE IPv4 IS NOT NULL";
        private static final String UPDATE_OFFLINE = "UPDATE computer SET IPv4 = NULL, cStatus = 'Offline', StudentID = NULL WHERE MacAddress = ?";

        public void HeartBeat() {
            Connection connection = sqlcon.getConnect();
            try (PreparedStatement ps = connection.prepareStatement(SELECT_COMPUTER_ONLINE);) {
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String macaddress = rs.getString("MacAddress");
                        String ipv4 = rs.getString("IPv4");
                        if (!sendMessage.Send(ipv4, "HeartBeat")) {
                            updateOffine(macaddress);
                        }
                    }
                    rs.close();
                }
                ps.close();
                connection.close();
            } catch (SQLException e) {
                sqlcon.printSQLException(e);
            }
        }

        public void updateOffine(String macaddress) {
            Connection connection = sqlcon.getConnect();
            try (PreparedStatement ps = connection.prepareStatement(UPDATE_OFFLINE);) {
                ps.setString(1, macaddress);
                System.out.println(ps);
                ps.executeUpdate();
                ps.close();
                connection.close();
            } catch (SQLException e) {
                sqlcon.printSQLException(e);
            }
        }

    }
%>