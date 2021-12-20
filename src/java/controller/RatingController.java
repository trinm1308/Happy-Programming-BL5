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
@WebServlet(name = "RatingController", urlPatterns = {"/RatingController"})
public class RatingController extends HttpServlet {

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
            if (request.getParameter("mentorId") == null) {
                request.getRequestDispatcher("forbidden.jsp").forward(request, response);
            }

            DBConnect dBConnect = new DBConnect();
            UserDAO ud = new UserDAO(dBConnect);
            RatingDAO rd = new RatingDAO(dBConnect);
            RequestDao rqd = new RequestDao(dBConnect);

            int mentorId = Integer.parseInt(request.getParameter("mentorId"));

            int[] mentorRequestCounts = rqd.getMentorRequestCounts(mentorId);
            request.setAttribute("requests", mentorRequestCounts);

            User user = new User();
            boolean hasPermisson = false;

            if (request.getSession().getAttribute("user") != null) {
                user = (User) request.getSession().getAttribute("user");
                if (user.getRole() == 1) {
                    hasPermisson = true;
                }
                request.setAttribute("user", user);
            }
            request.setAttribute("hasPermission", hasPermisson);

            //Check if current user has rated this mentor
            boolean hasRated = false;
            ArrayList<Rating> ratings = rd.getRatingOfMentor(mentorId);
            request.setAttribute("ratings", ratings);
            if (hasPermisson) {
                for (Rating r : ratings) {
                    if (r.getMenteeId() == user.getId()) {
                        hasRated = true;
                        request.setAttribute("currentUserRating", r);
                    }
                }
            }
            request.setAttribute("hasRated", hasRated);

            int averageStars = rd.getAverageRating(mentorId);

            request.setAttribute("averageStars", averageStars);

            User mentor = ud.getUserById(mentorId);
            request.setAttribute("mentor", mentor);

            request.getRequestDispatcher("mentor_ratings.jsp").forward(request, response);
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
        try {
            response.setContentType("text/html;charset=UTF-8");
            if (request.getParameter("mentorId") == null) {
                request.getRequestDispatcher("forbidden.jsp").forward(request, response);
            }

            DBConnect dBConnect = new DBConnect();
            UserDAO ud = new UserDAO(dBConnect);

            int mentorId = Integer.parseInt(request.getParameter("mentorId"));

            User mentor = ud.getUserById(mentorId);
            request.setAttribute("mentor", mentor);

            RatingDAO rd = new RatingDAO(dBConnect);

            User user = new User();
            boolean hasPermisson = false;

            if (request.getSession().getAttribute("user") != null) {
                user = (User) request.getSession().getAttribute("user");
                if (user.getRole() == 1) {
                    hasPermisson = true;
                }
                request.setAttribute("user", user);
            }
            request.setAttribute("hasPermission", hasPermisson);

            //Check if current user has rated this mentor
            boolean hasRated = false;
            ArrayList<Rating> ratings = rd.getRatingOfMentor(mentorId);
            request.setAttribute("ratings", ratings);
            Rating currentUserRating = new Rating();
            if (hasPermisson) {
                for (Rating r : ratings) {
                    if (r.getMenteeId() == user.getId()) {
                        hasRated = true;
                        currentUserRating = r;
                        request.setAttribute("currentUserRating", r);
                    }
                }
            }
            request.setAttribute("hasRated", hasRated);

            int averageStars = rd.getAverageRating(mentorId);

            request.setAttribute("averageStars", averageStars);

            switch (request.getParameter("action")) {
                case "add":
                    String rating = request.getParameter("rating");
                    String comment = request.getParameter("comment");
                    rd.addRating(user.getId(), mentorId, Integer.parseInt(rating), comment);
                    break;
                case "edit":
                    if (!hasRated || !hasPermisson) {
                        break;
                    }
                    int editId = currentUserRating.getId();
                    int editRate = Integer.parseInt(request.getParameter("rating"));
                    String editComment = request.getParameter("yourComment");
                    System.out.println(editComment);
                    rd.updateRating(editId, editRate, editComment);
                    break;
                case "delete":
                    if (!hasRated || !hasPermisson) {
                        break;
                    }
                    rd.deleteRating(currentUserRating.getId());
                    break;
                default:
                    break;
            }

            response.sendRedirect("RatingController?mentorId=" + mentorId);
        } catch (SQLException ex) {
            Logger.getLogger(RatingController.class.getName()).log(Level.SEVERE, null, ex);
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
