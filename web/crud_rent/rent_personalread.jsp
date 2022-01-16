        <%@page import="function.*, java.util.*"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
        <c:set var="context" value="${pageContext.request.contextPath}"/>
       
        <%
            String username = (String)request.getSession().getAttribute("username");
            fuser u = user.getRecordByU(username);
            
            int id = u.getIduser();
            
            List<frent> list_rus = rent.getAllByUser(id);
            request.setAttribute("list_ru", list_rus);
            pageContext.setAttribute("list", list_rus);
        %>
        
        <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                <c:set var="count" value="0" scope="page" />
                <c:if test="${list == []}">
                  <div style="text-align: center;" class="bg-dark text-light">
                    <h1>You've not rented anything yet :)</h1>
                  </div>
                </c:if>
              
                <c:forEach items="${list_ru}" var="ru" varStatus="vs">
                  <c:set var="price" value="${ru.getPrice()}"/>
                  <c:set var="total" value="${ru.getTotal()}"/>
                  <fmt:formatNumber type="number" var="f_price" maxFractionDigits="3" value="${price}"/>
                  <fmt:formatNumber type="number" var="f_total" maxFractionDigits="3" value="${total}"/>
                  <c:set var="count" value="${count + 1}" scope="page"/>
                  
                  <div class="card card-item bg-dark">
                    <div class="row">
                      <div class="col-md-3">
                        <image style="width:246px; height:246px;" src="image/${count}.jpg" class="img-fluid">
                      </div>
                      <div class="desc col-md-9">
                        <div class="card-title">Property Name : ${ru.getItemname()}</div>
                        <div class="card-title">Cost: Rp.${f_price}/night</div>
                        <div class="card-title">Rented From/To : ${ru.getTimefrom()} / ${ru.getTimeto()}</div>
                        <div class="card-title">Total Cost : Rp.${f_total}</div>
                      </div>
                    </div>
                    <div style="text-align: right; padding: 10px;">
                      <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#Delete${vs.index}">End Rent</button>
                    </div
                  </div>
                  <!-- Modal -->
                  <div class="modal fade" id="Delete${vs.index}" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                      <div class="modal-content bg-dark">
                        <div class="modal-body">
                          <div id="modal-alert-failed" class="alert">
                            <p>This action will delete or cancel your rent status information. <br>
                               Proceed to end the rent anyway?</p>
                          </div>
                          <div class="row">
                            <div class="col-md-6" id="button-modal">
                              <form action="crud_rent/rent_prosesdelete.jsp" method="post">
                                <input type="text" name="idrent" value="${ru.getIdrent()}">
                                <input type="text" name="iditem" value="${ru.getIditem()}">
                                <input type="text" name="status" value="Available">
                                <input style="width: 100%;" class="btn btn-warning" type="submit" value="End Rent">
                              </form>
                            </div>
                            <div class="col-md-6" style="width: 100%;" id="button-modal">
                              <button style="width: 100%;" type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>        
              </div>
            </div>
        </div>
        <c:choose>
          <c:when test="${param.alertER eq 'success'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content bg-dark">
                  <div class="modal-body">
                    <div id="modal-alert-success" class="alert">Rent status has successfully end :)</div>
                  </div>
                  <div style="text-align: right; padding: 10px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:when test="${param.alertER eq 'failed'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content bg-dark">
                  <div class="modal-body">
                    <div id="modal-alert-failed" class="alert">Rent status failed to end! :(</div>
                  </div>
                  <div style="text-align: right; padding: 10px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
        </c:choose>