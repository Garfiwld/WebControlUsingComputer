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
