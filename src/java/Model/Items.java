package Model;

import java.sql.Date;
import javax.servlet.http.Part;

public class Items {
    private int items_id;
    private int seller_id;
    private Part items_img;
    private String itemsName;
    private String itemsCtg;
    private Double price;
    private Date startDate;
    private Date endDate;
    private String itemsDesc;
    private String status;
    
    public Items(){
        
    }
    
    public int getItemsId(){
        return items_id;
    }
    
    public void setItemsId(int items_id){
        this.items_id = items_id;
    }
    
    public int getSellerId(){
        return seller_id;
    }
    
    public void setSellerId(int seller_id){
        this.seller_id = seller_id;
    }
    
    public Part getItemsImg(){
        return items_img;
    }
    
    public void setItemsImg(Part items_img){
        this.items_img = items_img;
    }
    
    public String getItemsName(){
        return itemsName;
    }
    
    public void setItemsName(String itemsName){
        this.itemsName = itemsName;
    }
    
    public String getItemsCtg(){
        return itemsCtg;
    }
    
    public void setItemsCtg(String itemsCtg){
        this.itemsCtg = itemsCtg;
    }
    
    public Double getPrice(){
        return price;
    }
    
    public void setPrice(Double price){
        this.price = price;
    }
    
    public Date getStartDate(){
        return startDate;
    }
    
    public void setStartDate(Date startDate){
        this.startDate = startDate;
    }
    
    public Date getEndDate(){
        return endDate;
    }
    
    public void setEndDate(Date endDate){
        this.endDate = endDate;
    }
    
    public String getItemsDesc(){
        return itemsDesc;
    }
    
    public void setItemsDesc(String itemsDesc){
        this.itemsDesc = itemsDesc;
    }
    
    public String getStatus(){
        return status;
    }
    
    public void setStatus(String status){
        this.status = status;
    }
}
