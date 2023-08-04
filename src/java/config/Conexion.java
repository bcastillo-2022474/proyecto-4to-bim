package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection conexion;
    
    public Connection Conexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBJavaEEVentas2022135?useSSL=false", "root", "K$oport3Lab");
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se establecio la conexion :'( ");
        }      
        return conexion;
    }
}
