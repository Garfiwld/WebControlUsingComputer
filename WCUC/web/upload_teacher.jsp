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
    String INSERT_TEACHER_BY_FILE = "INSERT INTO teacher (TeacherID, tPassword, tFirstname, tLastname, tRole) VALUES (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE TeacherID=?, tFirstname=?, tLastname=?, tRole=?;";

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

//        String saveRealPath = application.getRealPath("\\upload\\" + saveFile);
//        System.out.println("saveRealPath : " + saveRealPath);
        String savePath = "E:\\0_Workspace\\WebControlUsingComputer\\WCUC\\web\\upload\\" + saveFile;
        FileOutputStream fileOut = new FileOutputStream(savePath);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
        fileOut.close();

        try (Reader reader = new FileReader(savePath);
                CSVParser csvParser = new CSVParser(reader, CSVFormat.RFC4180.withFirstRecordAsHeader())) {
            for (CSVRecord record : csvParser) {
                try (Connection connection = sqlConnect.getConnect();
                        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TEACHER_BY_FILE)) {
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
        } catch (Exception e) {
        }
        File f = new File(savePath);
        f.delete();
    }
    response.sendRedirect("edit_teacher.jsp");
%>