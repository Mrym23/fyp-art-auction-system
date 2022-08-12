package DAOImpl;

import DAO.shopAddressDAO;
import Database.DBConnection;
import Model.ShopAddress;
import Model.ShopAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class shopAddressDAOImpl implements shopAddressDAO{
    
    private final Connection con;
    
    public shopAddressDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }

    @Override
    public void addShopAddress(ShopAddress shopAddress) throws SQLException {
        try {
            String mySQLQuery = "insert into shopaddress(seller_id, contact_no, addr1, addr2, city, state, zipcode) values(?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, shopAddress.getSeller_ID());
            myPS.setString(2, shopAddress.getContactNo());
            myPS.setString(3, shopAddress.getAddr1());
            myPS.setString(4, shopAddress.getAddr2());
            myPS.setString(5, shopAddress.getCity());
            myPS.setString(6, shopAddress.getState());
            myPS.setInt(7, shopAddress.getZipCode());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }
    
    @Override
    public ShopAddress retrieveShopAddressByAddress_ID(int address_ID) throws SQLException {
       ShopAddress address = new ShopAddress();
        
        try {
            String sqlQuery = "select * from shopaddress where addr_id=" +address_ID;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){                
                address.setAddress_ID(rs.getInt(1));
                address.setSeller_ID(rs.getInt(2));
                address.setContactNo(rs.getString(3));
                address.setAddr1(rs.getString(4)); 
                address.setAddr2(rs.getString(5));
                address.setCity(rs.getString(6));
                address.setState(rs.getString(7));
                address.setZipCode(rs.getInt(8));
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return address;
    }
    
    @Override
    public ShopAddress retrieveShopAddressBySeller_ID(int seller_ID) throws SQLException {
       ShopAddress address = new ShopAddress();
        
        try {
            String sqlQuery = "select * from shopaddress where seller_id=" +seller_ID;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){                
                address.setAddress_ID(rs.getInt(1));
                address.setSeller_ID(rs.getInt(2));
                address.setContactNo(rs.getString(3));
                address.setAddr1(rs.getString(4)); 
                address.setAddr2(rs.getString(5));
                address.setCity(rs.getString(6));
                address.setState(rs.getString(7));
                address.setZipCode(rs.getInt(8));
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return address;
    }
    
    @Override
    public void updateShopAddress(ShopAddress address) throws SQLException {
        try {
            String myQ = "UPDATE shopaddress SET seller_id=?, contact_no=?, addr1=?, addr2=?, city=?, state=?, zipcode=? WHERE addr_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setInt(1, address.getSeller_ID());
            myPS.setString(2, address.getContactNo());
            myPS.setString(3, address.getAddr1());
            myPS.setString(4, address.getAddr2());
            myPS.setString(5, address.getCity());
            myPS.setString(6, address.getState());
            myPS.setInt(7, address.getZipCode());
            myPS.setInt(8, address.getAddress_ID()); 
            
            
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
    public void deleteShopAddress(ShopAddress address) throws SQLException {
        
        String myQ = "delete from shopaddress where addr_id=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, address.getAddress_ID());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addressDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
