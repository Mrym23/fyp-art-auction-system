package DAOImpl;

import DAO.shopDAO;
import Database.DBConnection;
import Model.Shop;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class shopDAOImpl implements shopDAO {
    
    private final Connection con;
    
    public shopDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }
    
    @Override
    public void saveShop(Shop shop) throws SQLException {
        try {
            String mySQLQuery = "insert into shop(seller_id, shop_name, shop_desc) values(?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, shop.getSellerId());
            myPS.setString(2, shop.getShopName());
            myPS.setString(3, shop.getShopDesc());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }
    
    @Override
    public Shop retrieveShopBySellerID(int seller_ID) throws SQLException {

        Shop shop = null;

        try {
            String mySQLQuery = "select * from shop where seller_id=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setInt(1, seller_ID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                shop = new Shop();

                shop.setSellerId(seller_ID);
                shop.setShopName(rs.getString(3));
                shop.setShopDesc(rs.getString(4));
                shop.setShopId(rs.getInt(1));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

        return shop;
    }
}
