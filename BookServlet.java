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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.user.Buybook;
import java.util.C3P0Util;

@WebServlet(name = "BookServlet", urlPatterns = {"/BookServlet"})
public class BookServlet extends HttpServlet {

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
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=UTF-8");
            String bookName = request.getParameter("sid");

            Connection conn = C3P0Util.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from book where bookname=?;");
            ps.setString(1, bookName);
            ResultSet rs = ps.executeQuery();
            HttpSession session = request.getSession();
            while (rs.next()) {
                session.setAttribute("bookName", rs.getString(2));
                session.setAttribute("monry", rs.getString(3));
                session.setAttribute("leixing", rs.getString(4));
//                Buybook b  = new Buybook();
//                HttpSession session = request.getSession();

//                System.out.println("1111111111111111111" + User.username);

                System.out.println("servlet.BookServlet.processRequest()");

                if (bookName.equals("0987")) {
                    request.getRequestDispatcher("/bookInformation.jsp").forward(request, response);
                } else if (bookName.equals("1234")) {
                    request.getRequestDispatcher("/bookInformation_1.jsp").forward(request, response);
                } else if (bookName.equals("5678")) {
                    request.getRequestDispatcher("/bookInformation_2.jsp").forward(request, response);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookServlet.class.getName()).log(Level.SEVERE, null, ex);

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
