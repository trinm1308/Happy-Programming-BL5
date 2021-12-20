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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utility.HashPassword;

/**
 *
 * @author HELLO
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpController"})
public class SignUpController extends HttpServlet {

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
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

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
                    boolean addGender = "Male".equals(request.getParameter("gender"));
                    String addAddress = request.getParameter("address");
                    String addPassword = request.getParameter("password");
                    String passHash = HashPassword.sha256(addPassword);
                    User user = new User(0, addFullName, addAccount, passHash, addEmail, addPhone, addGender, addAddress,0 ,"framwork");
                    session.setAttribute("user", user);
                    User existUser = ud.checkExitsEmail(addEmail);
                    if (existUser == null) {
                        ud.registerUser(addFullName, addAccount, passHash, addEmail, addPhone, (addGender ? 1 : 0), addAddress);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Register success!');");
                        out.println("</script>");
                        response.sendRedirect("login.jsp");
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
