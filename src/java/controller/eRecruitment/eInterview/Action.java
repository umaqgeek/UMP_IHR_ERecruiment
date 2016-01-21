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
    /*
    * Method to setup interview
    */
    public String setupInterview(ArrayList<String> rData){
        String query = "";
        String msg = "";
        
        try{
            MainClient mc = new MainClient(DBConn.getHost());

            if (!rData.get(0).equals("N")){
                query = "UPDATE INTERVIEW_CHAIRMAN SET IC_INTERVIEW_DATETIME=?, IC_VENUE=? WHERE IC_REFID = '" + rData.get(0) + "'";
            }
            else{
                query = "INSERT INTO INTERVIEW_CHAIRMAN(IC_INTERVIEW_DATETIME, IC_VENUE) VALUES(?,?)";

            }
            String data[] = new String[2];
            

            data[0] = rData.get(1);
            data[1] = rData.get(2);

            
            msg = mc.setQuery(query, data);
        }
        catch(Exception ex){
            msg = ex.toString();
        }
        return msg;
    }
    /* Insert /Update to database table INTERVIEW Panel*/
    public String saveInterviewPanel(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            if (rData.get(0)!=""){
                query = "UPDATE INTERVIEW SET I_REFID = ?, I_DATETIME = ?, I_VENUE = ? WHERE I_REFID = '" + rData.get(0) + "'";
            }
            else{
                query = "INSERT INTO INTERVIEW(I_REFID, I_DATETIME, I_VENUE) VALUES(?,?,?)";
            }
            
            String data[] = new String[6];
            
            data[0] = rData.get(1);
            data[1] = rData.get(2);
            data[2] = rData.get(3);
            
            mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /* Save Questions of Interview*/
    public String saveInterviewQuestions(ArrayList<String> rData){
        String query = "";
        String msg = "";
        
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            if (!rData.get(0).equals("N")){
                query = "UPDATE INTERVIEW_QUESTION SET IQ_QUESTION = ?, IQ_MAX_MARK = ?, IQ_DESC =? WHERE IQ_REFID = '" + rData.get(0) + "'";
            }
            else{
                query = "INSERT INTO INTERVIEW_QUESTION(IQ_QUESTION, IQ_MAX_MARK, IQ_DESC) VALUES(?, ?, ?)";
            }
            String data[] = new String[3];
            
            data[0] = rData.get(1);
            data[1] = rData.get(2);
            data[2] = rData.get(3);
            
            mc.setQuery(query, data);
        }
        catch(Exception ex){
            msg = ex.toString();
        }
        
        return msg;
    }
    
    /* Save Interview Marks*/
    public String saveInterviewMarks(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            query = "INSERT INTO INTERVIEW_MARKS(IM_REFID, IQ_REFID, I_REFID, C_REFID, U_REFID, IM_MARKS) VALUES(?, ?, ?, ?, ?, ?)";
            String data[] = new String[6];
            
            data[0] = rData.get(0);
            data[1] = rData.get(1);
            data[2] = rData.get(2);
            data[3] = rData.get(3);
            data[4] = rData.get(4);
            data[5] = rData.get(5);
            
            mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /*
    * Method to delete Interview Question
    */
    public String deleteInterviewQuestion(String refID){
        MainClient mc = new MainClient(DBConn.getHost());
        String msg = "";
        
        try{
            String query = "DELETE FROM INTERVIEW_QUESTION WHERE IQ_REFID = ?";
            String data[] = new String[1];
            
            data[0] = refID;
            
            msg = mc.setQuery(query, data);
        }
        catch(Exception ex){
            msg = ex.toString();
        }
        return msg;
    }
}
