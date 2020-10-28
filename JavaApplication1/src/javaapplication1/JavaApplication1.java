/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author OBeseCat
 */
public class JavaApplication1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            Process px = Runtime.getRuntime().exec("cmd /c ipconfig /all");
            java.io.BufferedReader inx = new java.io.BufferedReader(new java.io.InputStreamReader(px.getInputStream()));
            String message = new String();
            String line = null;
            while ((line = inx.readLine()) != null) {
                message += line;
            }
            String[] result1 = message.split("Connection-specific DNS Suffix  . : cs");
            String[] result2 = result1[1].split("Physical Address. . . . . . . . . : ");
            String[] result3 = result2[1].split(" ");
            System.out.println(result3[0].replace("(Preferred)", "")); //Physical Address
            String[] result4 = result1[1].split("IPv4 Address. . . . . . . . . . . : ");
            String[] result5 = result4[1].split(" ");
            System.out.println(result5[0].replace("(Preferred)", "")); // IPv4 Address

        } catch (IOException ex) {
            Logger.getLogger(JavaApplication1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
