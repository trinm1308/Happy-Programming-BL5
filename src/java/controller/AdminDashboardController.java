/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.RequestDao;
import dao.SkillDao;
import dao.UserDAO;
import entity.Request;
import entity.Skill;
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
@WebServlet(name = "AdminDashboardController", urlPatterns = {"/AdminDashboardController"})
public class AdminDashboardController extends HttpServlet {

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
            DBConnect dBConnect = new DBConnect();
            UserDAO ud = new UserDAO(dBConnect);
            RequestDao rd = new RequestDao(dBConnect);
            SkillDao sd = new SkillDao(dBConnect);

            ArrayList<User> mentors = ud.getMentors();

            int[] requestCounts = rd.getRequestCounts();
            ArrayList<Request> requests = rd.getRecentRequests(20);

            ArrayList<Skill> skills = sd.getSkillList();

            request.setAttribute("skills", skills.size() >= 6 ? skills.subList(0, 6) : skills);
            request.setAttribute("requestCounts", requestCounts);
            request.setAttribute("requests", requests);
            request.setAttribute("newMentors", mentors.size() >= 6 ? mentors.subList(0, 6) : mentors);

            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RatingController.class.getName()).log(Level.SEVERE, null, ex);
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
