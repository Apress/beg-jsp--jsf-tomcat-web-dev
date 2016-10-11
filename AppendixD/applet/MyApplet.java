import java.awt.*;
import java.applet.*;
public class MyApplet extends Applet {
  String line;
  public void init() {
    line = getParameter("line");
    }
  public void paint(Graphics page) {
    page.setColor(Color.red);
    page.fillRect(0, 0, 50, 50);
    page.setColor(Color.green);
    page.fillRect(50, 0, 50, 50);
    page.setColor(Color.blue);
    page.fillRect(0, 50, 50, 50);
    page.setColor(Color.yellow);
    page.fillRect(50, 50, 50, 50);
    page.setColor(Color.black);
    page.drawString(line, 10, 40);
    }
  }