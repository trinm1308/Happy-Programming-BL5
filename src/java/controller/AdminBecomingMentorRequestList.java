/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.RequestMentorSkillDAO;
import entity.RequestMentorSkill;
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
@WebServlet(name = "AdminBecomingMentorRequestList", urlPatterns = {"/AdminBecomingMentorRequestList"})
public class AdminBecomingMentorRequestList extends HttpServlet {

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
        DBConnect db = new DBConnect();
        RequestMentorSkillDAO rmsd = new RequestMentorSkillDAO(db);

        int limit = 10;

        int pendingPage = request.getParameter("pendingPage") != null
                ? Integer.parseInt(request.getParameter("pendingPage"))
                : 1;
        int pendingOffset = pendingPage == 1
                ? 0
                : (pendingPage - 1) * limit;

        int historyPage = request.getParameter("historyPage") != null
                ? Integer.parseInt(request.getParameter("historyPage"))
                : 1;
        int historyOffset = historyPage == 1
                ? 0
                : (historyPage - 1) * limit;

        ArrayList<RequestMentorSkill> rms = rmsd.getPaginatedPending(limit, pendingOffset);
        ArrayList<RequestMentorSkill> rmsHistory = rmsd.getPaginatedHistory(limit, historyOffset);

        int pendingCount = rmsd.getCountOfStatus(0);
        int acceptedCount = rmsd.getCountOfStatus(1);
        int rejectedCount = rmsd.getCountOfStatus(2);

        request.setAttribute("rms", rms);
        request.setAttribute("pendingPage", pendingPage);
        request.setAttribute("pendingPages", pendingCount % limit == 0 ? pendingCount / limit : pendingCount / limit + 1);
        request.setAttribute("historyPage", historyPage);
        request.setAttribute("historyPages", (acceptedCount + rejectedCount) % limit == 0 ? (acceptedCount + rejectedCount) / limit :(acceptedCount + rejectedCount) / limit + 1);
        request.setAttribute("rmsHistory", rmsHistory);
        request.getRequestDispatcher("admin_becoming_mentor_request_list.jsp").forward(request, response);
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
            Logger.getLogger(AdminBecomingMentorRequestList.class.getName()).log(Level.SEVERE, null, ex);
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
            DBConnect db = new DBConnect();
            RequestMentorSkillDAO rmsd = new RequestMentorSkillDAO(db);

            String action = request.getParameter("action") != null
                    ? request.getParameter("action")
                    : "";

            switch (action) {
                case "accept":
                    rmsd.acceptRequest(
                            Integer.parseInt(request.getParameter("requestId")),
                            Integer.parseInt(request.getParameter("userId"))
                    );
                    break;
                case "reject":
                    rmsd.rejectRequest(Integer.parseInt(request.getParameter("requestId")));
                    break;
                case "revert":
                    rmsd.revertRequest(
                            Integer.parseInt(request.getParameter("requestId")),
                            Integer.parseInt(request.getParameter("userId")),
                            Integer.parseInt(request.getParameter("status"))
                    );
                    break;
                default:
                    break;
            }

            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AdminBecomingMentorRequestList.class.getName()).log(Level.SEVERE, null, ex);
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
