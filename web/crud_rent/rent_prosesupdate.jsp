<%@page import="function.user"%>
<jsp:useBean id="u" class="function.fuser"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = user.update(u);
    if (i!=0) {
        response.sendRedirect("read.jsp");
    }
%>