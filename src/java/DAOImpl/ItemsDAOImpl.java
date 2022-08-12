package DAOImpl;

import DAO.ItemsDAO;
import Database.DBConnection;
import Model.Items;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

public class ItemsDAOImpl implements ItemsDAO{
    
    private final Connection con;
    
    public ItemsDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }
    
    @Override
    public void saveItems(Items items) throws SQLException {
        try {
            String mySQLQuery = "insert into items(seller_id, items_img, itemsName, itemsCtg, price, startDate, endDate, itemsDesc, status) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            
            myPS.setInt(1, items.getSellerId());
            
            Part filePart = items.getItemsImg();
            InputStream inputStream = null;
            
            if (filePart != null){
                try {
                    // obtains input stream of the upload file
                    inputStream = filePart.getInputStream();
                } catch (IOException ex) {
                    Logger.getLogger(ItemsDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            } 
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(2, inputStream);
            }
            
            myPS.setString(3, items.getItemsName());
            myPS.setString(4, items.getItemsCtg());
            myPS.setDouble(5, items.getPrice());
            myPS.setDate(6, items.getStartDate());
            myPS.setDate(7, items.getEndDate());
            myPS.setString(8, items.getItemsDesc());
            myPS.setString(9, items.getStatus());
            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }
    
    @Override
    public List<Items> retrieveAllItemsBySellerId(int seller_id) throws ClassNotFoundException, SQLException {
        
        List <Items> itemsList = new ArrayList<>();
        
        Items items;
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from items where seller_id=" + seller_id;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            rs = myPS.executeQuery();
            
            while (rs.next()){
                items = new Items();
                
                items.setItemsId(rs.getInt("items_id"));
                items.setSellerId(rs.getInt("seller_id"));
                items.setItemsName(rs.getString("itemsName"));
                items.setItemsCtg(rs.getString("itemsCtg"));
                items.setPrice(rs.getDouble("price"));
                items.setStartDate(rs.getDate("startDate"));
                items.setEndDate(rs.getDate("endDate"));
                items.setItemsDesc(rs.getString("itemsDesc"));
                items.setStatus(rs.getString("status"));
                
                
                itemsList.add(items);
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return itemsList;
    }
    
    @Override
    public List<Items> retrieveAllItems() throws ClassNotFoundException, SQLException {
        
        List <Items> itemsList = new ArrayList<>();
        
        Items items;
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from items";
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            rs = myPS.executeQuery();
            
            while (rs.next()){
                items = new Items();
                
                items.setItemsId(rs.getInt("items_id"));
                items.setSellerId(rs.getInt("seller_id"));
                items.setItemsName(rs.getString("itemsName"));
                items.setItemsCtg(rs.getString("itemsCtg"));
                items.setPrice(rs.getDouble("price"));
                items.setStartDate(rs.getDate("startDate"));
                items.setEndDate(rs.getDate("endDate"));
                items.setItemsDesc(rs.getString("itemsDesc"));
                items.setStatus(rs.getString("status"));
                
                
                itemsList.add(items);
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return itemsList;
    }
    
    @Override
    public List<Items> retrieveAllItemsByCategory(String Ctg) throws ClassNotFoundException, SQLException {
        
        List <Items> itemsList = new ArrayList<>();
        
        Items items;
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from items where itemsCtg=" + Ctg;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            rs = myPS.executeQuery();
            
            while (rs.next()){
                items = new Items();
                
                items.setItemsId(rs.getInt("items_id"));
                items.setSellerId(rs.getInt("seller_id"));
                items.setItemsName(rs.getString("itemsName"));
                items.setItemsCtg(rs.getString("itemsCtg"));
                items.setPrice(rs.getDouble("price"));
                items.setStartDate(rs.getDate("startDate"));
                items.setEndDate(rs.getDate("endDate"));
                items.setItemsDesc(rs.getString("itemsDesc"));
                
                
                itemsList.add(items);
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return itemsList;
    }

    @Override
    public Items retrieveItemsByItemsID(int items_id) throws ClassNotFoundException, SQLException {
        
        Items items = null;
        
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from items where items_id=" + items_id;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            rs = myPS.executeQuery();
            
            while (rs.next()){
                items = new Items();
                
                items.setItemsId(rs.getInt("items_id"));
                items.setSellerId(rs.getInt("seller_id"));
                items.setItemsName(rs.getString("itemsName"));
                items.setItemsCtg(rs.getString("itemsCtg"));
                items.setPrice(rs.getDouble("price"));
                items.setStartDate(rs.getDate("startDate"));
                items.setEndDate(rs.getDate("endDate"));
                items.setItemsDesc(rs.getString("itemsDesc"));
                items.setStatus(rs.getString("status"));
                
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return items;
    }
    
    @Override
    public void update(Items items){
        
        try {
            String myQ = "UPDATE items SET seller_id=?, itemsName=?, itemsCtg=?, price=?, startDate=?, endDate=?, itemsDesc=?, status=? WHERE items_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setInt(1, items.getSellerId());
            myPS.setString(2, items.getItemsName());
            myPS.setString(3, items.getItemsCtg());
            myPS.setDouble(4, items.getPrice());
            myPS.setDate(5, items.getStartDate());
            myPS.setDate(6, items.getEndDate());
            myPS.setString(7, items.getItemsDesc());
            myPS.setString(8, items.getStatus());
            myPS.setInt(9, items.getItemsId());
            myPS.executeUpdate(); 
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(bidderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    @Override
    public void updateStartDate(Items items){
        
        try {
            String myQ = "UPDATE items SET startDate=?, status=? WHERE items_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setDate(1, items.getStartDate());
            myPS.setString(2, items.getStatus());
            myPS.setInt(3, items.getItemsId());
            
            myPS.executeUpdate(); 
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(bidderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
     @Override
    public void updateEndDate(Items items){
        
        try {
            String myQ = "UPDATE items SET endDate=?, status=? WHERE items_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setDate(1, items.getEndDate());
            myPS.setString(2, items.getStatus());
            myPS.setInt(3, items.getItemsId());
            myPS.executeUpdate(); 
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(bidderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    @Override
    public void updatePrice(Items items){
        
        try {
            String myQ = "UPDATE items SET price=? WHERE items_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setDouble(1, items.getPrice());
            myPS.setInt(2, items.getItemsId());
            myPS.executeUpdate(); 
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(bidderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    @Override
    public void updateStatus(Items items){
        
        try {
            String myQ = "UPDATE items SET status=? WHERE items_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, items.getStatus());
            myPS.setInt(2, items.getItemsId());
            myPS.executeUpdate(); 
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(bidderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    @Override
    public Items retrieveSellerIDByItemsID(int items_id) throws SQLException {

        Items items = null;

        try {
            String mySQLQuery = "select * from items where items_id=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setInt(1, items_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                items = new Items();

                items.setItemsId(items_id);
                items.setSellerId(rs.getInt(1));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

        return items;
    }
    
    @Override
    public Items retrieveItemsStatusByItemsId(int items_id) throws SQLException {

        Items items = null;

        try {
            String mySQLQuery = "select * from items where items_id=" + items_id;
            PreparedStatement ps = con.prepareStatement(mySQLQuery);


            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                items = new Items();

                items.setItemsId(items_id);
                items.setStatus(rs.getString("status"));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

        return items;
    }
    
    

}
