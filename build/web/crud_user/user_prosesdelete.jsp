<%@page import="function.user"%>
<jsp:useBean id="u" class="function.fuser"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = user.delete(u);
    if(i!=0) {
        session.invalidate();
        response.sendRedirect("../login.jsp?alert=goodbye");
    }
%>