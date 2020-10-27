<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <link rel="stylesheet" type="text/css" href="addons/jQDataTables/datatables.css"/>
        <title>Edit Teacher</title>
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
            .editMode{
                border: 1px solid black;
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
                        <div id="editinw" class="text-center" style="display:none;">
                            <button class="btn btn-secondary" onclick="editinw()">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>



        <%@include file="/includes/body.jsp" %>
        <script type="text/javascript" src="addons/jQDataTables/datatables.js"></script>
        <script src="addons/jQDataTables/dataTables.altEditor.free.js" ></script>
        <script type="text/javascript" CHARSET="UTF-8">
                                $(document).ready(function () {
                                    var columnDefs = [
                                        {
                                            data: "TeacherID",
                                            title: "TeacherID",
                                            pattern: "[A-Za-z]*",
                                            hoverMsg: "A-Z a-z Only!.",
                                            unique: true,
                                            required: true
                                        },
                                        {
                                            data: "tPassword",
                                            title: "tPassword",
                                            required: true
                                        },
                                        {
                                            data: "tFirstname",
                                            title: "tFirstname",
                                            required: true
                                        },
                                        {
                                            data: "tLastname",
                                            title: "tLastname",
                                            required: true
                                        },
                                        {
                                            data: "tRole",
                                            title: "tRole",
                                            type: "select",
                                            "options": [
                                                "Teacher",
                                                "Admin"
                                            ]
                                        }
                                    ];
                                    $('#example').DataTable({
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
                                                name: 'add'
                                            },
                                            {
                                                extend: 'selected',
                                                text: 'Edit',
                                                name: 'edit'
                                            },
                                            {
                                                extend: 'selected',
                                                text: 'Delete',
                                                name: 'delete'
                                            },
                                            {
                                                text: 'Refresh',
                                                name: 'refresh'
                                            }],
                                        onAddRow: function (datatable, rowdata, success, error) {
                                            $.ajax({
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
                                                url: 'ajax_teacher.jsp?action=ajedit',
                                                type: 'GET',
                                                data: rowdata,
                                                success: success,
                                                error: error
                                            });
                                        }
                                    });
                                });

                                // --- ทำให้ td ในตารางสามารถแก้ไข้ได้ ---
                                $(document).ready(function () {
                                    $('#example').dblclick(function () {
                                        var tdInw = document.getElementsByTagName("td");
                                        for (var i = 0; i < tdInw.length; i++) {
                                            tdInw[i].contentEditable = "true";
                                        }
                                        $(this).addClass('editMode');
                                        document.getElementById('editinw').style.display = "block"
                                    });
                                });
                                // --- อัพเดทข้อมูลทุก Row ที่แสดงผล ---
                                function editinw() {
                                    document.getElementById('editinw').style.display = "none"
                                    $('#example').removeClass("editMode");

                                    var thInw = document.getElementsByTagName("th");
                                    var trInw = document.getElementsByTagName("tr");
                                    for (var i = 1; i < trInw.length; i++) {
                                        var urlInw = 'ajax_teacher.jsp?action=ajedit';
                                        for (var j = 0; j < thInw.length; j++) {
                                            trInw[i].getElementsByTagName("td")[j].contentEditable = "false";
                                            console.log('&' + thInw[j].outerText + '=' + trInw[i].getElementsByTagName("td")[j].outerText);
                                            urlInw += '&' + thInw[j].outerText + '=' + trInw[i].getElementsByTagName("td")[j].outerText;
                                        }
                                        console.log(urlInw);
                                        $.ajax({
                                            url: urlInw,
                                            type: 'GET',
                                            success: function (response) {
                                                console.log('Save successfully');
                                            }
                                        });
                                    }
                                }
        </script>
    </body>
</html>
