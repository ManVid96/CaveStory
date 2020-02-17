/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Conexion.Conexion;
import java.io.IOException;
//import com.google.gson.Gson;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static java.util.Collections.list;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javie
 */
public class S_Like extends HttpServlet {

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Connection con = Conexion.getConexion();
            PreparedStatement stmt = null;
            String idvideo = request.getParameter("idVideo");
            String idUsuario = request.getParameter("idUsuario");
            String query = "select * from dalike where idVideo = ? and idUsuario = ?;";
            stmt = con.prepareStatement(query);
            stmt.setString(1, idvideo);
            stmt.setString(2, idUsuario);
            ResultSet rs = stmt.executeQuery();
            
           if (rs.next()){
               PreparedStatement stmt2 = null;
               String query2 = "delete from dalike where idVideo = ? and idUsuario = ?;";
               stmt2 = con.prepareStatement(query2);
                stmt2.setString(1, idvideo);
                stmt2.setString(2, idUsuario);
                stmt2.execute();
               
            String json = "0";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json); 
           }else {
               PreparedStatement stmt2 = null;
               String query2 = "insert into dalike (idVideo, idUsuario) values (?,?);";
               stmt2 = con.prepareStatement(query2);
               stmt2.setString(1, idvideo);
                stmt2.setString(2, idUsuario);
                stmt2.execute();
               
            String json = "1";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json); 
           }
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          try {
              processRequest(request, response);
          } catch (SQLException ex) {
              Logger.getLogger(S_Like.class.getName()).log(Level.SEVERE, null, ex);
          }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          try {
              processRequest(request, response);
          } catch (SQLException ex) {
              Logger.getLogger(S_Like.class.getName()).log(Level.SEVERE, null, ex);
          }
    }

        @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
