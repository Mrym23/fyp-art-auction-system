package DAO;

import Model.Seller;
import java.sql.SQLException;
import java.util.List;

public interface sellerDAO {
    
    Seller verifyID (int bidder_ID) throws SQLException;
    void saveID(Seller seller) throws SQLException;
    Seller retrieveSellerIDByBidderID(int bidder_ID) throws SQLException;
    Seller getOne(int seller_ID) throws SQLException;
}
