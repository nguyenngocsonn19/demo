package tagDemo;

public class Customer {
    private String firtName;
    private String lastName;

    private boolean godCustomer;

    public Customer(String firtName, String lastName, boolean godCustomer){
        super();
        this.firtName = firtName ;
        this.lastName = lastName;
        this.godCustomer = godCustomer;
    }

    public String getFirtName() {return firtName;}
    public void setFirtName(String firtName) { this.firtName = firtName;}

    public String getLastName() {return lastName;}
    public void setLastName(String lastName) { this.firtName = lastName;}

    public boolean isGodCustomer() {return  godCustomer;}

    public void setGodCustomer(boolean godCustomer) {this.godCustomer = godCustomer ;}


}
