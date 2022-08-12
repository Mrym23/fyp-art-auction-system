
package DAOImpl;

import DAO.PaymentDAO;
import Model.Payment;
import Database.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAOImpl implements PaymentDAO{
    
    private final Connection con;
    
    public PaymentDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }
    
    @Override
    public void addPayment(Payment payment) throws SQLException {
        try {
            String mySQLQuery = "insert into orderpayment(bidder_id, order_id, paymentMethod, orderTotal, addr_id, paymentDate) values(?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, payment.getBidderId());
            myPS.setInt(2, payment.getOrderId());
            myPS.setString(3, payment.getPayMethod());
            myPS.setDouble(4, payment.getOrderTotal());
            myPS.setInt(5, payment.getAddrId());
            myPS.setDate(6, payment.getPaymentDate());
            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }
    
    @Override
    public Payment retrievePaymentByOrdersId(int order_id) throws SQLException {
        
        Payment payment = null;
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from orderpayment where order_id=" + order_id;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            
            rs = myPS.executeQuery();
            
            while (rs.next()){
                payment = new Payment();
                
                payment.setOrderPaymentId(rs.getInt("orderpayment_id"));
                payment.setBidderId(rs.getInt("bidder_id"));
                payment.setOrderId(rs.getInt("order_id"));
                payment.setPayMethod("paymentMethod");
                payment.setOrderTotal(rs.getDouble("orderTotal"));
                payment.setAddrId(rs.getInt("addr_id"));
                payment.setPaymentDate(rs.getDate("orderDate"));
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }
        return payment;
    }
}
