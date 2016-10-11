package eshop.model;

import java.util.Hashtable;
import java.util.Enumeration;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import eshop.beans.Customer;
import eshop.beans.CartItem;

public class OrderPeer {

  public static long insertOrder(DataManager dataManager,
    Customer customer, Hashtable shoppingCart) {
    long returnValue = 0L;
    long orderId = System.currentTimeMillis();
    Connection connection = dataManager.getConnection();
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
        dataManager.putConnection(connection);
        }
      }
    return returnValue;
    }
  }
