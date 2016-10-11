package eshop.beans;

public class CartItem {
  private String author;
  private String title;
  private double price;
  private String bookID;
  private String quantity;

	public CartItem(Book book, int quantity) {
		this.bookID = book.getId();
		this.title = book.getTitle();
		this.author = book.getAuthor();
		this.price = book.getPrice();
		this.quantity = new Integer(quantity).toString();
	  }

	public String getAuthor() { return author; }
	public void setAuthor(String author) { this.author = author; }

	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }

	public double getPrice() { return price; }
	public void setPrice(double price) { this.price = price; }

	public String getBookID() { return bookID; }
	public void setBookId(String bookID) { this.bookID = bookID; }

	public String getQuantity() { return quantity; }
	public void setQuantity(String quantity) { this.quantity = quantity; }
  }
