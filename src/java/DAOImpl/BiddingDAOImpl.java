package DAOImpl;

import DAO.BiddingDAO;
import Database.DBConnection;
import Model.Bidding;
import Model.Orders;
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

public class BiddingDAOImpl implements BiddingDAO{
    
    private final Connection con;
    
    public BiddingDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }
    
    @Override
    public void addBid(Bidding bidding) throws SQLException {
        try {
            String mySQLQuery = "insert into bidding(bidder_id, items_id, bidPrice, bidDate) values(?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            
            myPS.setInt(1, bidding.getBidderId());
            myPS.setInt(2, bidding.getItemsId());
            myPS.setDouble(3, bidding.getBidPrice());
            myPS.setDate(4, bidding.getBidDate());
            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }
    
    @Override
    public Bidding retrieveBiddingByHighestBid(Double bidPrice) throws SQLException {
        
        Bidding bidding = null;
        
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from bidding where bidPrice=" + bidPrice;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            rs = myPS.executeQuery();
            
            while (rs.next()){
                bidding = new Bidding();
                
                //bidding.setBiddingId(rs.getInt("bidding_id"));
                bidding.setBidderId(rs.getInt("bidder_id"));
                //bidding.setItemsId(rs.getInt("items_id"));
                //bidding.setBidDate(rs.getDate("bidDate"));
                //bidding.setBidPrice(rs.getDouble("bidPrice"));
                
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return bidding;
    }
    
    @Override
     public List<Bidding> retrieveAllBiddingByBidderId(int bidder_id) throws SQLException {
        
        List <Bidding> biddingList = new ArrayList<>(); 
        Bidding bidding = null;
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from bidding where bidder_id=" + bidder_id;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            
            rs = myPS.executeQuery();
            
            while (rs.next()){
                bidding = new Bidding();
                
                bidding.setBiddingId(rs.getInt("bidding_id"));
                bidding.setBidderId(rs.getInt("bidder_id"));
                bidding.setItemsId(rs.getInt("items_id"));
                bidding.setBidPrice(rs.getDouble("bidPrice"));
                bidding.setBidDate(rs.getDate("bidDate"));
                
                biddingList.add(bidding);
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return biddingList;
    }
    
}
