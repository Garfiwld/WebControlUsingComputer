<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connect.SqlConnect"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="org.apache.commons.csv.CSVParser"%>
<%@page import="org.apache.commons.csv.CSVFormat"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.Reader"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            SqlConnect sqlConnect = new SqlConnect();
            String INSERT_STUDENT_BY_FILE = "INSERT INTO student (StudentID, sPassword, sFirstname, sLastname) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE StudentID=?, sFirstname=?, sLastname=?";

            //to get the content type information from JSP Request Header
            String contentType = request.getContentType();
            //here we are checking the content type is not equal to Null and
            if ((contentType
                    != null) && (contentType.indexOf(
                            "multipart/form-data") >= 0)) {
                DataInputStream in = new DataInputStream(
                        request.getInputStream());
                //we are taking the length of Content type data
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                //this loop converting the uploaded file into byte code
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead,
                            formDataLength);
                    totalBytesRead += byteRead;
                }
                String file = new String(dataBytes);
                //for saving the file name
                String saveFile = file
                        .substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,
                        saveFile.indexOf("\""));
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1,
                        contentType.length());
                int pos;
                //extracting the index of file 
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                //String savePath = application.getRealPath("\\upload\\" + saveFile);
                String savePath = "E:\\0_Workspace\\WebControlUsingComputer\\WCUC\\web\\upload\\" + saveFile;
                FileOutputStream fileOut = new FileOutputStream(savePath);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();
                String StudentID, sFirstname, sLastname;
                try (Reader reader = new FileReader(savePath);
                        CSVParser csvParser = new CSVParser(reader, CSVFormat.EXCEL.withFirstRecordAsHeader());) {
                    for (CSVRecord record : csvParser) {
                        String strOfStu = record.get("StdCode");
                        String[] arrOfStu = strOfStu.split("\'");
                        StudentID = arrOfStu[1];
                        String name = record.get("StdName");
                        String decodedTo885911 = new String(name.getBytes("ISO-8859-1"), "ISO-8859-11");
                        String[] arrOfsName = decodedTo885911.split(" ");
                        sFirstname = arrOfsName[1];
                        sLastname = arrOfsName[4];
//                        out.println(StudentID + " : " + sFirstname + " : " + sLastname + "<br>");

                        try (Connection connection = sqlConnect.getConnect();
                                PreparedStatement ps = connection.prepareStatement(INSERT_STUDENT_BY_FILE)) {
                            ps.setString(1, StudentID);
                            ps.setString(2, StudentID);
                            ps.setString(3, sFirstname);
                            ps.setString(4, sLastname);
                            ps.setString(5, StudentID);
                            ps.setString(6, sFirstname);
                            ps.setString(7, sLastname);
                            System.out.println(ps);
                            ps.executeUpdate();
                            ps.close();
                        } catch (SQLException e) {
                            sqlConnect.printSQLException(e);
                        }
                        File f = new File(savePath);
                        f.delete();
                    }
                }
            }

            response.sendRedirect("edit_student.jsp");
        %>
    </body>
</html>
