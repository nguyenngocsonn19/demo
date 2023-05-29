package shop;

import jakarta.servlet.RequestDispatcher;
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
        productList.add(new Product(1, "Iphone" , 2.000,"https://images.pexels.com/photos/16694210/pexels-photo-16694210/free-photo-of-bi-n-thanh-ph-b-bi-n-n-c.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","done"));
        productList.add(new Product(2, "Nokia" , 532.132,"https://images.pexels.com/photos/16694210/pexels-photo-16694210/free-photo-of-bi-n-thanh-ph-b-bi-n-n-c.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","not"));
        productList.add(new Product(3, "SamSung" , 5.000,"https://images.pexels.com/photos/16694210/pexels-photo-16694210/free-photo-of-bi-n-thanh-ph-b-bi-n-n-c.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","done"));
        productList.add(new Product(4,"Laptop", 2.3221,"","done"));
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "addImage":
                addImageToProduct(request, response);
                break;
            case "updateOrderStatus":
                updateOrderStatus(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException , IOException{
        doGet(request,response);
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product-list.jsp");
        dispatcher.forward(request,response);
    }

    private void addImageToProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String image = request.getParameter("image");

        Product product = getProductById(id);
        product.setImage(image);

        response.sendRedirect("products");
    }

    private void updateOrderStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String orderStatus = request.getParameter("orderStatus");

        Product product = getProductById(id);
        product.setOrderStatus(orderStatus);

        response.sendRedirect("products");
    }
    private void showNewForm(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");
        dispatcher.forward(request,response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameProduct = request.getParameter("nameProduct");
        double priceProduct = Double.parseDouble(request.getParameter("priceProduct"));
        String image = request.getParameter("image");
        String orderStatus = request.getParameter("orderStatus");

        int id = productList.size() + 1;

        Product newProduct = new Product(id, nameProduct, priceProduct, image, orderStatus);
        productList.add(newProduct);

        response.sendRedirect("products");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = getProductById(id);

        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");
        dispatcher.forward(request,response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        Double priceProduct = Double.parseDouble(request.getParameter("priceProduct"));

        Product product = getProductById(id);
        product.setNameProduct(nameProduct);
        product.setPriceProduct(priceProduct);


        response.sendRedirect("products");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = getProductById(id);
        productList.remove(product);

        response.sendRedirect("products");
    }

    private Product getProductById(int id){
        for (Product product : productList){
            if(product.getId() == id)
            {
                return  product;
            }
        }
        return  null;
    }
}
