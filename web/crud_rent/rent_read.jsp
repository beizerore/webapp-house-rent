<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Data</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        

    </head>
    <body>
        
        <%@page import="function.*, java.util.*"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
        <c:set var="context" value="${pageContext.request.contextPath}"/>
        
        <center><h1>Read Data</h1></center>
        
        <%
            String username = (String)request.getSession().getAttribute("username");
            fuser u = user.getRecordByU(username);
            
            int id = u.getIduser();
            
            List<frent> list_ru = rent.getAllByUser(id);
            request.setAttribute("list_ru", list_ru);
        %>
        
        <div class="container-fluid">
            <button class="btn" style="background-color: #3BBA9C; width: 10%;"><a style="color: white;" href="item_create.jsp">Add Data</a></button>
            <br/>
            <br/>
            <div class="row">
              <c:forEach items="${list_ru}" var="ru" varStatus="vs">
                <c:set var="price" value="${u.getPrice()}"/>
                <c:set var="stats" value="${u.getStatus()}"/>
                <fmt:formatNumber type="number" var="f_price" maxFractionDigits="3" value="${price}"/>
                <div class="col-md-3 mt-3">
                  <div class="card">
                    <image src="image/0.jpg" style="width: 90%; height:90%; align-self: center">
                    <div class="card-body">
                      <h4 class="card-title">${ru.getItemname()}</h4>
                      <h5 class="card-title">${ru.getIdrent()}</h5>
                      <p class="card-title">${u.getAddress()}</p>
                      <p class="card-text">${u.getDesc()}</p>
                      <p class="card-title">Property of: ${u.getOwnername()}</p>
                      
                      <h5 class="card-title">${u.getStatus()}</h5>
                      <a class="btn btn-dark" href="${context}/crud_rent/rent_create.jsp?iditem=${u.getIditem()}">Book</a>
                      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${vs.index}">
                        Book
                      </button>
                      <!-- Modal -->
                      <div class="modal fade" id="myModal${vs.index}" role="dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">Book</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <form action="${context}/crud_rent/rent_passproses.jsp" method="get">
                                <input type="text" name="idrenter" value="<%=u.getIduser()%>">
                                <input type="text" name="iditem" value="${u.getIditem()}">
                                <input type="text" name="price" value="${u.getPrice()}">
                                
                                <label for="username">Username</label>
                                  <input type="text" class="form-control" value="<%out.print(username);%>" readonly><br/>
                                <label for="timefrom">From
                                  <input type="date" name="timefrom" id="timefrom" class="form-control"></label>
                                <label for="timeto">To
                                  <input type="date" name="timeto" id="timeto" class="form-control"></label><br/>
                                <label for="price">Price per Day</label>
                                  <input type="text" class="form-control" value="${f_price}" readonly><br/>
                            </div>
                            <div class="modal-footer">
                              <input type="submit" value="Submit" class="btn btn-primary"></button>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
        </div>
    </body>
</html>