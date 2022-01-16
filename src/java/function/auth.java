package function;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

public class auth extends HttpServlet {
  
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
          
          PrintWriter out = response.getWriter();

          String username = request.getParameter("username");
          String password = request.getParameter("password");
          
          try {
              Connection con = koneksi.getKoneksi();
              PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username=? AND password=?");

              ps.setString(1, username);
              ps.setString(2, password);
              ResultSet rs = ps.executeQuery();
              boolean status = rs.next();
              
              HttpSession session = request.getSession();
              
              if(status != false){
                session.setAttribute("username", username);
                Cookie cookie = new Cookie("username", username);  
                response.addCookie(cookie);
                
                out.println("{\"succ\":1}");
                out.flush();
              }
              else {
                out.println("{\"fail\":0}");
                out.flush();
              }
              
          } catch(Exception e) {
              System.out.println(e);
          }
  }
}