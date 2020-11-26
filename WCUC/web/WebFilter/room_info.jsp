<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/head.jsp" %>
        <link rel="stylesheet" type="text/css" href="addons/jQDataTables/datatables.css"/>
        <title>Room Info</title>
        <style>
            .pagination .page-item.active .page-link {
                background-color: #aa66cc;
            }
            .pagination .page-item.active .page-link:hover {
                background-color: #d86fd2;
            }
        </style>
    </head>
    <body class="fixed-sn">
        <%@include file="includes/navbar.jsp" %>

        <main>
            <div class="container-fluid mt-3">
                <div class="card">

                    <div class="card-body">

                        <!--Header -->
                        <div class="form-header purple-gradient accent-1">
                            <h3>Room Info</h3>
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" class="dataTable table table-striped" id="example"></table>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="includes/body.jsp" %>
        <script type="text/javascript" src="addons/jQDataTables/datatables.js"></script>
        <script src="addons/jQDataTables/dataTables.altEditor.free.js" ></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var columnDefs = [
                    {
                        data: "MacAddress",
                        title: "MacAddress"
                    },
                    {
                        defaultContent: "",
                        data: "IPv4",
                        title: "IPv4"
                    },
                    {
                        data: "cStatus",
                        title: "cStatus"
                    },
                    {
                        data: "SeatID",
                        title: "SeatID"
                    },
                    {
                        defaultContent: "",
                        data: "StudentID",
                        title: "StudentID"

                    },
                    {
                        defaultContent: "",
                        data: "sFirstname",
                        title: "sFirstname"

                    },
                    {
                        defaultContent: "",
                        data: "sLastname",
                        title: "sLastname"

                    }
                ];
                $('#example').DataTable({
                    ajax: {
                        url: 'ajax_seat.jsp?action=ajlist',
                        dataSrc: ''
                    },
                    columns: columnDefs,
                    dom: 'Bfrtip', // Needs button container
                    order: [[1, 'desc'], [2, 'asc'], [4, 'asc']],
                    select: false,
                    responsive: true,
                    altEditor: true, // Enable altEditor
                    buttons: [
                        {
                            text: 'Refresh',
                            name: 'refresh'
                        },
                        {
                            text: 'Export csv',
                            extend: 'csvHtml5',
                            filename: function () {
                                var date = new Date();
                                var hours = date.getHours();
                                var minutes = date.getMinutes();
                                minutes = minutes < 10 ? '0' + minutes : minutes;
                                var seconds = date.getSeconds();
                                seconds = seconds < 10 ? '0' + seconds : seconds;
                                var strDate = date.getMonth() + 1 + "-" + date.getDate() + "-" + date.getFullYear();
                                var strTime = hours + '-' + minutes + '-' + seconds;
                                return  "ROOM_621_" + strDate + "_" + strTime;
                            }
                        }]
                }
                );
                /* --- End --- myTable = $('#example').DataTable*/
            });
        </script>
    </body>
</html>