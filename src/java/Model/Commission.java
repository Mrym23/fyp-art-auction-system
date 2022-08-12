package Model;

import java.sql.Date;

public class Commission {
    private int commission_id;
    private int seller_id;
    private Double comm;
    private String payMethod;
    private Date payDate;
    
    public Commission(){
        
    }
    
    public int getCommissionId(){
        return commission_id;
    }
    
    public void setCommissionId(int commission_id){
        this.commission_id = commission_id;
    }
    
    public int getSellerId(){
        return seller_id;
    }
    
    public void setSellerId(int seller_id){
        this.seller_id = seller_id;
    }
    
    public Double getComm(){
        return comm;
    }
    
    public void setComm(Double comm){
        this.comm = comm;
    }
    
    public String getPayMethod(){
        return payMethod;
    }
    
    public void setPayMethod(String payMethod){
        this.payMethod = payMethod;
    }
    
    public Date getPayDate(){
        return payDate;
    }
    
    public void setPayDate(Date payDate){
        this.payDate = payDate;
    }
}
