package com;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

public class ReciveMessage {

    InternetControl internetControl = new InternetControl();

    public void start() {

        ReciveMessage.start();

    }

    Thread ReciveMessage = new Thread() {
        @Override
        public void run() {
            System.out.println("ReciveMessage Start");
            try {
                ServerSocket serversocketStudent = new ServerSocket(26104);
                while (true) {
                    Socket readAccept = serversocketStudent.accept();
                    BufferedReader read = new BufferedReader(new InputStreamReader(readAccept.getInputStream()));
                    String msg = read.readLine();
                    String room = read.readLine();
                    System.out.println("[GET] InternetOn " + msg + " : room : " + room);
                    switch (msg) {
                        case "InternetOn":
                            internetControl.InternetOn(room);
                            break;
                        case "InternetOff":
                            internetControl.InternetOff(room);
                            break;
                    }
                    read.close();
                    readAccept.close();
                }
            } catch (IOException ex) {
            }
        }
    };
}
