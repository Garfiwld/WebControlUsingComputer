package Socket;

import Client.LockScreen;
import Client.StudentLogin;
import Client.main;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

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
                            ReciveMsg.interrupt();
                            break;
                        case "Restart":
                            main.Restart();
                            ReciveMsg.interrupt();
                            break;
                        case "LockScreen":
                            lockScreen.setVisible(true);
                            ReciveMsg.interrupt();
                            break;
                        case "UnlockScreen":
                            lockScreen.setVisible(false);
                            ReciveMsg.interrupt();
                            break;
                    }
                }
            } catch (IOException ex) {
            }
        }
    });
}
