package Client;

import Model.StudentModel;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
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

        addKeyListener(new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
                if (e.getKeyCode() == KeyEvent.VK_WINDOWS
                        || e.getKeyCode() == KeyEvent.VK_CONTROL
                        || e.getKeyCode() == KeyEvent.VK_ALT
                        || e.getKeyCode() == KeyEvent.VK_TAB
                        || e.getKeyCode() == KeyEvent.VK_SHIFT) {
                    main.Restart();
                }
            }

            @Override
            public void keyReleased(KeyEvent e) {
            }
        });

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

        jL_Warning = new javax.swing.JLabel();
        jL_LOCK = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(null);

        jL_Warning.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jL_Warning.setForeground(new java.awt.Color(255, 255, 255));
        jL_Warning.setText("Warning! don't press key Ctrl, Windows, Alt, Shift, Tab");
        getContentPane().add(jL_Warning);
        jL_Warning.setBounds(70, 160, 960, 60);

        jL_LOCK.setFont(new java.awt.Font("Tahoma", 0, 48)); // NOI18N
        jL_LOCK.setForeground(new java.awt.Color(255, 255, 255));
        jL_LOCK.setText("!!! LOCKSCREEN BY TEACHER !!!");
        getContentPane().add(jL_LOCK);
        jL_LOCK.setBounds(70, 50, 960, 60);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jL_LOCK;
    private javax.swing.JLabel jL_Warning;
    // End of variables declaration//GEN-END:variables
}
