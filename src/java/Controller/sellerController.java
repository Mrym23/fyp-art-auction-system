package Controller;

import DAO.CommissionDAO;
import DAO.sellerDAO;
import DAO.shopAddressDAO;
import DAO.shopDAO;
import DAOImpl.CommissionDAOImpl;
import DAOImpl.sellerDAOImpl;
import DAOImpl.shopAddressDAOImpl;
import DAOImpl.shopDAOImpl;
import Model.Commission;
import Model.Seller;
import Model.Shop;
import Model.ShopAddress;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sellerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String cmd = request.getParameter("command");
        
        if (cmd != null){
            switch(cmd){
                case "verify":
                    verifyID(request, response);
                    break;
                    
                case "saveId":
                    saveID(request, response);
                    break;
                    
                case "saveShop":
                    saveShop(request, response);
                    break;
                    
                case "saveAddress":
                    saveAddress(request, response);
                    break;
                    
                case "commissionPayment":
                    addCommission(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/SELLER/Dashboard.jsp");
        }
    }
    
    private void verifyID(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException{
        
        if(req.getParameter("command") != null){
            
            String bidId = req.getParameter("hidid");
            
            sellerDAO sellerdao = new sellerDAOImpl();
            
            try {
                Seller seller = sellerdao.verifyID(Integer.parseInt(bidId));
                //Seller seller1 = sellerdao.retrieveSellerIDByBidderID(Integer.parseInt(bidId));
                //String sellerId = Integer.toString(seller1.getSellerId());
                //int sellerId = seller1.getSellerId();
                
                
                if(seller == null){
                    
                    resp.sendRedirect(req.getContextPath() + "/SELLER/NotRegistered.jsp?id=" + bidId);
                    
                } else {
                    
                    int sellerId = seller.getSellerId();
                    resp.sendRedirect(req.getContextPath() + "/SELLER/Dashboard.jsp?id=" + sellerId);
                }
                
            } catch (SQLException e){
                throw new ServletException(e);
            }
        }    
    }
    
    private void saveID(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String bidId = req.getParameter("hidid");
        String id_No = req.getParameter("idNo");
        
        Seller newseller = new Seller();
        
        newseller.setBidderId(Integer.parseInt(bidId));
        newseller.setIdNo(id_No);

        sellerDAO sellerdao = new sellerDAOImpl();
        sellerdao.saveID(newseller);
        
        req.setAttribute("newseller", newseller);
        resp.sendRedirect(req.getContextPath() + "/SELLER/ShopRegistration.jsp?id=" + bidId);
    }
    
    private void saveShop(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String sellerId = req.getParameter("hidid");
        String shopname = req.getParameter("shopname");
        String shopdesc = req.getParameter("shopdesc");
        
        
        Shop newshop = new Shop();
        
        newshop.setSellerId(Integer.parseInt(sellerId));
        newshop.setShopName(shopname);
        newshop.setShopDesc(shopdesc);

        shopDAO shopdao = new shopDAOImpl();
        shopdao.saveShop(newshop);
        
        req.setAttribute("newshop", newshop);
        resp.sendRedirect(req.getContextPath() + "/SELLER/ShopAddressRegister.jsp?id=" + sellerId);
    }
    
    private void saveAddress(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        
        String sellerId = req.getParameter("hidid");
        String contactNo = req.getParameter("contactNo");
        String addr1 = req.getParameter("addr1");
        String addr2 = req.getParameter("addr2");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zipcode = req.getParameter("zipCode");
        
        ShopAddress newShopAddress = new ShopAddress();
        
        newShopAddress.setSeller_ID(Integer.parseInt(sellerId));
        newShopAddress.setContactNo(contactNo);
        newShopAddress.setAddr1(addr1);
        newShopAddress.setAddr2(addr2);
        newShopAddress.setCity(city);
        newShopAddress.setState(state);
        newShopAddress.setZipCode(Integer.parseInt(zipcode));

        shopAddressDAO shopaddressdao = new shopAddressDAOImpl();
        shopaddressdao.addShopAddress(newShopAddress);
        
        req.setAttribute("newShopAddress", newShopAddress);
        resp.sendRedirect(req.getContextPath() + "/SELLER/Dashboard.jsp?id=" + sellerId);
    }

    private void addCommission(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String sellerId = req.getParameter("hidsellerid");
        String comm = req.getParameter("Comm");
        String paymentMethod = req.getParameter("payMethod");
        String paymentDate = req.getParameter("payDate");
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate orderPaymentDate = LocalDate.parse(paymentDate, formatter);
        
        Commission commission = new Commission();
        
        commission.setSellerId(Integer.parseInt(sellerId));
        commission.setComm(Double.parseDouble(comm));
        commission.setPayMethod(paymentMethod);
        commission.setPayDate(Date.valueOf(orderPaymentDate));
        
        Commission Comm = new Commission();
        
        Comm.setSellerId(Integer.parseInt(sellerId));
        Comm.setComm(Double.parseDouble(comm));
        Comm.setPayDate(Date.valueOf(orderPaymentDate));
        
        CommissionDAO commdao = new CommissionDAOImpl();
        commdao.addCommissionPayment(commission);
        
        Commission Commi = commdao.retrieveLatestCommissionBySellerId(Integer.parseInt(sellerId));
        if (Commi != null){
            CommissionDAO commdao2 = new CommissionDAOImpl();
            commdao2.updateLatestCommission(Comm);
        }else{
            CommissionDAO commdao3 = new CommissionDAOImpl();
            commdao3.addLatestCommission(Comm);
        }
        
        req.setAttribute("commission", commission);
        resp.sendRedirect(req.getContextPath() + "/SELLER/Sales.jsp?id=" + sellerId);
        
        
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(sellerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(sellerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
