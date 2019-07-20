<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- process.jsp -->

<%-- JSP page settings --%>
<%@ page language = "java" session = "true" %>
<%@ page import = "java.text.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
   <title>Agradecimiento</title>
   <link rel="stylesheet" href="styles.css" type="text/css" />
   <link rel="stylesheet" href="css/bootstrap.min.css">
</head>

<% // start scriptlet

   // get total order amount
   Double d = ( Double ) session.getAttribute( "total" );
   double total = d.doubleValue();

   // invalidate session because processing is complete
   session.invalidate();

%> <%-- end scriptlet --%>

<body>
   <p class="bigFont">Gracias</p>

   <p>Su pedido ha sido procesado</p>

   <p>Su tarjeta de credito ha sido debitado:
      <span class="bold">
         $<%= new DecimalFormat( "0.00" ).format( total ) %>
      </span>
   </p>
   <br>


   <div class="d-flex justify-content-around">
      <div class="p-2">
         <a href="index.html">
            <button type="button" class="btn btn-primary">Cerrar</button>
         </a>
      </div>
      <div class="p-2">
         <a href="books.jsp">
            <button type="button" class="btn btn-danger">Ver lista</button>
         </a>
      </div>
   </div>
</body>

</html>