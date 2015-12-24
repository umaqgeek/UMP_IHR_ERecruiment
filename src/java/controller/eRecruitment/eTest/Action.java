/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libraries.eRecruitment.eTest;

import java.util.ArrayList;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author SUNNY
 */
public class Action {
    /*  The method to save/update Test TEST_SET_DB
    *   rData is the parameter to receive ArrayList<String> data from a Form
    */
    public String saveTest(ArrayList<String> rData){
        MainClient mc = new MainClient(DBConn.getHost());
        String query = "";
        String msg = "";
        
        if (rData.get(0)==""){
            query = "INSERT INTO TEST_SET_DB(TSDB_SET_NAME, TST_REFID) VALUES(?,?)";
        }
        else{
            query = "UPDATE TEST_SET_DB SET TSDB_SET_NAME=?, TST_REFID=? WHERE TSDB_REFID='" + rData.get(0) + "'";
        }
        String data[] = new String[2];
        
        data[0] = rData.get(1);
        data[1] = rData.get(2);
        try{
            msg = mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /*  The method to save/update Test Type TEST_SET_TYPE
    *   rData is the parameter to receive ArrayList<String> data from a Form
    */
    public String saveTestType(ArrayList<String> rData){
        MainClient mc = new MainClient(DBConn.getHost());
        String query = "";
        String msg = "";
        
        if (rData.get(0)==""){
            query = "INSERT INTO TEST_SET_TYPE(TST_TYPE) VALUES(?)";
        }
        else{
            query = "UPDATE TEST_DB SET TST_TYPE = ? WHERE TST_REFID = '" + rData.get(0) + "'";
        }
        String data[] = new String[1];
        
        data[0] = rData.get(1);
        try{
            msg = mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /*  The method to save/update Question TEST_SET_DB
    *   rData is the parameter to receive ArrayList<String> data from a Form
    */
    public String saveQuestion(ArrayList<String> rData){
        MainClient mc = new MainClient(DBConn.getHost());
        String query = "";
        String msg = "";
        
        if (rData.get(0)==""){
            query = "INSERT INTO TEST_DB(TSDB_REFID, TDB_QNO, TDB_QUEST) VALUES(?,?,?)";
        }
        else{
            query = "UPDATE TEST_DB SET TSDB_REFID=?, TDB_QNO=?, TDB_QUEST=? WHERE TDB_REFID='" + rData.get(0) + "'";
        }
        String data[] = new String[2];
        
        data[0] = rData.get(1);
        data[1] = rData.get(2);
        data[2] = rData.get(3);
        try{
            msg = mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /*  The method to save/update Answer of Each Question ANSWER_DB
    *   rData is the parameter to receive ArrayList<String> data from a Form
    */
    public String saveAnswer(ArrayList<String> rData){
        MainClient mc = new MainClient(DBConn.getHost());
        String query = "";
        String msg = "";
        
        if (rData.get(0)==""){
            query = "INSERT INTO ANSWER_DB(TDB_REFID, ADB_ANS, ADB_SET_SCORE, AC_REFID) VALUES(?,?,?,?)";
        }
        else{
            query = "UPDATE ANSWER_DB SET TDB_REFID=?, ADB_ANS=?, ADB_SET_SCORE=?, AC_REFID=? WHERE ADB_REFID='" + rData.get(0) + "'";
        }
        String data[] = new String[4];
        
        data[0] = rData.get(1);
        data[1] = rData.get(2);
        data[2] = rData.get(3);
        data[2] = rData.get(4);
        try{
            msg = mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /*  The method to save/update Scoring/Answer Category ANS_CATEGORY
    *   rData is the parameter to receive ArrayList<String> data from a Form
    */
    public String saveAnswerCategory(ArrayList<String> rData){
        MainClient mc = new MainClient(DBConn.getHost());
        String query = "";
        String msg = "";
        
        if (rData.get(0)==""){
            query = "INSERT INTO ANS_CATEGORY(AC_CATEGORY) VALUES(?)";
        }
        else{
            query = "UPDATE ANS_CATEGORY SET AC_CATEGORY=? WHERE AC_REFID='" + rData.get(0) + "'";
        }
        String data[] = new String[1];
        
        data[0] = rData.get(1);
        try{
            msg = mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /*  The method to save Results of Test TEST_RESULT
    *   rData is the parameter to receive ArrayList<String> data from a Form
    */
    public String saveResult(ArrayList<String> rData){
        MainClient mc = new MainClient(DBConn.getHost());
        String query = "";
        String msg = "";
        
        if (rData.get(0)==""){
            query = "INSERT INTO TEST_RESULT(PA_REFID, TSDB_REFID, TR_STATUS, TR_MARKS, C_REFID) VALUES(?,?,?,?,?)";
        }
        else{
            query = "UPDATE TEST_RESUTL SET PA_REFID=?, TSDB_REFID=?, TR_STATUS=?, TR_MARKS=?, C_REFID=? WHERE TR_REFID = '" + rData.get(0) + "'";
        }
        String data[] = new String[5];
        
        data[0] = rData.get(1);
        data[1] = rData.get(2);
        data[2] = rData.get(3);
        data[3] = rData.get(4);
        data[4] = rData.get(5);
        
        try{
            msg = mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }    
}
