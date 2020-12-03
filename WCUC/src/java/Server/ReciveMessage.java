package Server;

import java.io.BufferedReader;
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

public class ReciveMessage {

    public void start() {

        ReciveMessage.start();

    }
    Thread ReciveMessage = new Thread() {
        @Override
        public void run() {
            try {
                ServerSocket serversocketStudent = new ServerSocket(25101);
                while (true) {
                    Socket readAccept = serversocketStudent.accept();
                    BufferedReader read = new BufferedReader(new InputStreamReader(readAccept.getInputStream()));
                    String action = read.readLine();
                    switch (action) {
                        case "HeartBeat":
                            String ipv4 = read.readLine();
                            String macaddress = read.readLine();
                            String status = read.readLine();
                            String studentid = read.readLine();
                            updateMatchMac(ipv4, macaddress, status);
                            if (status.equals("Login")) {
                                updateStudentLogin(studentid, macaddress);
                            }
                            System.out.println("\n[GET] HeartBeat : " + ipv4 + " : " + macaddress + " : " + status + " : " + studentid);
                            break;
                        case "MatchMac":
                            ipv4 = read.readLine();
                            macaddress = read.readLine();
                            updateMatchMac(ipv4, macaddress, "Online");
                            System.out.println("\n[GET] MatchMac : " + ipv4 + " : " + macaddress);
                            break;
                        case "Login":
                            studentid = read.readLine();
                            String spassword = read.readLine();
                            macaddress = read.readLine();
                            ipv4 = read.readLine();
                            List<String> result = studentLogin(studentid, spassword);
                            Socket soket = new Socket(ipv4, 26103);
                            PrintWriter put = new PrintWriter(soket.getOutputStream());
                            if (!result.isEmpty()) {
                                put.println("LoginSuccess");
                                String sfirstlogin = result.get(4);
                                put.println(sfirstlogin);
                                put.flush();
                                updateStudentLogin(studentid, macaddress);
                            } else {
                                put.println("LoginFailed");
                                put.flush();
                            }
                            System.out.println("\n[GET] Login : " + studentid + " : " + spassword + " : " + macaddress + " : " + ipv4);
                            soket.close();
                            put.close();
                            break;
                        case "UpdatePassword":
                            String StudentID = read.readLine();
                            String sPassword = read.readLine();
                            updateStudentPassword(StudentID, sPassword);
                            System.out.println("\n[GET] UpdatePassword : " + StudentID + " : " + sPassword);
                            break;
                        default:
                            System.out.println("\n[GET] " + action);
                            break;
                    }
                    read.close();
                    readAccept.close();
                }
            } catch (Exception e) {

            }
        }
    };

    SqlConnect sqlcon = new SqlConnect();
    private static final String SELECT_STUDENT_LOGIN = "SELECT * FROM student  WHERE student.StudentID=? and student.sPassword=?";
    private static final String UPDATE_STUDENT_LOGIN = "UPDATE computer SET cStatus='Login',StudentID=? WHERE MacAddress = ?";
    private static final String UPDATE_MATCHMAC = "INSERT INTO computer (MacAddress, IPv4, cStatus) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE IPv4 = ?, cStatus=?";
    private static final String UPDATE_SPASSWORD = "Update student set sPassword = ?, sFirstLogin = ? Where StudentID = ?";

    public ArrayList<String> studentLogin(String studentid, String spassword) {
        ArrayList<String> studentloginList = new ArrayList<>();
        Connection connection = sqlcon.getConnect();
        try (PreparedStatement ps = connection.prepareStatement(SELECT_STUDENT_LOGIN);) {
            ps.setString(1, studentid);
            ps.setString(2, spassword);
//            System.out.println("--- Check student login ---\n" + ps + "\n");
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

    public void updateStudentLogin(String studentid, String macaddress) {
        Connection connection = sqlcon.getConnect();
        try (PreparedStatement ps = connection.prepareStatement(UPDATE_STUDENT_LOGIN);) {
            ps.setString(1, studentid);
            ps.setString(2, macaddress);
//            System.out.println("--- Update status student Online. ---- \n" + ps + "\n");
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            sqlcon.printSQLException(e);
        }
    }

    public void updateMatchMac(String ipAdress, String macAdress, String cStatus) {
        Connection connection = sqlcon.getConnect();
        try (PreparedStatement ps = connection.prepareStatement(UPDATE_MATCHMAC);) {
            ps.setString(1, macAdress);
            ps.setString(2, ipAdress);
            ps.setString(3, cStatus);
            ps.setString(4, ipAdress);
            ps.setString(5, cStatus);
//            System.out.println("--- Update MatchMac. ---- \n" + ps + "\n");
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
//            System.out.println("--- Update student new password. ---- \n" + ps + "\n");
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            sqlcon.printSQLException(e);
        }
    }

}
