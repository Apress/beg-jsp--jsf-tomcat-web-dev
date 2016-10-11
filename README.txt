******************************************************************************
*******  Introducing JSP, JSF and Tomcat: From Novice to Professional  *******
******************************************************************************

This README lists the test software mentioned in the manual and tells you how
to execute it.  For a description of the software and its structure, please
refer to the manual.

If you have followed the installation instructions in Appendix A, the URL
  http://localhost:8080/
corresponds to the following directory of your PC:
  C:\Program Files\Apache Software Foundation\Tomcat 6.0\webapps\ROOT\

None of the examples listed in this README file works unless you install the
following components (the releases in parentheses are those we have referred
to in Appendix A):
 *  Java (jdk1.6.0_01 / jre1.6.0_01)
 *  Tomcat (6.0.13)
To execute examples that use JSTL and process XML files, you also have to
install the following:
 *  JSTL (1.1.2), consisting of the libraries jstl.jar and standard.jar.
 *  XPath/Xerces (Xalan 2.7.0, Xerces-J 2.9.0), consisting of the libraries
    xalan.jar, xercesImpl.jar, serializer.jar, and xml-apis.jar.
To execute the online bookshop examples eshop and eshopx, you also need to
install:
 *  MySQL (5.0.41)
 *  MySQL JDBC driver(Connector-J 5.0.6)
To execute the online bookshop eshopf, you also need to install:
 *  JSF (1.2_04), consisting of the libraries jsf-api.jar and jsf-impl.jar.
You can either place the JARs in the Tomcat lib\ folder or in the WEB-INF\lib\
folder of your application, but if you put them in both, the application might
fail.

Note that we have NOT included any JAR in the WEB-INF\lib\ folder of the
examples.  We assume that you have installed the necessary packages by copying
the corresponding libraries into the Tomcat lib\ folder.

Concerning executing the examples, if you place, a module named whatever.html
in the ROOT folder, you should be able to view it in a browser by typing:
  http://localhost:8080/whatever.html
although it might be displayed incorrectly because some supporting files like
images and stylesheets might be missing.  The same goes for JSP and JSPX
modules that are not part of an application consisting of several modules.

To avoid clogging your ROOT folder with our test modules, we recommend that
you create a test folder inside webapps (i.e. "beside" ROOT).  For example:
  C:\Program Files\Apache Software Foundation\Tomcat 6.0\webapps\book\

For more complex applications (e.g. eshop), you will have to copy to webapps
the application folder.

There is no code specifically for Chapters 8-9 and for Appendices B, E, and G.


******************* Chapter 01: Introducing JSP and Tomcat *******************

===== hello.html writes "Hello World!" in the browser window.  To test it,
copy it to the test folder and type in the browser:
  http://localhost:8080/book/hello.html

===== hello.jsp writes "Hello World!" and displays the IP addres and the
browser type.  To test it, copy it to the test folder and type in the browser:
  http://localhost:8080/book/hello.jsp

===== ebookshop\
It contains an application that implements a simple online shop.  To test it,
copy the whole folder to webapps and type in the browser:
  http://localhost:8080/ebookshop


************************* Chapter 02: JSP Explained **************************

===== hello.jspx writes "Hello World!" and displays the IP addres and the
browser type, exactly like hello.jsp of Chapter 1, but is written in XML
format.  To test it, copy it to the test folder and type in the browser:
  http://localhost:8080/book/hello.jspx

===== req_params.jsp displays the request parameters in tabular form.  To test
it, copy it to the test folder and type in the browser:
  http://localhost:8080/book/req_params.jsp?a=3&b=5&a=3&c=7&b=1&d
or the same URL with any other combination of parameters.

===== req_params_jstl.jsp displays the request parameters in tabular form like
req_params.jsp, but uses the JSTL instead of scriplets.  To test it, copy it
to the test folder and type in the browser:
  http://localhost:8080/book/req_params_jstl.jsp?a=3&b=5&a=3&c=7&b=1&d
or the same URL with any other combination of parameters.

===== starfleet.jsp parses the file starfleet.xml and display it using the
JSTL-XML library.  To test it, copy it to the test folder together with
starfleet.xml and type in the browser:
  http://localhost:8080/book/starfleet.jsp

===== tags\
It contains an application to show how to implement custom tags.  To test it,
copy the whole folder to webapps and type in the browser:
  http://localhost:8080/tags/weekday.jsp?d=yyyy-mm-dd
or
  http://localhost:8080/tags/weekday.jspx?d=yyyy-mm-dd
where yyyy-mm-dd is a valid date.
The only difference between the two implementations is that the second one is
in XML format.

===== international\
It contains an application to show how to use of JSTL-FMT tags to support
multiple languages.  To test it, copy the whole folder to webapps and type in
the browser:
  http://localhost:8080/international/

