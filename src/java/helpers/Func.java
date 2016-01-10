/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author End User
 */
public class Func {
    
    /**
     * Get today's date format yyyy-MM-dd HH:mm:ss
     * @return 
     */
    public static String getTodayDate() {
        Calendar today = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(today.getTime());
    }
    
    /**
     * Get today's date format dd/MM/yyyy
     * @return 
     */
    public static String getTodayDate2() {
        Calendar today = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        return dateFormat.format(today.getTime());
    }
    
    /**
     * Get today's date format yyyy-MM-dd
     * @return 
     */
    public static String getTodayDate3() {
        Calendar today = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(today.getTime());
    }
    
    /**
     * Get date in oracle date format.
     * @param date
     * @return 
     */
    public static String getOracleDate(String date, String format) {
        try {
            String inputTimeStamp = date;
            final String inputFormat = format;
            final String outputFormat = "dd-MMM-yyyy";
            return Func.timeStampConverter(inputFormat, inputTimeStamp,
                    outputFormat);
        } catch (ParseException ex) {
            return ex.getMessage();
        }
    }
    
    /**
     * Get date in user defined format.
     * @return 
     */
    public static String timeStampConverter(final String inputFormat,
            String inputTimeStamp, final String outputFormat)
            throws ParseException {
        return new SimpleDateFormat(outputFormat).format(new SimpleDateFormat(
                inputFormat).parse(inputTimeStamp));
    }
    
    /**
     * Get date format 00/00/0000
     * @return 
     */
    public static String getDate(String date) {
        try {
            String str[] = date.split(" ");
            String str2[] = str[0].split("-");
            return str2[2]+"/"+str2[1]+"/"+str2[0];
        } catch (Exception e) {
            return "00/00/0000";
        }
    }
    
    /**
     * Get date format 00/00/0000 00:00:00
     * @return 
     */
    public static String getDateTime(String date) {
        String str[] = date.split(" ");
        String str2[] = str[0].split("-");
        String str3[] = str[1].split(":");
        return str2[2]+"/"+str2[1]+"/"+str2[0]+" "+str3[0]+":"+str3[1]+":"+str3[2];
    }
    
    /**
     * Get date format 00/00/0000
     * @return 
     */
    public static String sqlToDate(String date) {
        String str[] = date.split("-");
        return str[2]+"/"+str[1]+"/"+str[0];
    }
    
    /**
     * Get date format yyyy-MM-dd
     * @return 
     */
    public static String sqlToDate2(String date) {
        String str[] = date.split(" ");
        String str2[] = str[0].split("-");
        return str2[0] + "-" + str2[1] + "-" + str2[2];
    }
}
