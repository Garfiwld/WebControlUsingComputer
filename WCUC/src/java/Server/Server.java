package Server;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Timer;
import java.util.TimerTask;

public class Server {

    SendMessage sendMessage = new SendMessage();
    SqlConnect sqlcon = new SqlConnect();

    public void Start() {
        System.out.println("xxxxxxxxxxxxxxxxxx");
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
