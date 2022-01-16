package function;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import function.fuser;

public class user {
    
    public static int create(fuser gt) {
        int status = 0;
        
        try {
            Connection con = koneksi.getKoneksi();
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO user (name, username, password, phone, email, address, registration_time) VALUES (?,?,?,?,?,?,?)");
            ps.setString(1, gt.getName());
            ps.setString(2, gt.getUsername());
            ps.setString(3, gt.getPassword());
            ps.setString(4, gt.getPhone());
            ps.setString(5, gt.getEmail());
            ps.setString(6, gt.getAddress());
            ps.setTimestamp(7, new java.sql.Timestamp(new java.util.Date().getTime()));
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return status;
    }
    
    public static List<fuser> getAllRecords() {
        List<fuser> list_u = new ArrayList<fuser>();
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                fuser u = new fuser();
                u.setIduser(rs.getInt("id_user"));
                u.setName(rs.getString("name"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                u.setAddress(rs.getString("address"));
                u.setTime(rs.getString("registration_time"));
                list_u.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list_u;
    }
    
    public static int update(fuser u) {
        int status = 0;
        
        try {
            Connection con = koneksi.getKoneksi();
            
            PreparedStatement ps = con.prepareStatement("UPDATE user SET name=?, username=?, phone=?, email=?, address=? WHERE id_user=?");
            ps.setString(1, u.getName());
            ps.setString(2, u.getUsername());
            ps.setString(3, u.getPhone());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getAddress());
            ps.setInt(6, u.getIduser());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return status;
    }
    
    public static int updatePass(fuser p) {
        int status = 0;
        
        try {
            Connection con = koneksi.getKoneksi();
            
            PreparedStatement ps = con.prepareStatement("UPDATE user SET password=? WHERE id_user=?");
            ps.setString(1, p.getNpassword());
            ps.setInt(2, p.getIduser());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return status;
    }
    
    public static fuser getRecordById(int id) {
        fuser u = null;
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE id_user=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                u = new fuser();
                u.setIduser(rs.getInt("id_user"));
                u.setName(rs.getString("name"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                u.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return u;
    }
    
    public static fuser getRecordByU(String username) {
        fuser u = null;
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                u = new fuser();
                u.setIduser(rs.getInt("id_user"));
                u.setName(rs.getString("name"));
                u.setAddress(rs.getString("address"));
                u.setPhone(rs.getString("phone"));
                u.setPassword(rs.getString("password"));
                u.setTime(rs.getString("registration_time"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return u;
    }
    
    public static int delete(fuser u) {
        int status = 0;
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("DELETE FROM user WHERE id_user=?");
            ps.setInt(1, u.getIduser());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return status;
    }
}