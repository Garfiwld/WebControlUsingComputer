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
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

@MultipartConfig
public class upload_student_servlet extends HttpServlet {

    SqlConnect sqlConnect;
    private final String INSERT_STUDENT_BY_FILE = "INSERT INTO student (StudentID, sPassword, sFirstname, sLastname) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE StudentID=?, sFirstname=?, sLastname=?";

    @Override
    public void init() {
        sqlConnect = new SqlConnect();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            insertStudentByFile(request, response);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void insertStudentByFile(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        Part filePart = request.getPart("uploadFile");
        InputStream fileContent = filePart.getInputStream();

        Reader in = new InputStreamReader(fileContent);
        Connection connection = sqlConnect.getConnect();
        try (CSVParser csvParser = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in)) {
            for (CSVRecord record : csvParser) {
                try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENT_BY_FILE)) {
                    preparedStatement.setString(1, record.get("StudentID"));
                    preparedStatement.setString(2, record.get("StudentID"));
                    preparedStatement.setString(3, record.get("sFirstname"));
                    preparedStatement.setString(4, record.get("sLastname"));
                    preparedStatement.setString(5, record.get("StudentID"));
                    preparedStatement.setString(6, record.get("sFirstname"));
                    preparedStatement.setString(7, record.get("sLastname"));
                    System.out.println(preparedStatement);
                    preparedStatement.executeUpdate();
                    preparedStatement.close();
                } catch (SQLException e) {
                    sqlConnect.printSQLException(e);
                }
            }
        } catch (Exception e) {
        }
        System.out.println("xxxx");
        try (CSVParser csvParser = new CSVParser(in, CSVFormat.EXCEL.withFirstRecordAsHeader())) {
            for (CSVRecord record : csvParser) {
                try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENT_BY_FILE)) {
                    preparedStatement.setString(1, record.get("StdCode"));
                    preparedStatement.setString(2, record.get("StdCode"));
                    String name = record.get("StdName");
                    String[] arrOfStr = name.split(" ");
                    String firstname = arrOfStr[1];
                    String lastname = arrOfStr[2];
                    preparedStatement.setString(3, firstname);
                    preparedStatement.setString(4, lastname);
                    preparedStatement.setString(5, record.get("StdCode"));
                    preparedStatement.setString(6, firstname);
                    preparedStatement.setString(7, lastname);
                    System.out.println(preparedStatement);
                    preparedStatement.executeUpdate();
                    preparedStatement.close();
                } catch (SQLException e) {
                    sqlConnect.printSQLException(e);
                }
            }
        } catch (Exception e) {
        }
        System.out.println("yyyy");
        connection.close();
        response.sendRedirect("edit_student.jsp");
    }
}
