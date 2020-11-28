package Client;

public class StudentModel {

    protected static String ipv4, macaddress, studentid, spassword, status;

    public static String getIpv4() {
        return ipv4;
    }

    public static void setIpv4(String ipv4) {
        StudentModel.ipv4 = ipv4;
    }

    public static String getMacaddress() {
        return macaddress;
    }

    public static void setMacaddress(String macaddress) {
        StudentModel.macaddress = macaddress;
    }

    public static String getStudentid() {
        return studentid;
    }

    public static void setStudentid(String studentid) {
        StudentModel.studentid = studentid;
    }

    public static String getSpassword() {
        return spassword;
    }

    public static void setSpassword(String spassword) {
        StudentModel.spassword = spassword;
    }

    public static String getStatus() {
        return status;
    }

    public static void setStatus(String status) {
        StudentModel.status = status;
    }

}
