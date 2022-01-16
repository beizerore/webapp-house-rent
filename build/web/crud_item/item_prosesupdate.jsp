<%@page import="function.item"%>
<jsp:useBean id="u" class="function.fitem"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = item.update(u);
    if (i!=0) {
      response.sendRedirect("../index.jsp?folder=crud_item&file=item_personalread.jsp&alertU=success");
    } else {
      response.sendRedirect("../index.jsp?folder=crud_item&file=item_personalread.jsp&alertU=failed");
    }
%>