package Controller;

import DAO.ItemsDAO;
import DAO.OrderDAO;
import DAOImpl.ItemsDAOImpl;
import DAOImpl.OrderDAOImpl;
import Model.Items;
import Model.Orders;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ItemsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        String cmd = request.getParameter("command");
        
        if (cmd != null){
            switch(cmd){
                case "saveItems":
                    saveItems(request, response);
                    break;
                    
                case "update":
                    updateItems(request, response);
                    break;
                
                case "updateSD":
                    updateStartDate(request, response);
                    break;
                
                case "updateED":
                    updateEndDate(request, response);
                    break;
                
                case "updateDate":
                    updateDate(request, response);
                    break;

            }
        } else {
            response.sendRedirect(request.getContextPath() + "/GENERAL PAGES/LandingPage.jsp");
        }
    }
    
    private void saveItems(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        
        String sellerId = req.getParameter("hidid");
        Part image = req.getPart("image");
        String itemsName = req.getParameter("itemsName");
        String ctg = req.getParameter("category");
        Double price = Double.parseDouble(req.getParameter("price"));
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        String itemsDesc = req.getParameter("itemsDesc");
        String itemsStatus = req.getParameter("status");
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM d yyyy", Locale.ENGLISH);
        LocalDate startDateTime = LocalDate.parse(startDate, formatter);
        LocalDate endDateTime = LocalDate.parse(endDate, formatter);
        Date startDates = Date.valueOf(startDateTime);
        Date endDates = Date.valueOf(endDateTime);
        
        Items newitems = new Items();
        
        LocalDate today = LocalDate.now();
        Date tod = Date.valueOf(today);
                        
        if (startDates.after(tod)){
            itemsStatus = "Not Started";
        } else if (!startDates.after(tod) && endDates.after(tod)){
            itemsStatus = "Ongoing";
        } else {
            itemsStatus = "Ended";
        }
        
        newitems.setSellerId(Integer.parseInt(sellerId));
        newitems.setItemsImg(image);
        newitems.setItemsName(itemsName);
        newitems.setItemsCtg(ctg);
        newitems.setPrice(price);
        newitems.setStartDate(Date.valueOf(startDateTime));
        newitems.setEndDate(Date.valueOf(endDateTime));
        newitems.setItemsDesc(itemsDesc);
        newitems.setStatus(itemsStatus);

        ItemsDAO itemsdao = new ItemsDAOImpl();
        itemsdao.saveItems(newitems);
        
        req.setAttribute("newitems", newitems);
        resp.sendRedirect(req.getContextPath() + "/SELLER/ShopItems.jsp?id=" + sellerId);
    }
    
    private void updateItems(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        
        String sellerId = req.getParameter("hidid");
        String itemsId = req.getParameter("hiditemsid");
        String itemsName = req.getParameter("itemsName");
        String ctg = req.getParameter("category");
        Double price = Double.parseDouble(req.getParameter("price"));
        String itemsDesc = req.getParameter("itemsDesc");
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        String status = req.getParameter("status");
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate newEnddate = LocalDate.parse(endDate, formatter);
        LocalDate newStartdate = LocalDate.parse(startDate, formatter);
        
        Items newitems = new Items();
        
        newitems.setSellerId(Integer.parseInt(sellerId));
        newitems.setItemsId(Integer.parseInt(itemsId));
        newitems.setItemsName(itemsName);
        newitems.setItemsCtg(ctg);
        newitems.setPrice(price);
        newitems.setStartDate(Date.valueOf(newStartdate));
        newitems.setEndDate(Date.valueOf(newEnddate));
        newitems.setItemsDesc(itemsDesc);
        newitems.setStatus(status);

        ItemsDAO itemsdao = new ItemsDAOImpl();
        itemsdao.update(newitems);
        
        req.setAttribute("newitems", newitems);
        resp.sendRedirect(req.getContextPath() + "/SELLER/ShopItems.jsp?id=" + sellerId);
    }
    
    private void updateStartDate(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        
        String sellerId = req.getParameter("hidid");
        String itemsId = req.getParameter("hiditemsid");
        String startDate = req.getParameter("startDate");
        String status = req.getParameter("status");
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate newStartdate = LocalDate.parse(startDate, formatter);
        
        Items newitems = new Items();
        
        newitems.setItemsId(Integer.parseInt(itemsId));
        newitems.setStartDate(Date.valueOf(newStartdate));
        newitems.setStatus(status);

        ItemsDAO itemsdao = new ItemsDAOImpl();
        itemsdao.updateStartDate(newitems);
        
        req.setAttribute("newitems", newitems);
        resp.sendRedirect(req.getContextPath() + "/SELLER/ShopItems.jsp?id=" + sellerId);
    }
    
    private void updateEndDate(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        
        String sellerId = req.getParameter("hidid");
        String itemsId = req.getParameter("hiditemsid");
        String endDate = req.getParameter("endDate");
        String status = req.getParameter("status");
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate newEnddate = LocalDate.parse(endDate, formatter);
        
        Items newitems = new Items();
        
        newitems.setItemsId(Integer.parseInt(itemsId));
        newitems.setEndDate(Date.valueOf(newEnddate));
        newitems.setStatus(status);

        ItemsDAO itemsdao = new ItemsDAOImpl();
        itemsdao.updateEndDate(newitems);
        
        req.setAttribute("newitems", newitems);
        resp.sendRedirect(req.getContextPath() + "/SELLER/ShopItems.jsp?id=" + sellerId);
    }
    
    private void updateDate(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        
        String sellerId = req.getParameter("hidid");
        String itemsId = req.getParameter("hiditemsid");
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        String itemsStatus = "Ongoing";
        
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate newEnddate = LocalDate.parse(endDate, formatter);
        LocalDate newStartdate = LocalDate.parse(startDate, formatter);
        LocalDate today = LocalDate.now();
        Date tod = Date.valueOf(today);
        Date startDates = Date.valueOf(newStartdate);
        Date endDates = Date.valueOf(newEnddate);
        
        if (startDates.after(tod)){
            itemsStatus = "Not Started";
        } else if (!startDates.after(tod) && endDates.after(tod)){
            itemsStatus = "Ongoing";
        } else {
            itemsStatus = "Ended";
        }
        
        Items newitems = new Items();
        
        newitems.setItemsId(Integer.parseInt(itemsId));
        newitems.setEndDate(Date.valueOf(newEnddate));
        newitems.setStatus(itemsStatus);
        
        Items newItems = new Items();
        newItems.setItemsId(Integer.parseInt(itemsId));
        newItems.setStartDate(Date.valueOf(newStartdate));
        newItems.setStatus(itemsStatus);

        ItemsDAO itemsdao = new ItemsDAOImpl();
        itemsdao.updateEndDate(newitems);
        itemsdao.updateStartDate(newItems);
        
        req.setAttribute("newitems", newitems);
        resp.sendRedirect(req.getContextPath() + "/SELLER/ShopItems.jsp?id=" + sellerId);
    }
    
    private void updateStatus(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String sellerId = req.getParameter("hidid");
        String itemsId = req.getParameter("hiditemsid");
        String status = req.getParameter("status");
        
        
        Items newitems = new Items();
        
        newitems.setItemsId(Integer.parseInt(itemsId));
        newitems.setStatus(status);

        ItemsDAO itemsdao = new ItemsDAOImpl();
        itemsdao.updateStatus(newitems);
        
        req.setAttribute("newitems", newitems);
        resp.sendRedirect(req.getContextPath() + "/SELLER/ShopItems.jsp?id=" + sellerId);
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
            Logger.getLogger(ItemsController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ItemsController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ItemsController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ItemsController.class.getName()).log(Level.SEVERE, null, ex);
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
