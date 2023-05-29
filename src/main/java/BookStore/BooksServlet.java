package BookStore;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import shop.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/books")
public class BooksServlet extends HttpServlet {

    private List<Books> booksList;

    @Override
    public void init() throws ServletException{
        super.init();
        booksList = new ArrayList<>();
        booksList.add(new Books("Book1",12.12,1,"book1",2,"img/img.png"));
        booksList.add(new Books("Book2",13.13, 2,"book2", 3,"img/img.png"));
        booksList.add(new Books("Book3",14.14,3,"auth3",4,"img/img.png"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        String action = request.getParameter("action");

        if(action == null){
            action = "list";
        }

        switch (action){
            case "searchByName":
                searchBookByName(request, response);
                break;
            case "new" :
                showNewForm(request,response);
                break;
            case "create":
                createBook(request,response);
                break;
            case "edit":
                editBook(request,response);
            case "update":
                updateBook(request,response);
                break;
            case "delete":
                deleteBook(request,response);
                break;
            default:
                listBooks(request,response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException , IOException {
        doGet(request,response);
    }

    private void listBooks(HttpServletRequest request,HttpServletResponse response) throws  ServletException , IOException {
        request.setAttribute("booksList" , booksList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("books-list.jsp");
        dispatcher.forward(request,response);
    }

    private void showNewForm(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("books-form.jsp");
        dispatcher.forward(request,response);
    }

    private void createBook(HttpServletRequest request,HttpServletResponse response) throws ServletException , IOException {
        String bookTitle = request.getParameter("bookTitle");
        String author = request.getParameter("author");
        int bookId = booksList.size() +1;
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double bookPrice = Double.parseDouble(request.getParameter("bookPrice"));
        String img = request.getParameter("img");

        Books newBooks = new Books(bookTitle,bookPrice,bookId,author,quantity,img);

        booksList.add(newBooks);

        response.sendRedirect("books");
    }

    protected void editBook(HttpServletRequest request,HttpServletResponse response) throws ServletException , IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        Books books = getBookById(bookId);

        request.setAttribute("books", books);
        RequestDispatcher dispatcher = request.getRequestDispatcher("books-form.jsp");
        dispatcher.forward(request,response);

    }

    private void searchBookByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookName = request.getParameter("bookName");

        List<Books> searchResult = new ArrayList<>();

        for (Books book : booksList) {
            if (book.getBookTitle().toLowerCase().contains(bookName.toLowerCase())) {
                searchResult.add(book);
            }
        }

        request.setAttribute("searchResult", searchResult);

        RequestDispatcher dispatcher = request.getRequestDispatcher("books-list.jsp");
        dispatcher.forward(request, response);
    }

    private void updateBook(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String bookTitle = request.getParameter("bookTitle");
        String author = request.getParameter("author");
        Double bookPrice = Double.parseDouble(request.getParameter("bookPrice"));
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));

        Books books = getBookById(bookId);
        books.setBookTitle(bookTitle);
        books.setBookPrice(bookPrice);
        books.setQuantity(quantity);
        books.setAuthor(author);

        response.sendRedirect("books");
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        Books books = getBookById(bookId);
        booksList.remove(books);

        response.sendRedirect("books");
    }

    private Books getBookById(int bookId){
        for (Books books : booksList){
            if(books.getbookId() == bookId)
            {
                return  books;
            }
        }
        return  null;
    }
}
