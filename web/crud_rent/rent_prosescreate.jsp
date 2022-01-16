<%@page import="function.rent"%>
<jsp:useBean id="u" class="function.frent"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = rent.create(u);
    if(i>0) {
      response.sendRedirect("../index.jsp?folder=crud_item&file=item_read.jsp&alert=success");
    } else {
      response.sendRedirect("../index.jsp?folder=crud_item&file=item_read.jsp&alert=failed");
    }
%>