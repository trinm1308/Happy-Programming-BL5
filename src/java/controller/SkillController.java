/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.SkillDao;
import entity.Skill;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
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
public class SkillController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("service");

        switch (action) {
            case "showSkill": {
                try {
                    showSkill(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;

            case "adminUpdateSkill": {
                try {
                    adminUpdateSkill(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;

            case "adminCreateSkill":
                request.getRequestDispatcher("adminCreateSkillNew.jsp").forward(request, response);
                break;

            case "showDetail":
                request.getRequestDispatcher("skill-detail.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("service");

        switch (action) {
            case "adminUpdateSkillAfter": {
                try {
                    adminUpdateSkillAfter(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;

            case "addSkill": {
                try {
                    adminCreateSkillAfter(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            return;
            
            case "editSkill": {
                try {
                    editSkill(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            return;

            case "changeStatus": {
                String status = request.getParameter("status");
                String id = request.getParameter("id");
                SkillDao skillDao;
                try {
                    skillDao = new SkillDao(new DBConnect());
                    skillDao.updateStatus(id, status);
                    response.sendRedirect("SkillController?service=showSkill&message=success");
                } catch (SQLException ex) {
                    Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            return;

        }
    }

    // HIỂN THỊ TẤT CẢ CÁC KỸ NĂNG
    public void showSkill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        DBConnect dc = new DBConnect();
        SkillDao d = new SkillDao(dc);
        List<Skill> all = d.getSkillList();
        request.setAttribute("listSkill", all);
        request.setAttribute("skillPopular", d.getSkillHaveManyRequest());
        request.getRequestDispatcher("skill.jsp").forward(request, response);
    }
    
    public void editSkill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        DBConnect dc = new DBConnect();
        SkillDao d = new SkillDao(dc);
        int id = Integer.parseInt(request.getParameter("id"));
        Skill skill  = d.getSkill(id);
        request.setAttribute("fileName", skill.getImage());
        request.setAttribute("skill", skill);
        request.getRequestDispatcher("skill.jsp?service=edit").forward(request, response);
    }

    // TÌM KỸ NĂNG THEO ID VÀ CHUYỂN TỚI TRANG UPDATE ĐỂ CẬP NHẬT
    public void adminUpdateSkill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        DBConnect dc = new DBConnect();
        SkillDao d = new SkillDao(dc);
        int id = Integer.parseInt(request.getParameter("skillID"));
        Skill s = d.getSkill(id);
        request.setAttribute("id", id);
        request.setAttribute("skill", s);
        request.getRequestDispatcher("adminUpdateSkillNew.jsp").forward(request, response);
    }

    // CẬP NHẬT KỸ NĂNG
    public void adminUpdateSkillAfter(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        SkillDao d = new SkillDao(new DBConnect());

        int id = Integer.parseInt(request.getParameter("id"));
        String skillName = request.getParameter("name");
        String status = request.getParameter("status");
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        String category = request.getParameter("category");
        Skill s = new Skill(id, skillName, status, image, 0, description);
        s.setCategory(category);
        d.updateSkill(s);

        response.sendRedirect("SkillController?service=showSkill&message=success");
    }

    // TẠO KỸ NĂNG MỚI
    public void adminCreateSkillAfter(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        DBConnect dc = new DBConnect();
        SkillDao d = new SkillDao(dc);
        List<Skill> allSkill = d.getSkillList();
        Skill s = null;
        String skillName = request.getParameter("name");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String image = request.getParameter("image");
        String category = request.getParameter("category");

        for (Skill o : allSkill) {
            if (skillName.equalsIgnoreCase(o.getName())) {
                s = new Skill(o.getId(), o.getName(), o.getStatus());
                break;
            }
        }

        if (s == null) {
            s = new Skill(0, skillName, status, image, 0, description);
            s.setCategory(category);
            d.createSkill(s);
            response.sendRedirect("SkillController?service=showSkill&message=success");
        } else {
            request.setAttribute("alertMess1", " Tên kỹ năng đã tồn tại");
            request.getRequestDispatcher("skill.jsp?service=addSkill").forward(request, response);
        }
        dc.close();
    }

}
