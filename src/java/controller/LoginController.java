package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import context.DBConnect;
import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GHC
 */
public class LoginController extends HttpServlet {

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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        try{ 
            PrintWriter out = response.getWriter();
            DBConnect dc = new DBConnect();
            UserDAO ud = new UserDAO(dc);
            String acc = request.getParameter("username");
            String password = request.getParameter("password");
            User u = ud.checkUser(acc, password);
            if(u == null){
                HttpSession session =request.getSession();
               request.setAttribute("mess", "Wrong username or password ");
               request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                Cookie usernameC = new Cookie("userC", acc);
                Cookie passwordC = new Cookie("passC", password);
                usernameC.setMaxAge(30);
                if(request.getParameter("remember-me") != null){
                    passwordC.setMaxAge(30);
                }else{
                    passwordC.setMaxAge(0);
                }
                response.addCookie(usernameC);
                response.addCookie(passwordC);
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                response.setContentType("text/html;charset=UTF-8");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
       
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
