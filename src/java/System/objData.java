/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package System;

import java.util.ArrayList;
/**
 *
 * @author SUNNY
 */
public class objData {
    private ArrayList<ArrayList<String>> data;
    private String errMsg;
    private int flaG;
    // Get
    public ArrayList<ArrayList<String>> getTableData() { return data; }
    public String getErrorMessage() { return errMsg; }
    public int getFlag() { return flaG; }
    
    //Set
    public void setTableData(ArrayList<ArrayList<String>> data) {this.data = data;}
    public void setErrorMessage(String errMsg) { this.errMsg = errMsg; }
    public void setFlag(int flaG) { this.flaG = flaG; }
      
}
