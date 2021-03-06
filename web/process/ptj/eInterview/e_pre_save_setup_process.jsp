<%-- 
    Document   : e_pre_save_setup_process
    Created on : Feb 13, 2016, 10:13:25 PM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String[] pph_refid = request.getParameterValues("pph_refid");
    String[] pa_refid = request.getParameterValues("pa_refid");
    String ptj_is_refid = request.getParameter("ptj_is_refid");
    String uni_is_refid = request.getParameter("uni_is_refid");
    String dept_code = request.getParameter("dept_code");
    
    String ptj_is_venue = request.getParameter("is_venue").toUpperCase();
    String chairman_staff_id[] = request.getParameterValues("chairman_staff_id");
    String panel_staff_id[] = request.getParameterValues("panel_staff_id");
    
//    out.print("PPH REFID:<br>");
//    for(int a=0; a < pph_refid.length; a++)
//    {
//        out.print(pph_refid[a]+"<br>");
//    }
//    out.print("<br>");
//    out.print("PA REFID:<br>");
//    for(int a=0; a < pa_refid.length; a++)
//    {
//        out.print(pa_refid[a]+"<br>");
//    }
//    
//    out.print("<br>");
//    out.print("UNI IS REFID:"+uni_is_refid);
//    out.print("<br>");
//    out.print("PTJ IS REFID:"+ptj_is_refid);
//    out.print("<br>");
//    out.print("IS VENUE:"+ptj_is_venue);
//    out.print("<br>");
//    out.print("<br>");
//    for(int a = 0; a < chairman_staff_id.length; a++)
//    {
//        out.print("CHAIRMAN : "+chairman_staff_id[a]);
//        out.print("<br>");
//    }
//    out.print("<br>");
//    for(int a = 0; a < panel_staff_id.length; a++)
//    {
//        out.print("PANEL "+(a+1)+" : "+panel_staff_id[a]);
//        out.print("<br>");
//    }
//    
//    if(true)
//    {
//        return;
//    }
    //*************************** Validate Null Chairman *****************************
    if(chairman_staff_id == null)
    {
        response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_setup.jsp&alert=2&uni_is_refid="+uni_is_refid+"&dept_code="+dept_code);
        return;
    }
    //************************End Validate Null Chairman *****************************
    
    //*************************** Validate Null Panel ********************************
    if(panel_staff_id == null)
    {
        response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_setup.jsp&alert=3&ptj_is_refid="+ptj_is_refid+"&uni_is_refid="+uni_is_refid+"&dept_code="+dept_code);
        return;
    }
    //************************End Validate Null Panel ********************************
    
    //************************ Validate Duplicate Person *****************************
    for(int a=0; a<panel_staff_id.length; a++)
    {
        if(chairman_staff_id[0].equals(panel_staff_id[a]))
        {
            response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_setup.jsp&alert=1&ptj_is_refid="+ptj_is_refid+"&uni_is_refid="+uni_is_refid+"&dept_code="+dept_code);
            return;
        };
    }
    //**************************End Validate Duplicate Person ***********************
    
    //*************************Update accept*****************************
    String ptj_status_accept = "11";
    String panel_status_set = "2";
    String panel_status_sent = "21";
    String chairman_status_sent = "21";
    
    String sql_set_uni_invitation = "SELECT ipl.ipl_refid "
                                + "FROM interview_result_mark irm, interview_setup iss, interview_panel_list ipl, interview_irm_icm iii "
                                + "WHERE iss.is_refid = irm.is_refid "
                                + "AND irm.irm_refid = iii.irm_refid "
                                + "AND ipl.ipl_refid = iii.ipl_refid "
                                + "AND iss.is_refid = ? "
                                + "AND ipl.ipl_status = ? "
                                + "GROUP BY ipl.ipl_refid";
    String param_set_uni_invitation[] = { uni_is_refid, panel_status_set };
    ArrayList<ArrayList<String>> data_set_uni_invitation = mc.getQuery(sql_set_uni_invitation, param_set_uni_invitation);
    
    if(data_set_uni_invitation.size() > 0)
    {
        String sql_sent_uni_chairman = "UPDATE interview_chairman_list "
                                    + "SET icl_status = ? "
                                    + "WHERE is_refid = ? ";
        String param_sent_uni_chairman[] = { chairman_status_sent, uni_is_refid };
        mc.setQuery(sql_sent_uni_chairman, param_sent_uni_chairman);
        
        String sql_sent_uni_panel = "UPDATE interview_panel_list "
                                + "SET ipl_status = ? "
                                + "WHERE ipl_refid = ? ";
        String[] param_sent_uni_panel = new String[2];
        for(int a = 0; a < data_set_uni_invitation.size(); a++)
        {
            param_sent_uni_panel[0] = panel_status_sent;
            param_sent_uni_panel[1] = data_set_uni_invitation.get(a).get(0);
            mc.setQuery(sql_sent_uni_panel, param_sent_uni_panel);
        }
    }
    
    String sql_accept   = "UPDATE interview_result_mark "
                        + "SET irm_ptj_status = ? "
                        + "WHERE is_refid = ? "
                        + "AND pa_refid = ? ";
    String[] param_accept = new String[3];
    String aa = "";
    for(int a = 0; a < pa_refid.length; a++)
    {
        param_accept[0] = ptj_status_accept;
        param_accept[1] = uni_is_refid;
        param_accept[2] = pa_refid[a];
        aa = mc.setQuery(sql_accept, param_accept);
    }
