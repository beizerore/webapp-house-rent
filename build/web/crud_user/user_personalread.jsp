
        <%@page import="function.*, java.util.*"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <c:set var="context" value="${pageContext.request.contextPath}"/>
        
        <%
            String username = (String)request.getSession().getAttribute("username");
            fuser u = user.getRecordByU(username);
        %>
        
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-6">
              <div class="card card-item bg-dark">
                <div class="card-body">
                  <div class="card-header">User Profile</div>
                  <div class="c-title card-title"><p><i class="far fa-address-card"></i> Name : <%=u.getName()%></p></div>
                  <div class="c-title card-title"><p><i class="fas fa-user"></i> Username : <%=u.getUsername()%></p></div>
                  <div class="c-title card-title"><p><i class="fas fa-envelope"></i> Email : <%=u.getEmail()%></p></div>
                  <div class="c-title card-title"><p><i class="fas fa-phone"></i> Phone : <%=u.getPhone()%></p></div>
                  <div class="c-title card-title"><p><i class="fas fa-map-marked-alt"></i> Address : <%=u.getAddress()%></p></div>
                  <div class="c-title card-title"><p><i class="fas fa-clock"></i> Registration Time : <%=u.getTime()%></p></div>
                  <div style="text-align: right; margin-top: 70px;">
                    <button class="btn btn-warning" type="button" data-toggle="collapse" data-target="#collapseUser" aria-expanded="false" aria-controls="collapseExample">
                      Edit Profile
                    </button>
                    <button class="btn btn-warning" type="button" data-toggle="collapse" data-target="#collapsePass" aria-expanded="false" aria-controls="collapseExample">
                      Change Password
                    </button>
                    <button class="btn btn-warning" type="button" data-toggle="collapse" data-target="#collapseDelete" aria-expanded="false" aria-controls="collapseExample">
                      Delete Account
                    </button>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="row">
                <div class="col-sm-8">
                  <div class="collapse" id="collapseUser">
                    <div class="card card-item bg-dark">
                      <div class="card-body">
                        <form action="crud_user/user_prosesupdate.jsp" method="get">
                          <input type="hidden" name="iduser" value="<%=u.getIduser()%>">
                          <table class="table-username">
                            <tr>
                              <td><i class="far fa-address-card"></i></td>
                              <td><input class="form-control" type="text" name="name" placeholder="Your Name" value="<%=u.getName()%>"></td>
                            </tr>
                            <tr>
                              <td><i class="fas fa-user"></i></td>
                              <td><input class="form-control" type="text" name="username" placeholder="Username" value="<%=u.getUsername()%>"></td>
                            </tr>
                            <tr>
                              <td><i class="fas fa-envelope"></i></td>
                              <td><input class="form-control" type="text" name="email" placeholder="Email" value="<%=u.getEmail()%>"></td>
                            </tr>
                            <tr>
                              <td><i class="fas fa-phone"></i></td>
                              <td><input class="form-control" type="text" name="phone" placeholder="Phone Number" value="<%=u.getPhone()%>"></td>
                            <a href="user_prosescreate.jsp"></a>
                            </tr>
                            <tr>
                              <td><i class="fas fa-map-marked-alt"></i></td>
                              <td><input class="form-control" type="text" name="address" placeholder="Address" value="<%=u.getAddress()%>"></td>
                              <td><input type="submit" name="submit" class="btn btn-warning" value="Save Changes"></td>
                            </tr>
                          </table>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="collapse" id="collapseDelete">
                    <div class="card bg-dark card-item">
                      <div class="card-body">
                        Do you want to delete your account?
                        <div id="button-modal">
                          <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#Delete">Yes</button>
                          <button class="btn btn-warning" type="button" data-toggle="collapse" data-target="#collapseDelete" aria-expanded="false" aria-controls="collapseExample">
                            No
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="collapse" id="collapsePass">
                <div class="card card-item bg-dark">
                  <div class="card-body">
                    <form action="crud_user/user_updatepass.jsp" type="post">
                    <input type="hidden" name="iduser" value="<%=u.getIduser()%>">
                      <table class="table-username">
                        <tr>
                          <td>Current Password</td>
                          <td>New Password</td>
                          <td>Confirm Password</td>
                        </tr>
                        <tr>
                          <td><input class="form-control" type="text" name="opassword" value="<%=u.getPassword()%>"></td>
                          <td><input class="form-control" type="text" name="cpassword"></td>
                          <td><input class="form-control" type="text" name="npassword"></td>
                        </tr>
                        <tr>
                          <td style="text-align: right;" colspan="3"><input type="submit" value="Save Changes" style=" margin-top: 5px;" class="btn btn-warning"></td>
                        </tr>
                      </table>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="Delete" role="dialog">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content bg-dark">
              <div class="modal-body">
                <div id="modal-alert-failed" class="alert">
                  <p>This action will delete your information. <br>
                     Such as profile, wishlist, and property. Proceed to delete anyway?</p>
                </div>
                <div class="row">
                  <div class="col-md-6" id="button-modal">
                    <form action="crud_user/user_prosesdelete.jsp" method="post">
                      <input type="hidden" name="iduser" value="<%=u.getIduser()%>">
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
        <c:choose>
          <c:when test="${param.alertUP eq 'success'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content bg-dark">
                  <div class="modal-body">
                    <div id="modal-alert-success" class="alert">Your profile has been updated successfully! :)</div>
                  </div>
                  <div style="text-align: right; padding: 10px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:when test="${param.alertUP eq 'failed'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content bg-dark">
                  <div class="modal-body">
                    <div id="modal-alert-failed" class="alert">Your profile failed to update.. :(</div>
                  </div>
                  <div style="text-align: right; padding: 10px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:when test="${param.alertPA eq 'success'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content bg-dark">
                  <div class="modal-body">
                    <div id="modal-alert-success" class="alert">Your password has been updated successfully! :)</div>
                  </div>
                  <div style="text-align: right; padding: 10px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:when test="${param.alertPA eq 'failed'}">
            <div class="modal fade" id="modalOnLoad" role="dialog">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content bg-dark">
                  <div class="modal-body">
                    <div id="modal-alert-failed" class="alert">Your password failed to update.. :(</div>
                  </div>
                  <div style="text-align: right; padding: 10px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
        </c:choose>