<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
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
<%@page import="java.util.List"%>
<%

    SqlConnect sqlConnect = new SqlConnect();
    Gson gson = new Gson();
    ArrayList<TeacherModel> listTeacher = new ArrayList<>();

    String SELECT_ALL_TEACHER = "SELECT * FROM teacher";
    String INSERT_TEACHER = "INSERT INTO teacher (TeacherID, tPassword, tFirstname, tLastname, tRole) VALUES (?, ?, ?, ?, ?);";
    String UPDATE_TEACHER = "UPDATE teacher SET TeacherID = ?,tPassword= ?, tFirstname = ?, tLastname = ?, tRole = ? WHERE TeacherID = ?;";
    String DELETE_TEACHER = "DELETE FROM teacher WHERE TeacherID = ?;";

    String TeacherID, tPassword, tFirstname, tLastname, tRole;
    TeacherID = request.getParameter("TeacherID");
    tPassword = request.getParameter("tPassword");
    tFirstname = request.getParameter("tFirstname");
    tLastname = request.getParameter("tLastname");
    tRole = request.getParameter("tRole");

    String action = request.getParameter("action");
    switch (action) {
        case "ajlist":
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TEACHER);) {
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    String teacherid = rs.getString("TeacherID");
                    String tpassword = rs.getString("tPassword");
                    String tfirstname = rs.getString("tFirstname");
                    String tlastname = rs.getString("tLastname");
                    String trole = rs.getString("tRole");
                    listTeacher.add(new TeacherModel(teacherid, tpassword, tfirstname, tlastname, trole));
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
                    PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TEACHER)) {
                preparedStatement.setString(1, TeacherID);
                preparedStatement.setString(2, tPassword);
                preparedStatement.setString(3, tFirstname);
                preparedStatement.setString(4, tLastname);
                preparedStatement.setString(5, tRole);
                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                connection.close();
                TeacherModel teacherAdded = new TeacherModel(TeacherID, tPassword, tFirstname, tLastname, tRole);
                out.print(gson.toJson(teacherAdded));
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
        case "ajedit":
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TEACHER);) {
                preparedStatement.setString(1, TeacherID);
                preparedStatement.setString(2, tPassword);
                preparedStatement.setString(3, tFirstname);
                preparedStatement.setString(4, tLastname);
                preparedStatement.setString(5, tRole);
                preparedStatement.setString(6, TeacherID);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                connection.close();
                TeacherModel teacherEdit = new TeacherModel(TeacherID, tPassword, tFirstname, tLastname, tRole);
                out.print(gson.toJson(teacherEdit));
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
            break;
        case "ajdelete":
            boolean rowDeleted;
            try (Connection connection = sqlConnect.getConnect();
                    PreparedStatement preparedStatement = connection.prepareStatement(DELETE_TEACHER);) {
                preparedStatement.setString(1, TeacherID);
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

<%!
    public class TeacherModel {

        protected String TeacherID, tPassword, tFirstname, tLastname, tRole;

        public TeacherModel(String TeacherID, String tPassword, String tFirstname, String tLastname, String tRole) {
            this.TeacherID = TeacherID;
            this.tPassword = tPassword;
            this.tFirstname = tFirstname;
            this.tLastname = tLastname;
            this.tRole = tRole;
        }

        public String getTeacherID() {
            return TeacherID;
        }

        public void setTeacherID(String TeacherID) {
            this.TeacherID = TeacherID;
        }

        public String gettPassword() {
            return tPassword;
        }

        public void settPassword(String tPassword) {
            this.tPassword = tPassword;
        }

        public String gettFirstname() {
            return tFirstname;
        }

        public void settFirstname(String tFirstname) {
            this.tFirstname = tFirstname;
        }

        public String gettLastname() {
            return tLastname;
        }

        public void settLastname(String tLastname) {
            this.tLastname = tLastname;
        }

        public String gettRole() {
            return tRole;
        }

        public void settRole(String tRole) {
            this.tRole = tRole;
        }

    }
%>