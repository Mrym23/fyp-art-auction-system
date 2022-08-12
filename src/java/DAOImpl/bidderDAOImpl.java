package DAOImpl;

/**
 *
 * @author USER
 */
import DAO.bidderDAO;
import Database.DBConnection;
import Model.Bidder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class bidderDAOImpl implements bidderDAO{
    
    private final Connection con;
    
    public bidderDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }
    
    @Override
    public void save(Bidder bidder) throws SQLException {
        try {
            String mySQLQuery = "insert into bidder(fullname, email, password) values(?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, bidder.getFullname());
            myPS.setString(2, bidder.getEmail());
            myPS.setString(3, bidder.getPassword());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    @Override
    public Bidder authentication(String email, String password) throws SQLException {
        ResultSet rs = null;
        Bidder bidder = null;

        try {
            String mySQLQuery = "select * from bidder where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            while (rs.next()) {
                bidder = new Bidder();

                bidder.setEmail(email);
                bidder.setPassword(password);
                bidder.setBidder_ID(rs.getInt(1));
                bidder.setFullname(rs.getString(2));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }
            con.close();
        }

        return bidder;
    }

    @Override
    public List<Bidder> retrieveAll() throws SQLException {
        List<Bidder> bidderlist = new ArrayList<>();

        Bidder bidder;
        ResultSet rs = null;

        try {
            String sqlQuery = "select * from bidder";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                bidder = new Bidder();

                bidder.setFullname(rs.getString(1));
                bidder.setEmail(rs.getString(2));
                bidder.setPassword(rs.getString(3));

                bidderlist.add(bidder);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return bidderlist;
    }
    
    @Override
    public void update(Bidder bidder){
        
        try {
            String myQ = "UPDATE bidder SET fullname=?, email=?, password=? WHERE bidder_ID=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, bidder.getFullname());
            myPS.setString(2, bidder.getEmail());
            myPS.setString(3, bidder.getPassword());
            myPS.setInt(4, bidder.getBidder_ID()); 
            
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
    public Bidder getOne(int bidder_ID) throws SQLException {

        Bidder bidder = null;

        try {
            String mySQLQuery = "select * from bidder where bidder_ID=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setInt(1, bidder_ID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bidder = new Bidder();

                bidder.setBidder_ID(bidder_ID);
                bidder.setFullname(rs.getString(2));
                bidder.setEmail(rs.getString(3));
                bidder.setPassword(rs.getString(4));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

        return bidder;
    }
    
    @Override
    public Bidder retrieveBidderIdByEmail(String email) throws SQLException {

        Bidder bidder = null;

        try {
            String mySQLQuery = "select * from bidder where email=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bidder = new Bidder();

                bidder.setBidder_ID(rs.getInt(1));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

        return bidder;
    }

    @Override
    public Bidder verifyEmail (String email) throws SQLException {
        ResultSet rs = null;
        Bidder bidder = null;
        
        try {
            String mySQLQuery = "select * from bidder where email=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);
            
            ps.setString(1, email);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                bidder = new Bidder();
                
                bidder.setEmail(email);
                bidder.setBidder_ID(rs.getInt(1));
                bidder.setFullname(rs.getString(2));
                bidder.setPassword(rs.getString(4));
            }
            con.close();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            con.close();
        }
        
        return bidder;
    }
}
