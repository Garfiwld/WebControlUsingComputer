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

public class StudentLogin implements Runnable {

    SqlConnect sqlcon = new SqlConnect();
    private static final String SELECT_STUDENT_LOGIN = "SELECT * FROM student  WHERE student.StudentID=? and student.sPassword=?";
    private static final String UPDATE_STUDENT_ONLINE = "UPDATE computer SET cStatus=?,StudentID=? WHERE MacAddress = ?";
    
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

    int sender, port;
    Socket recive;

    StudentLogin(int port, int sender) {
        this.port = port;
        this.sender = sender;
    }

    @Override
    public void run() {
        try {
            System.out.println("/Wait Login");
            ServerSocket newss = new ServerSocket(port);
            while (true) {
                System.out.println("/Student Login");
                recive = newss.accept();
                new EchoThread(recive).start();
            }
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    public class EchoThread extends Thread {

        protected Socket socket;

        public EchoThread(Socket clientSocket) {
            this.socket = clientSocket;
        }

        public void run() {
            try {
                BufferedReader read = new BufferedReader(new InputStreamReader(recive.getInputStream()));
                String msg = read.readLine();
                if (msg.equals("online")) {
                } else if (msg.equals("login")) {
                    String ipclient = read.readLine();
                    String studentid = read.readLine();
                    String spassword = read.readLine();
                    String macaddress = read.readLine();
//                    System.out.println("/" + ipclient + " : " + studentid + " : " + spassword + " : " + macaddress);
                    List<String> result = studentLogin(studentid, spassword);
                    Socket soket = new Socket(ipclient, sender);
                    PrintWriter out = new PrintWriter(soket.getOutputStream());
                    if (!result.isEmpty()) {
//                        String section = result.get(4);
//                        String courseid = result.get(6);
//                        String roomid = result.get(7);
//                        System.out.println(section + " : " + status + " : " + courseid + " : " + roomid);
//                        if (!roomid.equals("null")) {
//                        System.out.println("Login.java#LoginSuccess");
                        out.println("LoginSuccess");
//                        out.println(section);
//                        out.println(courseid);
                        String sfirstlogin = result.get(4);
                        out.println(sfirstlogin);
//                        out.println(websocketDAO.banlistSoftware(courseid));
//                        out.println(websocketDAO.banlistWebsite(courseid));
                        out.flush();
//                        websocketDAO.updateStudentOnline(macaddress, studentid);
//                        } else {
//                            System.out.println("Login.java#RoomOffine");
//                            out.println("RoomOffine");
//                            out.flush();
//                        }
                    studentOnline(studentid, macaddress);
                    } else {
//                        System.out.println("Login.java#LoginFailed");
                        out.println("LoginFailed");
                        out.flush();
                    }
                }
            } catch (IOException e) {

            }
        }
    }

}
