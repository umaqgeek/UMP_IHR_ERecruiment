/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author End User
 */
public class DBConn {
    private static String host = "60.54.8.71";
    private static int netTime = 2000;
    private static String user = "cmsadmin";
    private static String pass = "7";
    private static String database = "UMPDB";
    private static String dbUrl = "jdbc:oracle:thin:@" + getHost() + ":80/" + getDatabase();
    private static int port_rmi = 1099;

    public static String getHost() {
        return host;
    }

    public static int getNetTime() {
        return netTime;
    }

    public static String getUser() {
        return user;
    }

    public static String getDatabase() {
        return database;
    }

    public static int getPort_rmi() {
        return port_rmi;
    }

    public static void setHost(String aHost) {
        host = aHost;
    }

    public static void setPort_rmi(int aPort_rmi) {
        port_rmi = aPort_rmi;
    }
    
    public static Connection getConn() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            return DriverManager.getConnection(dbUrl, getUser(), pass);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
