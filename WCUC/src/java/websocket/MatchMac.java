package websocket;

import connect.SqlConnect;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MatchMac implements Runnable {

    SqlConnect sqlcon = new SqlConnect();
    private static final String UPDATE_MATCHMAC = "INSERT INTO computer (MacAddress, IPv4) VALUES(?, ?) ON DUPLICATE KEY UPDATE IPv4 = ?";

    public void updateMarchmac(String ipAdress, String macAdress) {
        Connection connection = sqlcon.getConnect();
        try (PreparedStatement ps = connection.prepareStatement(UPDATE_MATCHMAC);) {
            ps.setString(1, macAdress);
            ps.setString(2, ipAdress);
            ps.setString(3, ipAdress);
            System.out.println(ps);
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            sqlcon.printSQLException(e);
        }

    }

    int portNumber;

    public MatchMac(int portNumber) {
        this.portNumber = portNumber;
    }

    @Override
    public void run() {
        try {
            ServerSocket Serversocket = new ServerSocket(this.portNumber);
            while (true) {
                Socket socket = Serversocket.accept();
                new EchoThread(socket).start();
            }
        } catch (IOException e) {

        }
    }

    public class EchoThread extends Thread {

        protected Socket clientSocket;

        EchoThread(Socket clientSocket) {
            this.clientSocket = clientSocket;
        }

        public void run() {
            try {
                BufferedReader read = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                String ipv4 = read.readLine();
                String macadress = read.readLine();
                updateMarchmac(ipv4, macadress);
            } catch (IOException ex) {
                Logger.getLogger(MatchMac.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
