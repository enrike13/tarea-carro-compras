<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- viewCart.jsp -->

<%-- JSP page settings --%>
<%@ page language = "java" session = "true" %>
<%@ page import = "clases.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>

<html xmlns = "http://www.w3.org/1999/xhtml">

<head>
   <title>Carrito de Compras</title>

   <link rel = "stylesheet" href = "styles.css"
      type = "text/css" />
</head>

<body>
   <p class = "bigFont">Carrito de Compras</p>

<%-- start scriptlet to display shopping cart contents --%>
<%
   Map cart = ( Map ) session.getAttribute( "cart" );
   double total = 0;

   if ( cart == null || cart.size() == 0 )
      out.println( "<p>Carrito de compras vacio.</p>" );
   else {

      // create variables used in display of cart
      Set cartItems = cart.keySet();
      Iterator iterator = cartItems.iterator();

      BookBean book;
      CartItemBean cartItem;

      int quantity;
      double price, subtotal;

%> <%-- end scriptlet for literal XHTML output --%>

   <table>
      <thead><tr>
         <th>Producto</th>
         <th>Cantidad</th>
         <th>Precio</th>
         <th>Total</th>
      </tr></thead>

<% // continue scriptlet

      while ( iterator.hasNext() ) {

         // get book data; calculate subtotal and total
         cartItem = ( CartItemBean ) cart.get( iterator.next() );
         book = cartItem.getBook();
         quantity = cartItem.getQuantity();
         price = book.getPrice();
         subtotal = quantity * price;
         total += subtotal;

%> <%-- end scriptlet for literal XHTML and   --%>
   <%-- JSP expressions output from this loop --%>

         <%-- display table row of book title, quantity, --%>
         <%-- price and subtotal --%>
         <tr>
            <td><%= book.getTitle() %></td>

            <td><%= quantity %></td>

            <td class = "right">
               <%=
                  new DecimalFormat( "0.00" ).format( price )
               %>
            </td>

            <td class = "bold right">
               <%=
                  new DecimalFormat( "0.00" ).format( subtotal )
               %>
            </td>
         </tr>

<% // continue scriptlet

      }  // end of while loop

%> <%-- end scriptlet for literal XHTML and   --%>

      <%-- display table row containing shopping cart total --%>
      <tr>
         <td colspan = "4" class = "bold right">Total:
            <%= new DecimalFormat( "0.00" ).format( total ) %>
         </td>
      </tr>
   </table>

<% // continue scriptlet

      // make current total a session attribute
      session.setAttribute( "total", new Double( total ) );
   }  // end of else

%> <%-- end scriptlet --%>

   <!-- link back to books.jsp to continue shopping -->
   <p class = "bold green">
      <a href = "books.jsp">Continuar comprando</a>
   </p>

   <!-- form to proceed to checkout -->
   <form method = "get" action = "order.html">
      <p><input type = "submit" value = "Confirmar" /></p>
   </form>
</body>

</html>