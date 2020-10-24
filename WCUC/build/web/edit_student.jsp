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
                color: #fff;
                background-color: #aa66cc;
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
                        title: "StudentID",
                        pattern: "[0-9]{13}",
                        hoverMsg: "0-9 13 Digit Only!.",
                        unique: true,
                        required: true
                    },
                    {
                        data: "sPassword",
                        title: "sPassword",
                        required: true
                    },
                    {
                        data: "sFirstname",
                        title: "sFirstname",
                        required: true
                    },
                    {
                        data: "sLastname",
                        title: "sLastname",
                        required: true
                    },
                    {
                        data: "sFirstLogin",
                        title: "sFirstLogin",
                        type: "readonly"
                        
                    }
                ];
                var myTable;
                myTable = $('#example').DataTable({
                    "sPaginationType": "full_numbers",
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
                            text: 'Export csv',
                            extend: 'csvHtml5'
                        }],
                    onAddRow: function (datatable, rowdata, success, error) {
                        $.ajax({
                            // a tipycal url would be / with type='PUT'
                            url: 'ajax_student.jsp?action=ajadd',
                            type: 'GET',
                            data: rowdata,
                            success: success,
                            error: error
                        });
                    }
                    ,
                    onDeleteRow: function (datatable, rowdata, success, error) {
                        $.ajax({
                            // a tipycal url would be /{id} with type='DELETE'
                            url: 'ajax_student.jsp?action=ajdelete',
                            type: 'GET',
                            data: rowdata,
                            success: success,
                            error: error
                        });
                    }
                    ,
                    onEditRow: function (datatable, rowdata, success, error) {
                        $.ajax({
                            // a tipycal url would be /{id} with type='POST'
                            url: 'ajax_student.jsp?action=ajedit',
                            type: 'GET',
                            data: rowdata,
                            success: success,
                            error: error
                        });
                    }
                });
                /*myTable = $('#example').DataTable*/
            });
        </script>
    </body>
</html>
