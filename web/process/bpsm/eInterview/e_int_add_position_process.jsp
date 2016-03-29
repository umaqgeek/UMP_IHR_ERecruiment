<%-- 
    Document   : e_int_add_position
    Created on : Mar 23, 2016, 4:04:05 PM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String[] pph_refid = request.getParameterValues("pph_refid");
    String is_refid = request.getParameter("is_refid");
    
    String pass_ptj = "PASS_PTJ";
    String sql_pa_list = "SELECT pa.pa_refid, pa.pa_status "
                    + "FROM pos_applied pa, position_ptj_hr pph "
                    + "WHERE pph.pph_refid = pa.pph_refid "
                    + "AND pa.pa_status = ? "
                    + "AND pph.pph_refid = ? ";
    String[] param_pa_list = new String[2];
    ArrayList<ArrayList<String>> data_pa_list;
    
    String sql_panel_list = "SELECT ipl.ipl_refid "
                    +"FROM interview_setup iss, interview_result_mark irm, interview_panel_list ipl, interview_irm_icm iii, staff_main sm, department_main dm, interview_invite_status iis, staff_main_archive052014 sma "
                    +"WHERE iss.is_refid = irm.is_refid "
                    +"AND irm.irm_refid = iii.irm_refid "
                    +"AND ipl.ipl_refid = iii.ipl_refid "
                    +"AND sm.sm_staff_id = ipl.sm_staff_id "
                    +"AND dm.dm_dept_code = sm.sm_dept_code "
                    +"AND sm.sm_staff_id = sma.sm_staff_id "
                    +"AND iis.iis_code = ipl.ipl_status "
                    +"AND iss.is_refid = ? "
                    +"GROUP BY ipl.ipl_refid";
    String param_panel_list[] = { is_refid };
    ArrayList<ArrayList<String>> data_panel_list = mc.getQuery(sql_panel_list, param_panel_list);
    
    //***********Insert interview result************************
    String irm_ptj_status_informed = "1";
    String irm_cand_status_set = "2";
    String sql_insert_result = "INSERT INTO interview_result_mark(irm_cand_status, irm_ptj_status, pa_refid, is_refid) "
                            + "VALUES( ? , ? , ? , ? )";
    String[] param_insert_result = new String[4];
    String irm_refid = "";
    //***********End Insert interview result********************
    //***********Insert into IRM_ICM**************************
    String sql_insert_irm_icm = "INSERT INTO interview_irm_icm(irm_refid, ipl_refid) "
                            + "VALUES( ? , ? )";
    String[] param_insert_irm_icm = new String[2];
    String iii_refid = "";
    //*******End Insert into IRM_ICM**************************
    //****************************SELECT UNI CRITERIA*******************************//
    String sql_uni_criteria  = "SELECT iim.icm_refid "
                                + "FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii, interview_iii_mark iim, interview_criteria_mark icm "
                                + "WHERE iss.is_refid = irm.is_refid "
                                + "AND irm.irm_refid = iii.irm_refid "
                                + "AND iii.iii_refid = iim.iii_refid "
                                + "AND icm.icm_refid = iim.icm_refid "
                                + "AND iss.is_refid = ? "
                                + "GROUP BY iim.icm_refid";
    String param_uni_criteria[] = { is_refid };
    ArrayList<ArrayList<String>> data_select_iimrefid = mc.getQuery(sql_uni_criteria, param_uni_criteria);
    
    //*******************************************************************************//
    //********************************INSERT ELECTED CRITERIA************************//
    String sql_insert_criteria  = "INSERT INTO interview_iii_mark(iii_refid, icm_refid) "
                                + "VALUES ( ? ,? )";
    String[] param_insert_criteria = new String[2];
    String iim_refid = "";
    //*******************************************************************************//
    
    for(int a = 0; a<pph_refid.length; a++)
    {
        param_pa_list[0] = pass_ptj;
        param_pa_list[1] = pph_refid[a];
        data_pa_list = mc.getQuery(sql_pa_list, param_pa_list);
        
        for(int b = 0; b < data_pa_list.size();b++)
        {
            param_insert_result[0] = irm_cand_status_set;
            param_insert_result[1] = irm_ptj_status_informed;
            param_insert_result[2] = data_pa_list.get(b).get(0);
            param_insert_result[3] = is_refid;
            irm_refid = mc.setQuery(sql_insert_result, param_insert_result, "irm_refid");
            
            for(int c = 0; c < data_panel_list.size(); c++)
            {
                param_insert_irm_icm[0] = irm_refid;
                param_insert_irm_icm[1] = data_panel_list.get(a).get(0);
                iii_refid = mc.setQuery(sql_insert_irm_icm, param_insert_irm_icm, "iii_refid");
                
                for(int d = 0; d < data_select_iimrefid.size(); d++)
                {
                    param_insert_criteria[0] = iii_refid;
                    param_insert_criteria[1] = data_select_iimrefid.get(d).get(0);
                    iim_refid = mc.setQuery(sql_insert_criteria, param_insert_criteria, "iim_refid");
                }
            }
        }
    }
    
    
    
    
    
    
    //************************PTJ*************************
    String is_type_ptj = "PTJ";
    String sql_insert_ptj_setup = "INSERT INTO interview_setup(is_date, is_starttime, is_endtime, is_type, is_status) "
                            + "VALUES ( ? , ? , ? , ? , ? )";
    String[] param_insert_ptj_setup = new String[5];
    String ptj_is_refid;
    String result = "";
    
    //**********PTJ Interview Data********************************
    for(int a = 0; a<pph_refid.length; a++)
    {
        ptj_is_refid = "";
        
        param_insert_ptj_setup[0] = Func.getOracleDate(request.getParameter("ptj_is_date_"+pph_refid[a]), "yyyy-MM-dd");
        param_insert_ptj_setup[1] = request.getParameter("ptj_is_starttime_"+pph_refid[a]);
        param_insert_ptj_setup[2] = request.getParameter("ptj_is_endtime_"+pph_refid[a]);
        param_insert_ptj_setup[3] = is_type_ptj;
        param_insert_ptj_setup[4] = irm_ptj_status_informed;
        ptj_is_refid = mc.setQuery(sql_insert_ptj_setup, param_insert_ptj_setup, "is_refid");
        
        param_pa_list[0] = pass_ptj;
        param_pa_list[1] = pph_refid[a];
        data_pa_list = mc.getQuery(sql_pa_list, param_pa_list);
        
        for(int b = 0; b < data_pa_list.size(); b++)
        {
            param_insert_result[0] = irm_cand_status_set;
            param_insert_result[1] = irm_ptj_status_informed;
            param_insert_result[2] = data_pa_list.get(b).get(0);
            param_insert_result[3] = ptj_is_refid;
            result = mc.setQuery(sql_insert_result, param_insert_result);
        }
    }
    
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&is_refid="+is_refid);
%>