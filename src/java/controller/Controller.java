/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import config.Config;
import java.util.ArrayList;
import libraries.My_func;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author umarmukhtar
 */
public class Controller {
    
    public static void setIP() {
        DBConn.setHost("175.142.65.30");
    }
    
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
        {"Application", "application/profile.jsp"},
        {"Application-Personal", "application/e-mohon_personal.jsp"},
        {"Application-Academic", "application/e-mohon_academic.jsp"},
        {"Application-Job", "application/e-mohon_job.jsp"},
        {"Application-Working", "application/e-mohon_working.jsp"},
        {"EIklan1", "advertisement/e-iklan.jsp"},
        {"EIklan2", "advertisement/e-iklan_BPSM.jsp"}
//        {"Advertisement", "advertisement/index.jsp"}
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
