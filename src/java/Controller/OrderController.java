/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ItemsDAO;
import DAO.OrderDAO;
import DAO.PaymentDAO;
import DAOImpl.ItemsDAOImpl;
import DAOImpl.OrderDAOImpl;
import DAOImpl.PaymentDAOImpl;
import Model.Items;
import Model.Orders;
import Model.Payment;
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
import javax.servlet.http.HttpSession;

public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String cmd = request.getParameter("command");
        
        if (cmd != null){
            switch(cmd){
                    
                case "addOrder":
                    addOrder(request, response);
                    break;
                
                case "addOrderPayment":
                    addPayment(request, response);
                    break;
                    
                case "nextPayment":
                    nextPayment(request, response);
                    break;
                    
                case "updateStatus":
                    updateStatus(request, response);
                    break;
                    
                case "updateSellStatus":
                    updateSellStatus(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/GENERAL PAGES/LandingPage.jsp");
        }
    }
    
    private void addOrder(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String sellerId = req.getParameter("hidsellerid");
        String bidderId = req.getParameter("hidbidderid");
        String itemsId = req.getParameter("hiditemsid");
        String status = req.getParameter("status");
        Double shippingFee = Double.parseDouble(req.getParameter("shippingFee"));
        String orderDate = req.getParameter("orderDate");
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate ordersDate = LocalDate.parse(orderDate, formatter);
        
        Orders orders = new Orders();
        
        orders.setSellerId(Integer.parseInt(sellerId));
        orders.setBidderId(Integer.parseInt(bidderId));
        orders.setItemsId(Integer.parseInt(itemsId));
        orders.setOrderDate(Date.valueOf(ordersDate));
        orders.setShippingFee(shippingFee);
        orders.setStatus(status);
        
        OrderDAO orderdao = new OrderDAOImpl();
        orderdao.addOrder(orders);
        
        String itemstatus = "Ordered";
        Items items = new Items();
        
        items.setStatus(itemstatus);
        items.setItemsId(Integer.parseInt(itemsId));
        
        ItemsDAO itemsdao = new ItemsDAOImpl();
        itemsdao.updateStatus(items);
        
        req.setAttribute("orders", orders);
        resp.sendRedirect(req.getContextPath() + "/SELLER/ShopItems.jsp?id=" + sellerId);
        
        
    }
    
    private void addPayment(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String bidderId = req.getParameter("hidbidderid");
        String ordersId = req.getParameter("hidordersid");
        String paymentMethod = req.getParameter("payMethod");
        Double orderTotal = Double.parseDouble(req.getParameter("orderTot"));
        String addrId = req.getParameter("addrid");
        String paymentDate = req.getParameter("payDate");
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate orderPaymentDate = LocalDate.parse(paymentDate, formatter);
        
        Payment payment = new Payment();
        
        
        payment.setBidderId(Integer.parseInt(bidderId));
        payment.setOrderId(Integer.parseInt(ordersId));
        payment.setPayMethod(paymentMethod);
        payment.setOrderTotal(orderTotal);
        payment.setAddrId(Integer.parseInt(addrId));
        payment.setPaymentDate(Date.valueOf(orderPaymentDate));
        
        PaymentDAO paymentdao = new PaymentDAOImpl();
        paymentdao.addPayment(payment);
        
        req.setAttribute("payment", payment);
        resp.sendRedirect(req.getContextPath() + "/BIDDER/Orders.jsp?id=" + bidderId);
        
        
    }
    
    private void nextPayment(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String bidderId = req.getParameter("hidbidderid");
        String ordersId = req.getParameter("hidordersid");
        String addrId = req.getParameter("addrid");
        
        Payment payment = new Payment();
        
        
        payment.setBidderId(Integer.parseInt(bidderId));
        payment.setOrderId(Integer.parseInt(ordersId));
        payment.setAddrId(Integer.parseInt(addrId));
        
        HttpSession session = req.getSession();
        session.setAttribute("payment", payment);
        resp.sendRedirect(req.getContextPath() + "/BIDDER/PaymentMethod.jsp?id=" + bidderId);
    }
    
    private void updateStatus(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String orderId = req.getParameter("ordid");
        String bidderId = req.getParameter("bidid");
        String status = req.getParameter("status");
        
        
        Orders neworder = new Orders();
        
        neworder.setOrderId(Integer.parseInt(orderId));
        neworder.setStatus(status);

        OrderDAO ordersdao = new OrderDAOImpl();
        ordersdao.updateStatus(neworder);
        
        req.setAttribute("neworder", neworder);
        resp.sendRedirect(req.getContextPath() + "/BIDDER/Orders.jsp?id=" + bidderId);
    }
    
    private void updateSellStatus(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String orderId = req.getParameter("ordid");
        String SellerId = req.getParameter("sellerid");
        String status = req.getParameter("status");
        
        
        Orders neworder = new Orders();
        
        neworder.setOrderId(Integer.parseInt(orderId));
        neworder.setStatus(status);

        OrderDAO ordersdao = new OrderDAOImpl();
        ordersdao.updateSellStatus(neworder);
        
        req.setAttribute("neworder", neworder);
        resp.sendRedirect(req.getContextPath() + "/SELLER/Orders.jsp?id=" + SellerId);
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
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
