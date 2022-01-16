
        <%@page import="function.*, java.util.*"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
        <c:set var="context" value="${pageContext.request.contextPath}"/>
        
        <%
            List<fitem> list_i = item.getAllRecords();
            request.setAttribute("list_i", list_i);
            
            String username = (String)request.getSession().getAttribute("username");
            fuser u = user.getRecordByU(username);
        %>
        
      <div style="display: grid; place-items: center; margin-top: -50px;">
        <img style="width: 100%;" src="image/bg-mega.jpg"/>
      </div>
        
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content bg-dark">
                  <div class="modal-body">
                    <div id="alert-window" class="class"></div>
                  </div>
                  <div style="text-align: right; padding: 10px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
              
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-7">
              <c:set var="count" value="0" scope="page" />
              
              <c:forEach items="${list_i}" var="u" varStatus="vs">
                <c:set var="price" value="${u.getPrice()}"/>
                <c:set var="stats" value="${u.getStatus()}"/>
                <fmt:formatNumber type="number" var="f_price" maxFractionDigits="3" value="${price}"/>
                <c:set var="count" value="${count + 1}" scope="page"/>
                
                <div class="card card-item bg-dark">
                  <div class="row">
                    <div class="col-md-4" style="align-self: center">
                      <image style="width:246px; height:246px;" src="image/${count}.jpg" class="img-fluid">
                    </div>
                    <div class="desc col-md-8">
                      <h4>${u.getName()}</h4>
                      <p>${u.getAddress()}</p>
                      <p>Rp.${f_price}/night</p>
                      <div class="div_list">
                        <ul class="ul_list">
                          <li>${u.getBath()}<i class="fas fa-bath"></i></li>&bull;
                          <li>${u.getBed()}<i class="fas fa-bed"></i></li>&bull;
                          <li>${u.getFurnish()}<i class="fas fa-home"></i></li>
                        </ul>
                      </div>
                      <c:set var="status" value="${u.getStatus()}"/>
                      <c:choose>
                        <c:when test="${status eq 'Available'}">
                          <div id="statusgreen" role="alert">
                        </c:when>
                        <c:when test="${status eq 'Unavailable'}">
                          <div id="statusred" role="alert">
                        </c:when>
                      </c:choose>
                      ${u.getStatus()}</div>
                    </div>
                  </div>
                  
                  <div class="card-footer bg-dark">
                    <div class="row">
                      <div class="col-md-6">
                        <p>Property of: ${u.getOwnername()}</p>
                      </div>
                      <div class="button col-md-6">
                        <c:choose>
                          <c:when test="${status eq 'Available'}">
                            <button type="button" class="btn" data-toggle="modal" data-target="#myModal${vs.index}">
                          </c:when>
                          <c:when test="${status eq 'Unavailable'}">
                            <button type="button" class="btn" data-toggle="modal" data-target="#myModal${vs.index}" disabled>
                          </c:when>
                        </c:choose>
                          Book
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
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
                          <input type="hidden" name="idrenter" value="<%=u.getIduser()%>">
                          <input type="hidden" name="iditem" value="${u.getIditem()}">
                          <input type="hidden" name="price" value="${u.getPrice()}">                                
                          <label for="username">Username</label>
                            <input type="text" class="form-control" value="<%out.print(username);%>" readonly><br/>
                          <label for="timefrom">From
                            <input type="date" name="timefrom" id="timefrom" class="form-control"></label>
                          <label for="timeto">To
                            <input type="date" name="timeto" id="timeto" class="form-control"></label><br/>
                          <label for="price">Cost</label>
                            <input type="text" class="form-control" value="Rp.${f_price}/night" readonly><br/>
                      </div>
                      <div class="modal-footer">
                        <input type="submit" value="Submit" class="btn btn-primary"></button>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>        
            </div>
            <div class="col-md-4">
              <div class="card card-item bg-dark" style="width: 18rem; margin-top: 20px;">
                <div class="card-header">
                  Featured
                </div>
                <ul class="list-group bg-dark">
                  <li style="background-color: grey;" class="list-group-item">Cras justo odio</li>
                  <li style="background-color: grey;" class="list-group-item">Dapibus ac facilisis in</li>
                  <li style="background-color: grey;" class="list-group-item">Vestibulum at eros</li>
                </ul>
              </div>
              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img class="d-block w-100" src="image/9.jpg" alt="First slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="image/10.jpg" alt="Second slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="image/6.jpg" alt="Third slide">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
            </div>
          </div>
        </div>