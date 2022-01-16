<!DOCTYPE html>
<html>
<head>
    <title>LOGIN</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="style/log.css">
    <link rel="stylesheet" type="text/css" href="style/main.css">
</head>
<body>
    <c:set var="context" value="${pageContext.request.contextPath}"/>

    <%
        String login_msg = (String)request.getAttribute("login_msg");
        if(login_msg != null) {
            out.print(login_msg);
        }
            
        if(session.getAttribute("username") != null) {
            response.sendRedirect("index.jsp?folder=crud_item&file=item_read.jsp");
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
          <div class="col-md-7 right">
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
            <p class="login-desc">Log In</p>
                <form name="login_form" id="login_form" method="post">
                  <div class="form-group">
                    <label for="username"><i class="far fa-user"></i> Username</label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="Username">
                  </div>
                  <div class="form-group">
                    <label for="password"><i class="far fa-key"></i> Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="******">
                  </div>
                  <button type="button" id="btn_login" class="btn btn-block tombol">Login</button>
                </form>
                <div class="form-group">Don't have an account? <a href="register.jsp" class="text-warning">Register Here</a></div>
                <nav class="right-bottom">
                  <a href="#!" class="text-warning">Terms of use.</a>
                  <a href="#!" class="text-warning">Privacy policy</a>
                </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
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
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      $('#btn_login').click(function(){
        var username = $('#username').val();
        var password = $('#password').val();
        
        if(username != '' && password != ''){
          $.ajax({
            url: "auth",
            method: "POST",
            dataType: "json",
            data: {
              username: username,
              password: password
            },
            success: function(data){
                if(data.succ){
                  window.location.replace("index.jsp?folder=crud_item&file=item_read.jsp&alert=hello");
                }
                else{
                  $('#modalOnLoad').modal('show');
                  $('#alert-window').removeClass('class').addClass('modal-alert-failed').html("Your Username/Password is invalid");
                }
              }
          });
        }
        else {
          console.log("failed 2");
          $('#modalOnLoad').modal('show');
          $('#alert-window').removeClass('class').addClass('modal-alert-failed').html("Username/Password is wrong");
        }
      });
    });
  </script>
  <script type="text/javascript">
    if(${param.alert != null}) {
      $(window).on('load', function() {
        $('#modalOnLoad').modal('show');
        
        if(${param.alert eq 's_create'}) {
          $('#alert-window').removeClass('class').addClass('modal-alert-success').html("Your Account Has Been Created");
        }
        else if (${param.alert eq 'f_create'}) {
          $('#alert-window').removeClass('class').addClass('modal-alert-failed').html("Failed to create your account");
        }
        else if (${param.alert eq 'logout'}){
          $('#alert-window').removeClass('class').addClass('modal-alert-success').html("Logout Success, Goodbye :')");
        }
        else if (${param.alert eq 'goodbye'}){
          $('#alert-window').removeClass('class').addClass('modal-alert-success').html("Your Account has been deleted, Goodbye :')");
        }
    });
    }
  </script>
</body>
</html>
