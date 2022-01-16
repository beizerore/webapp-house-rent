<!DOCTYPE html>
<html>
<head>
    <title>FORM LOGIN</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    
    <link rel="stylesheet" type="text/css" href="style/log.css">
</head>
<body>
    <c:set var="context" value="${pageContext.request.contextPath}"/>

    <%
        String login_msg = (String)request.getAttribute("login_msg");
        if(login_msg != null) {
            out.print(login_msg);
        }
            
        if(session.getAttribute("username") != null) {
            response.sendRedirect("index.jsp");
        }
    %>
</head>
<body>
  <div class="grid">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-5">
            <img src="image/bg-mega.jpg" alt="login" class="login-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
                <div class="logo-utama">
                  <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4 bg-warning" style="padding: 10px; color: black; text-align: center;">
                      YourInn.com
                    </div>
                    <div class="col-md-4"></div>
                  </div>
                </div>
              <p class="login-desc">Register</p>
              <form method="POST" action="crud_user/user_prosescreate.jsp">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name"><i class="far fa-address-card"></i> Name</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Name">
                  </div>
                  <div class="form-group">
                    <label for="username"><i class="far fa-user"></i> Username</label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="Username">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="phone"><i class="far fa-phone"></i> Phone</label>
                    <input type="number" name="phone" id="phone" class="form-control" placeholder="xxx-xxx-xxx-xxx">
                  </div>
                  <div class="form-group">
                    <label for="email"><i class="far fa-envelope"></i> Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="xxx@xxx.com">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="address"><i class="far fa-map-marked-alt"></i> Address</label>
                    <input type="text" name="address" id="addess" class="form-control" placeholder="Address">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="password"><i class="far fa-key"></i> Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="******">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="password" id="message"><i class="far fa-key"></i> Confirm Password</label>
                    <input type="password" name="c_password" id="c_password" class="form-control" placeholder="Confirm Password">
                  </div>
                </div>
              </div>
              <input name="login" id="login" class="btn btn-block tombol" type="submit" value="Register">
              </form>
                <div class="form-group">Already have an account? <a href="login.jsp" class="text-warning">Login Here</a></div>
                <nav>
                  <a href="#!" class="text-warning">Terms of use.</a>
                  <a href="#!" class="text-warning">Privacy policy</a>
                </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script>
        $('#password, #c_password').on('keyup', function () {
            if($('#password').val() == '' && $('#c_password').val() == '') {
              $('#message').html('Password can not be blank <i class="fas fa-exclamation-circle"></i>').css('color', '#FF8800');
            }
            else if($('#password').val() != $('#c_password').val()) {
              $('#message').html('Password not matching <i class="far fa-times-circle"></i>').css('color', 'red');
            }
            else {
              $('#message').html('Password matching <i class="far fa-check-circle"></i>').css('color', 'green');
            }  
        });
    </script>
</body>
</html>