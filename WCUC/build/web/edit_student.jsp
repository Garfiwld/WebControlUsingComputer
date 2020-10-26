<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <link rel="stylesheet" type="text/css" href="addons/jQDataTables/datatables.css"/>
        <title>Edit Student</title>
        <style>
            table.dataTable tbody>tr.selected, table.dataTable tbody>tr>.selected {
                background-color: #d86fd2;
            }
            .pagination .page-item.active .page-link {
                background-color: #aa66cc;
            }
            .pagination .page-item.active .page-link:hover {
                background-color: #d86fd2;
            }
        </style>
    </head>
    <body class="fixed-sn">
        <%@include file="/includes/navbar.jsp" %>

        <main>
            <div class="container-fluid mt-3">
                <div class="card">

                    <div class="card-body">

                        <!--Header -->
                        <div class="form-header purple-gradient accent-1">
                            <h3>Edit Student</h3>
                        </div>

                        <form action="upload_student.jsp" method="POST" enctype="multipart/form-data">
                            <div class="col-md-6 mx-auto">
                                <div class="form-group">
                                    <label for="uploadFile">Upload File</label>
                                    <input type="file" accept=".csv" class="form-control-file" id="uploadFile" name="uploadFile" required>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-secondary btn-block">Submit</button>
                                </div>
                            </div>
                        </form>

                        <table cellpadding="0" cellspacing="0" border="0" class="dataTable table table-striped" id="example"></table>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="/includes/body.jsp" %>
        <script type="text/javascript" src="addons/jQDataTables/datatables.js"></script>
        <script src="addons/jQDataTables/dataTables.altEditor.free.js" ></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var columnDefs = [
                    {
                        data: "StudentID",
                        title: "StudentID"
                    },
                    {
                        data: "sPassword",
                        title: "sPassword"
                    },
                    {
                        data: "sFirstname",
                        title: "sFirstname"
                    },
                    {
                        data: "sLastname",
                        title: "sLastname"
                    },
                    {
                        data: "sFirstLogin",
                        title: "sFirstLogin"

                    }
                ];
                $('#example').DataTable({
                    ajax: {
                        url: 'ajax_student.jsp?action=ajlist',
                        dataSrc: ''
                    },
                    columns: columnDefs,
                    dom: 'Bfrtip', // Needs button container
                    select: 'single',
                    responsive: true,
                    altEditor: true, // Enable altEditor
                    buttons: [
                        {
                            text: 'Refresh',
                            name: 'refresh'
                        },
                        {
                            text: 'Export csv',
                            extend: 'csvHtml5'
                        }]
                });
                /*myTable = $('#example').DataTable*/
            });
        </script>
    </body>
</html>
