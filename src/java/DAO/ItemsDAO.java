package DAO;

import Model.Items;
import java.sql.SQLException;
import java.util.List;

public interface ItemsDAO {
    
    void saveItems(Items items) throws SQLException;
    void update(Items items) throws SQLException;
    void updateStartDate(Items items) throws SQLException;
    void updateEndDate(Items items) throws SQLException;
    void updatePrice(Items items) throws SQLException;
    void updateStatus(Items items) throws SQLException;
    Items retrieveItemsByItemsID(int items_id) throws ClassNotFoundException, SQLException;
    Items retrieveSellerIDByItemsID(int items_id) throws SQLException;
    Items retrieveItemsStatusByItemsId(int items_id) throws SQLException;
    List<Items> retrieveAllItemsBySellerId(int seller_id) throws ClassNotFoundException, SQLException;
    List<Items> retrieveAllItems() throws ClassNotFoundException, SQLException;
    List<Items> retrieveAllItemsByCategory(String Ctg) throws ClassNotFoundException, SQLException;
    
}
