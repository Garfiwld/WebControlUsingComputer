package student;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JOptionPane;

public class LockScreen extends javax.swing.JFrame {

    public LockScreen() {
        setAlwaysOnTop(true);
        setUndecorated(true);
        setExtendedState(this.MAXIMIZED_BOTH);
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);

        initComponents();
        getContentPane().setBackground(Color.DARK_GRAY);
        Dimension position = Toolkit.getDefaultToolkit().getScreenSize();
        jLabel1.setBounds(position.width / 2 - (jLabel1.getPreferredSize().width / 2), position.height / 2, jLabel1.getPreferredSize().width, jLabel1.getPreferredSize().height);

        addWindowListener(new WindowAdapter() {

            @Override
            public void windowClosing(WindowEvent we) {
                String ObjButtons[] = {"Yes", "No"};
                int PromptResult = JOptionPane.showOptionDialog(null,
                        "Are you sure you want to exit?", "Online Examination System",
                        JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE, null,
                        ObjButtons, ObjButtons[1]);
                if (PromptResult == 0) {
                    System.exit(0);
                }
            }
        });

    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(null);

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 48)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("!!! LOCKSCREEN BY TEACHER !!!");
        getContentPane().add(jLabel1);
        jLabel1.setBounds(70, 50, 960, 60);

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
