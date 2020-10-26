package connect;

import java.io.IOException;
import java.net.Socket;
import javax.swing.JOptionPane;
import static student.StudentLogin.Restart;
import static student.StudentLogin.studentLogin;

public class SocketConnect {

    private final String host = "192.168.1.111";
    private final int portLogin = 25101;

    public Socket socketLogin() {
        Socket sock = null;
        int numtries = 0;
        while (true) {
            try {
                sock = new Socket(host, portLogin);
                break;
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(studentLogin.getContentPane(), "Please check internet connection!");
                if (numtries++ == 3) {
                    Restart();
                }
                wait(10 * 1000);
                continue;
            }
        }

        return sock;
    }

    public void wait(int ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
    }
}
