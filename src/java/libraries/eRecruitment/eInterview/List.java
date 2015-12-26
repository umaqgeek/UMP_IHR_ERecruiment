/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libraries.eRecruitment.eInterview;

import helpers.objData;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author SUNNY
 */
public class List {
    public objData getVenueList(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            
            String query = "SELECT ID, DESC FROM VENUES";
            String data[] = {};
            
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    public objData getPanelList(){
        objData objdata = new objData();
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            
            String query = "SELECT ID, DESC FROM PANEL";
            String data[] = {};
            
            objdata.setTableData(mc.getQuery(query, data));
        }
        catch(Exception e){
            objdata.setErrorMessage(e.toString());
            objdata.setFlag(1);
        }
        return objdata;
    }
    /*  Method to display the list of ADs that are ended */
    public objData  getJobListEnding(){
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
    public objData getJobList(){
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
