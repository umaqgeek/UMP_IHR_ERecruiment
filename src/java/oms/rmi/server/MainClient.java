/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.rmi.server;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.DBConn;
import models.RMIConn;
import oms.rmi.server.Message;

/**
 *
 * @author umarmukhtar
 */
public class MainClient {
    
    private String host = DBConn.getHost();
    
    /**
     * Call this constructor to start the RMI connection.<br />
     * Example:-<br /><br />
     * MainClient mc = new MainClient(SERVER_IP_ADDRESS);<br /><br />
     * or<br /><br />
     * MainClient mc = new MainClient("175.141.171.197");<br /><br />
     * @param host The IP Address of RMI server.<br />
     */
    public MainClient(String host) {
        this.host = host;
        DBConn.setHost(host);
        RMIConn rmic = new RMIConn();
        rmic.startRMI(host, DBConn.getPort_rmi());
    }
    
    /**
     * Private method to send message to the RMI Server.
     * @param msg 
     */
    private void sendMessage(String msg) {
        RMIConn rmic = new RMIConn();
        try {
            if (rmic.getImpl() == null) {
                new MainClient(this.host);
            }
            rmic.getImpl().sendMessageUMP(msg);
        } catch (RemoteException ex) {
            System.out.println("Error:"+ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public String add(String table, String data[][], String primaryKey) {
        String out = "-1";
        try {
            if (data.length > 0) {
                String query = "INSERT INTO "+table+"(";
                for (int i = 0; i < data.length-1; i++) {
                    query += data[i][0] + ",";
                }
                query += data[data.length-1][0] + ") VALUES(";
                for (int i = 0; i < data.length-1; i++) {
                    query += "?,";
                }
                query += "?)";
                String params[] = new String[data.length];
                for (int i = 0; i < data.length; i++) {
                    params[i] = data[i][1];
                }
                out = setQuery(query, params, primaryKey);
            } else {
                out = "-1";
            }
        } catch (Exception e) {
            out = "-1";
        }
        return out;
    }
    
    public String update(String table, String data[][], String primaryKey[][]) {
        String out = "-1";
        try {
            if (data.length > 0) {
                String query = "UPDATE "+table+" SET ";
                for (int i = 0; i < data.length-1; i++) {
                    query += data[i][0] + "=?,";
                }
                query += data[data.length-1][0] + "=? WHERE ";
                query += primaryKey[0][0] + "=?";
                for (int i = 1; i < primaryKey.length; i++) {
                    query += " AND " + primaryKey[i][0] + "=?";
                }
                int length = data.length + primaryKey.length;
                String params[] = new String[length];
                int index = 0;
                for (int i = 0; i < data.length; i++) {
                    params[i] = data[i][1];
                    index = i;
                }
                for (int i = index+1, j = 0; i < length && j < primaryKey.length; i++) {
                    params[i] = primaryKey[j][1];
                    j++;
                }
                
                out = setQuery(query, params);
            } else {
                out = "-1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            out = "-1";
        }
        return out;
    }
    
    /**
     * Use this method to send SQL query that does not return a table data values, such as:-<br />
     * 1. INSERT statement.<br />
     * 2. UPDATE statement.<br />
     * 3. DELETE FROM statement.<br />
     * 4. TRUNCATE statement.<br />
     * 5. CREATE TABLE/PROCEDURE/TRIGGER statement<br />
     * 6. DROP TABLE/COLUMN/PROCEDURE/TRIGGER statement<br />
     * 7. ... and so on.<br /><br />
     * @param query Pass your sql query here. <br /><br />
     * Example: INSERT INTO tableA(colA, colB) VALUES('data1', 'data2')<br /><br />
     * @param data Pass your data here.<br />
     * If you have two passing parameters (two question mark) on your query like this:-<br /><br />
     * String query = "INSERT INTO tableA(colA, colB) VALUES(?, ?)";<br /><br />
     * Then you need to pass two data as follows:-<br /><br />
     * String data[] = new String[2];<br />
     * data[0] = "data1";<br />
     * data[1] = "data2";<br />
     * boolean status = mc.setQuery(query, data);<br /><br />
     * If you don't have any passing parameters, just sent a nullify array like this:-<br /><br />
     * String data[] = {};<br />
     * boolean status = mc.setQuery(query, data);<br /><br />
     * @return String value<br />
     * Zero or Positive number: If sql execution was success.<br />
     * Negative number: If sql execution was failed and has error.<br />
     */
    public String setQuery(String query, String data[]) {
        String key = "0";
        RMIConn rmic = new RMIConn();
        try {
            if (rmic.getImpl() == null) {
                new MainClient(this.host);
            }
            key = rmic.getImpl().setQueryUMP(query, data);
        } catch (Exception e) {
            System.out.println("Error:"+e.getMessage());
            e.printStackTrace();
        }
        return key;
    }
    
    /**
     * Use this method to send SQL query that does not return a table data values, such as:-<br />
     * 1. INSERT statement.<br />
     * 2. UPDATE statement.<br />
     * 3. DELETE FROM statement.<br />
     * 4. TRUNCATE statement.<br />
     * 5. CREATE TABLE/PROCEDURE/TRIGGER statement<br />
     * 6. DROP TABLE/COLUMN/PROCEDURE/TRIGGER statement<br />
     * 7. ... and so on.<br /><br />
     * @param query Pass your sql query here. <br /><br />
     * Example: INSERT INTO tableA(colA, colB) VALUES('data1', 'data2')<br /><br />
     * @param data Pass your data here.<br />
     * If you have two passing parameters (two question mark) on your query like this:-<br /><br />
     * String query = "INSERT INTO tableA(colA, colB) VALUES(?, ?)";<br /><br />
     * Then you need to pass two data as follows:-<br /><br />
     * String data[] = new String[2];<br />
     * data[0] = "data1";<br />
     * data[1] = "data2";<br />
     * boolean status = mc.setQuery(query, data);<br /><br />
     * If you don't have any passing parameters, just sent a nullify array like this:-<br /><br />
     * String data[] = {};<br />
     * boolean status = mc.setQuery(query, data);<br /><br />
     * @return String value<br />
     * Zero or Positive number: If sql execution was success.<br />
     * Negative number: If sql execution was failed and has error.<br />
     */
    public String setQuery(String query, String data[], String priKey) {
        String key = "0";
        RMIConn rmic = new RMIConn();
        try {
            if (rmic.getImpl() == null) {
                new MainClient(this.host);
            }
            key = rmic.getImpl().setQueryUMP(query, data, priKey);
        } catch (Exception e) {
            System.out.println("Error:"+e.getMessage());
            e.printStackTrace();
        }
        return key;
    }
    
    /**
     * Use this method to get values from your query, <br />
     * and put the result into a 2D array list.<br /><br />
     * NOTE: THIS METHOD ONLY ACCEPT A SELECT STATEMENT QUERY!<br /><br />
     * @param query Pass your SELECT statement query in here.<br /><br />
     * For example: SELECT tableA.colA, tableA.colB FROM tableA<br /><br />
     * @param data Pass your data here.<br />
     * If you have one passing parameter (one question mark) on your query like this:-<br /><br />
     * String query = "SELECT tableA.colA, tableA.colB FROM tableA WHERE tableA.colA = ?";<br /><br />
     * Then you need to pass one data as follows:-<br /><br />
     * String data[] = new String[1];<br />
     * data[0] = "id1";<br />
     * ArrayList<ArrayList<String>> output = mc.getQuery(query, data);<br /><br />
     * If you don't have any passing parameters, just sent a nullify array like this:-<br /><br />
     * String data[] = {};<br />
     * ArrayList<ArrayList<String>> output = mc.getQuery(query, data);<br /><br />
     * @return It will return a table data with rows and columns into a 2D array list.
     */
    public ArrayList<ArrayList<String>> getQuery(String query, String data[]) {
        ArrayList<ArrayList<String>> output = new ArrayList<ArrayList<String>>();
        RMIConn rmic = new RMIConn();
        try {
            if (rmic.getImpl() == null) {
                new MainClient(this.host);
            }
            output = rmic.getImpl().getQueryUMP(query, data);
        } catch (Exception e) {
            System.out.println("Error:"+e.getMessage());
            e.printStackTrace();
        }
        return output;
    }
}
