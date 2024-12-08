/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cv.generator;

/**
 *
 * @author Hyrex
 */

//import java.sql.*;
//import javax.swing.*;
//public class db {
//
//
//
//    Connection conn=null;
//    public static Connection java_db(){
//
//        try{
//            Class.forName("org.sqlite.JDBC");
//            Connection conn =DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Rog Z\\Downloads\\CV-Builder (1)\\CV Generator\\cvdatabase.sqlite");
//            //JOptionPane.showMessageDialog(null, "Connection to database is successful");
//
//            return conn;
//
//
//        }catch (Exception e){
//            JOptionPane.showMessageDialog(null, e);
//            return null;
//        }
//
//    }
//}


import java.sql.*;
import javax.swing.*;

public class db {
    Connection conn = null;

    public static Connection java_db() {
        try {
            // Nạp driver cho SQL Server
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Chuỗi kết nối đến cơ sở dữ liệu SQL Server
            String url = "jdbc:sqlserver://localhost:1422;databaseName=CVs";
            String username = "sa";
            String password = "nnh2411";

            // Tạo kết nối
            Connection conn = DriverManager.getConnection(url, username, password);

            // Hiển thị thông báo kết nối thành công
            // JOptionPane.showMessageDialog(null, "Connection to database is successful");

            return conn;

        } catch (Exception e) {
            // Hiển thị thông báo lỗi nếu có lỗi xảy ra
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
    }
}


