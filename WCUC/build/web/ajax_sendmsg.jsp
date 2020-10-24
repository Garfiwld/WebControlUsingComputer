<%@page 
    contentType="application/json" pageEncoding="UTF-8"
    import="java.io.IOException"
    import="java.io.PrintWriter"
    import="java.sql.SQLException"
    import="java.sql.ResultSet"
    import="java.sql.PreparedStatement"
    import="java.sql.Connection"
    import="java.net.Socket"
    import="connect.SqlConnect"
    %>

<%
    SqlConnect sqlConnect = new SqlConnect();
    String SELECT_ALL_COMPUTER = "SELECT * FROM computer LEFT JOIN student ON computer.StudentID = student.StudentID WHERE SeatID IS NOT NULL";

    String ipv4, action;
    ipv4 = request.getParameter("IPv4");
    action = request.getParameter("Action");
    String volume = request.getParameter("volume");
    switch (volume) {
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
%>