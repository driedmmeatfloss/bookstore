/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

//import com.java.link.Link;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.C3P0Util;
//import zbiao.demo;
//import zbiao.mypeople;


@WebServlet(name = "XXCXServlet", urlPatterns = {"/XXCXServlet"})
public class XXCXServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out= response.getWriter();
        
        System.out.println("sadasda11111111111111111111111111111");
        
        try {
            List username = new ArrayList();
            List password = new ArrayList();
            List nickname = new ArrayList();
            List gander = new ArrayList();
            Connection conn = C3P0Util.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from user");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
//                demo d = new demo();
//                d.setUsername(rs.getString(1));
//                d.setPassword(rs.getString(2));
//                d.setNickname(rs.getString(3));
//                d.setGender(rs.getString(4));
                
//                out.println(d.toString());
//                out.println("<br><br>");
//                
                
                username.add(rs.getString(1));
                password.add(rs.getString(2));
                nickname.add(rs.getString(3));
                gander.add(rs.getString(4));
            }
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("nickname", nickname);
            request.setAttribute("gander", gander);
            
            request.getRequestDispatcher("GLY/XXCXquest.jsp").forward(request, response);
            
        } catch (Exception ex) {
            Logger.getLogger(XXCXServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
