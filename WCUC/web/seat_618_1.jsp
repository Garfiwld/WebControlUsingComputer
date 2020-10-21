<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int roomX = 20;
    int roomY = 20;

%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                white-space: nowrap;
                margin-top: 10px;
                margin-left: 0px;
            }
            a:link {text-decoration: none;}
            a:hover span {display:none}
            a:hover:before {content:"✅"}
            a{
                font-size: 50px;
                letter-spacing: -15px;
                line-height: 1;
            }
        </style>
    </head>
    <body>
        <h3 class="text-center">--- WHITEBOARD ---</h3>
        <div id="seat">
            <%                for (int i = 0; i < roomY; i++) {
                    for (int j = 0; j < roomX; j++) {
                        out.print("<a data-toggle=\"modal\" data-target=\"#exampleModal\"><span>⬛</span></a>");
                    }
                    out.print("<br>");
                }
            %>
        </div>

        <!-- Modal -->
        <div
            class="modal fade"
            id="exampleModal"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">...</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/includes/body.jsp" %>
    </body>
</html>
