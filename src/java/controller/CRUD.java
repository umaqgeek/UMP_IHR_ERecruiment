/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import config.Config;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author umarmukhtar
 */
public class CRUD {
    
    private String table;
    private ArrayList<String> columns;
    
    private void setTable(String table) {
        this.table = table;
    }
    
    private void setColumns(ArrayList<String> columns) {
        this.columns = columns;
    }
    
    public String getRender(ArrayList<String> columns, String table) {
        
        setTable(table);
        setColumns(columns);
        
        String str = "";
        try {
            String query = "SELECT ";
            for (int i = 0; i < columns.size()-1; i++) {
                query += columns.get(i)+",";
            }
            query += columns.get(columns.size()-1);
            query += " FROM "+table;
            MainClient mc = new MainClient(DBConn.getHost());
            String params[] = {};
            ArrayList<ArrayList<String>> data = mc.getQuery(query, params);
            
            str = "<div class=\"dataTable_wrapper\">"
                    + "<table class=\"table table-striped table-bordered table-hover\" id=\"dataTables-example\">"
                    + "<thead bgcolor=\"Aqua\">"
                    + " <tr>"
                    + "     <th>";
            for (int i = 0; i < columns.size()-1; i++) {
                str += columns.get(i)+"</th><th>";
            }
            str += columns.get(columns.size()-1) + "</th>";
            str += "<th>Action</th>";
            str +="</tr></thead><tbody>";
            for (int i = 0; i < data.size(); i++) {
                str += "<tr>";
                for (int j = 0; j < data.get(i).size(); j++) {
                    str += "<td>";
                    str += data.get(i).get(j);
                    str += "</td>";
                }
                str += "<td class=\"center\">\n" +
"                                                <button type=\"button\"  class=\"btn btn-info btn-sm\" data-toggle=\"modal\" data-target=\"#myUni\">\n" +
"                                                    <span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>\n" +
"                                                </button>&nbsp; \n" +
"                                                <button type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#myUni\">\n" +
"                                                    <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span>\n" +
"                                                </button>&nbsp; \n" +
"                                                <button type=\"button\" class=\"btn btn-warning btn-sm\" data-toggle=\"modal\" data-target=\"#myUni\">\n" +
"                                                    <span class=\"glyphicon glyphicon-download-alt\" aria-hidden=\"true\"></span>\n" +
"                                                </button>&nbsp;\n" +
"                                                <button type=\"button\" class=\"btn btn-success btn-sm\" data-toggle=\"modal\" data-target=\"#myUni\">\n" +
"                                                    <span class=\"glyphicon glyphicon-print\" aria-hidden=\"true\"></span>\n" +
"                                                </button>\n" +
"                                            </td>";
                str += "</tr>";
            }
            str += "</tbody></table></div>";
            
        } catch (Exception e) {
            str = "Error: "+e.getMessage();
        }
        return str;
    }
    
    public String getLibraries(HttpServletRequest request) {
        String str = "";
        str = "<!-- Bootstrap Core CSS -->\n" +
"    <link href=\""+Config.getBase_url(request)+"assets/bower_components/bootstrap/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n" +
"\n" +
"    <!-- MetisMenu CSS -->\n" +
"    <link href=\""+Config.getBase_url(request)+"assets/bower_components/metisMenu/dist/metisMenu.min.css\" rel=\"stylesheet\">\n" +
"\n" +
"    <!-- DataTables CSS -->\n" +
"    <link href=\""+Config.getBase_url(request)+"assets/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css\" rel=\"stylesheet\">\n" +
"\n" +
"    <!-- DataTables Responsive CSS -->\n" +
"    <link href=\""+Config.getBase_url(request)+"assets/bower_components/datatables-responsive/css/dataTables.responsive.css\" rel=\"stylesheet\">\n" +
"\n" +
"    <!-- Custom Fonts -->\n" +
"    <link href=\""+Config.getBase_url(request)+"assets/bower_components/font-awesome/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">";
        
//        str = "<!-- jQuery -->\n" +
//"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/jquery/dist/jquery.min.js\"></script>\n" +
//"\n" +
//"    <!-- Bootstrap Core JavaScript -->\n" +
//"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/bootstrap/dist/js/bootstrap.min.js\"></script>\n" +
//"\n" +
//"    <!-- Metis Menu Plugin JavaScript -->\n" +
//"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/metisMenu/dist/metisMenu.min.js\"></script>\n" +
//"\n" +
//"    <!-- DataTables JavaScript -->\n" +
//"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/datatables/media/js/jquery.dataTables.min.js\"></script>\n" +
//"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js\"></script>";
        
        return str;
    }
}
