<%@page import="function.user"%>
<jsp:useBean id="p" class="function.fuser"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>

<%
    int i = user.updatePass(p);
    if(i!=0) {
      response.sendRedirect(request.getContextPath()+"/index.jsp?folder=crud_user&file=user_personalread.jsp&alertPA=success");
    } else {
      out.print("gagal");
      //response.sendRedirect(request.getContextPath()+"/index.jsp?folder=crud_user&file=user_personalread.jsp&alert=failed");
    }
%>