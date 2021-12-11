/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dao Van Do
 */
public class HomePageDAO {

    public List<String> getAllSkill() throws SQLException {
        List<String> listSkill = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        Connection conn = bConnect.con;
        String sql = "select * from news";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            listSkill.add(rs.getString("url"));
        }
        return listSkill;
    }

}
