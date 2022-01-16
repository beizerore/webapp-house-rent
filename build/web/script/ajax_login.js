$(document).ready(function(){
  $('#login_btn').click(function(){
    var username = $('#username').val();
    var password = $('#password').val();
    
    if(username != '' && password != ''){
      $.ajax({
        url: "authentication.jsp",
        method: "POST",
        data: {
          username: username,
          password: password
        },
        success: function(data){
          if(data != 'true'){
            alert("failed");
          }
          else {
            window.location.replace("../index.jsp?folder=crud_item&file=item_read.jsp");
          }
        }
      });
    }
    else {
      alert("both fields are required");
    }
  });
});