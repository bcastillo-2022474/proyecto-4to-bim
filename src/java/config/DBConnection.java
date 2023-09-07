package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection connection;

    public Connection getConnection() {
        if (connection != null) return connection;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/DB2022_474?autoReconnect=true&useSSL=false", "quinto", "admin");
        } catch (Exception e){
            e.printStackTrace();
            System.out.println("No se puedo establecer la conexion :(");
        }
        return connection;
    }
}
