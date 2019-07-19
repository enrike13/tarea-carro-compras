// CartItemBean.java
// Class that maintains a book and its quantity.
package clases;

import java.io.*;

public class CartItemBean implements Serializable {
   private BookBean book;
   private int quantity;

   // initialize a CartItemBean
   public CartItemBean( BookBean bookToAdd, int number )
   {
      book = bookToAdd;
      quantity = number;
   }

   // get the book (this is a read-only property)
   public BookBean getBook()
   {
      return book;
   }

   // set the quantity
   public void setQuantity( int number )
   {
      quantity = number;
   }

   // get the quantity
   public int getQuantity()
   {
      return quantity;
   }
}