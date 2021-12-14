/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.SkillDao;
import dao.UserDAO;
import entity.Skill;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "MentorRegister", urlPatterns = {"/MentorRegister"})
public class MentorRegister extends HttpServlet {

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
            SkillDao Sdao = new SkillDao(dc);
            String service = request.getParameter("service");
            if (service == null) {
                List<Skill> listSkill = Sdao.getSkillList();
                request.setAttribute("listSkill", listSkill);
                request.getRequestDispatcher("mentorRegister.jsp").forward(request, response);;
            } else if (service.equals("addRequestMentor")) {
                int userid = Integer.parseInt(request.getParameter("id"));
                String[] skillValue = request.getParameterValues("nameSkill");
                for (String s : skillValue) {
                    Skill skill = ud.nameSkill(Integer.parseInt(s));
                    String intro = request.getParameter("introduce");
                    int status = 0;
                    ud.addRequestMentor(userid, Integer.parseInt(s), intro, status);
                }
                response.sendRedirect("home.jsp");
                return;
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
