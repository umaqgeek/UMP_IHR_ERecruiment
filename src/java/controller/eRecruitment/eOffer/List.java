/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libraries.eRecruitment.eOffer;

import helpers.objData;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author SUNNY
 */
public class List {
    public objData getCandidateOffers(String CandidateID){
        objData objdata = new objData();
        MainClient mc = new MainClient(DBConn.getHost());
        
        String query = "SELECT OF.O_REFID, OF.FL_REFID, OF.O_POSITION, OF.O_CONDITION, OF.O_DATE FROM OFFER OF JOIN FELLOWSHIP FE ON FE.FL_REF_ID = OF.FL_REF_ID WHERE FE.C_REF_ID = '" + CandidateID + "'";
        String data[] = {};
        try{
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    public objData getAllOffers(){
        objData objdata = new objData();
        MainClient mc = new MainClient(DBConn.getHost());
        
        String query = "SELECT  CN.C_NAME, CN.ICNO, OF.O_REFID, OF.O_POSITION, OF.O_CONDITION, OF.O_DATE, FE.FL_RESULTEN FROM OFFER OF JOIN FELLOWSHIP FE ON FE.FL_REF_ID = OF.FL_REF_ID";
        String data[] = {};
        try{
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
}
