package shop;

public class Product {
    public Integer id ;

    public String nameProduct;

    public Double priceProduct;


    public String image;

    public String orderStatus;


    public Product(Integer id, String nameProduct, Double priceProduct, String image, String orderStatus){
        super();
        this.id = id;
        this.nameProduct = nameProduct;
        this.priceProduct = priceProduct;
        this.image = image;
        this.orderStatus = orderStatus;
    }

    public String getNameProduct() {return nameProduct;}
    public void setNameProduct(String nameProduct) {this.nameProduct = nameProduct;}

    public Integer getId() {return id;}

    public void setId(Integer id) {this.id = id;}

    public Double getPriceProduct() {return priceProduct;}

    public void setPriceProduct(Double priceProduct) {this.priceProduct = priceProduct;}

    public String getImage() {return image;}
    public void setImage(String image) {this.image = image;}
    public String getOrderStatus() {return orderStatus;}
    public void setOrderStatus(String orderStatus) {this.orderStatus = orderStatus;}
}
