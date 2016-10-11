package eshop.components;
import javax.faces.component.UIInput;
import javax.faces.context.FacesContext;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import javax.el.ValueExpression;
import javax.faces.application.FacesMessage;
import javax.faces.context.ResponseWriter;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import eshop.components.InputEntryComponent;

import javax.faces.render.Renderer;

public class InputEntryComponent extends UIInput {
  private String label;
  public InputEntryComponent(){
    this.setRendererType("eshop.inputEntry");
    }
  public String getLabel() {
    return label;
    }
  public void setLabel(String label) {
    this.label = label;
    }

  private void encodeInput(ResponseWriter respWr) throws IOException {
    FacesContext ctxt = FacesContext.getCurrentInstance();
    respWr.startElement("input", this);
    respWr.writeAttribute("type", "text", "type");
    respWr.writeAttribute("id", this.getClientId(ctxt), "id");
    respWr.writeAttribute("name", this.getClientId(ctxt), "name");
    if(this.getValue() != null) {
      respWr.writeAttribute("value", this.getValue().toString(), "value");
      }
    respWr.endElement("input");
    }
  private void encodeLabel(ResponseWriter respWr) throws IOException {
    respWr.startElement("label", this);
    respWr.write(this.getLabel());
    if (this.isRequired()) {
      respWr.write("*");
      }
    respWr.endElement("label");
    }
  private void encodeMessage(FacesContext ctxt, ResponseWriter respWr)
      throws IOException {
    Iterator it = ctxt.getMessages(this.getClientId(ctxt));
    // Notice: an if instead of a while
    if (it.hasNext()){
      FacesMessage mess = (FacesMessage)it.next();
      if (!this.isValid()) {
        String errorStyleClass =
            (String)this.getAttributes().get("errorStyleClass");
        respWr.startElement("span", this);
        respWr.writeAttribute("class", errorStyleClass, "class");
        respWr.write(mess.getDetail());
        respWr.endElement("span");
        }
      }
    }

  // Overridden methods
  public void decode(FacesContext ctxt) {
    Map requestMap = ctxt.getExternalContext().getRequestParameterMap();
    String clientId = this.getClientId(ctxt);
    String val = (String)requestMap.get(clientId);
    ((UIInput)this).setSubmittedValue(val);
    }
  public void encodeBegin(FacesContext ctxt)
      throws IOException {
    ResponseWriter respWr = ctxt.getResponseWriter();
    encodeLabel(respWr);
    encodeInput(respWr);
    encodeMessage(ctxt, respWr);
    respWr.flush();
    }
  public void encodeEnd(FacesContext context) throws IOException {
    }
  public Object getConvertedValue(FacesContext ctxt, Object subVal)
      throws ConverterException {
    Object convVal = null;
    ValueExpression valExpr = this.getValueExpression("value");
    if (valExpr != null) {
      Class valType = valExpr.getType(ctxt.getELContext());
      if (valType != null) {
        convVal = subVal;
        if (!valType.equals(Object.class) && !valType.equals(String.class)) {
          Converter converter = ((UIInput)this).getConverter();
          converter =  ctxt.getApplication().createConverter(valType);
          if (converter != null ) {
            convVal = converter.getAsObject(ctxt, this, (String)subVal);
            }
          }
        }
      }
    return convVal;
    }
  public String getFamily() {
    return "eshop.inputEntry";
    }
  public void restoreState(FacesContext ctxt, Object state) {
    Object val[] = (Object[])state;
    super.restoreState(ctxt, val[0]);
    label = (String)val[1];
    }
  public Object saveState(FacesContext ctxt) {
    Object val[] = new Object[2];
    val[0] = super.saveState(ctxt);
    val[1] = label;
    return ((Object)val);
    }
  }