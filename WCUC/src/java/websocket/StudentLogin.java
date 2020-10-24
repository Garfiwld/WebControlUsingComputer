package websocket;

import connect.SqlConnect;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StudentLogin implements Runnable  {

    SendMssage sendMssage = new SendMssage();
    
    public StudentLogin() {
        
    }
    @Override
    public void run() {
        try {
            ServerSocket Serversocket = new ServerSocket(25101);
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
                while (true) {
                    BufferedReader read = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                    String action = read.readLine();
                    System.out.println("action : " + action);
                    switch (action) {
                        case "MatchMac":
                            String ipv4 = read.readLine();
                            String macadress = read.readLine();
                            updateMarchmac(ipv4, macadress);
                            break;
                        case "Login":
                            String studentid = read.readLine();
                            String spassword = read.readLine();
                            String macaddress = read.readLine();
                            ipv4 = read.readLine();
                            List<String> result = studentLogin(studentid, spassword);
                            Socket soket = new Socket(ipv4, 26101);
                            PrintWriter out = new PrintWriter(soket.getOutputStream());
                            if (!result.isEmpty()) {
                                out.println("LoginSuccess");
                                String sfirstlogin = result.get(4);
                                out.println(sfirstlogin);
                                out.flush();
                                studentOnline(studentid, macaddress);
                            } else {
                                out.println("LoginFailed");
                                out.flush();
                            }
                            break;
                        case "UpdatePassword":
                            String StudentID = read.readLine();
                            String sPassword = read.readLine();
                            updateStudentPassword(StudentID, sPassword);
                            break;
                        default:
                            break;
                    }
                }

            } catch (IOException e) {

            }
        }
    }

    SqlConnect sqlcon = new SqlConnect();
    private static final String SELECT_STUDENT_LOGIN = "SELECT * FROM student  WHERE student.StudentID=? and student.sPassword=?";
    private static final String UPDATE_STUDENT_ONLINE = "UPDATE computer SET cStatus=?,StudentID=? WHERE MacAddress = ?";
    private static final String UPDATE_MATCHMAC = "INSERT INTO computer (MacAddress, IPv4) VALUES(?, ?) ON DUPLICATE KEY UPDATE IPv4 = ?";
    private static final String UPDATE_SPASSWORD = "Update student set sPassword = ?, sFirstLogin = ? Where StudentID = ?";

    public List<String> studentLogin(String studentid, String spassword) {
        List<String> studentloginList = new ArrayList<>();
        Connection connection = sqlcon.getConnect();
        try (PreparedStatement ps = connection.prepareStatement(SELECT_STUDENT_LOGIN);) {
            ps.setString(1, studentid);
            ps.setString(2, spassword);
            System.out.println(ps);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String s0 = rs.getString("StudentID");
                    String s1 = rs.getString("sPassword");
                    String s2 = rs.getString("sFirstname");
                    String s3 = rs.getString("sLastname");
                    String s4 = rs.getString("sFirstLogin");
                    studentloginList.addAll(Arrays.asList(s0, s1, s2, s3, s4));
                }
                rs.close();
            }
            ps.close();
            connection.close();
        } catch (SQLException e) {
            sqlcon.printSQLException(e);
        } finally {
            return studentloginList;
        }
    }

    public List<String> studentOnline(String studentid, String macaddress) {
        List<String> studentloginList = new ArrayList<>();
        Connection connection = sqlcon.getConnect();
        try (PreparedStatement ps = connection.prepareStatement(UPDATE_STUDENT_ONLINE);) {
            ps.setString(1, "Online");
            ps.setString(2, studentid);
            ps.setString(3, macaddress);
            System.out.println(ps);
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            sqlcon.printSQLException(e);
        } finally {
            return studentloginList;
        }
    }

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

}
