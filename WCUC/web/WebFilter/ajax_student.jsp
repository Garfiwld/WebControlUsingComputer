<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Server.SqlConnect"%>
<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="org.apache.commons.csv.CSVFormat"%>
<%@page import="java.io.Reader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%
    SqlConnect sqlConnect = new SqlConnect();
    Gson gson = new Gson();
    ArrayList<StudentModel> listTeacher = new ArrayList<>();

    String SELECT_ALL_STUDENT = "SELECT * FROM student";

    String action = request.getParameter("action");
    switch (action) {
        case "ajlist":
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENT);) {
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    String studentid = rs.getString("StudentID");
                    String spassword = rs.getString("sPassword");
                    String sfirstname = rs.getString("sFirstname");
                    String slastname = rs.getString("sLastname");
                    String sfirstlogin = rs.getString("sFirstLogin");
                    listTeacher.add(new StudentModel(studentid, spassword, sfirstname, slastname, sfirstlogin));
                }
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            String json = gson.toJson(listTeacher);
            out.print(json);
            break;
    }
%>
<%!    public class StudentModel {

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
%>