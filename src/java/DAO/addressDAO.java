package DAO;

/**
 *
 * @author USER
 */
import Model.Address;
import java.sql.SQLException;
import java.util.List;

public interface addressDAO {
    
    void addAddress(Address address) throws SQLException;
    List<Address> retrieveAllAddressByBidder_ID(int bidder_ID) throws SQLException;
    Address retrieveAddressByAddress_ID(int address_ID) throws SQLException;
    void updateAddress(Address address) throws SQLException;
    void deleteAddress(Address address) throws SQLException;
}
