<%@page import="function.user"%>
<jsp:useBean id="u" class="function.fuser"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = user.update(u);
    if(i!=0) {
      response.sendRedirect(request.getContextPath()+"/index.jsp?folder=crud_user&file=user_personalread.jsp&alertUP=success");
    } else {
      response.sendRedirect(request.getContextPath()+"/index.jsp?folder=crud_user&file=user_personalread.jsp&alertUP=failed");
    }
%>