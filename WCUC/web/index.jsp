<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="websocket.SocketServer"%>
<!DOCTYPE html>
<html>

    <head>
        <script type="text/javascript">
            function load()
            {
                window.location.href = "login.jsp";

            }
        </script>
    </head>

    <body onload="load()">
        <%
            SocketServer run = new SocketServer();
            run.openServer();
        %>
    </body>
</html>
/*
ต้องทำ
1.Login
2.คุมการปิดเน็ต
3.อัพโหลดภาษาไทย
4.Log
5.ปิดเครื่องหากโดนปิด
*/