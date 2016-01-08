/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.eRecruitment.eTest;

import helpers.objData;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author SUNNY
 */
public class Info {
    /*  Method to Answer info from ANSWER_DB
    *   Returns objData 
    */
    public objData  getAnswer(String id){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT ADB_REFID, TDB_REFID, ADB_ANS, ADB_SET_SCORE, AC_REFID FROM ANSWER_DB WHERE ADB_REFID='" + id + "'";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to Answer info from ANSWER_DB
    *   Returns objData 
    */
    public objData  getAnswerX(String id){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT ADB_REFID, TDB_REFID, ADB_ANS, ADB_SET_SCORE, AC_REFID FROM ANSWER_DB WHERE ADB_REFID='" + id + "'";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display Answer Category info from
    *   Returns objData 
    */
    public objData  getAnswerCategory(String id){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT AC_REFID, AC_CATEGORY FROM ANS_CATEGORY WHERE AC_REFID = '" + id + "'";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display Test Set info from TEST_SET_DB
    *   Returns objData 
    */
    public objData  getTestSet(String id){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT TSDB_REFID, TSDB_SET_NAME, TST_REFID FROM TEST_SET_DB WHERE TSDB_REFID = '" + id + "'";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display Question info from TEST_DB
    *   Returns objData 
    */
    public objData  getQuestion(String id){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT TBD_REFID, TSDB_REFID, TDB_QNO, TDB_QUEST FROM TEST_DB WHERE TDB_REFID = '" + id + "'";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
}

