package DAO;

import Model.Commission;
import java.sql.SQLException;

public interface CommissionDAO {
    void addCommissionPayment(Commission commission) throws SQLException;
    void addLatestCommission(Commission commission) throws SQLException;
    void updateLatestCommission(Commission commission) throws SQLException;
    Commission retrieveLatestCommissionBySellerId(int seller_id) throws SQLException;
}
