package books;

public class Book {
	

	private String IBSN;
	private String Title;
	private String Author;
	private String Publisher;
	private int Quantity;
	private double Price;
	
	
	public Book(String IBSN2, String title, String author, String publisher, int quantity, double price) {
		super();
		IBSN = IBSN2;
		Title = title;
		Author = author;
		Publisher = publisher;
		Quantity = quantity;
		Price = price;
	}
	
	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String author) {
		Author = author;
	}

	public String getPublisher() {
		return Publisher;
	}

	public void setPublisher(String publisher) {
		Publisher = publisher;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public String getIBSN() {
		return IBSN;
	}
	
	public void setIBSN(String IBSN) {
		this.IBSN = IBSN;
	}
}
