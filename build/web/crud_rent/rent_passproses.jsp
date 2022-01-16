<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>    

 <%
    String from = request.getParameter("timefrom");
    String to   = request.getParameter("timeto");
    
    SimpleDateFormat formatDate = new java.text.SimpleDateFormat("yyyy-MM-dd");
    
    Date date_from = (Date) formatDate.parse(from);
    Date date_to   = (Date) formatDate.parse(to);
    String date1 = formatDate.format(date_from);
    String date2 = formatDate.format(date_to);
    
    int diff      = (int) ((date_to.getTime() - date_from.getTime())/(1000*60*60*24));
    double price  = Double.parseDouble(request.getParameter("price"));
    double total  = diff * price;
    
    String idrenter = request.getParameter("idrenter");
    String iditem   = request.getParameter("iditem");
    String status   = "Unavailable";
    
    String param1 = "?idrenter="+idrenter+"&iditem="+iditem+"&timefrom="+date1;
    String param2 = "&timeto="+date2+"&price="+price+"&total="+total+"&status="+status;
    
    if(total != 0) {
      //String context = (String) pageContext.getAttribute("context");
      response.sendRedirect("/TugasAkhir/crud_rent/rent_prosescreate.jsp"+param1+param2);
    }
    
    //out.println(param1+""+param2);
    //out.println("Between " +formatDate.format(date_from)+ " and " +formatDate.format(date_to)+ " there are " +diff+ " days");
 %>
 
<!-- <script>
  var url_string = window.location.href;
  var url        = new URL(url_string);
  
  var idrenter   = url.searchParams.get("idrenter");
  var iditem     = url.searchParams.get("iditem");
  var timefrom   = url.searchParams.get("timefrom");
  var timeto     = url.searchParams.get("timeto");
  var price      = url.searchParams.get("price");
  var status     = "Not Available";
  
  var from  = new Date(timefrom);
  var to    = new Date(timeto);
  var diff  = to.getTime() - from.getTime();
  var days  = diff / (3600 * 1000 * 24);
  var total = price * days;
  
  var param1 = "?idrenter="+idrenter+"&iditem="+iditem+"&timefrom="+timefrom;
  var param2 = "&timeto="+timeto+"&price="+price+"&total="+total+".0&status="+status;
  
  if(total != false) {
    window.location = "${context}/TugasAkhir/crud_rent/rent_prosescreate.jsp"+param1+param2;
  }
</script> -->