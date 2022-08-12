package Model;

public class Seller {
    private int seller_id;
    private int bidder_ID;
    private String id_number;
    
    public Seller() {
        
    }
    
    public int getSellerId(){
        return seller_id;
    }
    
    public void setSellerId(int seller_id){
        this.seller_id = seller_id;
    }
    
    public int getBidderId(){
        return bidder_ID;
    }
    
    public void setBidderId(int bidder_ID){
        this.bidder_ID = bidder_ID;
    }
    
    public String getIdNo(){
        return id_number;
    }
    
    public void setIdNo(String id_number){
        this.id_number = id_number;
    }
}
