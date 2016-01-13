/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.eRecruitment.eInterview;

import helpers.objData;
import models.DBConn;
import oms.rmi.server.MainClient;
import java.util.ArrayList;

/**
 *
 * @author SUNNY
 */
public class List {
    public objData getPanelList() {
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
    public objData getJobListEnding() {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());
            //String query  = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, PPH.PPH_PTJ, PPH.PPH_STARTDATE, PPH.PPH_ENDDATE, PPH.PPH_REFID FROM POS_APPLIED PA JOIN VACANCY_POS_PTJ VPP ON VPP.VPP_REFID = PA.VPP_REFID JOIN POSITION_PTJ_HR PPH ON PPH.PPH_REFID = VPP.PPH_REFID";
            String query  = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, PPH.PPH_PTJ, PPH.PPH_STARTDATE, PPH.PPH_ENDDATE, PPH.PPH_REFID, (SELECT I_REFID FROM INTERVIEW WHERE PA_REFID = (SELECT PA_REFID FROM VACANCY_POS_PTJ WHERE PPH_REFID=PPH.PPH_REFID)) FROM POSITION_PTJ_HR PPH WHERE PPH.PPH_REFID IN (SELECT VPP.PPH_REFID FROM VACANCY_POS_PTJ VPP)";
            //String query  = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, PPH.PPH_PTJ, PPH.PPH_STARTDATE, PPH.PPH_ENDDATE, PPH.PPH_REFID, INT.I_REFID, INT.I_DATETIME, INT.I_VENUE, '' AS INT.I_PANEL FROM POSITION_PTJ_HR PPH JOIN VACANCY_POS_PTJ VPP ON VPP.PPH_REFID = PPH.PPH_REFID LEFT OUTER JOIN INTERVIEW ON INT.I_REFID=PA.PA_REFID";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    *  Method to get Interview Setup Details
    */
    public objData getInterviewDetails(String InterviewID){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            
            String query = "SELECT I_REFID, I_DATETIME, I_VENUE FROM INTERVIEW WHERE I_REFID = ?";
            String data[] = {};
            data[0] = InterviewID;
            
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception ex){
            objdata.setErrorMessage(ex.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    *  Method to get Interview Panels
    */
    public objData getInterviewPanels(String InterviewID){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            
            String query = "SELECT U_REFID, U_NAME FROM USERS WHERE U_REFID IN (SELECT U_REFID FROM INTERVIEW_PANEL WHERE I_REFID = ?)";
            String data[] = {};
            data[0] = InterviewID;
            
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception ex){
            objdata.setErrorMessage(ex.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    *  Method to get Interview Panels to a String
    */
    public String getInterviewPanel(String InterviewID){
        String strPanel = "";
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            
            String query = "SELECT U_NAME FROM USERS WHERE U_REFID IN (SELECT U_REFID FROM INTERVIEW_PANEL WHERE I_REFID = ?)";
            String data[] = {};
            data[0] = InterviewID;
            
            objdata.setTableData(mc.getQuery(query, data));
            
            for (int inc=0; inc < objdata.getTableData().size(); inc++){
                ArrayList Row = objdata.getTableData().get(inc);
                if (inc==0){
                    strPanel += Row.get(0);
                }
                else {
                    strPanel += ", " + Row.get(0);
                }
            }
        }
        catch(Exception ex){
            objdata.setErrorMessage(ex.toString());
            objdata.setFlag(1);
        }
        return strPanel;
    }
    /*
    * Method to display list of Interviews for PTJ to Accept/Reject
    */
    public objData getInterviewsForDept(String DeptID) {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());

            String query  = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, PPH.PPH_PTJ, INT.I_DATETIME, INT.I_VENUE, POSITION_PTJ_HR, '' PPH JOIN VACANCY_POS_PTJ VPP ON VPP.PPH_REFID = PPH.PPH_REFID JOIN POS_APPLIED PA ON PA.VPP_REFID = VPP.VPP_REFID JOIN INTERVIEW INT ON INT.PA_REFID = PA.PA_REFID";
            String data[] = {};
            data[0] = DeptID;

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    * Method to display list of interview to Candidate for Accept/Reject
    */
    public objData getInterviewListForCandidate(String CandidateID) {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT PPH.PPH_GRADE, PPH_PPH_POSITION, PPH.PPH_PTJ, INT.I_DATETIME, INT.I_VENUE, INT.IPANEL FROM INTERVIEW INT JOIN POS_APPLIED PA ON PA.PA_REFID = INT.PA_REFID JOIN POSITION_PTJ_HR ON PPH.PA_REFID=PA.PA_REFID WHERE PA.C_REFID=?";
            String data[] = {};
            data[0] = CandidateID;

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    * Method to display list of interview for PTJ after Candidate Accept/Reject before setting up Pre Interview
    */
    public objData getInterviewListAfterCandidateResponse(String DeptID) {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT PPH.PPH_GRADE, PPH_PPH_POSITION, PPH.PPH_PTJ, INT.I_DATETIME, INT.I_VENUE, '', CND.C_NAME, CND.C_ICNO, INT.I_C_STATUS, INT.I_C_REASON FROM INTERVIEW INT JOIN POS_APPLIED PA ON PA.PA_REFID = INT.PA_REFID JOIN POSITION_PTJ_HR ON PPH.PA_REFID=PA.PA_REFID JOIN CANDIDATE ON PA.C_REFID = CND.C_REFID WHERE PPH.PPH_PTJ=?";
            String data[] = {};
            data[0] = DeptID;

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    * Method to display the Pre interviews for Panel while pre interviewing
    */
    public objData getPreInterviewListForPanel() {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT PI.PI_REFID, PA.PA_REFID, PI.PI_DATETIME, PI.PI_VENUE, '', CND.C_NAME, CND.C_ICNO FROM PREINTERVIEW PI JOIN POS_APPLIED PA ON PA.PA_REFID = INT.PA_REFID JOIN CANDIDATE CND.C_REFID=PA.C_REFID WHERE PI.I_REFID=?";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    * List of Interview for Panel while interviewing
    */
    public objData getInterviewListForPanel() {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT INT.I_REFID, PA.PA_REFID, INT.I_DATETIME, INT.I_VENUE, INT.IPANEL, CND.C_NAME, CND.C_ICNO FROM INTERVIEW INT JOIN POS_APPLIED PA ON PA.PA_REFID = INT.PA_REFID JOIN CANDIDATE CND.C_REFID=PA.C_REFID WHERE INT.I_REFID=?";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    * List of Preinterview for the decision
    */
    public objData getPreInterviewListForDecision() {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT PI.PI_REFID, PA.PA_REFID, PI.PI_DATETIME, PI.PI_VENUE, '', CND.C_NAME, CND.C_ICNO FROM PREINTERVIEW PI JOIN POS_APPLIED PA ON PA.PA_REFID = PI.PA_REFID JOIN CANDIDATE CND.C_REFID=PA.C_REFID";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*
    * List of Interview for the decision
    */
    public objData getInterviewListForDecision() {
        objData objdata = new objData();
        try {
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT INT.I_REFID, PA.PA_REFID, INT.I_DATETIME, INT.I_VENUE, INT.IPANEL, CND.C_NAME, CND.C_ICNO FROM INTERVIEW INT JOIN POS_APPLIED PA ON PA.PA_REFID = INT.PA_REFID JOIN CANDIDATE CND.C_REFID=PA.C_REFID";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query, data));
        } catch (Exception e) {
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
}
