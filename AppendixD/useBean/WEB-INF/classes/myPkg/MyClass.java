package myPkg;
import java.io.Serializable;
public class MyClass implements java.io.Serializable {
  private int i;
  public MyClass() {i = 0;}
  public void setI(int i) {this.i = i;}
  public int getI() {return i;}
  }