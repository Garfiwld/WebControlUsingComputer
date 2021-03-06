package Client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Timer;
import java.util.TimerTask;

public class main {

    public static final String host = "192.168.56.1";
    public static final int port = 25101;

    public static StudentModel studentModel = new StudentModel();
    public static StudentLogin studentLogin;

    public static void main(String args[]) throws IOException, InterruptedException {

        studentLogin = new StudentLogin();

        // --- อัพเดท IPv4 กับ MacAddress ที่ Database ---
        MatchMac();

        // --- ตรวจสอบการเชื่อมต่อกับ Server และ อัพเดท IPv4 กับ MacAddress ที่ Database---
        studentModel.setStatus("Online");
        HeartBeat();

        // --- เปิดรับการตรวจสอบ Login ---
//        ReciveLogin reciveLogin = new ReciveLogin();
//        reciveLogin.start();
        // --- เปิดรับข้อความ ---
        ReciveMessage reciveMessage = new ReciveMessage();
        reciveMessage.start();

        studentLogin.setVisible(true);

    }

    public static void MatchMac() {
        setIPv4AndMac();
        try (Socket socketLogin = new Socket(host, port)) {
            PrintWriter put = new PrintWriter(socketLogin.getOutputStream());
            put.println("MatchMac");
            put.println(studentModel.getIpv4());
            put.println(studentModel.getMacaddress());
            put.flush();
            System.out.println("\n[PUT] MatchMac : " + studentModel.getIpv4() + " : " + studentModel.getMacaddress());
            socketLogin.close();
            put.close();
        } catch (Exception ex) {
            System.out.println("Can't connect server.");
//            JOptionPane.showMessageDialog(studentLogin.getContentPane(), "Can't connect server.");
            MatchMac();
        }
    }

    public static void HeartBeat() {
        Timer t = new Timer();
        t.schedule(new TimerTask() {
            @Override
            public void run() {
//                int numtries = 1;
//                while (true) {
                setIPv4AndMac();
                try (Socket socketLogin = new Socket(host, port)) {
                    PrintWriter put = new PrintWriter(socketLogin.getOutputStream());
                    put.println("HeartBeat");
                    put.println(studentModel.getIpv4());
                    put.println(studentModel.getMacaddress());
                    put.println(studentModel.getStatus());
                    put.println(studentModel.getStudentid());
                    put.flush();
                    System.out.println("\n[PUT] HeartBeat : " + studentModel.getIpv4() + " : " + studentModel.getMacaddress());
//                        break;
                    socketLogin.close();
                    put.close();
                } catch (Exception e) {
//                        if (numtries++ >= 3) {
//                            Shutdown();
//                        }
//                        JOptionPane msg = new JOptionPane("Please check internet connection!\nif you fixed click OK.", JOptionPane.WARNING_MESSAGE);
//                        final JDialog dlg = msg.createDialog("Internet connection error.");
//                        dlg.setDefaultCloseOperation(JDialog.DO_NOTHING_ON_CLOSE);
//                        dlg.setAlwaysOnTop(true);
//                        new Thread(new Runnable() {
//                            @Override
//                            public void run() {
//                                try {
//                                    Thread.sleep(30 * 1000);
//                                } catch (InterruptedException e) {
//                                    e.printStackTrace();
//                                }
//                                dlg.setVisible(false);
//                            }
//                        }).start();
//                        dlg.setVisible(true);
                }
//                }
            }
        }, 0, 5 * 1000);
    }

    public static void Restart() {
        System.out.println("\n--- Restart ---");
//        JOptionPane.showMessageDialog(studentLogin.getContentPane(), "--- Restart ---");
        try {
            Runtime.getRuntime().exec("cmd /c shutdown -r -f -t 0");
        } catch (IOException e) {
        }
    }

    public static void Shutdown() {
        System.out.println("\n--- Shutdown ---");
//        JOptionPane.showMessageDialog(studentLogin.getContentPane(), "--- Shutdown ---");
        try {
            Runtime.getRuntime().exec("cmd /c shutdown -s -f -t 0");
        } catch (IOException e) {
        }
    }

    public static void setIPv4AndMac() {
        try {
            Process px = Runtime.getRuntime().exec("cmd /c ipconfig /all");
            BufferedReader inx = new BufferedReader(new InputStreamReader(px.getInputStream()));
            String message = new String();
            String line = null;
            while ((line = inx.readLine()) != null) {
                message += line;
            }
            String[] result1 = message.split("Ethernet adapter Ethernet:");
            String[] result2 = result1[1].split("Physical Address. . . . . . . . . : ");
            String[] result3 = result2[1].split(" ");
            studentModel.setMacaddress(result3[0].replace("(Preferred)", "")); //Physical Address
            String[] result4 = result1[1].split("IPv4 Address. . . . . . . . . . . : ");
            String[] result5 = result4[1].split(" ");
            studentModel.setIpv4(result5[0].replace("(Preferred)", "")); // IPv4 Address
            studentLogin.jL_Mac.setText("MacAdress : " + studentModel.getMacaddress());
            studentLogin.jL_IP.setText("IPv4Adress : " + studentModel.getIpv4());
            System.out.println("\nsetIPv4AndMac : " + studentModel.getMacaddress() + " : " + studentModel.getIpv4());
            inx.close();
        } catch (Exception e) {
        }
    }
}
