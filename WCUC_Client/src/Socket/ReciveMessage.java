package Socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import Client.LockScreen;
import Client.StudentLogin;
import Client.main;

public class ReciveMessage {

    LockScreen lockScreen = new LockScreen();
    StudentLogin studentLogin = new StudentLogin();

    public void start() {

        ReciveMsg.start();

    }
    Thread ReciveMsg = new Thread(new Runnable() {

        @Override
        public void run() {
            try {
                ServerSocket serversocketStudent = new ServerSocket(26103);
                while (true) {
                    Socket readAccept = serversocketStudent.accept();
                    BufferedReader read = new BufferedReader(new InputStreamReader(readAccept.getInputStream()));
                    String msg = read.readLine();
                    System.out.println("\n[GET] " + msg);
                    switch (msg) {
                        case "Shutdown":
                            main.Shutdown();
                            break;
                        case "Restart":
                            main.Restart();
                            break;
                        case "LockScreen":
                            lockScreen.setVisible(true);
                            break;
                        case "UnlockScreen":
                            lockScreen.setVisible(false);
                            break;
                    }
                }
            } catch (IOException ex) {
            }
        }
    });
}
