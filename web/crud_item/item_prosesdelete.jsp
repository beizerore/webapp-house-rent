<%@page import="function.item"%>
<jsp:useBean id="i" class="function.fitem"></jsp:useBean>
<jsp:setProperty property="*" name="i"/>

<%
    int x = item.delete(i);
    if(x!=0) {
      response.sendRedirect("../index.jsp?folder=crud_item&file=item_personalread.jsp&alertD=success");
    } else {
      response.sendRedirect("../index.jsp?folder=crud_item&file=item_personalread.jsp&alertD=failed");
    }
%>