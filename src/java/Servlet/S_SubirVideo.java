/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Conexion.Conexion;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.objects.NativeError.getFileName;

/**
 *
 * @author javie
 */
@MultipartConfig
public class S_SubirVideo extends HttpServlet {

    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            InputStream pImageStream = null;
            Part filePart = request.getPart("foto");

            if (filePart != null){
                pImageStream = filePart.getInputStream();
            }
            
            InputStream pVideoStream = null;
            Part filePartVideo = request.getPart("video");

            if (filePartVideo != null){
                pVideoStream = filePartVideo.getInputStream();
            }
            
            String appPath = request.getServletContext().getRealPath("");
            String savePath = "http://localhost:8084/ProyectoPAPW/";
            
            
            String titulo = request.getParameter("titulo");
            String nombreUsuario = request.getParameter("nombreUsuario");
            String idUsuario = request.getParameter("idUsuario");
            String descripcion = request.getParameter("description");
            /*Part file = request.getPart("video");
            String fileName = file.getSubmittedFileName();
            
            Random rand = new Random();
            int  n = rand.nextInt(5000) + 1;
            
            String videoPath = "http://localhost:8084/ProyectoPAPW/" + nombreUsuario + idUsuario + n + fileName ;
            
            File fileSaveDir = new File(savePath);
            
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }
            
            file.write(videoPath);*/
            
            Connection con = null;
            con = Conexion.getConexion();
            PreparedStatement stmt = null;
            
            String query = "insert into video(titulo,path,descripcion,idUsuario,imagen, vistas) values(?,?,?,?,?,?);";
            stmt = con.prepareStatement(query);
            
            stmt.setString(1, titulo);
            stmt.setBlob(2, pVideoStream);
            stmt.setString(3, descripcion);
            stmt.setString(4, idUsuario);
            stmt.setBlob(5, pImageStream);
            stmt.setInt(6,0);
            
            
            stmt.executeUpdate();
     
            
            
            response.sendRedirect("index.jsp");
//            String appPath = request.getServletContext().getRealPath("");
//            File fileSaveDir = new File(appPath + "uploadFiles");
//            if (!fileSaveDir.exists()) {
//                fileSaveDir.mkdir();
//            }
            

            
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
            Logger.getLogger(S_SubirVideo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(S_SubirVideo.class.getName()).log(Level.SEVERE, null, ex);
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
