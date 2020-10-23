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
public class SeatModel {
    protected String MacAddress, IPv4, SeatID, sStatus, StudentID, Firstnames, Lastnames;

    public SeatModel(String MacAddress, String IPv4, String SeatID, String sStatus, String StudentID, String Firstnames, String Lastnames) {
        this.MacAddress = MacAddress;
        this.IPv4 = IPv4;
        this.SeatID = SeatID;
        this.sStatus = sStatus;
        this.StudentID = StudentID;
        this.Firstnames = Firstnames;
        this.Lastnames = Lastnames;
    }

    public String getMacAddress() {
        return MacAddress;
    }

    public void setMacAddress(String MacAddress) {
        this.MacAddress = MacAddress;
    }

    public String getIPv4() {
        return IPv4;
    }

    public void setIPv4(String IPv4) {
        this.IPv4 = IPv4;
    }

    public String getSeatID() {
        return SeatID;
    }

    public void setSeatID(String SeatID) {
        this.SeatID = SeatID;
    }

    public String getsStatus() {
        return sStatus;
    }

    public void setsStatus(String sStatus) {
        this.sStatus = sStatus;
    }

    public String getStudentID() {
        return StudentID;
    }

    public void setStudentID(String StudentID) {
        this.StudentID = StudentID;
    }

    public String getFirstnames() {
        return Firstnames;
    }

    public void setFirstnames(String Firstnames) {
        this.Firstnames = Firstnames;
    }

    public String getLastnames() {
        return Lastnames;
    }

    public void setLastnames(String Lastnames) {
        this.Lastnames = Lastnames;
    }
    
}
