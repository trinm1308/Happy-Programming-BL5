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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setContentType("text/html;charset=UTF-8");

            DBConnect dc = new DBConnect();
            UserDAO ud = new UserDAO(dc);

            ArrayList<User> users = ud.getUsers();

            request.setAttribute("users", users);
            request.getRequestDispatcher("user_management.jsp").forward(request, response);
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
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setContentType("text/html;charset=UTF-8");

            DBConnect dc = new DBConnect();
            UserDAO ud = new UserDAO(dc);

            if (request.getParameter("action") != null) {
                String action = request.getParameter("action");
                switch (action) {
                    case "getProfile":
                        String account = request.getParameter("user");
                        User u = ud.showUserProfile(account);
                        HttpSession session = request.getSession();
                        session.setAttribute("u", u);
                        response.sendRedirect("profile.jsp");
                    default:
                        break;
                }
            }

            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setContentType("text/html;charset=UTF-8");

            DBConnect dc = new DBConnect();
            UserDAO ud = new UserDAO(dc);

            if (request.getParameter("action") != null) {
                String action = request.getParameter("action");
                switch (action) {
                    case "updateProfile":
                        HttpSession session = request.getSession();
                        User user = (User) session.getAttribute("user");
                        //id = Integer.parseInt(request.getParameter("ID"));
                        String fullName = request.getParameter("name");
                        //account = request.getParameter("Username");
                        String email = user.getEmail();
                        String phone = request.getParameter("phone");
                        String avatar = request.getParameter("avatar");
                        System.out.println(request.getParameter("Gender"));
                        boolean gender = "0".equals(request.getParameter("gender"));
                        System.out.println(gender);
                        String address = request.getParameter("address");

                        ud.editUser(user.getId(), fullName, user.getAccount(), email, phone, gender, address, avatar);
                        User newUser = ud.getUserById(user.getId());
                        session.setAttribute("user", newUser);
                        request.setAttribute("result", "success");

                        response.sendRedirect("profile.jsp?action=success");
                        return;
                    default:
                        break;
                }
            }

            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
