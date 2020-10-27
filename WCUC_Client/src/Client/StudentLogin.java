package Client;

import Model.StudentModel;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.PrintWriter;
import java.net.Socket;
import javax.swing.JOptionPane;

public class StudentLogin extends javax.swing.JFrame {

    StudentModel studentModel = new StudentModel();

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
                main.Restart();
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
        try (Socket socketLogin = new Socket(main.host, main.port);
                PrintWriter put = new PrintWriter(socketLogin.getOutputStream())) {
            String StudentID = String.valueOf(jTF_StudentID.getText());
            studentModel.setStudentid(StudentID);
            String sPassword = String.valueOf(jP_sPassword.getPassword());
            studentModel.setSpassword(sPassword);
            put.println("Login");
            put.println(studentModel.getStudentid());
            put.println(studentModel.getSpassword());
            put.println(studentModel.getMacaddress());
            put.println(studentModel.getIpv4());
            put.flush();
            System.out.println("\n[PUT] Login : " + studentModel.getStudentid() + " : " + studentModel.getSpassword() + " : " + studentModel.getMacaddress() + " : " + studentModel.getIpv4());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(getContentPane(), "Failed connect server.");
        }
    }//GEN-LAST:event_jB_LoginActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jB_Login;
    public static javax.swing.JLabel jL_IP;
    public static javax.swing.JLabel jL_Mac;
    private javax.swing.JPasswordField jP_sPassword;
    private javax.swing.JTextField jTF_StudentID;
    private javax.swing.JLabel tLogin;
    // End of variables declaration//GEN-END:variables
}
