package Model;

public class StudentModel {

    protected static String ipv4, macaddress, studentid, course, section, datetime;

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

    public static String getCourse() {
        return course;
    }

    public static void setCourse(String course) {
        StudentModel.course = course;
    }

    public static String getSection() {
        return section;
    }

    public static void setSection(String section) {
        StudentModel.section = section;
    }

    public static String getDatetime() {
        return datetime;
    }

    public static void setDatetime(String datetime) {
        StudentModel.datetime = datetime;
    }

}
