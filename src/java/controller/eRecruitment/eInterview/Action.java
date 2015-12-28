/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.eRecruitment.eInterview;

import models.DBConn;
import oms.rmi.server.MainClient;
import java.util.ArrayList;

/**
 *
 * @author SUNNY
 */
public class Action {
    /* Add/Edit to database table E-INTERVIEW */
    public String saveInterview(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            if (rData.get(0)!=null){
                query = "UPDATE E-INTERVIEW SET PA_REFID =?, I_PTJ =?, I_DATETIME = ?, I_VENUE =?, I_PANEL =? WHERE I_REFID = '" + rData.get(0) + "'";
            }
            else{
                query = "INSERT INTO E-INTERVIEW(I_REFID, PA_REFID, I_PTJ, I_DATETIME, I_VENUE, I_PANEL) VALUES(?,?,?,?,?,?)";
            }
            
            String data[] = new String[6];
            
            data[0] = rData.get(1);
            data[1] = rData.get(2);
            data[2] = rData.get(3);
            data[3] = rData.get(4);
            data[4] = rData.get(5);
            
            mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
}
