package BookStore;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/books")
@MultipartConfig
public class BooksServlet extends HttpServlet {

    private List<Books> booksList;

    @Override
    public void init() throws ServletException{
        super.init();
        booksList = new ArrayList<>();
        booksList.add(new Books("Onepiece",12.12,1,"Oda Eiichiro",10,"img/onepiece.jpg"));
        booksList.add(new Books("Naruto",13.13, 2,"Kishimoto Masashi ", 30,"img/naruto.jpg"));
        booksList.add(new Books("Conan",14.14,3,"Aoyama Gosho",40,"img/conna.jpg"));
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

        Part filePart = request.getPart("img");

        String fileName = getFileName(filePart);


        String uploadDirectory = getServletContext().getRealPath("/img");

        String filePath = uploadFile(filePart, fileName, uploadDirectory);

        String img ="img/" + fileName;

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

    private void updateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        Part filePart = request.getPart("img");
        if (filePart != null && filePart.getSize() > 0) {
            deleteImage(books.getImg(), request);

            String fileName = getFileName(filePart);
            String uploadDirectory = getServletContext().getRealPath("/img");
            String filePath = uploadFile(filePart, fileName, uploadDirectory);
            String img = "img/" + fileName;

            // gán giá trị mới cho thuộc tính img của đối tượng books
            books.setImg(img);
        }

        response.sendRedirect("books");
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        Books books = getBookById(bookId);
        booksList.remove(books);

        response.sendRedirect("books");
    }

    private void  deleteImage(String img, HttpServletRequest request) throws ServletException, IOException{
        String uploadDirectory = request.getServletContext().getRealPath("" )+ File.separator + "img";
        String imgPath = uploadDirectory + File.separator + img;

        File imgFile = new File(imgPath);
        if(imgFile.exists()){
            imgFile.delete();
        }
    }

    private  String uploadFile(Part filePart, String fileName, String uploadDirectory) throws IOException{
        String filePath = uploadDirectory + File.separator + fileName;
        try(InputStream inputStream = filePart.getInputStream();
            FileOutputStream outputStream = new FileOutputStream(filePath)){
                byte[] buffer = new byte[8192];
                int bytesRead;

                while ((bytesRead = inputStream.read(buffer)) != -1){
                    outputStream.write(buffer, 0 , bytesRead);
                }


            }
            return filePath;
    }

    private String getFileName(Part part){
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");

        for (String element : elements){
            if (element.trim().startsWith("filename")){
                return element.substring(element.indexOf("=") + 1 ).trim().replace("\"","");
            }
        }
        return "";
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
