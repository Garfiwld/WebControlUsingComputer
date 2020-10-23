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

public class UpdateStudentPassword implements Runnable {

    SqlConnect sqlcon = new SqlConnect();
    private static final String UPDATE_SPASSWORD = "Update student set sPassword = ?, sFirstLogin = ? Where StudentID = ?";

    public void updateStudentPassword(String studentid, String spassword) {
        Connection connection = sqlcon.getConnect();
        try (PreparedStatement ps = connection.prepareStatement(UPDATE_SPASSWORD);) {
            ps.setString(1, spassword);
            ps.setString(2, "No");
            ps.setString(3, studentid);
            System.out.println(ps);
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            sqlcon.printSQLException(e);
        }
    }

    int port;

    UpdateStudentPassword(int portNumber) {
        this.port = portNumber;
    }

    @Override
    public void run() {
        ServerSocket Serversocket;
        Socket socket;
        try {
            Serversocket = new ServerSocket(port);
            while (true) {
                socket = Serversocket.accept();
                new EchoThread(socket).start();
            }

        } catch (IOException ex) {
            Logger.getLogger(UpdateStudentPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public class EchoThread extends Thread {

        protected Socket socket;

        public EchoThread(Socket clientSocket) {
            this.socket = clientSocket;
        }

        public void run() {
            try {
                BufferedReader read = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                String StudentID = read.readLine();
                String sPassword = read.readLine();
                updateStudentPassword(StudentID, sPassword);
            } catch (IOException ex) {
                Logger.getLogger(UpdateStudentPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
