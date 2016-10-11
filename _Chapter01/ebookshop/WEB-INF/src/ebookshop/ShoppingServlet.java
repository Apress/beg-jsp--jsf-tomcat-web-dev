package ebookshop;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import ebookshop.Book;

public class ShoppingServlet extends HttpServlet {

  public void init(ServletConfig conf) throws ServletException  {
    super.init(conf);
    }

  public void doGet (HttpServletRequest req, HttpServletResponse res)
      throws ServletException, IOException {
    doPost(req, res);
    }

  public void doPost (HttpServletRequest req, HttpServletResponse res)
      throws ServletException, IOException {
    HttpSession session = req.getSession(true);
    Vector<Book> shoplist =
      (Vector<Book>)session.getAttribute("ebookshop.cart");
    String do_this = req.getParameter("do_this");
    if (do_this == null) {
      Vector<String> blist = new Vector<String>();
      blist.addElement("Beginning JSP, JSF and Tomcat. Zambon/Sekler $39.99");
      blist.addElement("Beginning JBoss Seam. Nusairat $39.99");
      blist.addElement("Founders at Work. Livingston $25.99");
      blist.addElement("Business Software. Sink $24.99");
      blist.addElement("Foundations of Security. Daswani/Kern/Kesavan $39.99");
      session.setAttribute("ebookshop.list", blist);
      ServletContext    sc = getServletContext();
      RequestDispatcher rd = sc.getRequestDispatcher("/");
      rd.forward(req, res);
      }
    else {
      if (do_this.equals("checkout"))  {
        float dollars = 0;
        int   books = 0;
        for (int i = 0; i < shoplist.size(); i++) {
          Book  aBook = (Book)shoplist.elementAt(i);
          float price = aBook.getPrice();
          int   qty = aBook.getQuantity();
          dollars += price * qty;
          books += qty;
          }
        req.setAttribute("dollars", new Float(dollars).toString());
        req.setAttribute("books", new Integer(books).toString());
        ServletContext    sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/Checkout.jsp");
        rd.forward(req, res);
        } // if (..checkout..
      else {
        if (do_this.equals("remove")) {
          String pos = req.getParameter("position");
          shoplist.removeElementAt((new Integer(pos)).intValue());
          }
        else if (do_this.equals("add")) {
          boolean found = false;
          Book aBook = getBook(req);
          if (shoplist == null) {  // the shopping cart is empty
            shoplist = new Vector<Book>();
            shoplist.addElement(aBook);
            }
          else {  // update the #copies if the book is already there
            for (int i = 0; i < shoplist.size() && !found; i++) {
              Book b = (Book)shoplist.elementAt(i);
              if (b.getTitle().equals(aBook.getTitle())) {
                b.setQuantity(b.getQuantity() + aBook.getQuantity());
                shoplist.setElementAt(b, i);
                found = true;
                }
              } // for (i..
            if (!found) {  // if it is a new book => Add it to the shoplist
              shoplist.addElement(aBook);
              }
            } // if (shoplist == null) .. else ..
          } // if (..add..
        session.setAttribute("ebookshop.cart", shoplist);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/");
        rd.forward(req, res);
        } // if (..checkout..else
      } // if (do_this..
    } // doPost

  private Book getBook(HttpServletRequest req) {
    String myBook = req.getParameter("book");
    int    n = myBook.indexOf('$');
    String title = myBook.substring(0, n);
    String price = myBook.substring(n+1);
    String qty = req.getParameter("qty");
    return new Book(title, Float.parseFloat(price), Integer.parseInt(qty));
    } // getBook
  }
