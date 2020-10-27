<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="websocket.StartServer"%>
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
            StartServer run = new StartServer();
            run.openServer();
        %>
    </body>
</html>