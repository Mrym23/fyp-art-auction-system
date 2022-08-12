package DAOImpl;

import DAO.CommissionDAO;
import Database.DBConnection;
import Model.Commission;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CommissionDAOImpl implements CommissionDAO {
    
    private final Connection con;
    
    public CommissionDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }
    
    @Override
    public void addCommissionPayment(Commission commission) throws SQLException {
        try {
            String mySQLQuery = "insert into commissionpayment(seller_id, commission, payMethod, payDate) values(?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, commission.getSellerId());
            myPS.setDouble(2, commission.getComm());
            myPS.setString(3, commission.getPayMethod());
            myPS.setDate(4, commission.getPayDate());
            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }
    
    @Override
    public void addLatestCommission(Commission commission) throws SQLException {
        try {
            String mySQLQuery = "insert into latestcommission (seller_id, comm, payDate) values(?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, commission.getSellerId());
            myPS.setDouble(2, commission.getComm());
            myPS.setDate(3, commission.getPayDate());
            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }
    
    @Override
    public void updateLatestCommission(Commission Commission){
        
        try {
            String myQ = "UPDATE latestcommission SET comm=?, payDate=? WHERE seller_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setDouble(1, Commission.getComm());
            myPS.setDate(2, Commission.getPayDate());
            myPS.setInt(3, Commission.getSellerId());
            
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
    public Commission retrieveLatestCommissionBySellerId(int seller_id) throws SQLException {
        
        Commission commission = null;
        
        ResultSet rs = null;
        
        try {
            String mySQLQuery = "select * from latestcommission where seller_id=" + seller_id;
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            rs = myPS.executeQuery();
            
            while (rs.next()){
                commission = new Commission();
                
                commission.setCommissionId(rs.getInt("latest_id"));
                commission.setSellerId(rs.getInt("seller_id"));
                commission.setComm(rs.getDouble("comm"));
                commission.setPayDate(rs.getDate("payDate"));
                //bidding.setBiddingId(rs.getInt("bidding_id"));
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
        return commission;
    }

}
