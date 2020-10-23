package websocket;

public class SocketServer {

    public void openServer() {
        System.out.println("openServer");
        Thread Matchmac = new Thread(new MatchMac(25101));
        Thread StudentLogin = new Thread(new StudentLogin(25102, 26101));
        Thread UpdateStudentPassword = new Thread(new UpdateStudentPassword(25103));
        Matchmac.start();
        StudentLogin.start();
        UpdateStudentPassword.start();
    }
};
