/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author javie
 */
public class S_LogIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String usuario = request.getParameter("username");
            String pass = request.getParameter("pass");
            
            
            Connection con = Conexion.getConexion();
        PreparedStatement stmt = null;
        
        try {
            String query = "select * from usuario where usuario = ? and contraUsuario = ?";
            stmt = con.prepareStatement(query);
            
            
            stmt.setString(1, usuario);
            stmt.setString(2, pass);
            ResultSet rs = stmt.executeQuery();
            
                      
            if(rs.next()){
                Blob foto = rs.getBlob("avatar");
                byte[] bytesimagen = foto.getBytes(1, (int)foto.length());
            String ba64 = Base64.getEncoder().encodeToString(bytesimagen);
            
                int idUsuario =rs.getInt("idUsuario");
                request.setAttribute("usuario", usuario);
                request.setAttribute("foto", ba64);
                //Mandamos estos atributos a la página bienvenida.jsp
                HttpSession session=request.getSession(false); 
            if (session == null){
               session=request.getSession(); 
            }
            
            session.setAttribute("usuario", usuario);
            session.setAttribute("id", idUsuario);
            session.setAttribute("foto", ba64);
                response.sendRedirect("index.jsp");
                out.println("si existe");
            } else {
                out.println(":c");
            }
            
        
        out.close();
        
                     
        
        } catch (SQLException ex) {
        out.println(ex.toString());
        }  
        
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
