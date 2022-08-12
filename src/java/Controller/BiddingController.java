/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Bidding;
import DAO.BiddingDAO;
import DAO.ItemsDAO;
import DAOImpl.BiddingDAOImpl;
import DAOImpl.ItemsDAOImpl;
import Model.Items;
import Model.Orders;
import java.io.IOException;
import java.io.PrintWriter;
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

public class BiddingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String cmd = request.getParameter("command");
        
        if (cmd != null){
            switch(cmd){
                case "addBid":
                    addBid(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/GENERAL PAGES/LandingPage.jsp");
        }
    }
    
    private void addBid(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String backId = req.getParameter("backid");
        String item = req.getParameter("item");
        String bidderId = req.getParameter("hidid");
        String itemsId = req.getParameter("hiditemid");
        Double price = Double.parseDouble(req.getParameter("price"));
        String bidDate = req.getParameter("bidDate");
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate bidingDate = LocalDate.parse(bidDate, formatter);
        
        Bidding newbidding = new Bidding();
        Items newitems = new Items();
        
        newbidding.setBidderId(Integer.parseInt(bidderId));
        newbidding.setItemsId(Integer.parseInt(itemsId));
        newbidding.setBidPrice(price);
        newbidding.setBidDate(Date.valueOf(bidingDate));
        newitems.setPrice(price);
        newitems.setItemsId(Integer.parseInt(itemsId));

        BiddingDAO biddingdao = new BiddingDAOImpl();
        biddingdao.addBid(newbidding);
        ItemsDAO itemsdao = new ItemsDAOImpl();
        itemsdao.updatePrice(newitems);
        
        if (backId.equals("1")){
            req.setAttribute("newbidding", newbidding);
            resp.sendRedirect(req.getContextPath() + "/BIDDER/Homepage.jsp?id=" + bidderId);
        } else if (backId.equals("3")){
            req.setAttribute("newbidding", newbidding);
            resp.sendRedirect(req.getContextPath() + "/BIDDER/ItemsDetails.jsp?id=" + bidderId + "&itemsid=" + itemsId + "&backid=1&item=hmpg");
        }else {
            req.setAttribute("newbidding", newbidding);
            resp.sendRedirect(req.getContextPath() + "/BIDDER/CategoryItems.jsp?id=" + bidderId + "&item=" + item);
        }
        
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
            Logger.getLogger(BiddingController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(BiddingController.class.getName()).log(Level.SEVERE, null, ex);
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
