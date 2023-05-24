package shop;

public class Product {
    public Integer id ;

    public String nameProduct;

    public Double priceProduct;

    public Product(Integer id, String nameProduct, Double priceProduct){
        super();
        this.id = id;
        this.nameProduct = nameProduct;
        this.priceProduct = priceProduct;
    }

    public String getNameProduct() {return nameProduct;}
    public void setNameProduct(String nameProduct) {this.nameProduct = nameProduct;}

    public Integer getId() {return id;}

    public void setId(Integer id) {this.id = id;}

    public Double getPriceProduct() {return priceProduct;}

    public void setPriceProduct(Integer id) {this.priceProduct = priceProduct;}
}
