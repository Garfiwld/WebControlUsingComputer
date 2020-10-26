<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<%
    SqlConnect sqlConnect = new SqlConnect();
    String INSERT_STUDENT_BY_FILE = "INSERT INTO student (StudentID, sPassword, sFirstname, sLastname) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE StudentID=?, sFirstname=?, sLastname=?";

    //to get the content type information from JSP Request Header
    String contentType = request.getContentType();
    //here we are checking the content type is not equal to Null and
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        DataInputStream in = new DataInputStream(request.getInputStream());
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

        try (Reader reader = new FileReader(savePath);
                CSVParser csvParser = new CSVParser(reader, CSVFormat.RFC4180.withFirstRecordAsHeader())) {
            for (CSVRecord record : csvParser) {
                try (Connection connection = sqlConnect.getConnect();
                        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENT_BY_FILE)) {
                    preparedStatement.setString(1, record.get("StudentID"));
                    preparedStatement.setString(2, record.get("StudentID"));
                    String sfirstname = record.get("sFirstname");
//                            String decodedsfn = new String(sfirstname.getBytes("UTF-8"), "UTF-8");
                    String slirstname = record.get("sLastname");
//                            String decodedsln = new String(slirstname.getBytes("UTF-8"), "UTF-8");
                    preparedStatement.setString(3, sfirstname);
                    preparedStatement.setString(4, slirstname);
                    preparedStatement.setString(5, record.get("StudentID"));
                    preparedStatement.setString(6, sfirstname);
                    preparedStatement.setString(7, slirstname);
                    System.out.println(preparedStatement);
                    preparedStatement.executeUpdate();
                    preparedStatement.close();
                } catch (SQLException e) {
                    sqlConnect.printSQLException(e);
                }
            }
        } catch (Exception e) {
        }

        try (Reader reader = new FileReader(savePath);
                CSVParser csvParser = new CSVParser(reader, CSVFormat.EXCEL.withFirstRecordAsHeader());) {
            String StudentID, sFirstname, sLastname;
            for (CSVRecord record : csvParser) {
                String strOfStu = record.get("StdCode");
                String[] arrOfStu = strOfStu.split("\'");
                StudentID = arrOfStu[1];
                String name = record.get("StdName");
                String deTIS60 = new String(name.getBytes("ISO-8859-1"), "TIS-620");
                String[] arrOfsName = deTIS60.split(" ");
//                        String decodedUTF8 = new String(deISO885911.getBytes("ISO-8859-11"), "UTF-8");
//                        String[] arrOfsName = decodedUTF8.split(" ");
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
            }
        } catch (Exception e) {
        }
        File f = new File(savePath);
        f.delete();
    }
    response.sendRedirect("edit_student.jsp");
%>