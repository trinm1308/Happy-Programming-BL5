package controller;

import context.DBConnect;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MenteeRequestStatistics extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            
            DBConnect dc = new DBConnect();
            UserDAO ud = new UserDAO(dc);
            String service = request.getParameter("service");
            if("showAll".equals(service)) {
                request.setAttribute("menteeList", ud.getAllMentee());
                request.getRequestDispatcher("mentee-statistic.jsp").forward(request, response);
            }
        } catch(Exception ex) {
            Logger.getLogger(MentorRequestStatistics.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
