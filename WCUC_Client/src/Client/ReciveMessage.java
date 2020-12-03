package Client;

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

public class ReciveMessage {

    LockScreen lockScreen = new LockScreen();
    StudentLogin studentLogin = new StudentLogin();
    StudentModel studentModel = new StudentModel();

    public void start() {

        ReciveMsg.start();

    }
    Thread ReciveMsg = new Thread() {

        @Override
        public void run() {
            try {
                ServerSocket serversocketStudent = new ServerSocket(26103);
                while (true) {
                    Socket readAccept = serversocketStudent.accept();
                    BufferedReader read = new BufferedReader(new InputStreamReader(readAccept.getInputStream()));
                    String msg = read.readLine();
                    System.out.println("\n[GET] " + msg);
                    switch (msg) {
                        case "Shutdown":
                            main.Shutdown();
                            break;
                        case "Restart":
                            main.Restart();
                            break;
                        case "LockScreen":
                            lockScreen.setVisible(true);
                            break;
                        case "UnlockScreen":
                            lockScreen.setVisible(false);
                            break;
                        case "LoginSuccess":
//                            JOptionPane.showMessageDialog(main.studentLogin.getContentPane(), "Login Success.");
                            String sfirstlogin = read.readLine();
                            if (sfirstlogin.equals("Yes")) {
                                JTextField jpf = new JPasswordField(15);
                                JLabel jl = new JLabel("Please input your new password");
                                Object object[] = {jpf, jl};
                                int i = JOptionPane.showConfirmDialog(main.studentLogin.getContentPane(), object, "First Login", JOptionPane.WARNING_MESSAGE);
                                if (i == JOptionPane.OK_OPTION) {
                                    String newPassword = jpf.getText();
                                    try {
                                        Socket socketLogin = new Socket(main.host, main.port);
                                        try (PrintWriter put = new PrintWriter(socketLogin.getOutputStream())) {
                                            put.println("UpdatePassword");
                                            put.println(studentModel.getStudentid());
                                            put.println(newPassword);
                                            put.flush();
                                            System.out.println("\n[PUT] UpdatePassword : " + studentModel.getStudentid() + " : " + newPassword);
                                            put.close();
                                        }
                                        socketLogin.close();
                                        main.studentLogin.setVisible(false);
                                    } catch (IOException e) {
                                    }
                                }
                            } else {
                                main.studentLogin.setVisible(false);
                            }
                            studentModel.setStatus("Login");
                            break;
                        case "LoginFailed":
                            JOptionPane.showMessageDialog(main.studentLogin.getContentPane(), "Username or Password Invalid.");
                            break;
                        default:
                            break;
                    }
                    read.close();
                    readAccept.close();
                }
            } catch (IOException ex) {
            }
        }
    };
}
