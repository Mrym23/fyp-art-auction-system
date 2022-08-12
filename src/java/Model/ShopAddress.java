package Model;


public class ShopAddress {
   
    private String contactNo;
    private String addr1;
    private String addr2;
    private String city;
    private String state;
    private int zipCode;
    private int address_ID;
    private int seller_ID;
    
    public ShopAddress() {
    
    }
    
    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }
    
    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }
    
    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }
    
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }
    
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    
    public int getAddress_ID() {
        return address_ID;
    }

    public void setAddress_ID(int address_ID) {
        this.address_ID = address_ID;
    }
    
    public int getSeller_ID() {
        return seller_ID;
    }

    public void setSeller_ID(int seller_ID) {
        this.seller_ID = seller_ID;
    }
}
