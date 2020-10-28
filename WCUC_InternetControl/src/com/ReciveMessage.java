package com;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

public class ReciveMessage {

    Thread ReciveMsg;

    public void start() {

        ReciveMsg.start();

    }

    public ReciveMessage() {
        this.ReciveMsg = new Thread(new Runnable() {

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
                                try {
                                    Runtime.getRuntime().exec("cmd /c C:\\WCUC_InternetControl\\WCUC_Autoit\\" + room + "_UnBlock.exe");
                                    System.out.println("case : InternetOn | room : " + room + " completed.");
                                } catch (IOException e) {
                                    System.out.println("case : InternetOn | room : " + room + " failed.");
                                }
                                break;
                            case "InternetOff":
                                try {
                                    Runtime.getRuntime().exec("cmd /c C:\\WCUC_InternetControl\\WCUC_Autoit\\" + room + "_Block.exe");
                                    System.out.println("case : InternetOn | room : " + room + " completed.");
                                } catch (IOException e) {
                                    System.out.println("case : InternetOn | room : " + room + " failed.");
                                }
                                break;
                        }
                    }
                } catch (IOException ex) {
                    System.out.println(ex);
                }
            }
        });
    }
}
