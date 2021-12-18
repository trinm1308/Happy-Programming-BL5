/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.MentorDAO;
import entity.MentorEntity;
import entity.Point;
import entity.Rating;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dao Van Do
 */
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
        response.setContentType("text/html;charset=UTF-8");

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
            MentorDAO mentorDAO = new MentorDAO();
            int mentorId = Integer.parseInt(request.getParameter("mentorID"));
            int point = Integer.parseInt(request.getParameter("point"));
            List<Rating> ratings = mentorDAO.getRatingsByPoint(mentorId, point);
            MentorEntity mentorEntity = mentorDAO.getMentorByID(mentorId);
            request.setAttribute("mentor", mentorEntity);
            request.setAttribute("ratings", ratings);
            request.getRequestDispatcher("mentordetail.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RatingController.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
        int mentorId = Integer.parseInt(request.getParameter("mentorID"));
        String point = request.getParameter("point");
        String content = request.getParameter("content");

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String author = "GUES";
        if (u != null) {
            author = u.getFullName();
        }

        MentorDAO mentorDAO = new MentorDAO();
        try {
            Point p = mentorDAO.getRateByMentorID(mentorId);
            p.setRateCount(p.getRateCount() + 1);
            mentorDAO.rate(mentorId, Integer.parseInt(point), content, author);
            List<Rating> ratings = mentorDAO.ratings(mentorId);
            int rate = 0;
            for (Rating i : ratings) {
                rate += i.getPoint();
            }
            if (ratings.size() > 0) {
                rate = rate / ratings.size();
                p.setRate(rate);
            } else {
                p.setRate(Integer.parseInt(point));
            }
            mentorDAO.updateRateMentor(mentorId, p.getRate(), p.getRateCount());
            MentorEntity mentorEntity = mentorDAO.getMentorByID(mentorId);

            request.setAttribute("mentor", mentorEntity);
            request.setAttribute("ratings", ratings);
            request.getRequestDispatcher("mentordetail.jsp").forward(request, response);

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
