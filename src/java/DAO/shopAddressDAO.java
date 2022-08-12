package DAO;

import Model.ShopAddress;
import java.sql.SQLException;
import java.util.List;

public interface shopAddressDAO {
    
    void addShopAddress(ShopAddress shopAddress) throws SQLException;
    ShopAddress retrieveShopAddressByAddress_ID(int address_ID) throws SQLException;
    ShopAddress retrieveShopAddressBySeller_ID(int seller_ID) throws SQLException;
    void updateShopAddress(ShopAddress shopAddress) throws SQLException;
    void deleteShopAddress(ShopAddress shopAddress) throws SQLException;
}
