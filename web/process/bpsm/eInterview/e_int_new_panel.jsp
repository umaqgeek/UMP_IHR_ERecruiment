<%-- 
    Document   : e_int_new_panel
    Created on : Feb 3, 2016, 8:15:00 PM
    Author     : Habib
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    
    String sent = "21";
    String is_refid = request.getParameter("is_refid");
    String panel_staffid = request.getParameter("panel_staff_id");
    
    String sql_new_panel = "INSERT INTO interview_panel_list (ipl_status, sm_staff_id) "
                        + "VALUES( ? , ? )";
    String param_new_panel[] = { sent, panel_staffid };
    String ipl_refid = mc.setQuery(sql_new_panel, param_new_panel, "ipl_refid");
    
    String sql_irm_list = "SELECT irm.irm_refid "
                        + "FROM interview_setup iss, interview_result_mark irm "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND iss.is_refid = ? ";
    String param_irm_list[] = { is_refid };
    ArrayList<ArrayList<String>> data_irm_list = mc.getQuery(sql_irm_list, param_irm_list);
    
    String sql_selected_criteria = "SELECT icm.icm_refid, icm.icm_criteria, icm.icm_minmark, icm.icm_maxmark "
            +"FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii, interview_iii_mark iim, interview_criteria_mark icm "
            +"WHERE iss.is_refid = irm.is_refid "
            +"AND irm.irm_refid = iii.irm_refid "
            +"AND iii.iii_refid = iim.iii_refid "
            +"AND icm.icm_refid =iim.icm_refid "
            +"AND iss.is_refid = ? "
            +"GROUP BY icm.icm_refid, icm.icm_criteria, icm.icm_minmark, icm.icm_maxmark";
    String param_selected_criteria[] = { is_refid };
    ArrayList<ArrayList<String>> data_selected_criteria = mc.getQuery(sql_selected_criteria, param_selected_criteria);
    
    String sql_insert_iii = "INSERT INTO interview_irm_icm(irm_refid, ipl_refid) "
                        + "VALUES( ? , ? )";
    String[] param_insert_iii = new String[2];
    String iii_refid = "";
    
    String sql_insert_iim = "INSERT INTO interview_iii_mark(iii_refid, icm_refid) "
                        + "VALUES( ? , ? )";
    String[] param_insert_iim = new String[2];
    String iim_refid = "";
    
    for(int a = 0; a < data_irm_list.size(); a++)
    {
        param_insert_iii[0] = data_irm_list.get(a).get(0);
        param_insert_iii[1] = ipl_refid;
        iii_refid = mc.setQuery(sql_insert_iii, param_insert_iii, "iii_refid");
        
        for(int b = 0; b < data_selected_criteria.size(); b++)
        {
            param_insert_iim[0] = iii_refid;
            param_insert_iim[1] = data_selected_criteria.get(b).get(0);
            mc.setQuery(sql_insert_iim, param_insert_iim);
        }
    }
    
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&is_refid="+is_refid+"&alert=0");
%>
