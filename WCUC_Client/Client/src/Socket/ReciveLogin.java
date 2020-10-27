package Socket;

import Model.StudentModel;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import student.StudentLogin;

public class ReciveLogin {

    StudentModel studentModel = new StudentModel();

    public void start() {
        Reciver.start();
    }
    Thread Reciver = new Thread(new Runnable() {

        @Override
        public void run() {

            try {
                ServerSocket serversocketStudent = new ServerSocket(26101);
                while (true) {
                    Socket socketAccept = serversocketStudent.accept();
                    BufferedReader read = new BufferedReader(new InputStreamReader(socketAccept.getInputStream()));
                    String action = read.readLine();
                    System.out.println("action : " + action);
                    switch (action) {
                        case "LoginSuccess":
                            JOptionPane.showMessageDialog(StudentLogin.studentLogin.getContentPane(), "Login Successfully.");
                            String sfirstlogin = read.readLine();
                            if (sfirstlogin.equals("Yes")) {
                                JTextField jpf = new JPasswordField(15);
                                JLabel jl = new JLabel("Please input your new password");
                                Object object[] = {jpf, jl};
                                int i = JOptionPane.showConfirmDialog(StudentLogin.studentLogin.getContentPane(), object, "First Login", JOptionPane.WARNING_MESSAGE);
                                if (i == JOptionPane.OK_OPTION) {
                                    String result = jpf.getText();
                                    try {
                                        System.out.println("SocketNewpassword");
                                        Socket socketLogin = new Socket(StudentLogin.host, StudentLogin.portLogin);
                                        try (PrintWriter out = new PrintWriter(socketLogin.getOutputStream())) {
                                            out.println("UpdatePassword");
                                            out.println(studentModel.getStudentid());
                                            out.println(result);
                                            out.flush();
                                        }
                                        StudentLogin.studentLogin.setVisible(false);
                                    } catch (IOException e) {
                                    }
                                }
                            } else {
                                StudentLogin.studentLogin.setVisible(false);
                            }
                            StudentLogin.HeartBeat();
                            break;
                        case "LoginFailed":
                            JOptionPane.showMessageDialog(StudentLogin.studentLogin.getContentPane(), "Username or Password Invalid.");
                            break;
                    }
                }
            } catch (IOException e) {
            }
        }
    });
}
