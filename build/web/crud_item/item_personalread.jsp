    
        <%@page import="function.*, java.util.*"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
        <c:set var="context" value="${pageContext.request.contextPath}"/>
        
        <%
            String username = (String)request.getSession().getAttribute("username");
            fuser u = user.getRecordByU(username);
            
            int id = u.getIduser();
            
            List<fitem> list_iu = item.getAllByUser(id);
            request.setAttribute("list_iu", list_iu);
        %>
        
        <div style="margin-bottom: 20px" class="container-fluid">
          <div class="row">
            <div class="col-md-8">
              <c:set var="count" value="0" scope="page" />
              
              <c:forEach items="${list_iu}" var="iu" varStatus="vs">
                <c:set var="price" value="${iu.getPrice()}"/>
                <fmt:formatNumber type="number" var="f_price" maxFractionDigits="3" value="${price}"/>
                <c:set var="count" value="${count + 1}" scope="page"/>
                
                <div id="accordion${vs.index}">
                  <div class="card bg-dark text-light">
                    <div class="card-header" id="headingOne">
                      <h5 class="mb-0">
                        <button class="btn btn-link text-light" data-toggle="collapse" data-target="#collapseOne${vs.index}" aria-expanded="true" aria-controls="collapseOne">
                          Property Information (ID Item: ${iu.getIditem()})
                        </button>
                      </h5>
                    </div>
                    <div id="collapseOne${vs.index}" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion${vs.index}">
                      <div class="card-body">
                        <div style="text-align: right;">
                          <button class="btn btn-warning" type="button" data-toggle="modal" data-target="#Delete${vs.index}">
                            <i class="fas fa-trash-alt"></i> Delete
                          </button>
                          <button class="btn btn-warning" data-toggle="collapse" data-target="#collapseTwo${vs.index}" aria-expanded="false" aria-controls="collapseTwo">
                            <i class="fas fa-edit"></i> Edit
                          </button>
                        </div>
                        <div class="row">
                          <div class="col-md-4" style="align-self: center">
                            <image style="width:246px; height:246px;" src="image/${count}.jpg" class="img-fluid">
                          </div>
                          <div class="desc col-md-8">
                            <table class="table-username table-item">
                              <tr>
                                <td>Name</td>
                                <td>: ${iu.getName()}</td>
                              </tr>
                              <tr>
                                <td>Address</td>
                                <td>: ${iu.getAddress()}</td>
                              </tr>
                              <tr>
                                <td>Price</td>
                                <td>: Rp.${f_price}</td>
                              </tr>
                              <tr>
                                <td>Bed</td>
                                <td>: ${iu.getBed()}</td>
                              </tr>
                              <tr>
                                <td>Bathroom</td>
                                <td>: ${iu.getBath()}</td>
                              </tr>
                              <tr>
                                <td>Furnish Status</td>
                                <td>: ${iu.getFurnish()}</td>
                              </tr>
                              <tr>
                                <td>Available Status</td>
                                <td>: ${iu.getStatus()}</td>
                              </tr>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card bg-dark text-light">
                    <div id="collapseTwo${vs.index}" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion${vs.index}">
                      <div class="card-body">
                        <form action="crud_item/item_prosesupdate.jsp" method="post">
                          <input type="hidden" name="iditem" value="${iu.getIditem()}"/>
                            <table class="table-username table-item">
                              <tr>
                                <td>Name</td>
                                <td><input class="form-control" type="text" name="name" value="${iu.getName()}"/></td>
                              </tr>
                              <tr>
                                <td>Address</td>
                                <td><input class="form-control" type="text" name="address" value="${iu.getAddress()}"/></td>
                              </tr>
                              <tr>
                                <td>Price</td>
                                <td><input class="form-control" type="number" name="price" value="${iu.getPrice()}"</td>
                              </tr>
                              <tr>
                                <td>Bed</td>
                                <td><input class="form-control" type="number" name="bed" value="${iu.getBed()}"</td>
                              </tr>
                              <tr>
                                <td>Bathroom</td>
                                <td><input class="form-control" type="number" name="bath" value="${iu.getBath()}"</td>
                              </tr>
                              <tr>
                                <td>Furnish Status</td>
                                <td>
                                  <select class="form-control" name="furnish">
                                    <option value="Full-Furnished">Full-Furnished</option>
                                    <option value="Semi-Furnished">Semi-Furnished</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td>Available Status</td>
                                <td>
                                  <select class="form-control" name="status">
                                    <option value="Available">Available</option>
                                    <option value="Unavailable">Unvailable</option>
                                  </select>
                                </td>
                              </tr>
                            </table>
                          <div style="text-align: right; margin-top: 10px;">
                            <a class="text-dark btn btn-warning" data-toggle="collapse" data-target="#collapseOne${vs.index}" aria-expanded="false" aria-controls="collapseOne">
                              Cancel
                            </a>
                            <input class="btn btn-warning" type="submit" value="Save Changes"/>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal fade" id="Delete${vs.index}" role="dialog">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content bg-dark">
                      <div class="modal-body">
                        <div id="modal-alert-failed" class="alert">
                          <p>Do you want to delete this property?</p>
                        </div>
                        <div class="row">
                          <div class="col-md-6" id="button-modal">
                            <form action="crud_item/item_prosesdelete.jsp" method="post">
                              <input type="hidden" name="iditem" value="${iu.getIditem()}">
                              <input style="width: 100%;" class="btn btn-warning" type="submit" value="Delete">
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
            <div class="col-md-4">
              <div class="card bg-dark">
                <button class="btn btn-warning" type="button" data-toggle="collapse" data-target="#collapseAdd" aria-expanded="false" aria-controls="collapseExample">
                  Add Property
                </button>
              </div>
              <div class="collapse" id="collapseAdd">
                <div class="card bg-dark card-item">
                  <div class="card-body">
                    <form action="crud_item/item_prosescreate.jsp" method="post">
                      <input type="hidden" name="idowner" value="<%= u.getIduser() %>"/>
                      <input type="hidden" name="status" value="Available"/>
                            <table class="table-username table-item">
                              <tr>
                                <td>Name</td>
                                <td><input class="form-control" type="text" name="name"/></td>
                              </tr>
                              <tr>
                                <td>Address</td>
                                <td><input class="form-control" type="text" name="address"/></td>
                              </tr>
                              <tr>
                                <td>Price</td>
                                <td><input class="form-control" type="number" name="price"/></td>
                              </tr>
                              <tr>
                                <td>Bed</td>
                                <td><input class="form-control" type="number" name="bed"/></td>
                              </tr>
                              <tr>
                                <td>Bathroom</td>
                                <td><input class="form-control" type="number" name="bath"/></td>
                              </tr>
                              <tr>
                                <td>Furnish Status</td>
                                <td>
                                  <select class="form-control" name="furnish">
                                    <option value="Full-Furnished">Full-Furnished</option>
                                    <option value="Semi-Furnished">Semi-Furnished</option>
                                  </select>
                                </td>
                              </tr>
                            </table>
                          <div style="text-align: right; margin-top: 10px;">
                            <input class="btn btn-warning" type="submit" value="Save Changes"/>
                          </div>
                        </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <c:choose>
          <c:when test="${param.alert eq 'success'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content bg-dark">
                  <div class="modal-body">
                    <div id="modal-alert-success" class="alert">Property Successfully Added! :)</div>
                  </div>
                  <div style="text-align: right; padding: 10px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:when test="${param.alert eq 'failed'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content bg-dark">
                  <div class="modal-body">
                    <div id="modal-alert-failed" class="alert">Property Failed to Add! :(</div>
                  </div>
                  <div style="text-align: right; padding: 10px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:when test="${param.alertU eq 'success'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body bg-dark">
                    <div id="modal-alert-success" class="alert">
                      Property Updated Successfully! :)
                    </div>
                    <div style="text-align: right; padding: 10px;">
                      <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:when test="${param.alertU eq 'failed'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body bg-dark">
                    <div id="modal-alert-failed" class="alert">
                      Property Failed to Update :(
                    </div>
                    <div style="text-align: right; padding: 10px;">
                      <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:when test="${param.alertD eq 'success'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body bg-dark">
                    <div id="modal-alert-success" class="alert">
                      Property has been deleted Successfully! :)
                    </div>
                    <div style="text-align: right; padding: 10px;">
                      <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:when test="${param.alertD eq 'failed'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body bg-dark">
                    <div id="modal-alert-failed" class="alert">
                      Property failed to delete :(
                    </div>
                    <div style="text-align: right; padding: 10px;">
                      <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
        </c:choose>