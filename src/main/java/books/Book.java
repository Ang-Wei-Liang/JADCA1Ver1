package books;

public class Book {
    private String isbn;
    private String title;
    private String author;
    private String publisher;
    private String category;
    private int quantity;
    private double price;

    // Constructor
    public Book(String isbn, String title, String author, String publisher, String category, int quantity, double price) {
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.category = category;
        this.quantity = quantity;
        this.price = price;
    }

    // Getter methods
    public String getIsbn() {
        return isbn;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public String getPublisher() {
        return publisher;
    }
    
    public String getCategory() {
        return category;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }
}
