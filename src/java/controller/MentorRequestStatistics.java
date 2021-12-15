/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.RatingDAO;
import dao.RequestDao;
import dao.UserDAO;
import entity.Rating;
import entity.Request;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tri
 */
public class MentorRequestStatistics extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        DBConnect dBConnect = new DBConnect();
        UserDAO ud = new UserDAO(dBConnect);
        RatingDAO rd = new RatingDAO(dBConnect);
        RequestDao rqd = new RequestDao(dBConnect);

        User u = (User) request.getSession().getAttribute("user");
        User mentor = ud.getUserById(u.getId());
        request.setAttribute("mentor", mentor);

        int[] mentorRequestCounts = rqd.getMentorRequestCounts(mentor.getId());
        request.setAttribute("requests", mentorRequestCounts);

        int limit = 10;

        int pendingPage = request.getParameter("pendingPage") != null
                ? Integer.parseInt(request.getParameter("pendingPage"))
                : 1;
        int pendingOffset = pendingPage == 1
                ? 0
                : (pendingPage - 1) * limit;

        int pendingCount = rqd.getCountOfStatus(mentor.getId(), -1);
        request.setAttribute("pendingPage", pendingPage);
        request.setAttribute("pendingPages", pendingCount % limit == 0 ? pendingCount / limit : pendingCount / limit + 1);

        ArrayList<Request> pendingRequests = rqd.getPaginatedRequestsByMentorId(mentor.getId(), limit, pendingOffset);
        request.setAttribute("pendingRequests", pendingRequests);

        ArrayList<Rating> ratings = rd.getRatingOfMentor(mentor.getId());
        int averageStars = rd.getAverageRating(mentor.getId());

        request.setAttribute("averageStars", averageStars);
        request.setAttribute("ratings", ratings);

        request.getRequestDispatcher("mentor_request_statistics.jsp").forward(request, response);
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MentorRequestStatistics.class.getName()).log(Level.SEVERE, null, ex);
        }
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MentorRequestStatistics.class.getName()).log(Level.SEVERE, null, ex);
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
