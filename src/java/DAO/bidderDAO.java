package DAO;

/**
 *
 * @author USER
 */
import Model.Bidder;
import java.sql.SQLException;
import java.util.List;

public interface bidderDAO {
    void save(Bidder bidder) throws SQLException;
    Bidder authentication(String email, String password) throws SQLException;
    List<Bidder> retrieveAll() throws SQLException;
    void update(Bidder bidder);
    Bidder getOne(int bidder_ID) throws SQLException;
    Bidder retrieveBidderIdByEmail(String email) throws SQLException;
    Bidder verifyEmail (String email) throws SQLException;
}
