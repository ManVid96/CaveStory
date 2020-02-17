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
public class S_ModificarVideo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection con = Conexion.getConexion();
            String idVideo = request.getParameter("idVideo");
            String nombre = request.getParameter("titulo");
            String descripcion = request.getParameter("descripcion");
            PreparedStatement stmtPopu = null;
            String queryPopu = "update video set titulo = ?, descripcion = ? where idVideo = ?";
            stmtPopu = con.prepareStatement(queryPopu);
            stmtPopu.setString(1, nombre);
            stmtPopu.setString(2, descripcion);
            stmtPopu.setString(3, idVideo);
            stmtPopu.execute();

            
            response.sendRedirect("index.jsp");
            
        }
    }

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            //response.sendRedirect("index.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(S_LogIn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            //response.sendRedirect("index.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(S_LogIn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
   

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
