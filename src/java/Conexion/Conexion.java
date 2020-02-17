/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
    protected static Connection con;
    protected Statement stmt;
    private static String server = "localhost";
    private static String port = "3304";
    private static String bdname = "bdm";
    private static String url = "jdbc:mysql://127.0.0.1:3306/" + bdname;
    private static String usser = "root";
    private static String pass = "";
    private static String err;
    
    public Conexion(){
    }
    
    public String getURL(){
        return url;
    }
    
//    public Connection Conectar(){
//        con=null;
//         try{
//              Class.forName("org.gjt.mm.mysql.Driver");
//              con = DriverManager.getConnection(getURL(),usser,pass);
//              stmt=con.createStatement();
//              System.out.println("Conectado");
//         }catch(Exception ex){
//             err= "Error Mientras se conectaba a la Base de Datos";
//             System.out.println(err);
//             return null;
//         }
//          return con;
//     }
    
    public static Connection getConexion() throws SQLException {
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        con = DriverManager.getConnection(url, usser, pass);
        return con;
    }
    
    

}
