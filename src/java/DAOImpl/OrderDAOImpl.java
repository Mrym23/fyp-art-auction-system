package DAOImpl;

import DAO.OrderDAO;
import Database.DBConnection;
import Model.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAOImpl implements OrderDAO{
   
    private final Connection con;
    
    public OrderDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }
    
    @Override
    public void addOrder(Orders orders) throws SQLException {
        try {
            String mySQLQuery = "insert into orders(seller_id, bidder_id, items_id, status, shippingFee, orderDate) values(?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            
            myPS.setInt(1, orders.getSellerId());
            myPS.setInt(2, orders.getBidderId());
            myPS.setInt(3, orders.getItemsId());
            myPS.setString(4, orders.getStatus());
            myPS.setDouble(5, orders.getShippingFee());
            myPS.setDate(6, orders.getOrderDate());
            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }
    
    @Override
    public Orders retrieveOrderByItemsId(int items_id) throws SQLException {
        
        Orders orders = null;
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from orders where items_id=" + items_id;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            
            rs = myPS.executeQuery();
            
            while (rs.next()){
                orders = new Orders();
                
                orders.setOrderId(rs.getInt("order_id"));
                orders.setSellerId(rs.getInt("seller_id"));
                orders.setBidderId(rs.getInt("bidder_id"));
                orders.setItemsId(rs.getInt("items_id"));
                orders.setStatus(rs.getString("status"));
                orders.setShippingFee(rs.getDouble("shippingFee"));
                orders.setOrderDate(rs.getDate("orderDate"));
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return orders;
    }
    
    @Override
    public Orders retrieveOrderByOrdersId(int order_id) throws SQLException {
        
        Orders orders = null;
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from orders where order_id=" + order_id;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            
            rs = myPS.executeQuery();
            
            while (rs.next()){
                orders = new Orders();
                
                orders.setOrderId(rs.getInt("order_id"));
                orders.setSellerId(rs.getInt("seller_id"));
                orders.setBidderId(rs.getInt("bidder_id"));
                orders.setItemsId(rs.getInt("items_id"));
                orders.setStatus(rs.getString("status"));
                orders.setShippingFee(rs.getDouble("shippingFee"));
                orders.setOrderDate(rs.getDate("orderDate"));
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return orders;
    }
    
    @Override
     public List<Orders> retrieveAllOrderByBidderId(int bidder_id) throws SQLException {
        
        List <Orders> ordersList = new ArrayList<>(); 
        Orders orders = null;
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from orders where bidder_id=" + bidder_id;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            
            rs = myPS.executeQuery();
            
            while (rs.next()){
                orders = new Orders();
                
                orders.setOrderId(rs.getInt("order_id"));
                orders.setSellerId(rs.getInt("seller_id"));
                orders.setBidderId(rs.getInt("bidder_id"));
                orders.setItemsId(rs.getInt("items_id"));
                orders.setStatus(rs.getString("status"));
                orders.setShippingFee(rs.getDouble("shippingFee"));
                orders.setOrderDate(rs.getDate("orderDate"));
                
                ordersList.add(orders);
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return ordersList;
    }
    
    @Override
    public List<Orders> retrieveAllOrdersBySellerId(int seller_id) throws ClassNotFoundException, SQLException {
        
        List <Orders> ordersList = new ArrayList<>();
        
        Orders orders;
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from orders where seller_id=" + seller_id;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            rs = myPS.executeQuery();
            
            while (rs.next()){
                orders = new Orders();
                
                orders.setOrderId(rs.getInt("order_id"));
                orders.setSellerId(rs.getInt("seller_id"));
                orders.setBidderId(rs.getInt("bidder_id"));
                orders.setItemsId(rs.getInt("items_id"));
                orders.setStatus(rs.getString("status"));
                orders.setShippingFee(rs.getDouble("shippingFee"));
                orders.setOrderDate(rs.getDate("orderDate"));
                
                
                
                ordersList.add(orders);
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return ordersList;
    }
    
    @Override
    public void updateStatus(Orders orders){
        
        try {
            String myQ = "UPDATE orders SET status=? WHERE order_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, orders.getStatus());
            myPS.setInt(2, orders.getOrderId());
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
    public void updateSellStatus(Orders orders){
        
        try {
            String myQ = "UPDATE orders SET status=? WHERE order_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, orders.getStatus());
            myPS.setInt(2, orders.getOrderId());
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
}
