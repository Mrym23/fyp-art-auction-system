package DAOImpl;

import DAO.sellerDAO;
import Database.DBConnection;
import Model.Seller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class sellerDAOImpl implements sellerDAO {

    private final Connection con;
    
    public sellerDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }
    
    @Override
    public Seller verifyID(int bidder_ID) throws SQLException {
        ResultSet rs = null;
        Seller seller = null;
        
        try {
            String mySQLQuery = "select seller_id from seller where bidder_ID=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);
            
            ps.setInt(1, bidder_ID);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                seller = new Seller();
                
                seller.setBidderId(bidder_ID);
                seller.setSellerId(rs.getInt(1));
            }
            con.close();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            con.close();
        }
        
        return seller;
    }
    
    @Override
    public void saveID(Seller seller) throws SQLException {
        try {
            String mySQLQuery = "insert into seller(bidder_ID, id_number) values(?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, seller.getBidderId());
            myPS.setString(2, seller.getIdNo());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }
    
    @Override
    public Seller getOne(int seller_ID) throws SQLException {

        Seller seller = null;

        try {
            String mySQLQuery = "select * from seller where seller_id=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setInt(1, seller_ID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                seller = new Seller();

                seller.setSellerId(seller_ID);
                seller.setBidderId(rs.getInt(2));
                seller.setIdNo(rs.getString(3));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

        return seller;
    }
    
    @Override
    public Seller retrieveSellerIDByBidderID(int bidder_ID) throws SQLException {

        Seller seller = null;

        try {
            String mySQLQuery = "select * from seller where bidder_ID=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setInt(1, bidder_ID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                seller = new Seller();

                seller.setBidderId(bidder_ID);
                seller.setSellerId(rs.getInt(1));
                seller.setIdNo(rs.getString(3));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

        return seller;
    }

}
