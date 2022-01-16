<%@page import="function.item"%>
<jsp:useBean id="u" class="function.fitem"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = item.create(u);
    if(i>0) {
      response.sendRedirect("../index.jsp?folder=crud_item&file=item_personalread.jsp&alert=success");
    }
    else {
      response.sendRedirect("../index.jsp?folder=crud_item&file=item_personalread.jsp&alert=failed");
    }
%>