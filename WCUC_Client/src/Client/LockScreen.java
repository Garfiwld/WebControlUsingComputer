package Client;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;
import javax.swing.JFrame;

public class LockScreen extends JFrame {

    StudentModel studentModel = new StudentModel();
    StudentLogin studentLogin = new StudentLogin();

    public LockScreen() {
        setAlwaysOnTop(true);
        setUndecorated(true);
        setExtendedState(this.MAXIMIZED_BOTH);
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        getContentPane().setBackground(Color.DARK_GRAY);

        initComponents();
        Dimension position = Toolkit.getDefaultToolkit().getScreenSize();
        jL_LOCK.setBounds(position.width / 2 - (jL_LOCK.getPreferredSize().width / 2), position.height / 2, jL_LOCK.getPreferredSize().width, jL_LOCK.getPreferredSize().height);
        jL_Warning.setBounds(position.width / 2 - (jL_Warning.getPreferredSize().width / 2), position.height / 2 + 60, jL_Warning.getPreferredSize().width, jL_Warning.getPreferredSize().height);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jL_Warning = new javax.swing.JLabel();
        jL_LOCK = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });
        addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                formKeyPressed(evt);
            }
        });
        getContentPane().setLayout(null);

        jL_Warning.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jL_Warning.setForeground(new java.awt.Color(255, 255, 255));
        jL_Warning.setText("Warning! don't press key Ctrl, Windows, Alt, Shift, Funtion 1-12");
        getContentPane().add(jL_Warning);
        jL_Warning.setBounds(70, 160, 960, 60);

        jL_LOCK.setFont(new java.awt.Font("Tahoma", 0, 48)); // NOI18N
        jL_LOCK.setForeground(new java.awt.Color(255, 255, 255));
        jL_LOCK.setText("!!! LOCKSCREEN BY TEACHER !!!");
        getContentPane().add(jL_LOCK);
        jL_LOCK.setBounds(70, 50, 960, 60);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        main.Restart();
    }//GEN-LAST:event_formWindowClosing

    private void formKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_formKeyPressed
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
    }//GEN-LAST:event_formKeyPressed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jL_LOCK;
    private javax.swing.JLabel jL_Warning;
    // End of variables declaration//GEN-END:variables
}
