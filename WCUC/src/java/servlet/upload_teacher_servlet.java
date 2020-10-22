/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import connect.SqlConnect;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;

@MultipartConfig
public class upload_teacher_servlet extends HttpServlet {

    SqlConnect sqlConnect;

    @Override
    public void init() {
        sqlConnect = new SqlConnect();
    }

    private final String INSERT_TEACHER_BY_FILE = "INSERT INTO teacher (TeacherID, tPassword, tFirstname, tLastname, tRole) VALUES (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE TeacherID=?, tFirstname=?, tLastname=?, tRole=?;";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            insertTeacherByFile(request, response);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    private void insertTeacherByFile(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        Part filePart = request.getPart("uploadFile");
        InputStream fileContent = filePart.getInputStream();
        Reader in = new InputStreamReader(fileContent);
        System.out.println(request.getPart("uploadFile").toString());
        Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
        Connection connection = sqlConnect.getConnect();
        for (CSVRecord record : records) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TEACHER_BY_FILE)) {
                preparedStatement.setString(1, record.get("TeacherID"));
                preparedStatement.setString(2, record.get("TeacherID"));
                preparedStatement.setString(3, record.get("tFirstname"));
                preparedStatement.setString(4, record.get("tLastname"));
                preparedStatement.setString(5, record.get("tRole"));
                preparedStatement.setString(6, record.get("TeacherID"));
                preparedStatement.setString(7, record.get("tFirstname"));
                preparedStatement.setString(8, record.get("tLastname"));
                preparedStatement.setString(9, record.get("tRole"));
                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();
                preparedStatement.close();
            } catch (SQLException e) {
                sqlConnect.printSQLException(e);
            }
        }
        connection.close();
        response.sendRedirect("edit_teacher.jsp");
    }

}
