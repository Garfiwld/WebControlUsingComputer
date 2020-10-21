/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.SqlConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author OBeseCat
 */
public class TeacherDAO {

    SqlConnect sqlConnect = new SqlConnect();
    
    private static final String SELECT_ALL_TEACHER = "SELECT * FROM teacher";

    public List<String> selectAllTeachers() {
        List<String> teachers = new ArrayList<>();
        try (Connection connection = sqlConnect.getConnect();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TEACHER);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String username = rs.getString("TeacherID");
                String password = rs.getString("tPassword");
                String firstname = rs.getString("tFirstname");
                String lastname = rs.getString("tLastname");
                teachers.addAll(Arrays.asList(username, firstname, lastname, password));
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            sqlConnect.printSQLException(e);
        }
        return teachers;
    }

}
