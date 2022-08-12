package DAO;

import Model.Shop;
import java.sql.SQLException;


public interface shopDAO {
    
    void saveShop(Shop shop) throws SQLException;
    Shop retrieveShopBySellerID(int seller_ID) throws SQLException;
}
