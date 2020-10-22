/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

/**
 *
 * @author OBeseCat
 */
public class StudentModel {
    protected String StudentID, sPassword, sFirstname, sLastname, sFirstLogin;

    public StudentModel(String StudentID, String sPassword, String sFirstname, String sLastname, String sFirstLogin) {
        this.StudentID = StudentID;
        this.sPassword = sPassword;
        this.sFirstname = sFirstname;
        this.sLastname = sLastname;
        this.sFirstLogin = sFirstLogin;
    }

    public StudentModel(String StudentID, String sPassword, String sFirstname, String sLastname) {
        this.StudentID = StudentID;
        this.sPassword = sPassword;
        this.sFirstname = sFirstname;
        this.sLastname = sLastname;
    }

    public String getStudentID() {
        return StudentID;
    }

    public void setStudentID(String StudentID) {
        this.StudentID = StudentID;
    }

    public String getsPassword() {
        return sPassword;
    }

    public void setsPassword(String sPassword) {
        this.sPassword = sPassword;
    }

    public String getsFirstname() {
        return sFirstname;
    }

    public void setsFirstname(String sFirstname) {
        this.sFirstname = sFirstname;
    }

    public String getsLastname() {
        return sLastname;
    }

    public void setsLastname(String sLastname) {
        this.sLastname = sLastname;
    }

    public String getsFirstLogin() {
        return sFirstLogin;
    }

    public void setsFirstLogin(String sFirstLogin) {
        this.sFirstLogin = sFirstLogin;
    }
    
}
