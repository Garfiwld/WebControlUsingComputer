package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

public class SendMessage {

    public void InternetStatus(String room, String status) {
        String host = null;
        switch (room) {
            case "618_1":
                host = "192.168.14.27";
                break;
            case "618_2":
                host = "192.168.14.27";
                break;
            case "621":
                host = "192.168.14.27";
                break;
        }
        try {
            Socket socketLogin = new Socket(host, 25101);
            try (PrintWriter put = new PrintWriter(socketLogin.getOutputStream())) {
                put.println(status);
                put.flush();
                System.out.println("\n[PUT] " + status);
            }
        } catch (IOException e) {
        }
    }
}
