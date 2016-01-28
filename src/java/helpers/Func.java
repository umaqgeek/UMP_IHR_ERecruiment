/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author End User
 */
public class Func {
    
    public static boolean isMatchString(String str, String[] words) {
        boolean status = false;
        try {
            for (int i = 0; i < words.length; i++) {
                if (str.toUpperCase().equals(words[i].toUpperCase())) {
                    status = true;
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Error isMatchString: "+e.getMessage());
            status = false;
        }
        return status;
    }
    
    /**
     * Get today's date format yyyy-MM-dd HH:mm:ss
     * @return 
     */
    public static String getTodayDate() {
        Calendar today = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(today.getTime());
    }
    
    public static String generateDriverSelect(int param, ArrayList<ArrayList<String>> pph_vehicle){
        String license_list = "<select id='dl_code' class='vehicle' name='dl_code'>";
                                        for (int i = 0; i < pph_vehicle.size(); i++) {
                                            String x = pph_vehicle.get(i).get(0);

                                            license_list += "<option value='" + x + "'>" + x + "</option>";
                                        }
                                        license_list += "</select>";
        
        return license_list;
    }
    
    public static String generateGradeSelect(){
        String license_list = "<select id='pmr_grade' class='vehicle' name='stam_grade'>";
                                        
                                            license_list += "<option value='Please Select'>Please Select</option>";
                                            license_list += "<option value='A'>A</option>";
                                            license_list += "<option value='B'>B</option>";
                                             license_list += "<option value='C'>C</option>";
                                              license_list += "<option value='D'>D</option>";
                                               license_list += "<option value='E'>E</option>";
                                          
                                        license_list += "</select>";
        
        return license_list;
    }
    
    public static String generateSubjectSelect(){
        String license_list = "<select id='dl_code' class='vehicle' name='dl_code'>";
                                        
                                            license_list += "<option value='Please Select'>Please Select</option>";
                                            license_list += "<option value='Bahasa Melayu'>Bahasa Melayu</option>";
                                            license_list += "<option value='English'>English</option>";
                                             license_list += "<option value='Mathematics'>Mathematics</option>";
                                              license_list += "<option value='Science'>Science</option>";
                                               license_list += "<option value='Sejarah'>Sejarah</option>";
                                                license_list += "<option value='Pendidikan Islam'>Pendidikan Islam</option>";
                                                 license_list += "<option value='Pendidikan Moral'>Pendidikan Moral</option>";
                                                  license_list += "<option value='Pendidikan Sivik dan Kewarganegaan'>Pendidikan Sivik dan Kewarganegaraan</option>";
                                                   license_list += "<option value='Geografi'>Geografi</option>";
                                                    license_list += "<option value='Pendidikan Jasmani'>Pendidikan Jasmani</option>";
                                                     license_list += "<option value='Kemahiran Hidup'>Kemahiran Hidup</option>";
                                                      license_list += "<option value='Pendidikan Seni Visual'>Pendidikan Seni Visual</option>";
                                                       license_list += "<option value='Pendidikan Muzik'>Pendidikan Muzik</option>";
                                                        license_list += "<option value='Bahasa Arab'>Bahasa Arab</option>";
                                                         license_list += "<option value='Bahasa Cina'>Bahasa Cina</option>";
                                                          license_list += "<option value='English'>Bahasa Tamil</option>";
                                        license_list += "</select>";
        
        return license_list;
    }
    
    public static String generateHigherDegreeExamForm(){
     String form="";
     
     
     return form;
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
            return "";
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
