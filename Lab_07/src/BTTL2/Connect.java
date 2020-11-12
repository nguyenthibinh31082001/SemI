/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BTTL2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class Connect {
    private static final String HOST = "jdbc:sqlserver://localhost:1433;databaseName=lab_06";

    private static final String USERNAME = "sa";
    private static final String PASSWORD = "123456789";
    public static Connection getConnection() {
        try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(HOST, USERNAME, PASSWORD);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null,ex);
        } catch (SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null,ex);
        }
        return null;
    }
}
