/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.eRecruitment.eInterview;

import helpers.objData;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author SUNNY
 */
public class Info {
    /*  Method to display the list of ADs that are ended */
    public objData getAdInfo(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            String query = "SELECT * FROM EADS WHERE ID = ?";
            String data[] = {};
            
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
}
