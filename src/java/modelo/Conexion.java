
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {


    public static Connection getConexion() {
        Connection cn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books?zeroDateTimeBehavior=convertToNull",
                "root", "mysql");
        } catch (Exception e) {
        }
        return cn;
    }


}
