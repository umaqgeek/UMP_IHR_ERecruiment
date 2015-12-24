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
public class List {
    /*  Method to display the list of ADs that are ended */
    public objData  getEndedAds(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT * FROM EADS WHERE END_DATE < NOW()";
            String data[] = {};

            objdata.setTableData(mc.getQuery(query,data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display the list of all ADs */
    public objData getAds(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            String query = "SELECT * FROM EADS";
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
