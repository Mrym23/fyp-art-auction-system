package Model;

import java.sql.Date;

public class Orders {
    private int order_id;
    private int seller_id;
    private int bidder_id;
    private int items_id;
    private String status;
    private Double shippingFee;
    private Date orderDate;
    
    public Orders(){
        
    }
    
    public int getOrderId(){
        return order_id;
    }
    
    public void setOrderId(int order_id){
        this.order_id = order_id;
    }
    
    public int getSellerId(){
        return seller_id;
    }
    
    public void setSellerId(int seller_id){
        this.seller_id = seller_id;
    }
    
    public int getBidderId(){
        return bidder_id;
    }
    
    public void setBidderId(int bidder_id){
        this.bidder_id = bidder_id;
    }
    
    public int getItemsId(){
        return items_id;
    }
    
    public void setItemsId(int items_id){
        this.items_id = items_id;
    }
    
    public String getStatus(){
        return status;
    }
    
    public void setStatus(String status){
        this.status = status;
    }
    
    public Double getShippingFee(){
        return shippingFee;
    }
    
    public void setShippingFee(Double shippingFee){
        this.shippingFee = shippingFee;
    }
    
    public Date getOrderDate(){
        return orderDate;
    }
    
    public void setOrderDate(Date orderDate){
        this.orderDate = orderDate;
    }
}
