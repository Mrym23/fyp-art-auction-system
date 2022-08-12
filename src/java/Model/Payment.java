package Model;

import java.sql.Date;

public class Payment {
    private int orderpayment_id;
    private int bidder_id;
    private int order_id;
    private String payMethod;
    private Double orderTotal;
    private int addr_id;
    private Date paymentDate;
    
    public Payment(){
        
    }
    
    public int getOrderPaymentId(){
        return orderpayment_id;
    }
    
    public void setOrderPaymentId(int orderpayment_id){
        this.orderpayment_id = orderpayment_id;
    }
    
    public int getBidderId(){
        return bidder_id;
    }
    
    public void setBidderId(int bidder_id){
        this.bidder_id = bidder_id;
    }
    
    public int getOrderId(){
        return order_id;
    }
    
    public void setOrderId(int order_id){
        this.order_id = order_id;
    }
    
    public String getPayMethod(){
        return payMethod;
    }
    
    public void setPayMethod(String payMethod){
        this.payMethod = payMethod;
    }
    
    public Double getOrderTotal(){
        return orderTotal;
    }
    
    public void setOrderTotal(Double orderTotal){
        this.orderTotal = orderTotal;
    }
    
    public int getAddrId(){
        return addr_id;
    }
    
    public void setAddrId(int addr_id){
        this.addr_id = addr_id;
    }
    
    public Date getPaymentDate(){
        return paymentDate;
    }
    
    public void setPaymentDate(Date paymentDate){
        this.paymentDate = paymentDate;
    }
}
