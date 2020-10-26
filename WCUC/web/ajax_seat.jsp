<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="connect.SqlConnect"%>
<%
    SqlConnect sqlConnect = new SqlConnect();
    Gson gson = new Gson();
    String SELECT_ALL_COMPUTER = "SELECT * FROM computer LEFT JOIN student ON computer.StudentID = student.StudentID WHERE SeatID IS NOT NULL";
    String SELECT_SEATINFO_BY_SEATID = "SELECT * FROM computer LEFT JOIN student ON computer.StudentID = student.StudentID WHERE SeatID = ?";
    String SELECT_MAC = "SELECT MacAddress FROM computer WHERE SeatID IS NULL";
    String MacAddress, SeatID, cStatus;
    MacAddress = request.getParameter("MacAddress");
    SeatID = request.getParameter("SeatID");
    cStatus = request.getParameter("cStatus");
    String action = request.getParameter("action");
    switch (action) {
        case "ajmac":
            List<String> listMac = new ArrayList<>();
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement ps = connection.prepareStatement(SELECT_MAC);) {
                System.out.println(ps);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String macaddress = rs.getString("MacAddress");
                    listMac.add(macaddress);
                }
                ps.close();
                connection.close();
                String json = gson.toJson(listMac);
                response.getWriter().write(json);
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
        case "ajinfo":
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement ps = connection.prepareStatement(SELECT_SEATINFO_BY_SEATID);) {
                ps.setString(1, SeatID);
                System.out.println(ps);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String macaddress = rs.getString("MacAddress");
                    String ipv4 = rs.getString("IPv4");
                    String seatid = rs.getString("SeatID");
                    String cstatus = rs.getString("cStatus");
                    String studentid = rs.getString("StudentID");
                    String sfirstname = rs.getString("sFirstname");
                    String slastname = rs.getString("sLastname");
                    SeatModel seatinfo = new SeatModel(macaddress, ipv4, seatid, cstatus, studentid, sfirstname, slastname);
                    String json = gson.toJson(seatinfo);
                    response.getWriter().write(json);
                }
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
        case "ajlist":
            ArrayList<SeatModel> listSeat = new ArrayList<>();
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement ps = connection.prepareStatement(SELECT_ALL_COMPUTER);) {
                System.out.println(ps);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String macaddress = rs.getString("MacAddress");
                    String ipv4 = rs.getString("IPv4");
                    String seatid = rs.getString("SeatID");
                    String cstatus = rs.getString("cStatus");
                    String studentid = rs.getString("StudentID");
                    String sfirstname = rs.getString("sFirstname");
                    String slastname = rs.getString("sLastname");
                    listSeat.add(new SeatModel(macaddress, ipv4, seatid, cstatus, studentid, sfirstname, slastname));
                }
                ps.close();
                connection.close();
                String json = gson.toJson(listSeat);
                response.getWriter().write(json);
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
    }
%>
<%!
    public class SeatModel {

        protected String MacAddress, IPv4, SeatID, cStatus, StudentID, sFirstname, sLastname;

        public SeatModel(String MacAddress, String IPv4, String SeatID, String cStatus, String StudentID, String sFirstname, String sLastname) {
            this.MacAddress = MacAddress;
            this.IPv4 = IPv4;
            this.SeatID = SeatID;
            this.cStatus = cStatus;
            this.StudentID = StudentID;
            this.sFirstname = sFirstname;
            this.sLastname = sLastname;
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

        public String getCstatus() {
            return cStatus;
        }

        public void setCstatus(String cStatus) {
            this.cStatus = cStatus;
        }

        public String getStudentID() {
            return StudentID;
        }

        public void setStudentID(String StudentID) {
            this.StudentID = StudentID;
        }

        public String getSfirstname() {
            return sFirstname;
        }

        public void setSfirstname(String sFirstname) {
            this.sFirstname = sFirstname;
        }

        public String getSlastname() {
            return sLastname;
        }

        public void setSlastname(String sLastname) {
            this.sLastname = sLastname;
        }

    }
%>
