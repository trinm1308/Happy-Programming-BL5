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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tri
 */
@WebServlet(name = "AdminMentorListController", urlPatterns = {"/AdminMentorList"})
public class AdminMentorListController extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setContentType("text/html;charset=UTF-8");

            DBConnect dc = new DBConnect();
            UserDAO ud = new UserDAO(dc);

            ArrayList<User> users = ud.getMentors();

            request.setAttribute("users", users);
            request.getRequestDispatcher("admin_mentor_list.jsp").forward(request, response);
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
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setContentType("text/html;charset=UTF-8");

            DBConnect dc = new DBConnect();
            UserDAO ud = new UserDAO(dc);

            if (request.getParameter("action") != null) {
                String action = request.getParameter("action");
                switch (action) {
                    case "add":
                        String addFullName = request.getParameter("FullName");
                        String addAccount = request.getParameter("Username");
                        String addEmail = request.getParameter("Email");
                        String addPhone = request.getParameter("Phone");
                        boolean addGender = "Male".equals(request.getParameter("Gender"));
                        String addAddress = request.getParameter("Address");

                        ud.addUser(addFullName, addAccount, addEmail, addPhone, addGender, addAddress);
                        break;
                    case "edit":
                        int id = Integer.parseInt(request.getParameter("ID"));
                        String fullName = request.getParameter("FullName");
                        String account = request.getParameter("Username");
                        String email = request.getParameter("Email");
                        String phone = request.getParameter("Phone");
                        System.out.println(request.getParameter("Gender"));
                        boolean gender = "Male".equals(request.getParameter("Gender"));
                        System.out.println(gender);
                        String address = request.getParameter("Address");

                        ud.editUser(id, fullName, account, email, phone, gender, address, "a");
                        break;

                    case "demote":
                        String[] ids = request.getParameterValues("selectedIds");
                        for (String s : ids) {
                            ud.demoteMentor(Integer.parseInt(s));
                        }
                        break;

                    default:
                        break;
                }
            }

            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AdminMentorListController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
