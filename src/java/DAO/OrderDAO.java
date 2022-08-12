package DAO;

import Model.Orders;
import java.sql.SQLException;
import java.util.List;

public interface OrderDAO {
    
    Orders retrieveOrderByItemsId(int items_id) throws SQLException;
    Orders retrieveOrderByOrdersId(int order_id) throws SQLException;
    List<Orders> retrieveAllOrderByBidderId(int bidder_id) throws SQLException;
    List<Orders> retrieveAllOrdersBySellerId(int seller_id) throws ClassNotFoundException, SQLException;
    void addOrder(Orders orders) throws SQLException;
    public void updateStatus(Orders orders) throws SQLException;
    public void updateSellStatus(Orders orders) throws SQLException;
}
