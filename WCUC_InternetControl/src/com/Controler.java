package com;

import java.awt.Color;

public class Controler extends javax.swing.JFrame {

    InternetControl internetControl = new InternetControl();

    public Controler() {
        initComponents();
        //setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        getContentPane().setBackground(Color.DARK_GRAY);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jL_618_1 = new javax.swing.JLabel();
        jB_618_1_ON = new javax.swing.JButton();
        jB_618_1_OFF = new javax.swing.JButton();
        jL618_2 = new javax.swing.JLabel();
        jB_618_2_ON = new javax.swing.JButton();
        jB_618_2_OFF = new javax.swing.JButton();
        jL_621 = new javax.swing.JLabel();
        jB_621_ON = new javax.swing.JButton();
        jB_621_OFF = new javax.swing.JButton();
        jL_InternetControl = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jL_618_1.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jL_618_1.setForeground(new java.awt.Color(255, 255, 255));
        jL_618_1.setText("618/1");

        jB_618_1_ON.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jB_618_1_ON.setForeground(new java.awt.Color(0, 0, 0));
        jB_618_1_ON.setText("On");
        jB_618_1_ON.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jB_618_1_ONActionPerformed(evt);
            }
        });

        jB_618_1_OFF.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jB_618_1_OFF.setForeground(new java.awt.Color(0, 0, 0));
        jB_618_1_OFF.setText("Off");
        jB_618_1_OFF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jB_618_1_OFFActionPerformed(evt);
            }
        });

        jL618_2.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jL618_2.setForeground(new java.awt.Color(255, 255, 255));
        jL618_2.setText("618/2");

        jB_618_2_ON.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jB_618_2_ON.setForeground(new java.awt.Color(0, 0, 0));
        jB_618_2_ON.setText("On");
        jB_618_2_ON.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jB_618_2_ONActionPerformed(evt);
            }
        });

        jB_618_2_OFF.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jB_618_2_OFF.setForeground(new java.awt.Color(0, 0, 0));
        jB_618_2_OFF.setText("Off");
        jB_618_2_OFF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jB_618_2_OFFActionPerformed(evt);
            }
        });

        jL_621.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jL_621.setForeground(new java.awt.Color(255, 255, 255));
        jL_621.setText("621");

        jB_621_ON.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jB_621_ON.setForeground(new java.awt.Color(0, 0, 0));
        jB_621_ON.setText("On");
        jB_621_ON.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jB_621_ONActionPerformed(evt);
            }
        });

        jB_621_OFF.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jB_621_OFF.setForeground(new java.awt.Color(0, 0, 0));
        jB_621_OFF.setText("Off");
        jB_621_OFF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jB_621_OFFActionPerformed(evt);
            }
        });

        jL_InternetControl.setFont(new java.awt.Font("Dialog", 1, 36)); // NOI18N
        jL_InternetControl.setForeground(new java.awt.Color(255, 255, 255));
        jL_InternetControl.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jL_InternetControl.setText("Internet Control");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jL_InternetControl, javax.swing.GroupLayout.DEFAULT_SIZE, 288, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(53, 53, 53)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jL_618_1)
                        .addGap(24, 24, 24)
                        .addComponent(jB_618_1_ON)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jB_618_1_OFF))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addGroup(layout.createSequentialGroup()
                            .addComponent(jL_621)
                            .addGap(24, 24, 24)
                            .addComponent(jB_621_ON)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                            .addComponent(jB_621_OFF))
                        .addGroup(layout.createSequentialGroup()
                            .addComponent(jL618_2)
                            .addGap(24, 24, 24)
                            .addComponent(jB_618_2_ON)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                            .addComponent(jB_618_2_OFF))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addComponent(jL_InternetControl)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jB_618_1_OFF)
                    .addComponent(jB_618_1_ON)
                    .addComponent(jL_618_1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jB_618_2_OFF)
                    .addComponent(jB_618_2_ON)
                    .addComponent(jL618_2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jB_621_OFF)
                    .addComponent(jB_621_ON)
                    .addComponent(jL_621))
                .addContainerGap(31, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jB_618_1_OFFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jB_618_1_OFFActionPerformed
        internetControl.InternetOff("618_1");
    }//GEN-LAST:event_jB_618_1_OFFActionPerformed

    private void jB_618_1_ONActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jB_618_1_ONActionPerformed
        internetControl.InternetOn("618_1");
    }//GEN-LAST:event_jB_618_1_ONActionPerformed

    private void jB_618_2_OFFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jB_618_2_OFFActionPerformed
        internetControl.InternetOff("618_2");
    }//GEN-LAST:event_jB_618_2_OFFActionPerformed

    private void jB_618_2_ONActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jB_618_2_ONActionPerformed
        internetControl.InternetOn("618_2");
    }//GEN-LAST:event_jB_618_2_ONActionPerformed

    private void jB_621_OFFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jB_621_OFFActionPerformed
        internetControl.InternetOff("621");
    }//GEN-LAST:event_jB_621_OFFActionPerformed

    private void jB_621_ONActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jB_621_ONActionPerformed
        internetControl.InternetOn("621");
    }//GEN-LAST:event_jB_621_ONActionPerformed

    public static void main(String args[]) {

        ReciveMessage reciveMessage = new ReciveMessage();
        reciveMessage.start();

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Controler().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jB_618_1_OFF;
    private javax.swing.JButton jB_618_1_ON;
    private javax.swing.JButton jB_618_2_OFF;
    private javax.swing.JButton jB_618_2_ON;
    private javax.swing.JButton jB_621_OFF;
    private javax.swing.JButton jB_621_ON;
    private javax.swing.JLabel jL618_2;
    private javax.swing.JLabel jL_618_1;
    private javax.swing.JLabel jL_621;
    private javax.swing.JLabel jL_InternetControl;
    // End of variables declaration//GEN-END:variables
}
