package DAO;

import Model.Bidding;
import Model.Orders;
import java.sql.SQLException;
import java.util.List;

public interface BiddingDAO {
     void addBid(Bidding bidding) throws SQLException; 
     Bidding retrieveBiddingByHighestBid(Double bidPrice) throws SQLException;
     List<Bidding> retrieveAllBiddingByBidderId(int bidder_id) throws SQLException;
     
}
