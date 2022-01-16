<%-- 
    Document   : dummy
    Created on : Jan 3, 2022, 10:46:44 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <h1>Hello World!</h1>
    
    <input type="date" id="a">
    <input type="date" id="b">
    <input type="text" id="price" value="200000" readonly>
    <input type="text" id="total" readonly>
    <button onclick="hey()">Cek</button>
    <script>
      function hey() {
        var a = document.getElementById("a").value;
        var b = document.getElementById("b").value;
        var c = document.getElementById("price").value;
        
        var x = new Date(a);
        var y = new Date(b);
        
        var z = y.getTime() - x.getTime();
        var xxx = (z / (3600 * 24 * 1000));
        
        var total = c * xxx;
        document.getElementById("total").value = total;
      }
    </script>
  </body>
</html>
