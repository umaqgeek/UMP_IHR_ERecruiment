<%--
    Document   : e_int_pos_list
    Created on : Jan 28, 2016, 4:38:16 PM
    Author     : Habib
--%>
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String[] pph_refid = request.getParameterValues("pph_refid");
    String is_type = request.getParameter("is_type");
    String is_date = Func.getOracleDate(request.getParameter("is_date"), "yyyy-MM-dd");
    String is_starttime = request.getParameter("is_starttime");
    String is_endtime = request.getParameter("is_endtime");
    String is_venue = request.getParameter("is_venue").toUpperCase();
    String chairman_staff_id = request.getParameter("chairman_staff_id");
    String panel_staff_id[] = request.getParameterValues("panel_staff_id");
    
    //************************ Validate Duplicate Person *****************************
    for(int a=0; a<panel_staff_id.length; a++)
    {
        if(chairman_staff_id.equals(panel_staff_id[a]))
        {
            String[] selected_pos = request.getParameterValues("pph_refid");
            String and = "&selected_pos";
            String equals = "=";
            String sCount = "";
            String add_param = "";
            String alert = "&alert=1";
            String sSize = "&selected_size="+Integer.toString(selected_pos.length);
            String link_to_setup = "../../../process.jsp?p=BPSM/E-Interview/e_int_pos_setup.jsp"+alert+sSize;
            for(int b=0; b < selected_pos.length; b++)
            {
                sCount = Integer.toString(b);
                add_param = and+sCount+equals+selected_pos[b];
                link_to_setup = link_to_setup+add_param;
            //    out.print("link: "+link_to_setup+"<br>");
            }
            response.sendRedirect(link_to_setup);
            return;
        };
    }
    
    //********Get all pa_refid******************************************************************
    String pass_ptj = "PASS_PTJ";
    String sql_pa_list = "SELECT pa.pa_refid "
                    + "FROM pos_applied pa "
                    + "WHERE pa.pa_status = ? "
                    + "AND pa.pph_refid = ? ";
    String[] param_pa_list = new String[2];
    ArrayList<ArrayList<String>> data_pa_list;
    //*****End Get all pa_refid******************************************************************
    
    //******************Insert to interview setup*********************************************
    String is_status_saved = "SAVED";
    String sql_insert_setup = "INSERT INTO interview_setup(is_date, is_starttime, is_endtime, is_venue, is_type, is_status) "
                            + "VALUES ( ? , ? , ? , ? , ? , ? )";
    String param_insert_setup[] = { is_date, is_starttime, is_endtime, is_venue, is_type, is_status_saved};
    String is_refid = mc.setQuery(sql_insert_setup, param_insert_setup, "is_refid");
    //**************End Insert to interview setup*********************************************
   
    //*****************Insert Chairman**********************************************
    String icl_status_set = "SET";
    String sql_insert_chairman = "INSERT INTO interview_chairman_list(icl_status, sm_staff_id, is_refid) "
                            + "VALUES( ? , ? , ? )";
    String param_insert_chairman[] = { icl_status_set, chairman_staff_id, is_refid };
    String icl_refid = mc.setQuery(sql_insert_chairman, param_insert_chairman, "icl_refid");
    //***************End Insert Chairman********************************************
    
    //*****************Insert panel************************************************************
    String ipl_status_set = "SET";
    String sql_insert_panel = "INSERT INTO interview_panel_list(ipl_status, sm_staff_id) "
                            + "VALUES( ? , ? )";
    String[] param_insert_panel = new String[2];
    String[] ipl_refid = new String[panel_staff_id.length];
    
    for(int a = 0; a < panel_staff_id.length; a++)
    {
        param_insert_panel[0] = ipl_status_set;
        param_insert_panel[1] = panel_staff_id[a];
        
        ipl_refid[a] = mc.setQuery(sql_insert_panel, param_insert_panel, "ipl_refid");
    }
    //*************End Insert panel************************************************************
//    out.print(is_refid);
    
    //***********Insert interview result************************
    String sql_insert_result = "INSERT INTO interview_result_mark(pa_refid, is_refid) "
                            + "VALUES( ? , ? )";
    String[] param_insert_result = new String[2];
    String irm_refid = "";
    //***********End Insert interview result********************
    
    //***********Insert into IRM_ICM**************************
    String sql_insert_irm_icm = "INSERT INTO interview_irm_icm(irm_refid, ipl_refid) "
                            + "VALUES( ? , ? )";
    String[] param_insert_irm_icm = new String[2];
    String iii_refid = "";
    //*******End Insert into IRM_ICM**************************
    
    for(int a = 0; a<pph_refid.length; a++)
    {
        param_pa_list[0] = pass_ptj;
        param_pa_list[1] = pph_refid[a];
        data_pa_list = mc.getQuery(sql_pa_list, param_pa_list);
        
        for(int b = 0; b < data_pa_list.size();b++)
        {
            param_insert_result[0] = data_pa_list.get(b).get(0);
            param_insert_result[1] = is_refid;
            irm_refid = mc.setQuery(sql_insert_result, param_insert_result, "irm_refid");
            
            for(int c = 0; c < ipl_refid.length; c++)
            {
                param_insert_irm_icm[0] = irm_refid;
                param_insert_irm_icm[1] = ipl_refid[c];
                iii_refid = mc.setQuery(sql_insert_irm_icm, param_insert_irm_icm);
            }
        }
        
//        out.print("<br><br>Pph refid: "+pph_refid[a]+"<br>"
//                + "Pa count: "+data_pa_list.size()+"<br>"
//                + "Date: "+is_date+"<br>"
//                + "Start: "+is_starttime+"<br>"
//                + "End: "+is_endtime+"<br>"
//                + "Venue: "+is_venue+"<br>"
//                + "Type: "+is_type);
    }
    
//    if(true)
//    {
//        return;
//    }
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp");
%>