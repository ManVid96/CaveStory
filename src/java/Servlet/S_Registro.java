/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Conexion.Conexion;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

/**
 *
 * @author javie
 */
@MultipartConfig
@WebServlet(name = "S_Registro", urlPatterns = {"/S_Registro"})
public class S_Registro extends HttpServlet {

    
    
    Connection con = null;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        byte gender2 = 0;
        String usuario = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String fecha = request.getParameter("date");
        String gender = request.getParameter("gender");
        if("Hombre".equals(gender)){
            gender2 = 1;
        } else {
            gender2 = 0;
        }
        
        
        InputStream pImageStream = null;
            Part filePart = request.getPart("file");

            if (filePart != null){
                pImageStream = filePart.getInputStream();
            }
        

        con = Conexion.getConexion();
        PreparedStatement stmt = null;
        
        try {
            String query = "insert into usuario(usuario,contraUsuario,correoUsuario,avatar, fechaNacimiento, genero) values(?,?,?,?,?,?);";
            stmt = con.prepareStatement(query);
            
            
            stmt.setString(1, usuario);
            stmt.setString(2, pass);
            stmt.setString(3, email);
            stmt.setBlob(4, pImageStream);
            stmt.setString(5, fecha);
            stmt.setByte(6, gender2);
            
            stmt.executeUpdate();
        
        out.close();
        response.sendRedirect("index.jsp");
        
        } catch (SQLException ex) {
        out.println(ex.toString());
        
        out.println(gender + "\n");
        }  
        

        
              
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {  
            processRequest(req, resp);
            HttpSession session=req.getSession(false); 
            if (session == null){
               session=req.getSession(); 
            }
            
            String usuariotl = req.getParameter("username");
            session.setAttribute("UserName", usuariotl); 
            
            InputStream pImageStream = null;
            Part filePart = req.getPart("file");

            if (filePart != null){
                pImageStream = filePart.getInputStream();
            }
            
                       
            Blob foto = (Blob) pImageStream;
            byte[] bytesimagen = foto.getBytes(1, (int)foto.length());
            String ba64 = Base64.getEncoder().encodeToString(bytesimagen);
            
            session.setAttribute("foto", ba64); 
            //resp.sendRedirect("index.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(S_Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
            HttpSession session=req.getSession(false); 
            if (session == null){
               session=req.getSession(); 
            }
            String usuariotl = req.getParameter("username");
            session.setAttribute("usuario", usuariotl);
            
            InputStream pImageStream = null;
            Part filePart = req.getPart("file");

            if (filePart != null){
                pImageStream = filePart.getInputStream();
            }
            
                       
            Blob foto = (Blob) pImageStream;
            byte[] bytesimagen = foto.getBytes(1, (int)foto.length());
            String ba64 = Base64.getEncoder().encodeToString(bytesimagen);
            
            session.setAttribute("foto", ba64); 
            
            //resp.sendRedirect("index.jsp");
        } catch (ServletException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(S_Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    

}
