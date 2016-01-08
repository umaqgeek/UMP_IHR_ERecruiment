/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import java.util.ArrayList;
/**
 * Class to retrieve data from Database
 * @author SUNNY
 */
public class objData {
    /* To receive array data from MainClient*/
    private ArrayList<ArrayList<String>> data;
    /* To stores an exception message if it is caught */
    private String errMsg;
    /* To store flaG value 0 if no error 1 if there is an error */
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
