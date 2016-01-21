package controller.eRecruitment.eInterview;

import helpers.objData;
import models.DBConn;
import oms.rmi.server.MainClient;
import java.util.ArrayList;
import java.util.HashSet;

/**
 *
 * @author Vijay
 */
public class List {

    /*
    * Method to get list of Chirmans to Dropdown
    */
    public objData getChairmans(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            
            String query = "SELECT U_REFID, U_NAME FROM USERS";
            String data[] = {};
            
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception ex){
            objdata.setErrorMessage(ex.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    * Method to display setup interviews
    */
    public objData getInterviews(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            String query = "SELECT IC_REFID, IC_INTERVIEW_DATETIME, IC_VENUE, IC_APPROVAL_DATETIME FROM INTERVIEW_CHAIRMAN ORDER BY IC_INTERVIEW_DATETIME DESC";
            String data[] = {};
            
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception ex){
            objdata.setErrorMessage(ex.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    * Method to get Panel
    */
    public objData getPanels() {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT U_REFID, U_NAME FROM USERS";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display the list of ADs that are ended */
    public objData getPositions() {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());
            String query  = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, PPH.PPH_PTJ, PPH.PPH_STARTDATE, PPH.PPH_ENDDATE, PPH.PPH_REFID, (SELECT I_REFID FROM INTERVIEW WHERE PA_REFID = (SELECT PA_REFID FROM VACANCY_POS_PTJ WHERE PPH_REFID=PPH.PPH_REFID)) FROM POSITION_PTJ_HR PPH WHERE PPH.PPH_REFID IN (SELECT VPP.PPH_REFID FROM VACANCY_POS_PTJ VPP)";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    * Method to display the list of Interview Questions
    */
    public objData getInterviewQuestions(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            
            String query = "SELECT IQ_REFID, IQ_QUESTION, IQ_MAX_MARK, IQ_DESC FROM INTERVIEW_QUESTION";
            String data[] = {};
            
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception ex){
            objdata.setErrorMessage(ex.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
}
