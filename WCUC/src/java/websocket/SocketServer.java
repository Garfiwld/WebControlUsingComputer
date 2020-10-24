package websocket;

public class SocketServer {

    public void openServer() {
        System.out.println("openServer");
        Thread ReciveMssage = new Thread(new StudentLogin());
        ReciveMssage.start();
    }
};
