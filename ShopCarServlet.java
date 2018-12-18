/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java.servlet;

import java.frist.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.C3P0Util;

@WebServlet(name = "ShopCarServlet", urlPatterns = {"/ShopCarServlet"})
public class ShopCarServlet extends HttpServlet {

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
        try {
            
            
            request.setCharacterEncoding("utf8");
            response.setContentType("text/html;charset=UTF-8");
//            System.out.println("servlet.BuyServlet.processRequest()111111111111111111111111111");

//        System.out.println("1111111111111111111"+s);
            if(User.username==null){
               response.sendRedirect("buy/yanzheng.jsp");
               return;
            }    
            
        
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Connection conn = C3P0Util.getConnection();
            PreparedStatement ps = conn.prepareStatement("insert into shopcar values(null,?,?,?,?);");
            ps.setString(1, User.username);
            ps.setString(2, (String) request.getSession().getAttribute("monry"));
            ps.setString(3, (String) request.getSession().getAttribute("bookName"));
//            ps.setString(4, "");
            ps.setString(4, df.format(new Date()));

            ps.executeUpdate();

//            request.getRequestDispatcher("").forward(request, response);
            response.sendRedirect("buy/shopcar.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(ShopCarServlet.class.getName()).log(Level.SEVERE, null, ex);
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
