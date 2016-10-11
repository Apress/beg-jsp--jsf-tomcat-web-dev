package eshop.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import eshop.beans.Book;
import eshop.beans.CartItem;
import eshop.beans.Category;
import eshop.beans.Customer;

public class DataManager {

  public Connection getConnection() {
    Connection conn = null;
    try {
      Context ctx = new InitialContext();
        if (ctx != null){
          Context envContext  = (Context)ctx.lookup("java:/comp/env");
          if (envContext != null) {
            DataSource ds = (DataSource)envContext.lookup("jdbc/mysql");
            if (ds != null) {
              conn = ds.getConnection();
            }
          }
        }
      }
    catch (Exception e) {
      System.out.println("Could not connect to DB: " + e.getMessage());
      e.printStackTrace(System.out);
      }
    return conn;
    }
  
  public void putConnection(Connection conn) {
    if (conn != null) {
      try { conn.close(); }
      catch (SQLException e) { }
      }
    }

  public String getCategoryName(String categoryID) {
    Category category = CategoryPeer.getCategoryById(this, categoryID);
    return (category == null) ? null : category.getName();
    }

  public List<Category> getCategories() {
    return CategoryPeer.getAllCategories(this);
    }
  
  public ArrayList getSearchResults(String keyword) {
    return BookPeer.searchBooks(this, keyword);
    }

  public ArrayList getBooksInCategory(String categoryID) {
    return BookPeer.getBooksByCategory(this, categoryID);
    }

  public Book getBookDetails(String bookID) {
    return BookPeer.getBookById(this, bookID);
    }
  public long insertOrder(Customer customer, Hashtable shoppingCart) {
    return OrderPeer.insertOrder(this, customer, shoppingCart);
    }

  public long insertOrder_(Customer customer, Hashtable shoppingCart) {
    long returnValue = 0L;
    long orderId = System.currentTimeMillis();
    Connection connection = getConnection();
    if (connection != null) {
      Statement s = null;
      try {
        connection.setAutoCommit(false);
        s = connection.createStatement();
        String sql = "insert into orders (order_id, delivery_name,"
          + " delivery_address, cc_name, cc_number, cc_expiry) values ('"
          + orderId + "','" + customer.getContactName() + "','"
          + customer.getDeliveryAddress() + "','"
          + customer.getCcName() + "','" + customer.getCcNumber()
          + "','" + customer.getCcExpiryDate() + "')"
          ;
        try {
          s.executeUpdate(sql);

          // Insert items into the OrderDetails table
          Enumeration enumList = shoppingCart.elements();
          while (enumList.hasMoreElements()) {
            CartItem item = (CartItem)enumList.nextElement();
            sql = "insert into order_details (order_id, book_id, quantity,"
                + " price, title, author) values ('" + orderId + "','"
                + item.getBookID() + "','" + item.getQuantity() + "','"
                + item.getPrice() + "','" + item.getTitle() + "','"
                + item.getAuthor() + "')"
                ;
            s.executeUpdate(sql);
            }
          try { s.close(); }
          finally { s = null; }
          connection.commit();
          returnValue = orderId;
          }
        catch (SQLException e) {
          System.out.println("Could not insert order: " + e.getMessage());
          try { connection.rollback(); }
          catch (SQLException ee) { }
          }
        }
      catch (SQLException e) {
        System.out.println("Could not insert order: " + e.getMessage());
        }
      finally {
        if (s != null) {
          try { s.close(); }
          catch (SQLException e) { }
          }
        putConnection(connection);
        }
      }
    return returnValue;
    }
  }
