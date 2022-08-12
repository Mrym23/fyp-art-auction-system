package Model;

import java.sql.Date;
import javax.servlet.http.Part;

public class Bidding {
    private int bidding_id;
    private int bidder_id;
    private int items_id;
    private Double bidPrice;
    private Date bidDate;
    
    public Bidding(){
        
    }
    
    public int getBiddingId(){
        return bidding_id;
    }
    
    public void setBiddingId(int bidding_id){
        this.bidding_id = bidding_id;
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
    
    public Double getBidPrice(){
        return bidPrice;
    }
    
    public void setBidPrice(Double bidPrice){
        this.bidPrice = bidPrice;
    }
    
    public Date getBidDate(){
        return bidDate;
    }
    
    public void setBidDate(Date bidDate){
        this.bidDate = bidDate;
    }
}
