/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

public class SendMessage {

    public boolean Send(String ipv4, String msg) {
        try {
            Socket send = new Socket(ipv4, 26103);
            PrintWriter put = new PrintWriter(send.getOutputStream());
            put.println(msg);
            put.flush();
            System.out.println("\n[PUT] " + msg + " : " + ipv4 + " : 26103");
            return true;
        } catch (IOException ex) {
            System.out.println("\n[PUT ERROR] Client Offline. IPv4 : " + ipv4 + " : 26103");
            return false;
        }
    }

    public boolean SendInternetContol(String msg, String room) {
        try {
            Socket send = new Socket("192.168.14.5", 26104);
            PrintWriter put = new PrintWriter(send.getOutputStream());
            put.println(msg);
            put.println(room);
            put.flush();
            System.out.println("\n[PUT] " + msg + " : " + room + " : 192.168.14.5 : 26104");
            return true;
        } catch (IOException ex) {
            System.out.println("\n[PUT ERROR] SendInternetContol Offline" + " : 192.168.14.5 : 26104");
            return false;
        }
    }
}
