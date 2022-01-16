package function;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import function.frent;

public class rent {
        
    public static int create(frent gt) {
        int status = 0;
        
        try {
            Connection con = koneksi.getKoneksi();

            PreparedStatement ps = con.prepareStatement("INSERT INTO rent (id_item, id_renter, time_from, time_to, price, total) VALUES (?,?,?,?,?,?)");
            ps.setInt(1, gt.getIditem());
            ps.setInt(2, gt.getIdrenter());
            ps.setString(3, gt.getTimefrom());
            ps.setString(4, gt.getTimeto());
            ps.setDouble(5, gt.getPrice());
            ps.setDouble(6, gt.getTotal());
            ps.executeUpdate();
            
            PreparedStatement st = con.prepareStatement("UPDATE item SET status=? WHERE id_item=?");
            st.setString(1, gt.getStatus());
            st.setInt(2, gt.getIditem());
            status = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return status;
    }
    
    public static List<frent> getAllRecords() {
        List<frent> list_r = new ArrayList<frent>();
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT * " +
                                                        "FROM ((rent " +
                                                        "INNER JOIN user ON rent.id_renter = user.id_user) " +
                                                        "INNER JOIN item ON rent.id_renter = item.id_item);");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                frent r = new frent();
                r.setIdrent(rs.getInt("id_rent"));
                r.setItemname(rs.getString("item_name"));
                r.setRentername(rs.getString("name"));
                r.setTimefrom(rs.getString("time_from"));
                r.setTimeto(rs.getString("time_to"));
                r.setPrice(rs.getDouble("price"));
                r.setTotal(rs.getDouble("total"));
                list_r.add(r);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list_r;
    }
    
    public static List<frent> getAllByUser(int id) {
        List<frent> list_ru = new ArrayList<frent>();
         
       /* try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM rent " +
                                                        "INNER JOIN item ON rent.id_item = item.id_item " +
                                                        "WHERE id_renter=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                frent ru = new frent();
                ru.setItemname(rs.getString("item_name"));
                ru.setIdrenter(rs.getInt("id_renter"));
                list_ru.add(ru);
            }
        } catch(Exception e) {
            System.out.println(e);
        } */
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM rent " +
                                                      //"FROM ((rent " +
                                                      //"INNER JOIN user ON rent.id_renter = user.id_user) " +
                                                        "INNER JOIN item ON rent.id_item = item.id_item " +
                                                        "WHERE id_renter=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                frent ru = new frent();
                ru.setIdrent(rs.getInt("id_rent"));
                ru.setIditem(rs.getInt("id_item"));
                ru.setItemname(rs.getString("item_name"));
                //ru.setIdrenter(rs.getInt("id_renter"));
                //ru.setRentername(rs.getString("name"));
                ru.setTimefrom(rs.getString("time_from"));
                ru.setTimeto(rs.getString("time_to"));
                ru.setPrice(rs.getDouble("price"));
                ru.setTotal(rs.getDouble("total"));
                list_ru.add(ru);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list_ru;
    }
    
    public static frent getRecordById(int id) {
        frent r = null;
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM rent WHERE id_rent=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                r = new frent();
                r.setIdrent(rs.getInt("id_rent"));
                r.setItemname(rs.getString("item_name"));
                r.setRentername(rs.getString("name"));
                r.setTimefrom(rs.getString("time_from"));
                r.setTimeto(rs.getString("time_to"));
                r.setPrice(rs.getDouble("price"));
                r.setTotal(rs.getDouble("total"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return r;
    }
    
    public static int delete(frent r) {
        int status = 0;
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("DELETE FROM rent WHERE id_rent=?");
            ps.setInt(1, r.getIdrent());
            status = ps.executeUpdate();
            
            PreparedStatement st = con.prepareStatement("UPDATE item SET status=? WHERE id_item=?");
            st.setString(1, r.getStatus());
            st.setInt(2, r.getIditem());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return status;
    }
}