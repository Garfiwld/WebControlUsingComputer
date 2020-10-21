<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <link rel="stylesheet" type="text/css" href="addons/jQDataTables/datatables.min.css"/>
        <title>JSP Page</title>
        <style>
            table.dataTable tbody>tr.selected, table.dataTable tbody>tr>.selected {
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
                            <h3>Edit Teacher</h3>
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" class="dataTable table table-striped" id="example"></table>
                    </div>
                </div>
            </div>
        </main>



        <%@include file="/includes/body.jsp" %>
        <script type="text/javascript" src="addons/jQDataTables/datatables.min.js"></script>
        <script src="addons/jQDataTables/dataTables.altEditor.free.js" ></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var columnDefs = [
                    {
                        data: "TeacherID",
                        title: "TeacherID",
                        pattern: "[A-Z]*",
                        hoverMsg: "A-Z Uppercase Only!.",
                        unique: true,
                        required: true
                    },
                    {
                        data: "tFirstname",
                        title: "Firstname",
                        required: true
                    },
                    {
                        data: "tLastname",
                        title: "Lastname",
                        required: true
                    },
                    {
                        data: "tPassword",
                        title: "Password",
                        required: true
                    },
                    {
                        data: "tRole",
                        title: "Role",
                        type: "select",
                        "options": [
                            "Teacher",
                            "Admin"
                        ]
                    }
                ];
                var myTable;
                myTable = $('#example').DataTable({
                    "sPaginationType": "full_numbers",
                    ajax: {
                        url: 'ajax_teacher.jsp?action=ajlist',
                        dataSrc: ''
                    },
                    columns: columnDefs,
                    dom: 'Bfrtip', // Needs button container
                    select: 'single',
                    responsive: true,
                    altEditor: true, // Enable altEditor
                    buttons: [
                        {
                            text: 'Add',
                            name: 'add'        // do not change name
                        },
                        {
                            extend: 'selected', // Bind to Selected row
                            text: 'Edit',
                            name: 'edit'        // do not change name
                        },
                        {
                            extend: 'selected', // Bind to Selected row
                            text: 'Delete',
                            name: 'delete'      // do not change name
                        },
                        {
                            text: 'Refresh',
                            name: 'refresh'      // do not change name
                        }],
                    onAddRow: function (datatable, rowdata, success, error) {
                        $.ajax({
                            // a tipycal url would be / with type='PUT'
                            url: 'ajax_teacher.jsp?action=ajadd',
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
                            url: 'ajax_teacher.jsp?action=ajdelete',
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
                            url: 'ajax_teacher.jsp?action=ajedit',
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
