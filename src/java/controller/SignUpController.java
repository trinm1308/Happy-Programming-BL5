/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HELLO
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/register"})
public class SignUpController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");

            DBConnect dc = new DBConnect();
            UserDAO ud = new UserDAO(dc);
            if (request.getParameter("action") != null) {
                String action = request.getParameter("action");
                if (action.equals("Signup")) {
                    HttpSession session = request.getSession();
                    String addFullName = request.getParameter("fullname");
                    String addAccount = request.getParameter("username");
                    String addEmail = request.getParameter("email");
                    String addPhone = request.getParameter("phone");
                    String addDOB = request.getParameter("birthday");
                    boolean addGender = "Male".equals(request.getParameter("gender"));
                    String addAddress = request.getParameter("address");
                    String addPassword = request.getParameter("password");
                    User user = new User(0, addFullName, addAccount, addPassword, addEmail, addPhone, addGender, addAddress,0 ,"framwork");
                    session.setAttribute("user", user);
                    User existUser = ud.checkExitsEmail(addEmail);
                    if (existUser == null) {
                        ud.registerUser(addFullName, addAccount, addPassword, addEmail, addPhone, (addGender ? 1 : 0), addAddress);
                        String userfrom = "cango-no-reply@hopestorex.com";
                        String passfrom = "qweQWE@123";
                        String code = "http://localhost:8080/LoginController";
                        String subject = "Welcome to Happy Programming";
                        String message = ("Registered successfully. Welcome to Happy Programming: " + code);
                        UserDAO.send(addEmail, subject, message, userfrom, passfrom);
                        response.sendRedirect("/LoginController");
                        return;
                    } else {
                        request.setAttribute("mess", "Email already register!!!");
                        request.getRequestDispatcher("signup.jsp").forward(request, response);
                    }
                }
            }
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
