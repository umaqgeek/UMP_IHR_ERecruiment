/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libraries.eRecruitment.eTest;

import helpers.objData;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author SUNNY
 */
public class List {
    /*  Method to display all Answers from ANSWER_DB
    *   Returns objData 
    */
    public objData  getAnswers(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT ADB_REFID, TDB_REFID, ADB_ANS, ADB_SET_SCORE, AC_REFID FROM ANSWER_DB";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display all Questions from TEST_DB
    *   Returns objData 
    */
    public objData  getQuestions(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT TBD_REFID, TSDB_REFID, TDB_QNO, TDB_QUEST FROM TEST_DB";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display all Questions from TEST_SET_DB
    *   Returns objData 
    */
    public objData  getTests(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT TSDB_REFID, TSDB_SET_NAME, TST_REFID FROM TEST_SET_DB";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display all Questions from TEST_SET_TYPE
    *   Returns objData 
    */
    public objData  getTestTypes(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT TST_REFID, TST_TYPE FROM TEST_SET_TYPE";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display all Questions from TEST_SET_TYPE
    *   Returns objData 
    */
    public objData  getAnsCategories(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT AC_REFID, AC_CATEGORY FROM ANS_CATEGORY";
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