===== eshop\
It contains an online bookshop application implemented with JSP pages.  To
test it, copy the whole folder to webapps and type in the browser:
  http://localhost:8080/eshop/shop/

===== eshopx\
It contains an online bookshop application functionally identical to eshop,
but implemented with JSP documents (i.e. in XML format).  To test it, copy the
whole folder to webapps and type in the browser:
  http://localhost:8080/eshopx/shop/


************************** Chapter 03: The Web Page **************************

===== basic.html shows the basic structure of an HTML module.  To test it,
copy it to the test folder and type in the browser:
  http://localhost:8080/book/basic.html

===== show_req.jsp displays the method of the HTTP-request and lists its
parameters.  To test it, copy it to the test folder and type in the browser:
  http://localhost:8080/book/show_req.jsp?a=3&b=5&a=3&c=7&b=1&d
or the same URL with any other combination of parameters.

===== table.html shows a table.  To test it, copy it to the test folder and
type in the browser:
  http://localhost:8080/book/table.html

===== penguin\
This folder contains two test modules, penguin_tbl.html and penguin.html.
The first one shows you how to make a clickable map (which doesn't work!) with
an HTML table.  The second one shows you how to do it properly with the map
HTML element.  To test them, copy the whole folder to the test folder and type
in the browser:
  http://localhost:8080/book/penguin/penguin_tbl.html
and
  http://localhost:8080/book/penguin/penguin.html

===== form\
This folder contains the module form.html to show you how to make HTML forms,
and its JSP version form.jsp.  To test them, copy them to the test folder and
type in the browser:
  http://localhost:8080/book/form.html
and
  http://localhost:8080/book/form.jsp

===== p_styles.html shows paragraph styling.  To test it, copy it to the test
folder and type in the browser:
  http://localhost:8080/book/p_styles.html

===== tabs\
This folder contains the module tabs.html to show you how to implement tabs by
means of CSS, and its JSP version tabs.jsp.  To test them, copy the whole
folder to the test folder and type in the browser:
  http://localhost:8080/book/tabs/tabs.html
and
  http://localhost:8080/book/tabs/tabs.jsp

===== dates\
This folder contains the module dates.jsp to show you how to use JavaScript to
check dates on the client side.  To test it, copy the whole folder to the test
folder and type in the browser:
  http://localhost:8080/book/dates/dates.jsp

===== balls\
This folder contains the module balls.html to show you how to create
animations with JavaScript.  To test it, copy the whole folder to the test
folder and type in the browser:
  http://localhost:8080/book/balls/balls.jsp

===== ticker\
This folder contains two examples of how to generate a scrolling ticker tape
with JavaScript.  To test them, copy them to the test folder and type in the
browser:
  http://localhost:8080/book/ticker0.html
and
  http://localhost:8080/book/ticker.html

===== ajax\
This folder contains the module ajax.html to show you how to let the client
communicate asynchronously with the server.  To test it, copy the whole folder
to the test folder and type in the browser:
  http://localhost:8080/book/ajax/ajax.html


*************************** Chapter 04: Databases ****************************

===== xls\
This folder contains the module xls.jsp to show you how to access a
spreadsheet as if it were a database.  To test it, copy the whole folder to
the test folder and type in the browser:
  http://localhost:8080/book/xls/xls.jsp


******************* Chapter 05: At Face Value (JSF Primer) *******************

===== eshopf\
It contains a version of eshopx (see Chapter 2) in which the user interface
has been implemented with JSF.  To test it, copy the whole folder to webapps
and type in the browser:
  http://localhost:8080/eshopf/
Be aware of the fact that the "Custom Name" field in the Checkout page is
duplicated at the top of the content area.  You can remove it out by editing
the file Checkout.jspx.

===== eshopfn\
It is almost identical to eshopf.  The only differences are that the renderer
of eshop:inputEntry is inside the component and the redundant "Custom Name"
field in Checkout.jspx has been commented out.  To test it, copy the whole
folder to webapps and type in the browser:
  http://localhost:8080/eshopfn/


********************* Chapter 06: Communicating with XML *********************

Note: we have included the same enterprises.xml file in more than one example
folder to make the testing of the examples easier.

===== xml-validate\
This folder contains the examples to validate an XML file in 6 different ways.
To test them, copy the whole folder to webapps and type in the browser the
following URLs:
  http://localhost:8080/xml-validate/with-dtd/starfleet_validate_dom.jsp
  http://localhost:8080/xml-validate/with-dtd/starfleet_validate_sax.jsp
  http://localhost:8080/xml-validate/with-dtd/starfleet_validate_jaxp.jsp
to validate the file enterprises.xml against starfleet.dtd, or type one of the
following ("http://" at the beginning omitted because the URLs didn't fit in a
single line):
  localhost:8080/xml-validate/with-schema/starfleet_validate_dom_schema.jsp
  localhost:8080/xml-validate/with-schema/starfleet_validate_sax_schema.jsp
  localhost:8080/xml-validate/with-schema/starfleet_validate_jaxp_schema.jsp
to validate enterprise_schema.xml against starfleet.xsd.

===== xml-style\
This folder contains two examples of how to apply XSL stylesheets to transform
XML files.  To test them, copy the whole folder to webapps and type in the
browser:
  http://localhost:8080/xml-style/starfleet_transform_xml.jsp
to transform xml\starfleet.xml to out\enterprises_out.xml, or:
  http://localhost:8080/xml-style/enterprises_transform.jsp
to transform xml\enterprises_schema.xml to out\enterprises_out.html.

===== soap\
This folder contains an example of how to exchange SOAP messages between
applications.  To test it, copy the whole folder to the test folder and type
in the browser:
  http://localhost:8080/book/soap/myMess_send.jsp


********************* Appendix A: Installing Everything **********************

===== jdbc\
This folder contains one module to verify the correct installation of all the
packages described in Appendix A up to and including MySQL, and one that also
verifies the installation of the JSTL.  To use them, you have first to create
the database used for the eShop application. To do so, execute the MySQL
Command Line Client and, at the mysql> prompt, copy and paste the content of
the file jdbc\shop.sql.  You then copy the whole jdbc folder to the test
folder and type in the browser the following URLs:
  http://localhost:8080/book/jdbc/jdbc.jsp
  http://localhost:8080/book/jdbc/jdbc.jspx

===== xpath\
This folder contains a module to verify the correct installation of the
Xalan software.  To use it, copy the whole folder to the test folder and
type in the browser:
  http://localhost:8080/book/xpath/starfleet.jspx


************************* Appendix C: HTML Reference *************************

===== charform.html shows text formatting.  To test it, copy it to the test
folder and type in the browser:
  http://localhost:8080/book/charform.html

===== charstyle.html shows text styling.  To test it, copy it to the test
folder and type in the browser:
  http://localhost:8080/book/charstyle.html

===== abbr.html shows how to define an abbreviation.  To test it, copy it to
the test folder and type in the browser:
  http://localhost:8080/book/abbr.html

===== blockquote.html shows how to define a quotation.  To test it, copy it to
the test folder and type in the browser:
  http://localhost:8080/book/blockquote.html

===== maptest\
This folder contains three modules to show you how to use image maps:
maptest.html uses a map together with an object element, maptest_img.html
together with an img element, and maptest_area.html together with an image
using area elements.  To test them, copy the whole folder to the test folder
and type in the browser the following URLs:
  http://localhost:8080/book/maptest/maptest.html
  http://localhost:8080/book/maptest/maptest_img.html
  http://localhost:8080/book/maptest/maptest_area.html

===== frames\
This folder contains frameset.html to show you how to use frames, and
iframe.html to show you how to use iframes.  To test them, copy the whole
folder to the test folder and type in the browser the following URLs:
  http://localhost:8080/book/frames/frameset.html
  http://localhost:8080/book/frames/iframe.html

===== forms\
This folder contains examples of how to use forms elements.  To test them,
copy the whole folder to the test folder and type in the browser the following
URLs:
  http://localhost:8080/book/forms/form_text.html
  http://localhost:8080/book/forms/form_buttons.html
  http://localhost:8080/book/forms/form_choices.html
  http://localhost:8080/book/forms/form_selections.html
  http://localhost:8080/book/forms/form_fieldset.html

===== lists\
This folder contains examples of how to use list elements.  To test them,
copy the whole folder to the test folder and type in the browser the following
URLs:
  http://localhost:8080/book/lists/list_definition.html
  http://localhost:8080/book/lists/list_ordered.html
  http://localhost:8080/book/lists/list_unordered.html

===== tables\
This folder contains examples of how to use table elements.  To test them,
copy the whole folder to the test folder and type in the browser the following
URLs:
  http://localhost:8080/book/tables/table_valign.html
  http://localhost:8080/book/tables/table_frame.html
  http://localhost:8080/book/tables/cr_span.html
  http://localhost:8080/book/tables/td_headers.html
  http://localhost:8080/book/tables/table_col.html
  http://localhost:8080/book/tables/table_colgroup.html
  http://localhost:8080/book/tables/table_rowgroup.html


************************* Appendix D: JSP Reference **************************

===== do_it\
The two JSP pages in this folder show you how to use an application attribute
to enable and disable a conditional code. To test them, copy the whole folder
to the test folder and type in the browser:
  http://localhost:8080/book/do_it/do_it.jsp
to enable the conditional code, and
  http://localhost:8080/book/do_it/do_it_not.jsp
to disable it.

===== log\
The two JSP pages in this folder show you how to implement your own logging
mechanism using an application attribute. To test them, copy the whole folder
to webapps and type in the browser:
  http://localhost:8080/log/log_on.jsp
to switch the logging ON, and
  http://localhost:8080/log/log_off.jsp
to switch it OFF.

===== stack_trace\
This folder contains a module that shows you how to create an error JSP page
and display the stack trace.  To test it, copy the whole folder to the test
folder and type in the browser:
  http://localhost:8080/book/stack_trace/cause_exception.jsp

===== req_headers.jsp displays the HTTP request headers.  To test it, copy it
to the test folder and type in the browser:
  http://localhost:8080/book/req_headers.jsp

===== user_authentication\
This example shows you how to implement a simple user authentication
mechanism.  To install it, do the following:
 *  Copy the whole folder to webapps.
 *  Go to the folder
      C:\Program Files\Apache Software Foundation\Tomcat 6.0\conf\
    and edit the file tomcat-users.xml
 *  Insert the following four line immediately above </tomcat-users>
      <role rolename="canDoThis"/>
      <role rolename="canDoThat"/>
      <user username="aBloke" password="whatever" roles="canDoThis"/>
      <user username="bigCheese" password="yes!" roles="canDoThis,canDoThat"/>
 *  Restart Tomcat
To test it, type in the browser:
  http://localhost:8080/user_authentication/
You will see that you can access the "this" page if you login with one of the
above userIDs and passwords, while to enter the "that" page you must login as
bigCheese.  Once you are logged in, you need to exit your browser in order to
log out.

===== req_body\
This folder contains two modules that show you how to read the body of the
HTTP request.  To test them, copy the whole folder to the test folder, type in
the browser:
  http://localhost:8080/book/req_body/req_getReader.jsp
and submit, or type:
  http://localhost:8080/book/req_body/req_getInputStream.jsp
and then upload a small text file.

===== req_params.jsp displays the HTTP request parameters.  To test it, copy
it to the test folder and type in the browser:
  http://localhost:8080/book/req_params.jsp?a=b&c=d&a=zzz&empty=&empty=&1=22
or the same URL with any other combination of parameters.
Note: this same module was also listed in Chapter 2 and is only repeated here
for convenience.

===== concurrency\
This folder contains two examples of how to protect critical code from the
effects of concurrency.  Copy the whole folder to the test folder, so that the
examples can be executed with the following URLs:
  http://localhost:8080/book/concurrency/concurrency.jsp
  http://localhost:8080/book/concurrency/concurrency2.jsp
To test them, please refer to the section of Appendix D under the heading:
"Example: Testing concurrency".

===== jsp_element\
This folder contains a module that shows you how to create XML elements in
JSP.  To test it, copy the whole folder to the test folder, type in the
browser:
  http://localhost:8080/book/jsp_element/actel_element_attribute.jsp
and look at the source of the generated HTML page.

===== jsp_include\
This folder contains a module that shows you how jsp:include works.  To test
it, copy the whole folder to the test folder and type in the browser
  http://localhost:8080/book/jsp_include/includes.jsp
Please refer to the Appendix D for the details.

===== applet\
This folder contains a module that shows you how to use a Java applet inside a
JSP page.  To test it, copy the whole folder to the test folder and type in
the browser:
  http://localhost:8080/book/applet/applet.jsp
Warning #1: it doesn't work with Firefox.  Use IE or Opera.
Warning #2: it only works if you have named the test folder "book", otherwise
            you have to edit applet.jsp and correct the folder name.

===== useBean\
This folder contains a module that shows you how to use a Java object inside a
JSP page.  To test it, copy the whole folder to webapps and type in the
browser:
  http://localhost:8080/useBean/myObj.jsp

===== JSTL-core\
This folder contains two modules that show you how to use c:forEach and
c:forTokens.  To test them, copy the whole folder to the test folder and type
in the browser the following URLs:
  http://localhost:8080/book/JSTL-core/forEach.jsp
  http://localhost:8080/book/JSTL-core/forTokens.jsp


*********************** Appendix F: JSF Quick Reference **********************

=====testf\
It contains an application to show the rendering of the h:select* tags.
To test it, copy the whole folder to webapps and type in the browser:
  http://localhost:8080/testf/


******************** Appendix G: Development Environments ********************

In the SW folder for this appendix we have included the WAR files of five
applications that we describe in other chapters.  This makes it easy for you
to import the applications into the Eclipse IDE.

===== eshop.war and eshopx.war
Described in Chapter 2.

===== eshopf.war and eshopfn.war
Described in Chapter 5.

===== testf.war
Described in Appendix F.
