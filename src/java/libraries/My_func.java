/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libraries;

import config.Config;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author umarmukhtar
 */
public class My_func {
    
    public static final String INFO_KEY = "info";
    public static final String ERROR_KEY = "error";
    public static final String SUCCESS_KEY = "success";
    
    public static final String SESSION_KEY = "pageurl";
    public static final String URL_KEY = "p";
    
    public static final String LOGIN_URL = "WEB-INF/jsp/login.jsp";
    
    public static final String INSERT = "insert";
    public static final String DELETE = "delete";
    
    public static String getURI(HttpServletRequest request, int uri) {
        String currURL = (request.getRequestURL()).toString();
        String baseURL = Config.getBase_url(request);
//        String pecah[] = 
        return "|"+currURL+"|"+baseURL+"|";
    }
}
