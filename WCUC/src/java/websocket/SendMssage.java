package websocket;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

public class SendMssage {

    public boolean Send(String ipv4, String msg) {
        try {
            Socket send = new Socket(ipv4, 26103);
            PrintWriter out = new PrintWriter(send.getOutputStream());
            out.println(msg);
            out.flush();
            return true;
        } catch (IOException ex) {
            System.out.println("Client Offline IPv4 : " + ipv4);
            return false;
        }
    }
}
