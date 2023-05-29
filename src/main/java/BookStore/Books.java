package BookStore;

public class Books {
    public int bookId;
    public String bookTitle;

    public Double bookPrice;

    public String author;

    public int quantity;

    public String img;

    public Books(String bookTitle, Double bookPrice, Integer bookId, String author,Integer quantity, String img){
        this.author = author;
        this.bookTitle = bookTitle;
        this.bookPrice = bookPrice;
        this.bookId = bookId;
        this.quantity = quantity;
        this.img = img;
    }

    public String getBookTitle() {return bookTitle;}

    public void setBookTitle(String bookTitle){this.bookTitle = bookTitle;}

    public String getAuthor() {return  author;}

    public void setAuthor(String author) {this.author = author;}

    public Integer getbookId() {return bookId;}

    public void setBookId(Integer bookId) {this.bookId = bookId ;}

    public Double getBookPrice() {return bookPrice;}

    public void setBookPrice(Double bookPrice) { this.bookPrice = bookPrice;}

    public Integer getQuantity(){return quantity;}

    public void setQuantity(Integer quantity) {this.quantity = quantity;}

    public String getImg() { return img;}

    public void setImg(String img) {this.img = img; }
}
