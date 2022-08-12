package Controller;

import DAO.addressDAO;
import DAO.bidderDAO;
import DAOImpl.bidderDAOImpl;
import Model.Bidder;
import DAO.adminDAO;
import DAOImpl.addressDAOImpl;
import DAOImpl.adminDAOImpl;
import Model.Address;
import Model.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class bidderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        String cmd = request.getParameter("command");
        
        if (cmd != null){
            switch(cmd){
                case "verify":
                    verifyEmail(request, response);
                    break;
                
                case "signin":
                    retrieveUser(request, response);
                    break;
                    
                case "update":
                    updateBidder(request, response);
                    break;
                
                case "updateAdmin":
                    updateAdmin(request, response);
                    break;
                    
                case "signout":
                    signOut(request, response);
                    break;
                    
                case "updateAddress":
                    updateAddress(request, response);
                    break;
                    
                case "addNewAddress":
                    saveAddress(request, response);
                    break;
                    
                case "deleteAddress":
                    deleteAddress(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/GENERAL PAGES/LandingPage.jsp");
        }
    }
    
    private void verifyEmail(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException{
        
        if(req.getParameter("command") != null){
            
            String fullname = req.getParameter("fullname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            
            bidderDAO bidderdao = new bidderDAOImpl();
            adminDAO admindao = new adminDAOImpl();
            
            try {
                Bidder bidder = bidderdao.verifyEmail(email);
                Admin admin = admindao.verifyEmail(email);
                
                if(admin != null){
                    HttpSession session = req.getSession();
                    session.setAttribute("errorEmail", "Email is already taken.");
                    resp.sendRedirect("GENERAL PAGES/Signup.jsp");
                }
                else if(bidder == null){
                    Bidder newBidder = new Bidder();
        
                    newBidder.setFullname(fullname);
                    newBidder.setEmail(email);
                    newBidder.setPassword(password);

                    bidderDAO nbidder = new bidderDAOImpl();
                    nbidder.save(newBidder);
        
                    req.setAttribute("bidderDetails", newBidder);
                    resp.sendRedirect("GENERAL PAGES/Login.jsp");
                    
                } else {
                    
                    req.setAttribute("errorEmail", "Email is already taken.");
                    resp.sendRedirect("GENERAL PAGES/Signup.jsp");
                }
                
            } catch (SQLException e){
                throw new ServletException(e);
            }
        }    
    }
    
    private void retrieveUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException{
        
        if(req.getParameter("command") != null){
            
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            
            
            bidderDAO bidderdao = new bidderDAOImpl();
            adminDAO admindao = new adminDAOImpl();
            
            try {
                Bidder uBidder = bidderdao.authentication(email, password);
                Admin admin = admindao.authentication(email, password);
                
                if(admin != null){
                    HttpSession session = req.getSession();
                    session.setAttribute("admin", admin);
                    resp.sendRedirect("ADMIN/AdminSettings.jsp");
                }
                else if(uBidder != null){
                    
                    int bidderId = uBidder.getBidder_ID();
                    
                    HttpSession session = req.getSession();
                    session.setAttribute("uBidder", uBidder);
                    resp.sendRedirect("BIDDER/Homepage.jsp?id=" + bidderId);
                } else {
                    HttpSession session = req.getSession();
                    session.setAttribute("error", "Invalid email or password");
                    resp.sendRedirect("GENERAL PAGES/Login.jsp");
                    //req.setAttribute("error", "Invalid username or password!");
                    //RequestDispatcher rd = req.getRequestDispatcher("GENERAL PAGES/LogInSignUp.jsp");
                    //rd.forward(req,resp);
                }
                
            } catch (SQLException e){
                throw new ServletException(e);
            }
        }
        
    }
    
    private void updateBidder(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int id = Integer.parseInt(request.getParameter("hidid"));
        
        Bidder bidder = new Bidder();
        
        bidder.setFullname(fullname);
        bidder.setEmail(email);
        bidder.setPassword(password);
        bidder.setBidder_ID(id);
        
        bidderDAO bidderdao = new bidderDAOImpl();
        
        bidderdao.update(bidder);
        
        HttpSession session = request.getSession();
        session.setAttribute("uBidder", bidder);
        response.sendRedirect(request.getContextPath() + "/BIDDER/MyProfile.jsp?id=" + id);
    }
    
    // admin
    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int id = Integer.parseInt(request.getParameter("hidid"));
        
        Admin admin = new Admin();
        
        admin.setEmail(email);
        admin.setPassword(password);
        admin.setId(id);
       
        adminDAO admindao = new adminDAOImpl();
         
        admindao.update(admin);
        
        HttpSession session = request.getSession();
        session.setAttribute("admin", admin);
        
        response.sendRedirect("ADMIN/AdminSettings.jsp");
    }
    
    private void saveAddress(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String bidId = req.getParameter("hidid");
        String name = req.getParameter("name");
        String contactNo = req.getParameter("contactNo");
        String addr1 = req.getParameter("addr1");
        String addr2 = req.getParameter("addr2");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zipcode = req.getParameter("zipcode");
        
        Address newAddress = new Address();
        
        newAddress.setBidder_ID(Integer.parseInt(bidId));
        newAddress.setName(name);
        newAddress.setContactNo(contactNo);
        newAddress.setAddr1(addr1);
        newAddress.setAddr2(addr2);
        newAddress.setCity(city);
        newAddress.setState(state);
        newAddress.setZipCode(Integer.parseInt(zipcode));

        addressDAO addressdao = new addressDAOImpl();
        addressdao.addAddress(newAddress);
        
        req.setAttribute("newAddress", newAddress);
        resp.sendRedirect(req.getContextPath() + "/BIDDER/MyProfile.jsp?id=" + bidId);
    }
    
    private void updateAddress(HttpServletRequest req, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        String bidId = req.getParameter("hidbidderid");
        String addrId = req.getParameter("hidid");
        String name = req.getParameter("name");
        String contactNo = req.getParameter("contactNo");
        String addr1 = req.getParameter("addr1");
        String addr2 = req.getParameter("addr2");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zipcode = req.getParameter("zipcode");
        
        Address newAddress = new Address();
        
        newAddress.setAddress_ID(Integer.parseInt(addrId));
        newAddress.setBidder_ID(Integer.parseInt(bidId));
        newAddress.setName(name);
        newAddress.setContactNo(contactNo);
        newAddress.setAddr1(addr1);
        newAddress.setAddr2(addr2);
        newAddress.setCity(city);
        newAddress.setState(state);
        newAddress.setZipCode(Integer.parseInt(zipcode));

        addressDAO addressdao = new addressDAOImpl();
        
        addressdao.updateAddress(newAddress);
        
        HttpSession session = req.getSession();
        session.setAttribute("uAddress", newAddress);
        response.sendRedirect(req.getContextPath() + "/BIDDER/MyProfile.jsp?id=" + bidId);
    }
    
    private void deleteAddress(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("hidAddrId"));
        int bidderid = Integer.parseInt(request.getParameter("hidbidderId"));
        
        Address address = new Address();
        
        address.setAddress_ID(id);
        
        addressDAO addressdao = new addressDAOImpl();
        
        addressdao.deleteAddress(address);
        
        response.sendRedirect(request.getContextPath() + "/BIDDER/MyProfile.jsp?id=" + bidderid);
        
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
            Logger.getLogger(bidderController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(bidderController.class.getName()).log(Level.SEVERE, null, ex);
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
   
    private void signOut(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        request.getSession().removeAttribute("uBidder");
        
        response.sendRedirect("GENERAL PAGES/LandingPage.jsp");
    }

}
