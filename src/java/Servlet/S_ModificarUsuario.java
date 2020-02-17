/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Conexion.Conexion;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;

/**
 *
 * @author javie
 */
public class S_ModificarUsuario extends HttpServlet {

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
            String usuario = request.getParameter("usuario");
            String correo = request.getParameter("email");
            String contra = request.getParameter("contra");
            
            PreparedStatement stmtPopu = null;
            String queryPopu = "update usuario set correoUsuario = ?, contraUsuario = ? where usuario = ?";
            stmtPopu = con.prepareStatement(queryPopu);
            stmtPopu.setString(1, correo);
            stmtPopu.setString(2, contra);
            stmtPopu.setString(3, usuario);
            stmtPopu.execute();

            
            response.sendRedirect("index.jsp");
            
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            //response.sendRedirect("index.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(S_ModificarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            //response.sendRedirect("index.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(S_ModificarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
   

   
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

