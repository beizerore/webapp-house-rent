<%@page import="function.rent"%>
<jsp:useBean id="u" class="function.frent"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = rent.delete(u);
    if(i!=0) {
      response.sendRedirect("../index.jsp?folder=crud_rent&file=rent_personalread.jsp&alertER=success");
    } else {
      response.sendRedirect("../index.jsp?folder=crud_rent&file=rent_personalread.jsp&alertER=failed");
    }
%>