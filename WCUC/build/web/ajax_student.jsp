<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="org.apache.commons.csv.CSVFormat"%>
<%@page import="java.io.Reader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="connect.SqlConnect"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%!
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
%>

<%

    SqlConnect sqlConnect = new SqlConnect();
    Gson gson = new Gson();
    ArrayList<StudentModel> listTeacher = new ArrayList<>();

    String SELECT_ALL_STUDENT = "SELECT * FROM student";
    String INSERT_STUDENT = "INSERT INTO student (StudentID, sPassword, sFirstname, sLastname) VALUES (?, ?, ?, ?);";
    String UPDATE_STUDENT = "UPDATE student SET StudentID = ?,sPassword= ?, sFirstname = ?, sLastname = ? WHERE StudentID = ?;";
    String DELETE_STUDENT = "DELETE FROM student WHERE StudentID = ?;";

    String StudentID, sPassword, sFirstname, sLastname;
    StudentID = request.getParameter("StudentID");
    sPassword = request.getParameter("sPassword");
    sFirstname = request.getParameter("sFirstname");
    sLastname = request.getParameter("sLastname");

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
        case "ajadd":
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENT)) {
                preparedStatement.setString(1, StudentID);
                preparedStatement.setString(2, sPassword);
                preparedStatement.setString(3, sFirstname);
                preparedStatement.setString(4, sLastname);
                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                connection.close();
                StudentModel teacherAdded = new StudentModel(StudentID, sPassword, sFirstname, sLastname);
                out.print(gson.toJson(teacherAdded));
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
        case "ajedit":
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STUDENT);) {
                preparedStatement.setString(1, StudentID);
                preparedStatement.setString(2, sPassword);
                preparedStatement.setString(3, sFirstname);
                preparedStatement.setString(4, sLastname);
                preparedStatement.setString(5, StudentID);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                connection.close();
                StudentModel studenEdit = new StudentModel(StudentID, sPassword, sFirstname, sLastname);
                out.print(gson.toJson(studenEdit));
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
        case "ajdelete":
            boolean rowDeleted;
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement preparedStatement = connection.prepareStatement(DELETE_STUDENT);) {
                preparedStatement.setString(1, StudentID);
                rowDeleted = preparedStatement.executeUpdate() > 0;
                preparedStatement.close();
                connection.close();
                out.print(rowDeleted);
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
    }
%>