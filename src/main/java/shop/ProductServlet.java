package shop;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private List<Product> productList;

    @Override
    public void init() throws ServletException{
        super.init();
        productList = new ArrayList<>();
        productList.add(new Product(1, "Iphone" , 2.000));
        productList.add(new Product(1, "Nokia" , 532.132));
        productList.add(new Product(1, "SamSung" , 5.000));
        productList.add(new Product(4,"Laptop", 2.3221));
    }
}
