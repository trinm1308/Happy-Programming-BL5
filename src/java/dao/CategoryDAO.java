package dao;

import context.DBConnect;
import entity.Category;
import entity.Skill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CategoryDAO {
    PreparedStatement ps;
    ResultSet rs;

    private Connection con;

    private DBConnect dbConn = null;

    public CategoryDAO(DBConnect dbconn) {
        con = dbconn.con;
        this.dbConn = dbconn;
    }
    
    public ArrayList<Category> getList() {

        ArrayList<Category> list = new ArrayList<>();
        String query = "select * from category";

        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Category s = new Category();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                list.add(s);
            }

            try {
                ps.close();
            } catch (SQLException e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
