package function;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;


@WebServlet(name = "logout", urlPatterns = {"/logout"})
public class logout extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try {
      response.setContentType("text/html");  
      PrintWriter out = response.getWriter();  
                      
      HttpSession session = request.getSession();  
      session.invalidate();  
      
      Cookie cookie = new Cookie("username", null);
      cookie.setMaxAge(0);
      response.addCookie(cookie);
      
      response.sendRedirect("login.jsp?alert=logout");
    } catch(Exception e) {
      System.out.println(e);
    }
  }
}
