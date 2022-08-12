package DAOImpl;

import DAO.addressDAO;
import Database.DBConnection;
import Model.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class addressDAOImpl implements addressDAO {
    
    private final Connection con;
    
    public addressDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }

    @Override
    public void addAddress(Address address) throws SQLException {
        try {
            String mySQLQuery = "insert into bidderaddress(bidder_ID, name, contactNo, addr1, addr2, city, state, zipcode) values(?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, address.getBidder_ID());
            myPS.setString(2, address.getName());
            myPS.setString(3, address.getContactNo());
            myPS.setString(4, address.getAddr1());
            myPS.setString(5, address.getAddr2());
            myPS.setString(6, address.getCity());
            myPS.setString(7, address.getState());
            myPS.setInt(8, address.getZipCode());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    @Override
    public List<Address> retrieveAllAddressByBidder_ID(int bidder_ID) throws SQLException {
        List<Address> addresslist = new ArrayList<>();

        Address address;
        ResultSet rs = null;

        try {
            String sqlQuery = "select * from bidderaddress where bidder_ID=" + bidder_ID;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                address = new Address();

                address.setAddress_ID(rs.getInt(1));
                address.setName(rs.getString(3));
                address.setContactNo(rs.getString(4));
                address.setAddr1(rs.getString(5));
                address.setAddr2(rs.getString(6));
                address.setCity(rs.getString(7));
                address.setState(rs.getString(8));
                address.setZipCode(rs.getInt(9));
                address.setBidder_ID(bidder_ID);

                addresslist.add(address);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return addresslist;
    }
    
    @Override
    public Address retrieveAddressByAddress_ID(int address_ID) throws SQLException {
       Address address = new Address();
        
        try {
            String sqlQuery = "select * from bidderaddress where addr_id=" +address_ID;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){                
                address.setAddress_ID(rs.getInt(1));
                address.setBidder_ID(rs.getInt(2));
                address.setName(rs.getString(3));
                address.setContactNo(rs.getString(4));
                address.setAddr1(rs.getString(5)); 
                address.setAddr2(rs.getString(6));
                address.setCity(rs.getString(7));
                address.setState(rs.getString(8));
                address.setZipCode(rs.getInt(9));
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return address;
    }

    @Override
    public void updateAddress(Address address) throws SQLException {
        try {
            String myQ = "UPDATE bidderaddress SET bidder_ID=?, name=?, contactNo=?, addr1=?, addr2=?, city=?, state=?, zipcode=? WHERE addr_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setInt(1, address.getBidder_ID()); 
            myPS.setString(2, address.getName());
            myPS.setString(3, address.getContactNo());
            myPS.setString(4, address.getAddr1());
            myPS.setString(5, address.getAddr2());
            myPS.setString(6, address.getCity());
            myPS.setString(7, address.getState());
            myPS.setInt(8, address.getZipCode());
            myPS.setInt(9, address.getAddress_ID()); 
            
            
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
    public void deleteAddress(Address address) throws SQLException {
        
        String myQ = "delete from bidderaddress where addr_id=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, address.getAddress_ID());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addressDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
