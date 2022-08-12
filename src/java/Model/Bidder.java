package Model;

/**
 *
 * @author 
 */
public class Bidder {
    private String fullname;
    private String email;
    private String password;
    private int bidder_ID;
    
    public Bidder() {
    
    }
    
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public int getBidder_ID() {
        return bidder_ID;
    }

    public void setBidder_ID(int bidder_ID) {
        this.bidder_ID = bidder_ID;
    }
}
