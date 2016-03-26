<%-- 
    Document   : e_int_save_chairman_decision_process_uni
    Created on : Mar 27, 2016, 5:10:43 AM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String is_refid = request.getParameter("is_refid");
    String icl_refid = request.getParameter("icl_refid");
    String irm_refid[] = request.getParameterValues("irm_refid");
    String todayDate = Func.getOracleDate(Func.getTodayDate3(), "yyyy-MM-dd");
    
    String sql_select_pa = "SELECT pa.pa_refid, f.f_refid "
                        + "FROM pos_applied pa, interview_result_mark irm, interview_setup iss, filter f "
                        + "WHERE pa.pa_refid = irm.pa_refid "
                        + "AND pa.pa_refid = f.pa_refid "
                        + "AND iss.is_refid = irm.is_refid "
                        + "AND irm.irm_refid = ? "
                        + "AND iss.is_refid = ? ";
    String[] param_select_pa = new String[2];
    ArrayList<ArrayList<String>> data_select_pa;
    
    String sql_pass_filter = "UPDATE filter "
                        + "SET fs_code = ? , "
                        + "f_intuni_status = ? , "
                        + "f_intuni = ? "
                        + "WHERE f_refid = ? ";
    String[] param_pass_filter = new String[4];
    
    String sql_update_pa = "UPDATE pos_applied "
                        + "SET pa_status = ? "
                        + "WHERE pa_refid = ? ";
    String[] param_update_pa = new String[2];
    
    String sql_chairman_decide = "UPDATE interview_result_mark "
                            + "SET irm_status = ? , "
                            + "irm_reason = ? "
                            + "WHERE irm_refid = ? ";
    String[] param_chairman_decide = new String[3];
    
    for(int a = 0; a < irm_refid.length; a++)
    {
        String convert_status = "";
        if(request.getParameter("result_"+irm_refid[a]).equalsIgnoreCase("PASS"))
        {
            convert_status = "PASS_INT_UNI";
        }
        else if(request.getParameter("result_"+irm_refid[a]).equalsIgnoreCase("FAIL"))
        {
            convert_status = "FAIL_INT_UNI";
        }
        
        param_chairman_decide[0] = request.getParameter("result_"+irm_refid[a]);
        param_chairman_decide[1] = request.getParameter("remark_"+irm_refid[a]);
        param_chairman_decide[2] = irm_refid[a];
        mc.setQuery(sql_chairman_decide, param_chairman_decide);
        //out.print(param_chairman_decide[0]+" - "+param_chairman_decide[1]+" - "+param_chairman_decide[2]+"<br>");
        
        param_select_pa[0] = irm_refid[a];
        param_select_pa[1] = is_refid;
        data_select_pa = mc.getQuery(sql_select_pa, param_select_pa);
        
//        out.print("Result :"+convert_status+"<br>");
//        out.print("IRM :"+irm_refid[a]+"<br>");
//        out.print("FILTER: "+data_select_pa.get(0).get(1)+"<br>");
        
        param_pass_filter[0] = convert_status;
        param_pass_filter[1] = convert_status;
        param_pass_filter[2] = todayDate;
        param_pass_filter[3] = data_select_pa.get(0).get(1);
        mc.setQuery(sql_pass_filter, param_pass_filter);
//        out.print("PA: "+data_select_pa.get(0).get(0)+"<br>");

        param_update_pa[0] = convert_status;
        param_update_pa[1] = data_select_pa.get(0).get(0);
        String res = mc.setQuery(sql_update_pa, param_update_pa);
//        out.print("Result : "+res+"<br>");
//        out.print("<br>");
    }
//    if(true)
//    {
//        return;
//    }
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_chairman_start_uni.jsp&is_refid="+is_refid+"&icl_refid="+icl_refid);
%>


