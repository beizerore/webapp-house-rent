package function;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import function.fitem;

public class item {
        
    public static int create(fitem gt) {
        int status = 0;
        
        try {
            Connection con = koneksi.getKoneksi();

            PreparedStatement ps = con.prepareStatement("INSERT INTO item (item_name, address, furnish, bathroom, bed, id_owner, price, status) VALUES (?,?,?,?,?,?,?,?)");
            ps.setString(1, gt.getName());
            ps.setString(2, gt.getAddress());
            ps.setString(3, gt.getFurnish());
            ps.setInt(4, gt.getBath());
            ps.setInt(5, gt.getBed());
            ps.setInt(6, gt.getIdowner());
            ps.setDouble(7, gt.getPrice());
            ps.setString(8, gt.getStatus());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return status;
    }
    
    public static List<fitem> getAllRecords() {
        List<fitem> list_i = new ArrayList<fitem>();
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM item INNER JOIN user ON item.id_owner = user.id_user");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                fitem i = new fitem();
                i.setIditem(rs.getInt("id_item"));
                i.setBath(rs.getInt("bathroom"));
                i.setBed(rs.getInt("bed"));
                i.setName(rs.getString("item_name"));
                i.setAddress(rs.getString("address"));
                i.setFurnish(rs.getString("furnish"));
                i.setOwnername(rs.getString("username"));
                i.setPrice(rs.getDouble("price"));
                i.setStatus(rs.getString("status"));
                list_i.add(i);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list_i;
    }
    
    public static List<fitem> getAllByUser(int id) {
        List<fitem> list_iu = new ArrayList<fitem>();
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM item INNER JOIN user ON item.id_owner = user.id_user WHERE item.id_owner=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                fitem iu = new fitem();
                iu.setIditem(rs.getInt("id_item"));
                iu.setBath(rs.getInt("bathroom"));
                iu.setBed(rs.getInt("bed"));
                iu.setName(rs.getString("item_name"));
                iu.setAddress(rs.getString("address"));
                iu.setFurnish(rs.getString("furnish"));
                iu.setOwnername(rs.getString("username"));
                iu.setPrice(rs.getDouble("price"));
                iu.setStatus(rs.getString("status"));
                list_iu.add(iu);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list_iu;
    }
    
    public static int update(fitem i) {
        int status = 0;
        
        try {
            Connection con = koneksi.getKoneksi();
            
            PreparedStatement ps = con.prepareStatement("UPDATE item SET item_name=?, address=?, furnish=?, price=?, status=?, bathroom=?, bed=? WHERE id_item=?");
            ps.setString(1, i.getName());
            ps.setString(2, i.getAddress());
            ps.setString(3, i.getFurnish());
            ps.setDouble(4, i.getPrice());
            ps.setString(5, i.getStatus());
            ps.setInt(6, i.getBath());
            ps.setInt(7, i.getBed());
            ps.setInt(8, i.getIditem());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return status;
    }
    
    /* public static fitem getRecordById(int id) {
        fitem i = null;
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("SELECT id_item, item_name, address, description, price, status FROM item WHERE id_item=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                i = new fitem();
                i.setIditem(rs.getInt("id_item"));
                i.setName(rs.getString("item_name"));
                i.setAddress(rs.getString("address"));
                i.setDesc(rs.getString("description"));
                i.setPrice(rs.getDouble("price"));
                i.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return i;
    } */
    
    public static int delete(fitem i) {
        int status = 0;
        
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("DELETE FROM item WHERE id_item=?");
            ps.setInt(1, i.getIditem());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return status;
    }
}