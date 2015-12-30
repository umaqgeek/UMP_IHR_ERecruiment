/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import config.Config;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import libraries.My_func;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author umarmukhtar
 */
public class CRUD {
    
    private String table;
    private ArrayList<String> columns;
    private ArrayList<ArrayList<String>> data;
    
    private void setTable(String table) {
        this.table = table;
    }
    
    private void setColumns(ArrayList<String> columns) {
        this.columns = columns;
    }
    
    public String addData(ArrayList<String> columns, String table) {
        String str = "";
        try {
            str += "<form action=\"ProcessCRUD\" method=\"post\">\n" +
                    "<input type=\"hidden\" name=\"CRUD_table\" value=\""+table+"\" />\n" +
                    "<input type=\"hidden\" name=\"CRUD_type\" value=\""+My_func.INSERT+"\" />\n" +
    "    <table class=\"table\">\n";
            
            for (int i = 0; i < columns.size(); i++) {
                if (!columns.get(i).toUpperCase().contains("refid".toUpperCase())) {
                    str += "" +
        "        <tr>\n" +
        "            <th>"+columns.get(i)+"</th>\n" +
        "            <th>:</th>\n" +
        "            <th><input type=\"text\" name=\""+columns.get(i)+"\" class=\"form-control\" /></th>\n" +
        "        </tr>\n";
                }
            }
            
            str += "<tr><td colspan=\"3\"><button type=\"submit\">Submit</button> <button type=\"reset\">Reset</button></td></tr>" +
"    </table>\n" +
"</form>";
        } catch (Exception e) {
        }
        return str;
    }
    
    public String listTable(ArrayList<String> columns, String table) {
        
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
            this.data = mc.getQuery(query, params);
            
            str = "<div class=\"panel panel-default\">\n" +
"                       \n" +
"                        <div class=\"panel-body\">"
                    + "<div class=\"dataTable_wrapper\">"
                    + "<table class=\"table table-striped table-bordered table-hover\" id=\"dataTables-example\">"
                    + "<thead bgcolor=\"Aqua\">"
                    + " <tr>"
                    + "     <th>";
            int indexPrimaryKey = 0;
            String primaryKeyColumn = "";
            for (int i = 0; i < columns.size()-1; i++) {                
                str += columns.get(i)+"</th><th>";
                if (columns.get(i).toUpperCase().contains("refid".toUpperCase())) {
                    indexPrimaryKey = i;
                    primaryKeyColumn = columns.get(i);
                }
            }
            str += columns.get(columns.size()-1) + "</th>";
            str += "<th>Action</th>";
            str +="</tr></thead><tbody>";
            for (int i = 0; i < data.size(); i++) {
                
                String primaryKeyValue = data.get(i).get(0);
                
                str += "<tr>";
                for (int j = 0; j < data.get(i).size(); j++) {
                    str += "<td>";
                    str += data.get(i).get(j);
                    str += "</td>";
                    
                    primaryKeyValue = (indexPrimaryKey == j) ? (data.get(i).get(j)) : (data.get(i).get(0));
                }
                str += "<td class=\"center\">\n" +
"                                                <button type=\"button\"  class=\"btn btn-info btn-sm\" data-toggle=\"modal\" data-target=\"#myUni\">\n" +
"                                                    <span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>\n" +
"                                                </button>&nbsp; \n" +
"<button type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#myUni\" " + 
"onclick=\"if (confirm('Are you sure?')) { location.href='ProcessCRUD?idtype="+primaryKeyColumn+"&id="+primaryKeyValue+"&CRUD_table="+table+"&CRUD_type="+My_func.DELETE+"'; }\">\n" +
"                                                    <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span>\n" +
"                                                </button></form>&nbsp; \n" +
"                                            </td>";
                str += "</tr>";
            }
            str += "</tbody></table></div></div></div>";
            
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
        
//        str += "<!-- jQuery -->\n" +
//"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/jquery/dist/jquery.min.js\"></script>\n" +
//"\n" +
//"    <!-- Bootstrap Core JavaScript -->\n" +
//"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/bootstrap/dist/js/bootstrap.min.js\"></script>\n" +
//"\n" +
//"    <!-- Metis Menu Plugin JavaScript -->\n" +
//"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/metisMenu/dist/metisMenu.min.js\"></script>\n" +
//"\n" +
//"    <!-- DataTables JavaScript -->\n";
        
        str += "" +
"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/datatables/media/js/jquery.dataTables.min.js\"></script>\n" +
"    <script src=\""+Config.getBase_url(request)+"assets/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js\"></script>";
        
        str += "<script>\n" +
"    $(document).ready(function() {\n" +
"        $('#dataTables-example').DataTable({\n" +
"                responsive: true\n" +
"        });\n" +
"    });\n" +
"    </script>";
        
        return str;
    }
}
