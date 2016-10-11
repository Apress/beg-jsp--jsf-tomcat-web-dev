package eshop.tags;

import java.util.Hashtable;
import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.http.HttpSession;

public class DeleteBookTag extends TagSupport {
  static final long serialVersionUID = 1L;
  private String bookID;

  public void setBookID(String bookID) {
    this.bookID = bookID;
    }

  public int doEndTag() {
    HttpSession session = pageContext.getSession();
    Hashtable shoppingCart = (Hashtable)session.getAttribute("shoppingCart");
    shoppingCart.remove(bookID);
    return EVAL_PAGE;
    }
  }
