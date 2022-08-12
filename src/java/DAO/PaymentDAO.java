package DAO;


import Model.Payment;
import java.sql.SQLException;
import java.util.List;

public interface PaymentDAO {
    void addPayment(Payment payment) throws SQLException;
    Payment retrievePaymentByOrdersId(int order_id) throws SQLException;
}
