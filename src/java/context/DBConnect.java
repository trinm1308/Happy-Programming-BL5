/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package context;
//class này quản lý các kết nối đến cơ sở dữ liệu

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnect {

    private static String DB_URL = "jdbc:mysql://localhost:3306/happy_programming?allowPublicKeyRetrieval=true&useSSL=false";
    private static String USER_NAME = "root";
    private static String PASSWORD = "12345";
    //class này quản lý các kết nối đến cơ sở dữ liệu
    public Connection con = null;//cho bằng null để tránh ngoại lệ

    public DBConnect() throws SQLException {
        //để kết nối đến cơ sở dữ liệu
        try {
            //get driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
            System.out.println("Connected");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ResultSet getData(String sql) {
        ResultSet rs = null;
        try {

            Statement state = con.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static void main(String[] args) throws SQLException {
        new DBConnect();
    }
}
