/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServlet;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author umarmukhtar
 */
public class Login {
    
    public ArrayList<ArrayList<String>> menuList(String role) {
        ArrayList<ArrayList<String>> menus = new ArrayList<ArrayList<String>>();
        try {
            String query = "SELECT im.im_desc, im.im_link "
                    + "FROM interface_menu im, role r, interface_menu_role imr "
                    + "WHERE im.im_refid = imr.im_refid "
                    + "AND r.rl_refid = imr.rl_refid "
                    + "AND r.rl_role = ? "
                    + "ORDER BY im.im_priority ASC ";
            String params[] = {role};
            MainClient mc = new MainClient(DBConn.getHost());
            menus = mc.getQuery(query, params);
        } catch (Exception e) {
            ArrayList<String> error = new ArrayList<String>();
            error.add("Error");
            error.add(e.getMessage());
            menus.add(error);
        }
        return menus;
    }
}
