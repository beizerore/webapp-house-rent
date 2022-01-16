<%@page import="function.user"%>
<jsp:useBean id="u" class="function.fuser"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = user.create(u);
    if(i>0) {
        response.sendRedirect("../login.jsp?alert=s_create");
    } else {
        response.sendRedirect("../login.jsp?alert=f_create");
    }
%>