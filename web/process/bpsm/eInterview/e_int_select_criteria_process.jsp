<%-- 
    Document   : e_int_select_criteria_process
    Created on : Feb 6, 2016, 3:26:22 PM
    Author     : Habib
--%>

<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String is_refid = request.getParameter("is_refid");
    String icm_refid[] = request.getParameterValues("icm_refid");
    
    String sql_iii_refid = "SELECT iii.iii_refid "
                        +"FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii "
                        +"WHERE iss.is_refid = irm.is_refid "
                        +"AND irm.irm_refid = iii.irm_refid "
                        +"AND iss.is_refid = ? ";
    String param_iii_refid[] = { is_refid };
    ArrayList<ArrayList<String>> data_iii_refid = mc.getQuery(sql_iii_refid, param_iii_refid);
    
    String sql_delete_question = "DELETE FROM interview_iii_mark "
                            + "WHERE iii_refid = ? ";
    String[] param_delete_question = new String[1];
    
    for(int a=0; a < data_iii_refid.size(); a++)
    {
        param_delete_question[0] = data_iii_refid.get(a).get(0);
        mc.setQuery(sql_delete_question, param_delete_question);
    }
    
    String sql_insert_question = "INSERT INTO interview_iii_mark( iii_refid, icm_refid ) "
                            + "VALUES( ? , ? )";
    String[] param_insert_question = new String[2];
//    //*****************DEBUG*******************************
//    out.print(is_refid+"<br><br>");
//    
//    for(int a = 0; a < data_iii_refid.size(); a++)
//    {
//        out.print(data_iii_refid.get(a).get(0)+"<br>");
//        for(int b = 0; b < icm_refid.length; b++)
//        {
//            out.print(icm_refid[b]+"<br>");
//        }
//        out.print("<br>");
//    }

//    if(true)
//    {
//        return;
//    }
    //****************END DEBUG****************************
    if(icm_refid != null)
    {
        for(int a = 0; a < data_iii_refid.size(); a++)
        {
            param_insert_question[0] = data_iii_refid.get(a).get(0);
            for(int b = 0; b < icm_refid.length; b++)
            {
                param_insert_question[1] = icm_refid[b];
                String res = mc.setQuery(sql_insert_question, param_insert_question);
            }
        }
    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_question_setup.jsp&is_refid="+is_refid);
%>
