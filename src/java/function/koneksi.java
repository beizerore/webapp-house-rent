package function;
import java.sql.*;

public class koneksi {
    public static Connection getKoneksi() {
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_rent","root","");
        } catch(Exception e) {
            System.out.println(e);
        }
        
        return con;
    }
}