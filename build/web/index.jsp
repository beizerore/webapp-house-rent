<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Menu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="style/main.css"/>
  </head>
  <body>
    <%@page import="java.io.File, java.util.Date"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    
    <%
      if(session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
      }
    %>
    <header>
      <nav style="background-color: #292929;" class="navbar fixed-top navbar-expand-md navbar-dark scrolling-navbar">
        <a style="padding: 10px; color: black;" class="navbar-brand bg-warning" href="#">YourInn.com</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Sticky-nav">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="Sticky-nav">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp?folder=crud_item&file=item_read.jsp">Catalog</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.jsp?folder=crud_item&file=item_personalread.jsp">Your Property</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.jsp?folder=crud_rent&file=rent_personalread.jsp">Rent History</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i style="font-size: 20px;" class="far fa-user-circle"></i> ${sessionScope.username}
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="index.jsp?folder=crud_user&file=user_personalread.jsp">Profile</a>
                <div class="dropdown-divider"></div>
                <a data-toggle="modal" data-target="#Logout" class="dropdown-item">Logout</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
    </header>
            
    <main> 
      <div>
          <%
            if(request.getParameter("folder")!=null) {
              String dataFile = request.getParameter("folder")+"/"+request.getParameter("file");
              File file = new File(request.getServletContext().getRealPath(dataFile));
                if(file.exists()) { %>
                  <jsp:include page="<%=dataFile%>"/> <%
                } 
                else { %>
                  <jsp:include page="index.jsp"/> <%
                }
            }
          %>
      </div>
    </main>
    <section style="background-color: #292929;" class="footers pt-5 pb-3">
      <div class="container pt-5">
          <div class="row">
              <div class="col-xs-12 col-sm-6 col-md-4">
                <div style="color: white;">
                  <p class="bg-warning" style="font-size: 36px; padding: 10px; color: black;">YourInn.com</p>
                </div>
                <div class="footers-info mt-3">
                  <p>Cras sociis natoque penatibus et magnis Lorem Ipsum tells about the compmany right now the best.</p>
                </div>
              </div>
              <div class="col-xs-12 col-sm-6 col-md-2">
                <h5 style="color: white;">Essentials</h5>
                <ul class="list-unstyled">
                  <li><a href="maintenance.html">Search</a></li>
                  <li><a href="contact.html">Sell your Car</a></li>
                  <li><a href="about.html">Advertise with us</a></li>
                  <li><a href="about.html">Dealers Portal</a></li>
                  <li><a href="about.html">Post Requirements</a></li>
                </ul>
              </div>
          </div>
      </div>
    </section>
    <section style="background-color:black; border:0px;">
       <div class="container">
           <div class="row text-center">
               <div class="col-md-12 pt-3">
                   <p class="text-muted">© 2021 Zerore Bei</p>
               </div>
           </div>
       </div>
    </section>
    
    <div class="modal fade" id="Logout" role="dialog">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content bg-dark">
          <div class="modal-body">
            <div id="modal-alert-failed" class="alert">
              <p>Are You Sure? :(</p>
            </div>
            <div class="row">
              <div class="col-md-6" id="button-modal">
                <form action="logout" method="post">
                  <input style="width: 100%;" class="btn btn-warning" type="submit" value="Yes">
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
      
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script type="text/javascript">
    if(${param.alert != null}) {
      $(window).on('load', function() {
        $('#modalOnLoad').modal('show');

        var hello = '<% out.print("Welcome! "+request.getSession().getAttribute("username")+"<br>You were signed in at: "+new Date().toLocaleString()+"<br> Happy Check In :)"); %>';
        if(${param.alert eq 'success'}) {
          $('#alert-window').removeClass('class').addClass('modal-alert-success').html("Congrats, Booking Success! :)");
        }
        else if (${param.alert eq 'failed'}) {
          $('#alert-window').removeClass('class').addClass('modal-alert-failed').html("Oh no, Booking Fail.. :(");
        }
        else if (${param.alert eq 'hello'}){
          $('#alert-window').removeClass('class').addClass('modal-alert-success').html(hello);
        }
    });
    }
  </script>
  </body>
</html>