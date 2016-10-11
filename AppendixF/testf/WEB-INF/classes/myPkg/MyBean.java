package myPkg;

import java.util.ArrayList;
import javax.faces.model.SelectItem;

public class MyBean {
  private ArrayList choices = new ArrayList();
  private String oneChoice;
  private Object oneValue;
  private SelectItem[] selects;
  

  public MyBean()  {
    selects = new SelectItem[3];
    selects[0] = new SelectItem("1", "one");
    selects[1] = new SelectItem("2", "two");
    selects[2] = new SelectItem("3", "three");
    }

  // ---------- Getters
  public Object[] getChoices() {
    return choices.toArray(); 
    }
  public String getOneChoice() {
    return oneChoice; 
    }
  public Object getOneValue() {
    return oneValue; 
    }
  public SelectItem[] getSelects() {
    return selects;
    }  

  // ---------- Setters
  public void setChoices(Object[] choiceArray) {
    int len=0;
    if (choiceArray != null) len = choiceArray.length;
    if (len != 0) {
      choices.clear();
      choices = new ArrayList(len);
      for (int k = 0; k < len; k++) {
        choices.add(choiceArray[k]);
        }
      }
    }
  public void setOneChoice(String oneChoice) {
    this.oneChoice = oneChoice;
    }
  public void setOneValue(Object oneValue) {
    this.oneValue = oneValue;
    }
  public void setSelects(SelectItem[] selects) {
    this.selects = selects;
    }  
  }
