
package Model;


public class Shop {
    
    private int shop_id;
    private int seller_id;
    private String shopName;
    private String shopDesc;
    
    public Shop() {
        
    }
    
    public int getShopId() {
        return shop_id;
    }
    
    public void setShopId(int shop_id) {
        this.shop_id = shop_id;
    }
    
    public int getSellerId() {
        return seller_id;
    }
    
    public void setSellerId(int seller_id) {
        this.seller_id = seller_id;
    }
    
    public String getShopName() {
        return shopName;
    }
    
    public void setShopName(String shopName) {
        this.shopName = shopName;
    }
    
    public String getShopDesc() {
        return shopDesc;
    }
    
    public void setShopDesc(String shopDesc) {
        this.shopDesc = shopDesc;
    }
}
