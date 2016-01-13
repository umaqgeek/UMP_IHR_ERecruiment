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
    /* Insert /Update to database table INTERVIEW */
    public String saveInterview(ArrayList<String> rData){
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
    /* Update Status of PTJ Accept/Reject For Interview*/
    public String saveIPTJStatus(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            query = "UPDATE INTERVIEW SET I_PTJSTATUS = ? WHERE I_REFID = ?";
            String data[] = new String[2];
            
            data[0] = rData.get(0);
            data[1] = rData.get(1);
            
            mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /* Update Status of Candidate Accept/Reject For Interview*/
    public String saveICandidateStatus(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            query = "UPDATE INTERVIEW SET I_C_STATUS = ?, I_C_REASON = ? WHERE I_REFID = ?";
            String data[] = new String[2];
            
            data[0] = rData.get(0);
            data[1] = rData.get(1);
            data[2] = rData.get(2);
            
            mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /* Update Status of Interview Pass/Fail/KIV*/
    public String saveIStatus(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            query = "UPDATE INTERVIEW SET I_CM_STATUS = ? WHERE I_REFID = ?";
            String data[] = new String[2];
            
            data[0] = rData.get(0);
            data[1] = rData.get(1);
            
            mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /* Save Questions of Interview*/
    public String saveIQuestions(ArrayList<String> rData){
        String query = "";
        String msg = "";
        
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            query = "INSERT INTO INTERVIEW_QUESTIONS(IQ_REFID, IQ_DESC) VALUES(?, ?)";
            String data[] = new String[2];
            
            data[0] = rData.get(0);
            data[1] = rData.get(1);
            
            mc.setQuery(query, data);
        }
        catch(Exception ex){
            msg = ex.toString();
        }
        
        return msg;
    }
    
    /* Save Interview Marks*/
    public String saveIMarks(ArrayList<String> rData){
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
//-----------------    
    /* Insert /Update to database table Pre INTERVIEW */
    public String savePreInterview(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            if (rData.get(0)!=""){
                query = "UPDATE PREINTERVIEW SET PI_REFID = ?, PI_DATETIME = ?, PI_VENUE = ? WHERE PI_REFID = '" + rData.get(0) + "'";
            }
            else{
                query = "INSERT INTO PREINTERVIEW(PI_REFID, PI_DATETIME, PI_VENUE) VALUES(?,?,?)";
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
    /* Insert /Update to database table Pre INTERVIEW Panel*/
    public String savePreInterviewPanel(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            if (rData.get(0)!=""){
                query = "UPDATE PREINTERVIEW SET PI_REFID = ?, PI_DATETIME = ?, PI_VENUE = ? WHERE PI_REFID = '" + rData.get(0) + "'";
            }
            else{
                query = "INSERT INTO PREINTERVIEW(PI_REFID, PI_DATETIME, PI_VENUE) VALUES(?,?,?)";
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
    /* Update Status of Pre Interview Pass/Fail/KIV*/
    public String savePIStatus(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            query = "UPDATE PREINTERVIEW SET PI_CM_STATUS = ? WHERE PI_REFID = ?";
            String data[] = new String[2];
            
            data[0] = rData.get(0);
            data[1] = rData.get(1);
            
            mc.setQuery(query, data);
        }
        catch(Exception e){
            msg = e.toString();
        }
        return msg;
    }
    /* Save Questions of Pre Interview*/
    public String savePIQuestions(ArrayList<String> rData){
        String query = "";
        String msg = "";
        
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            query = "INSERT INTO PREINTERVIEW_QUESTIONS(PQ_REFID, PQ_DESC) VALUES(?, ?)";
            String data[] = new String[2];
            
            data[0] = rData.get(0);
            data[1] = rData.get(1);
            
            mc.setQuery(query, data);
        }
        catch(Exception ex){
            msg = ex.toString();
        }
        
        return msg;
    }
    
    /* Save Interview Marks*/
    public String savePIMarks(ArrayList<String> rData){
        String query = "";
        String msg = "";
        try{
            MainClient mc = new MainClient(DBConn.getHost());
            query = "INSERT INTO PREINTERVIEW_MARKS(PM_REFID, IQ_REFID, I_REFID, C_REFID, U_REFID, IM_MARKS) VALUES(?, ?, ?, ?, ?, ?)";
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
}
