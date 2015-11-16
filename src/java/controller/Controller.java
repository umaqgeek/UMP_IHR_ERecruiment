/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author umarmukhtar
 */
public class Controller {
    
    public final static String dashboardLinks[][] = {
        {"E-Advertisement", "Advertisement"},
        {"E-Application", "Application"},
        {"E-Filter", "Filter"},
        {"E-Test", "Test"},
        {"E-Interview", "Interview"},
        {"E-Result", "Result"},
        {"E-Offer", "Offer"},
        {"E-Register", "Register"}
    };
    
    private static String pages[][] = {
        {"Login", "auth/login.jsp"},
        {"Dashboard", "dashboard.jsp"},
        {"Application", "application/profile.jsp"}
    };
    
    public static String getPages(String method) {
        String page = pages[0][1];
        try {
            for (int i = 0; i < pages.length; i++) {
                if (pages[i][0].toUpperCase().equals(method.toUpperCase())) {
                    page = pages[i][1];
                    break;
                }
            }
        } catch (Exception e) {
        }
        return page;
    }
}
