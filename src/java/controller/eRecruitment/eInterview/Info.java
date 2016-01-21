package controller.eRecruitment.eInterview;

import helpers.objData;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author SUNNY
 */
public class Info {
    /*
    * Method to display an Interview Question info
    */
    public objData getInterviewQuestion(String refID){
        MainClient mc = new MainClient(DBConn.getHost());
        objData objdata = new objData();
        try{
            String query = "SELECT IQ_REFID, IQ_QUESTION, IQ_MAX_MARK, IQ_DESC FROM INTERVIEW_QUESTION WHERE IQ_REFID = ?";
            String data[] = new String[1];
            
            data[0]  = refID;
            System.out.println(mc.getQuery(query, data) + " " + refID);
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception ex){
            objdata.setErrorMessage(ex.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
}
