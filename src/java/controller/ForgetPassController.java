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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class ForgetPassController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            DBConnect dc = new DBConnect();
            UserDAO ud = new UserDAO(dc);
            String email = request.getParameter("email");
            User u = ud.checkExitsEmail(email);
            String action = request.getParameter("change_pass");
            if (request.getParameter("type") != null) {
                HttpSession session = request.getSession();
                String otp = request.getParameter("otp");
                if (session.getAttribute("otp").equals(otp)) {
                    ud.changePassword((int) session.getAttribute("userId"), request.getParameter("password"));
                    response.sendRedirect("LoginController");
                    return;
                } else {
                    request.setAttribute("mess", "OTP invalid");
                    request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
                }
                return;
            } else {
                if (u != null) {
                    String userfrom = "teach1397@gmail.com";
                    String passfrom = "Kieu@nh1";
                    String code = ud.getRandom2(6);
                    String subject = "Change Your Password";
                    String message = ("Your authentic code to change your password: " + code);
                    UserDAO.send(email, subject, message, userfrom, passfrom);
                    HttpSession session = request.getSession();
                    session.setAttribute("otp", code);
                    session.setAttribute("account", u.getAccount());
                    session.setAttribute("userId", u.getId());
                    session.setMaxInactiveInterval(120);
                    request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    request.setAttribute("mess", session.getAttribute("otp"));
                    request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ForgetPassController.class.getName()).log(Level.SEVERE, null, ex);
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
