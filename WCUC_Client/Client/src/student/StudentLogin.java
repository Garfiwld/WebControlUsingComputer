package student;

import Socket.ReciveLogin;
import Model.StudentModel;
import Socket.ReciveMessage;
import connect.SocketConnect;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.UnsupportedLookAndFeelException;

public class StudentLogin extends javax.swing.JFrame {

    static StudentModel studentModel = new StudentModel();
    SocketConnect socketConnect = new SocketConnect();
    public static StudentLogin studentLogin;

    public StudentLogin() {
        setAlwaysOnTop(true);
        setUndecorated(true);
        setExtendedState(this.MAXIMIZED_BOTH);
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        getContentPane().setBackground(Color.DARK_GRAY);

        initComponents();
        Dimension position = Toolkit.getDefaultToolkit().getScreenSize();
        int wCenter = position.width / 2;
        int hCenter = position.height / 2;
        tLogin.setBounds(wCenter - (tLogin.getPreferredSize().width / 2), hCenter - 83, tLogin.getPreferredSize().width, tLogin.getPreferredSize().height);
        jTF_StudentID.setBounds(wCenter - (jTF_StudentID.getPreferredSize().width / 2), hCenter, jTF_StudentID.getPreferredSize().width, 45);
        jP_sPassword.setBounds(wCenter - (jTF_StudentID.getPreferredSize().width / 2), hCenter + 45 + 10, jTF_StudentID.getPreferredSize().width, 45);
        jB_Login.setBounds(wCenter - (jB_Login.getPreferredSize().width / 2), hCenter + 45 + 10 + 45 + 10, jB_Login.getPreferredSize().width, 40);

        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent we) {
                System.out.println("--- Restart ---");
                try {
                    Runtime.getRuntime().exec("cmd /c shutdown -r");
                } catch (IOException ex) {
                }
            }
        });

    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTF_StudentID = new javax.swing.JTextField();
        jP_sPassword = new javax.swing.JPasswordField();
        jB_Login = new javax.swing.JButton();
        tLogin = new javax.swing.JLabel();
        jL_IP = new javax.swing.JLabel();
        jL_Mac = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setAlwaysOnTop(true);
        getContentPane().setLayout(null);

        jTF_StudentID.setColumns(18);
        jTF_StudentID.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        getContentPane().add(jTF_StudentID);
        jTF_StudentID.setBounds(80, 90, 276, 20);

        jP_sPassword.setColumns(18);
        jP_sPassword.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        getContentPane().add(jP_sPassword);
        jP_sPassword.setBounds(80, 120, 276, 28);

        jB_Login.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jB_Login.setText("LOGIN");
        jB_Login.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jB_LoginActionPerformed(evt);
            }
        });
        getContentPane().add(jB_Login);
        jB_Login.setBounds(90, 160, 85, 31);

        tLogin.setFont(new java.awt.Font("Tahoma", 0, 50)); // NOI18N
        tLogin.setForeground(new java.awt.Color(255, 255, 255));
        tLogin.setText("Login");
        getContentPane().add(tLogin);
        tLogin.setBounds(70, 10, 119, 61);

        jL_IP.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jL_IP.setForeground(new java.awt.Color(255, 255, 255));
        jL_IP.setText("IPv4Address : ");
        getContentPane().add(jL_IP);
        jL_IP.setBounds(10, 30, 390, 20);

        jL_Mac.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jL_Mac.setForeground(new java.awt.Color(255, 255, 255));
        jL_Mac.setText("MacAddress : ");
        getContentPane().add(jL_Mac);
        jL_Mac.setBounds(10, 10, 420, 20);

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jB_LoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jB_LoginActionPerformed
        System.out.println("Login Press");
        /*
        *   รับค่าจากฟอร์มและส่งไป Server
         */
        try (Socket socketLogin = new SocketConnect().socketLogin();
                PrintWriter out = new PrintWriter(socketLogin.getOutputStream())) {
            out.println("Login");
            String StudentID = StudentLogin.jTF_StudentID.getText();
            studentModel.setStudentid(StudentID);
            out.println(StudentID);
            String sPassword = String.valueOf(jP_sPassword.getPassword());
            out.println(sPassword);
            out.println(studentModel.getMacaddress());
            out.println(studentModel.getIpv4());
            out.flush();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(getContentPane(), "Failed connect server.");
        }
    }//GEN-LAST:event_jB_LoginActionPerformed

    public static void main(String args[]) throws IOException, InterruptedException {

        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException ex) {
            Logger.getLogger(StudentLogin.class.getName()).log(Level.SEVERE, null, ex);
        }

        studentLogin = new StudentLogin();

        /*
         *  รับค่า MacAddress & IPv4
         */
        getIPv4AndMac();

        /*
         *  อัพเดท IPv4 กับ MacAddress ที่ Database
         */
        MatchMac();

        /*
        * เปิดรับการตรวจสอบ Login
         */
        ReciveLogin reciveLogin = new ReciveLogin();
        reciveLogin.start();

        /*
         *  เปิดรับข้อความ
         */
        ReciveMessage reciveMessage = new ReciveMessage();
        reciveMessage.start();

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                studentLogin.setVisible(true);
            }
        });
    }

    public static void getIPv4AndMac() {
        int numtries = 0;
        while (true) {
            try {
                InetAddress localhost = InetAddress.getLocalHost();
                InetAddress hostaddress = InetAddress.getByName(localhost.getHostAddress());
                NetworkInterface ni = NetworkInterface.getByInetAddress(hostaddress);
                byte[] mac = ni.getHardwareAddress();
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < mac.length; i++) {
                    sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
                }
                studentModel.setIpv4(localhost.getHostAddress());
                studentModel.setMacaddress(sb.toString());

                studentLogin.jL_Mac.setText("MacAdress : " + studentModel.getMacaddress());
                studentLogin.jL_IP.setText("IPv4Adress : " + studentModel.getIpv4());
                break;
            } catch (Exception e) {
                JOptionPane.showMessageDialog(studentLogin.getContentPane(), "Please check internet connection!");
                if (numtries++ == 3) {
                    Restart();
                }
                wait(10 * 1000);
                continue;
            }
        }
    }

    public static void wait(int ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
    }

    public static void Restart() {
        System.out.println("--- Restart ---");
        try {
            Runtime.getRuntime().exec("cmd /c shutdown -r");
        } catch (IOException e) {
        }
    }

    public static void Shutdown() {
        System.out.println("--- Shutdown ---");
        try {
            Runtime.getRuntime().exec("cmd /c shutdown -s");
        } catch (Exception e) {
        }
    }

    public static void MatchMac() {
        try (Socket socketLogin = new SocketConnect().socketLogin()) {
            PrintWriter out = new PrintWriter(socketLogin.getOutputStream());
            out.println("MatchMac");
            out.println(studentModel.getIpv4());
            out.println(studentModel.getMacaddress());
            out.flush();
        } catch (Exception ex) {
            MatchMac();
        }
    }

    public static void HeartBeat() {
        Timer t = new Timer();
        t.schedule(new TimerTask() {
            @Override
            public void run() {
                getIPv4AndMac();
                try (Socket socketLogin = new SocketConnect().socketLogin()) {
                    PrintWriter out = new PrintWriter(socketLogin.getOutputStream());
                    out.println("HeartBeat");
                    out.println(studentModel.getIpv4());
                    out.println(studentModel.getMacaddress());
                    out.flush();
                } catch (Exception ex) {
                    MatchMac();
                }
            }
        }, 0, 5 * 1000);
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jB_Login;
    private javax.swing.JLabel jL_IP;
    private javax.swing.JLabel jL_Mac;
    private javax.swing.JPasswordField jP_sPassword;
    public static javax.swing.JTextField jTF_StudentID;
    private javax.swing.JLabel tLogin;
    // End of variables declaration//GEN-END:variables
}
