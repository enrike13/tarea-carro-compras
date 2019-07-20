// TitlesBean.java
// Class TitlesBean makes a database connection and retrieves
// the books from the database.
package clases;

// Java core packages
import java.io.*;
import java.sql.*;
import java.util.*;

public class TitlesBean implements Serializable {
 String urlBD="jdbc:mysql://localhost:3306/books?zeroDateTimeBehavior=convertToNull";
 String usuarioBD="root";
 String passwordBD="mysql";

   public static Connection connection;
   private PreparedStatement titlesQuery;

   // construct TitlesBean object
   public TitlesBean(){
      // attempt database connection and setup SQL statements
      try {
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection(urlBD,usuarioBD,passwordBD);

         titlesQuery = connection.prepareStatement(
               "SELECT isbn, title, editionNumber, " +
               "copyright, publisherID, imageFile, price " +
               "FROM titles ORDER BY title"
            );
      }

      // process exceptions during database setup
      catch ( SQLException sqlException ) {
         sqlException.printStackTrace();
      }

      // process problems locating data source
      catch (Exception e){
        ;
      }
   }

   // return a List of BookBeans
   public List getTitles()
   {
      List titlesList = new ArrayList();

      // obtain list of titles
      try {
         ResultSet results = titlesQuery.executeQuery();

         // get row data
         while ( results.next() ) {
            BookBean book = new BookBean();

            book.setISBN( results.getString( "isbn" ) );
            book.setTitle( results.getString( "title" ) );
            book.setEditionNumber(
               results.getInt( "editionNumber" ) );
            book.setCopyright( results.getString( "copyright" ) );
            book.setPublisherID(
               results.getInt( "publisherID" ) );
            book.setImageFile( results.getString( "imageFile" ) );
            book.setPrice( results.getDouble( "price" ) );

            titlesList.add( book );
         }
      }

      // process exceptions during database query
      catch ( SQLException exception ) {
         exception.printStackTrace();
      }

      // return the list of titles
      finally {
         return titlesList;
      }
   }

   // close statements and terminate database connection
   protected void finalize()
   {
      // attempt to close database connection
      try {
         connection.close();
      }

      // process SQLException on close operation
      catch ( SQLException sqlException ) {
         sqlException.printStackTrace();
      }
   }
}