<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Data</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <style>
            td {
                white-space: nowrap;
            }

            td.wrapok {
                white-space:normal
            }
        </style>
    </head>
    <body>
        
        <%@page import="function.*, java.util.*"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        
        <center><h1>Read Data</h1></center>
        
        <script type="text/javascript">
            var msg ='<%=request.getParameter("alert")%>';
            if(msg == "success") {
                function alertName(){
                    alert("delete success");
                } 
            }
            else if(msg == "failed") {
                function alertName(){
                    alert("delete success");
                }
            }
         </script> 
        
        <%
            List<fuser> list = user.getAllRecords();
            request.setAttribute("list", list);
        %>
        
        <div class="container-fluid">
            <button class="btn" style="background-color: #3BBA9C; width: 10%;"><a style="color: white;" href="create.jsp">Add Data</a></button>
            <br/>
            <br/>
            <div class="row">
                <div class="col-md">
                    <table class="display nowrap" id="datatable">
                        <thead>
                            <tr>
                                <th>Nama</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Regis</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="u">
                                <tr>
                                    <td>${u.getName()}</td>
                                    <td>${u.getUsername()}</td>
                                    <td>${u.getPassword()}</td>
                                    <td>${u.getPhone()}</td>
                                    <td>${u.getEmail()}</td>
                                    <td>${u.getAddress()}</td>
                                    <td>${u.getTime()}</td>
                                    <td style="width: 50%;"><a class="btn btn-success" style="width: 100%; color: white;" href="update.jsp?iduser=${u.getIduser()}"><i class="fas fa-edit"></i></a></td>
                                    <td style="width: 50%;"><a class="btn btn-danger" style="width: 100%; color: white;" href="prosesdelete.jsp?&iduser=${u.getIduser()}"><i class="fas fa-trash"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function(){
                $('#datatable').DataTable({
                    scrollY:        '50vh',
                    scrollCollapse: true,
                    paging:         false
                });
            });
            
            window.onload = alertName;
        </script>
    </body>
</html>