//    out.print(aa);
//    if(true)
//    {
//        return;
//    }
    //*********************End Update accept*****************************
    
    //******************Insert to interview setup*********************************************
    String is_status_saved = "4";
    String sql_insert_setup = "UPDATE interview_setup "
                            + "SET is_venue = ? , "
                            + "is_status = ? "
                            + "WHERE is_refid = ? ";
    String param_insert_setup[] = { ptj_is_venue, is_status_saved, ptj_is_refid};
    mc.setQuery(sql_insert_setup, param_insert_setup);
    //**************End Insert to interview setup*********************************************
   
    //***************************Insert Chairman**********************************************
    String icl_status_sent = "21";
    String sql_insert_chairman = "INSERT INTO interview_chairman_list(icl_status, sm_staff_id, is_refid) "
                            + "VALUES( ? , ? , ? )";
    String param_insert_chairman[] = { icl_status_sent, chairman_staff_id[0], ptj_is_refid };
    String icl_refid = mc.setQuery(sql_insert_chairman, param_insert_chairman, "icl_refid");
    //***************End Insert Chairman******************************************************
    
    //*****************Insert panel************************************************************
    String ipl_status_sent = "21";
    String sql_insert_panel = "INSERT INTO interview_panel_list(ipl_status, sm_staff_id) "
                            + "VALUES( ? , ? )";
    String[] param_insert_panel = new String[2];
    String[] ipl_refid = new String[panel_staff_id.length];
    
    for(int a = 0; a < panel_staff_id.length; a++)
    {
        param_insert_panel[0] = ipl_status_sent;
        param_insert_panel[1] = panel_staff_id[a];
        
        ipl_refid[a] = mc.setQuery(sql_insert_panel, param_insert_panel, "ipl_refid");
    }
    //*************End Insert panel************************************************************
    
    //***********Insert interview result************************
    String irm_cand_status_set = "2";
    String irm_ptj_status_accepted = "11";
    String sql_insert_result = "UPDATE interview_result_mark "
                            + "SET irm_cand_status = ? , "
                            + "irm_ptj_status = ? "
                            + "WHERE pa_refid = ? "
                            + "AND is_refid = ? ";
    String[] param_insert_result = new String[4];
    String irm_refid = "";
    
    String sql_select_result = "SELECT irm.irm_refid "
                            + "FROM interview_result_mark irm, pos_applied pa, interview_setup iss "
                            + "WHERE pa.pa_refid = irm.pa_refid "
                            + "AND iss.is_refid = irm.is_refid "
                            + "AND pa.pa_refid = ? "
                            + "AND iss.is_refid = ? ";
    String[] param_select_result = new String[2];
    ArrayList<ArrayList<String>> data_select_result;
    //***********End Insert interview result********************
    
    //***********Insert into IRM_ICM**************************
    String sql_insert_irm_icm = "INSERT INTO interview_irm_icm(irm_refid, ipl_refid) "
                            + "VALUES( ? , ? )";
    String[] param_insert_irm_icm = new String[2];
    String iii_refid = "";
    //*******End Insert into IRM_ICM**************************
    
    //****************************SELECT UNI CRITERIA*******************************//
    String sql_uni_criteria  = "SELECT iim.icm_refid, icm.icm_criteria "
                                + "FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii, interview_iii_mark iim, interview_criteria_mark icm "
                                + "WHERE iss.is_refid = irm.is_refid "
                                + "AND irm.irm_refid = iii.irm_refid "
                                + "AND iii.iii_refid = iim.iii_refid "
                                + "AND icm.icm_refid = iim.icm_refid "
                                + "AND iss.is_refid = ? "
                                + "GROUP BY iim.icm_refid, icm.icm_criteria ";
    String param_uni_criteria[] = { uni_is_refid };
    ArrayList<ArrayList<String>> data_select_iimrefid = mc.getQuery(sql_uni_criteria, param_uni_criteria);
    //*******************************************************************************//
    //********************************INSERT ELECTED CRITERIA************************//
    String sql_insert_criteria  = "INSERT INTO interview_iii_mark(iii_refid, icm_refid) "
                                + "VALUES ( ? ,? )";
    String[] param_insert_criteria = new String[2];
    String iim_refid = "";
    //*******************************************************************************//
    
    
    for(int a = 0; a < pa_refid.length; a++)
    {
        param_insert_result[0] = irm_cand_status_set;
        param_insert_result[1] = irm_ptj_status_accepted;
        param_insert_result[2] = pa_refid[a];
        param_insert_result[3] = ptj_is_refid;
        mc.setQuery(sql_insert_result, param_insert_result, "irm_refid");
        
        param_select_result[0] = pa_refid[a];
        param_select_result[1] = ptj_is_refid;
        data_select_result = mc.getQuery(sql_select_result, param_select_result);
        
        irm_refid = data_select_result.get(0).get(0);
        for(int b = 0; b < ipl_refid.length; b++)
        {
            param_insert_irm_icm[0] = irm_refid;
            param_insert_irm_icm[1] = ipl_refid[b];
            
            iii_refid = mc.setQuery(sql_insert_irm_icm, param_insert_irm_icm, "iii_refid");
            for(int c = 0; c < data_select_iimrefid.size(); c++)
            {
                param_insert_criteria[0] = iii_refid;
                param_insert_criteria[1] = data_select_iimrefid.get(c).get(0);
                iim_refid = mc.setQuery(sql_insert_criteria, param_insert_criteria, "iim_refid");
            }
        }
    }
     //*******************************************************************************//
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_saved_setup_list.jsp");
%>