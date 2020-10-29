package Client;

import Model.StudentModel;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;
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
        jL_Warning.setBounds(position.width / 2 - (jL_Warning.getPreferredSize().width / 2), hCenter + 45 + 10 + 45 + 10 + 40 + 10, jL_Warning.getPreferredSize().width, jL_Warning.getPreferredSize().height);
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
        jL_Warning = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setAlwaysOnTop(true);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });
        getContentPane().setLayout(null);

        jTF_StudentID.setColumns(18);
        jTF_StudentID.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jTF_StudentID.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTF_StudentIDKeyPressed(evt);
            }
        });
        getContentPane().add(jTF_StudentID);
        jTF_StudentID.setBounds(80, 80, 284, 30);

        jP_sPassword.setColumns(18);
        jP_sPassword.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jP_sPassword.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jP_sPasswordKeyPressed(evt);
            }
        });
        getContentPane().add(jP_sPassword);
        jP_sPassword.setBounds(80, 120, 284, 28);

        jB_Login.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jB_Login.setText("LOGIN");
        jB_Login.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jB_LoginActionPerformed(evt);
            }
        });
        jB_Login.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jB_LoginKeyPressed(evt);
            }
        });
        getContentPane().add(jB_Login);
        jB_Login.setBounds(90, 160, 83, 38);

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

        jL_Warning.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jL_Warning.setForeground(new java.awt.Color(255, 255, 255));
        jL_Warning.setText("Warning! don't press key Ctrl, Windows, Alt, Shift, Funtion 1-12");
        getContentPane().add(jL_Warning);
        jL_Warning.setBounds(70, 210, 960, 60);

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jB_LoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jB_LoginActionPerformed
        System.out.println("Login Press");
        // --- รับค่าจากฟอร์มและส่งไป Server ---
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

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        main.Restart();
    }//GEN-LAST:event_formWindowClosing

    private void jTF_StudentIDKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTF_StudentIDKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_WINDOWS
                || evt.getKeyCode() == KeyEvent.VK_CONTROL
                || evt.getKeyCode() == KeyEvent.VK_ALT
                || evt.getKeyCode() == KeyEvent.VK_SHIFT
                || evt.getKeyCode() == KeyEvent.VK_F1
                || evt.getKeyCode() == KeyEvent.VK_F2
                || evt.getKeyCode() == KeyEvent.VK_F3
                || evt.getKeyCode() == KeyEvent.VK_F4
                || evt.getKeyCode() == KeyEvent.VK_F5
                || evt.getKeyCode() == KeyEvent.VK_F6
                || evt.getKeyCode() == KeyEvent.VK_F7
                || evt.getKeyCode() == KeyEvent.VK_F8
                || evt.getKeyCode() == KeyEvent.VK_F9
                || evt.getKeyCode() == KeyEvent.VK_F10
                || evt.getKeyCode() == KeyEvent.VK_F11
                || evt.getKeyCode() == KeyEvent.VK_F12) {
            main.Restart();
        }
    }//GEN-LAST:event_jTF_StudentIDKeyPressed

    private void jP_sPasswordKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jP_sPasswordKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            jB_Login.doClick();
        }
        if (evt.getKeyCode() == KeyEvent.VK_WINDOWS
                || evt.getKeyCode() == KeyEvent.VK_CONTROL
                || evt.getKeyCode() == KeyEvent.VK_ALT
                || evt.getKeyCode() == KeyEvent.VK_SHIFT
                || evt.getKeyCode() == KeyEvent.VK_F1
                || evt.getKeyCode() == KeyEvent.VK_F2
                || evt.getKeyCode() == KeyEvent.VK_F3
                || evt.getKeyCode() == KeyEvent.VK_F4
                || evt.getKeyCode() == KeyEvent.VK_F5
                || evt.getKeyCode() == KeyEvent.VK_F6
                || evt.getKeyCode() == KeyEvent.VK_F7
                || evt.getKeyCode() == KeyEvent.VK_F8
                || evt.getKeyCode() == KeyEvent.VK_F9
                || evt.getKeyCode() == KeyEvent.VK_F10
                || evt.getKeyCode() == KeyEvent.VK_F11
                || evt.getKeyCode() == KeyEvent.VK_F12) {
            main.Restart();
        }
    }//GEN-LAST:event_jP_sPasswordKeyPressed

    private void jB_LoginKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jB_LoginKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            jB_Login.doClick();
        }
        if (evt.getKeyCode() == KeyEvent.VK_WINDOWS
                || evt.getKeyCode() == KeyEvent.VK_CONTROL
                || evt.getKeyCode() == KeyEvent.VK_ALT
                || evt.getKeyCode() == KeyEvent.VK_SHIFT
                || evt.getKeyCode() == KeyEvent.VK_F1
                || evt.getKeyCode() == KeyEvent.VK_F2
                || evt.getKeyCode() == KeyEvent.VK_F3
                || evt.getKeyCode() == KeyEvent.VK_F4
                || evt.getKeyCode() == KeyEvent.VK_F5
                || evt.getKeyCode() == KeyEvent.VK_F6
                || evt.getKeyCode() == KeyEvent.VK_F7
                || evt.getKeyCode() == KeyEvent.VK_F8
                || evt.getKeyCode() == KeyEvent.VK_F9
                || evt.getKeyCode() == KeyEvent.VK_F10
                || evt.getKeyCode() == KeyEvent.VK_F11
                || evt.getKeyCode() == KeyEvent.VK_F12) {
            main.Restart();
        }
    }//GEN-LAST:event_jB_LoginKeyPressed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jB_Login;
    public static javax.swing.JLabel jL_IP;
    public static javax.swing.JLabel jL_Mac;
    private javax.swing.JLabel jL_Warning;
    private javax.swing.JPasswordField jP_sPassword;
    private javax.swing.JTextField jTF_StudentID;
    private javax.swing.JLabel tLogin;
    // End of variables declaration//GEN-END:variables
}
