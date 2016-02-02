/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author umarmukhtar
 */
public class Config {
    
    public static String webURL = "localhost";
    
    public static String getBase_url(HttpServletRequest request) {
//        return "http://"+webURL+":8080"+request.getContextPath()+"/";
        return "http://"+request.getServerName()+":"+request.getServerPort()+""+request.getContextPath()+"/";
    }
}
