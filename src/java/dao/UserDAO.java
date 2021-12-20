/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import entity.Mentee;
import entity.Mentor;
import entity.Skill;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Tri
 */
public class UserDAO {

    Connection conn = null;

    DBConnect dbConn = null;

    public UserDAO(DBConnect dbconn) {
        conn = dbconn.con;
        this.dbConn = dbconn;
    }

    public ArrayList<User> getUsers() {
        try {
            ArrayList<User> users = new ArrayList<>();

            String sql = "select * from user";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String account = rs.getString("account");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                String ava = rs.getString("ava");
                User u = new User(id, fullName, account, password, email, phone, gender, address, role, ava);

                users.add(u);
            }

            return users;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User showUserProfile(String account) {
        try {
            String sql = "select * from user where account=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, account);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                String ava = rs.getString("ava");
                return new User(id, fullName, account, password, email, phone, gender, address, role, ava);
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void changePassword(int id, String password) {
        try {
            String sql = "update user set password =? where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, password);
            pre.setInt(2, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User checkUser(String account, String password) {
        try {
            String sql = "select * from user where account=? and password =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, account);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                account = rs.getString("account");
                password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                String ava = rs.getString("ava");
                User u = new User(id, fullName, account, password, email, phone, gender, address, role, ava);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserById(int userId) {
        try {
            String sql = "select * from user where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String account = rs.getString("account");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                String ava = rs.getString("ava");
                User u = new User(id, fullName, account, password, email, phone, gender, address, role, ava);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editUser(int id, String fullName, String account, String email, String phone, boolean gender, String address, String ava) {
        try {
            String sql = "update user set full_name = ?, "
                    + "account = ?, "
                    + "email = ?, "
                    + "phone = ?, "
                    + "gender = ?, "
                    + "address = ?, "
                    + "ava = ? "
                    + "where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, fullName);
            pre.setString(2, account);
            pre.setString(3, email);
            pre.setString(4, phone);
            pre.setBoolean(5, gender);
            pre.setString(6, address);
            pre.setString(7, ava);
            pre.setInt(8, id);

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void adminEditUser(int id, String fullName, boolean gender, String email, String phone, int role) {
        try {
            String sql = "update user set full_name = ?, "
                    + "gender = ?, "
                    + "email = ?, "
                    + "phone = ?, "
                    + "role = ? "
                    + "where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, fullName);
            pre.setBoolean(2, gender);
            pre.setString(3, email);
            pre.setString(4, phone);
            pre.setInt(5, role);
            pre.setInt(6, id);

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void adminAddUser(String fullName, String account, String email, String phone, boolean gender, String address, int role) {
        try {
            String sql = "insert into user (full_name, account, email, phone, gender, address, role, password) values (?,?,?,?,?,?,?,?)";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, fullName);
            pre.setString(2, account);
            pre.setString(3, email);
            pre.setString(4, phone);
            pre.setBoolean(5, gender);
            pre.setString(6, address);
            pre.setInt(7, role);
            pre.setString(8, "12345678");

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addUser(String fullName, String account, String email, String phone, boolean gender, String address) {
        try {
            String sql = "insert into user (full_name, account, email, phone, gender, address, role, password) values (?,?,?,?,?,?,?,?)";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, fullName);
            pre.setString(2, account);
            pre.setString(3, email);
            pre.setString(4, phone);
            pre.setBoolean(5, gender);
            pre.setString(6, address);
            pre.setInt(7, 0);
            pre.setString(8, "12345678");

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(int id) {
        try {
            String sql = "delete from user where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User checkExitsEmail(String email) {
        try {
            String sql = "select * from user where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String account = rs.getString("account");
                String password = rs.getString("password");
                String userEmail = rs.getString("email");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                String ava = rs.getString("ava");
                return new User(id, fullName, account, password, email, phone, gender, address, role, ava);
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void registerUser(String fullName, String account, String password, String email, String phone, int gender, String address) {
        try {
            String sql = "insert into user (full_name, email, phone, gender, address, role, account, password) values (?,?,?,?,?,?,?,?)";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, fullName);
            pre.setString(2, email);
            pre.setString(3, phone);
            pre.setInt(4, gender);
            pre.setString(5, address);
            pre.setInt(6, 0);
            pre.setString(7, account);
            pre.setString(8, password);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<User> getMentors() {
        try {
            ArrayList<User> users = new ArrayList<>();

            String sql = "select * from user where role = 0 order by id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String account = rs.getString("account");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                String ava = rs.getString("ava");
                User u = new User(id, fullName, account, password, email, phone, gender, address, role, ava);

                users.add(u);
            }

            return users;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void send(String to, String sub,
            String msg, final String user, final String pass) {
        //Tạo 1 Properties(key-value)
        Properties props = new Properties();

        //Thông số kết nối tới Smtp Server--> đăng nhập email
        props.put("mail.smtp.host", "smtp.gmail.com");
        //below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
         */
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {

            /* Create an instance of MimeMessage, 
 	      it accept MIME types and headers 
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setText(msg);

            /* Transport class is used to deliver the message to the recipients */
            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Skill nameSkill(int IDSkill) {
        try {
            String sql = "select * from skill where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, IDSkill);
            ResultSet rs = ps.executeQuery();
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Skill(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public void updateFramework(String frame, int IdUSer) {
        String sql = "UPDATE user SET framework =? WHERE id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, frame);
            ps.setInt(1, IdUSer);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeRoleforUser(int role, int userid) {
        String sql = "Update user SET role=? WHERE id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, role);
            ps.setInt(2, userid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updatePassUser(String account, String password) {

        try {
            String sql = "Update user SET password=? WHERE account=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, account);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getRandom2(int numberOfCharactor) {
        String alpha = "abcdefghijklmnopqrstuvwxyz"; // a-z
        String alphaUpperCase = alpha.toUpperCase(); // A-Z
        String digits = "0123456789"; // 0-9
        String ALPHA_NUMERIC = alpha + alphaUpperCase + digits;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numberOfCharactor; i++) {
            int number = randomNumber(0, ALPHA_NUMERIC.length() - 1);
            char ch = ALPHA_NUMERIC.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public static int randomNumber(int min, int max) {
        Random rnd = new Random();
        return rnd.nextInt((max - min) + 1) + min;
    }

    public void addRequestMentor(int userid, int sid, String intro, int status) {
        String sql = "insert into request_mentor_skill(userid, skillid, introduce, status) values (?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, sid);
            ps.setString(3, intro);
            ps.setInt(4, status);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Skill> getSkills() {
        try {
            ArrayList<Skill> skills = new ArrayList<>();
            String sql = "select * from skill";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                Skill k = new Skill(id, name, description);

                skills.add(k);
            }
            return skills;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void demoteMentor(int id) {
        try {
            String sql = "update user set role = 1 "
                    + "where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Mentor> getSuggestMentor(int sid) {
        try {
            ArrayList<Mentor> mentors = new ArrayList();
            String sql = "select user.id, user.full_name, "
                    + "user.phone, user.email, skill.name, "
                    + "user.gender, rating.rate, request_mentor_skill.skillid "
                    + "from user inner join rating on user.id = "
                    + "rating.mentor_id inner join request_mentor_skill "
                    + "on user.id = request_mentor_skill.userid inner join "
                    + "skill on request_mentor_skill.skillid = skill.id where "
                    + "request_mentor_skill.status = 1 and "
                    + "request_mentor_skill.skillid = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("full_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String skillName = rs.getString("name");
                String gender = rs.getInt("gender") == 0 ? "male" : "Female";
                int rate = rs.getInt("rate");
                Mentor m = new Mentor(id, name, phone, email, skillName, gender, rate);
                mentors.add(m);
            }
            return mentors;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Mentor> getAllMentor() {
        try {
            ArrayList<Mentor> mentors = new ArrayList();
            String sql = "select user.id, user.full_name, "
                    + "user.phone, user.email, skill.name, "
                    + "user.gender, rating.rate, request_mentor_skill.skillid "
                    + "from user inner join rating on user.id = "
                    + "rating.mentor_id inner join request_mentor_skill "
                    + "on user.id = request_mentor_skill.userid inner join "
                    + "skill on request_mentor_skill.skillid = skill.id where "
                    + "request_mentor_skill.status = 1;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("full_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String skillName = rs.getString("name");
                String gender = rs.getInt("gender") == 0 ? "male" : "Female";
                int rate = rs.getInt("rate");
                Mentor m = new Mentor(id, name, phone, email, skillName, gender, rate);
                mentors.add(m);
            }
            return mentors;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Mentee> getAllMentee() {
        ArrayList<Mentee> menteeList = new ArrayList();
        try {
            String sql = "select A.id, A.full_name, A.account, A.ava, count(B.id) as total_request\n"
                    + " from user A left join request B\n"
                    + "on A.id = B.mentee_id\n"
                    + "where A.role = 1\n"
                    + "group by A.id\n"
                    + "order by A.full_name";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Mentee mentee = new Mentee();
                mentee.setId(rs.getInt("id"));
                mentee.setName(rs.getString("full_name"));
                mentee.setAccountName(rs.getString("account"));
                mentee.setTotalHours(rs.getInt("total_request"));
                mentee.setAvatar(rs.getString("ava"));
                menteeList.add(mentee);
            }
            return menteeList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return menteeList;
    }

    public Integer getTotalMentee() {
        try {
            String sql = "select count(*) as total from user where role=1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public Integer getTotalRequest() {
        try {
            String sql = "select count(*) as total from request";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public Integer getTotalHour() {
        try {
            String sql = "select sum(hours) as total from request";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public Integer getTotalSkill() {
        try {
            String sql = "select count(*) as total from skill";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
        }

        return 0;
    }
}
