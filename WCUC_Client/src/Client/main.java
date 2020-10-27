package Client;

import Model.StudentModel;
import Socket.ReciveLogin;
import Socket.ReciveMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.util.Timer;
import java.util.TimerTask;
import javax.swing.JOptionPane;

public class main {

    public static final String host = "192.168.1.111";
    public static final int port = 25101;

    public static StudentModel studentModel = new StudentModel();
    public static StudentLogin studentLogin;

    public static void main(String args[]) throws IOException, InterruptedException {

        studentLogin = new StudentLogin();
        /*
         *  อัพเดท IPv4 กับ MacAddress ที่ Database
         */
        MatchMac();

        /*
        * เปิดรับการตรวจสอบ Login
         */
        ReciveLogin reciveLogin = new ReciveLogin();
        reciveLogin.start();

        /*
         *  เปิดรับข้อความ
         */
        ReciveMessage reciveMessage = new ReciveMessage();
        reciveMessage.start();

        studentLogin.setVisible(true);

    }

    public static void getIPv4AndMac() {
        int numtries = 0;
        while (true) {
            try {
                InetAddress localhost = InetAddress.getLocalHost();
                InetAddress hostaddress = InetAddress.getByName(localhost.getHostAddress());
                NetworkInterface ni = NetworkInterface.getByInetAddress(hostaddress);
                byte[] mac = ni.getHardwareAddress();
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < mac.length; i++) {
                    sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
                }
                studentModel.setIpv4(localhost.getHostAddress());
                studentModel.setMacaddress(sb.toString());

                studentLogin.jL_Mac.setText("MacAdress : " + studentModel.getMacaddress());
                studentLogin.jL_IP.setText("IPv4Adress : " + studentModel.getIpv4());
                System.out.println("\ngetIPv4AndMac : " + studentModel.getMacaddress() + " : " + studentModel.getIpv4());
                break;
            } catch (Exception e) {
                if (++numtries > 1) {
                    Shutdown();
                }
                JOptionPane.showMessageDialog(studentLogin.getContentPane(), "Please check internet connection!");
                try {
                    Thread.sleep(10 * 1000);
                } catch (InterruptedException ex) {
                    Thread.currentThread().interrupt();
                }
            }
        }
    }

    public static void MatchMac() {
        getIPv4AndMac();
        try (Socket socketLogin = new Socket(host, port)) {
            PrintWriter put = new PrintWriter(socketLogin.getOutputStream());
            put.println("MatchMac");
            put.println(studentModel.getIpv4());
            put.println(studentModel.getMacaddress());
            put.flush();
        } catch (Exception ex) {
            System.out.println("Can't connect server.");
            MatchMac();
        }
    }

    public static void HeartBeat() {
        Timer t = new Timer();
        t.schedule(new TimerTask() {
            @Override
            public void run() {
                while (true) {
                    getIPv4AndMac();
                    try (Socket socketLogin = new Socket(host, port)) {
                        PrintWriter put = new PrintWriter(socketLogin.getOutputStream());
                        put.println("HeartBeat");
                        put.println(studentModel.getIpv4());
                        put.println(studentModel.getMacaddress());
                        put.flush();
                        System.out.println("\n[PUT] HeartBeat : " + studentModel.getIpv4() + " : " + studentModel.getMacaddress());
                        break;
                    } catch (Exception e) {
                    }
                }
            }
        }, 0, 5 * 1000);
    }

    public static void Restart() {
        System.out.println("\n--- Restart ---");
//        try {
//            Runtime.getRuntime().exec("cmd /c shutdown -r -f -t 0");
//        } catch (IOException e) {
//        }
    }

    public static void Shutdown() {
        System.out.println("\n--- Shutdown ---");
//        try {
//            Runtime.getRuntime().exec("cmd /c shutdown -s -f -t 0");
//        } catch (IOException e) {
//        }
    }
}
