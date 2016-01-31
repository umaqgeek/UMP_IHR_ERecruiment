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
    String[] ic_type = request.getParameterValues("ic_type");
    String ic_interview_datetime = Func.getDate(request.getParameter("ic_interview_date"));
    String[] ic_start_time = request.getParameterValues("ic_start_time");
    String[] ic_end_time = request.getParameterValues("ic_end_time");
    String[] ic_venue = request.getParameterValues("ic_venue");
    
//    for(int a =0; a < pph_refid.length; a++)
//    {
//        out.print(pph_refid[a]+"<br>");
//        
//        for(int b =0; b < ic_type.length; b++)
//        {
//            out.print(ic_type[b]+" "+ic_start_time[b]+" "+ic_end_time[b]+" "+ic_venue[b]+"<br>");
//            String pa_status_pass_ptj = "PASS_PTJ";
//            String sql_select_applicant = "SELECT PA.PA_REFID "
//                    + "FROM POSITION_PTJ_HR PPH, POS_APPLIED PA "
//                    + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
//                    + "AND PA.PPH_REFID = ? "
//                    + "AND PA.PA_STATUS = ? ";
//            String param_select_applicant[] = { pph_refid[0], pa_status_pass_ptj };
//            ArrayList<ArrayList<String>> data_select_applicant = mc.getQuery(sql_select_applicant, param_select_applicant);
//
//            if(data_select_applicant.size() > 0)
//            {
//                out.print(data_select_applicant.size());
//            }
//        }
//    }
//    
//    if(true)
//    {
//        return;
//    }
//    for(int a=0; a<panel.length; a++)
//    {
//        out.println(panel[a]);
//    }
//    
//    if(true)
//    {
//        return;
//    }
    
    for(int a=0;a<pph_refid.length; a++)
    {
        for(int b=0; b < ic_type.length; b++)
        {
            //Insert Interview Chairman
            String sql_insert_chairman = "INSERT INTO INTERVIEW_CHAIRMAN(IC_TYPE, IC_INTERVIEW_DATETIME, IC_STARTTIME, IC_ENDTIME, IC_VENUE) "
                                       + "VALUES( ? , ? , ? , ? , ? ) ";
            String param_insert_chairman[] = { ic_type[b], ic_interview_datetime, ic_start_time[b], ic_end_time[b], ic_venue[b] }; 
            String ic_refid = mc.setQuery(sql_insert_chairman, param_insert_chairman, "IC_REFID");

            //Insert Chairman to Assigned list
    //        String sql_assign_chairman = "INSERT INTO INTERVIEW_ASSIGN_LIST (IC_REFID, U_REFID) "
    //                                    + "VALUES( ? , ? )";
    //        String param_assign_chairman[] = { ic_refid, chairman_u_refid };
    //        mc.setQuery(sql_assign_chairman, param_assign_chairman);

            //Select Interview Chairman
            String pa_status_pass_ptj = "PASS_PTJ";
            String sql_select_applicant = "SELECT PA.PA_REFID "
                    + "FROM POSITION_PTJ_HR PPH, POS_APPLIED PA "
                    + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
                    + "AND PA.PPH_REFID = ? "
                    + "AND PA.PA_STATUS = ? ";
            String param_select_applicant[] = { pph_refid[a], pa_status_pass_ptj };
            ArrayList<ArrayList<String>> data_select_applicant = mc.getQuery(sql_select_applicant, param_select_applicant);

            if(data_select_applicant.size() > 0)
            {
                String pa_refid = "";
                String sql_insert_int_result = "INSERT INTO INTERVIEW_RESULT (IC_REFID, PA_REFID) "
                                         + "VALUES ( ? , ? )";
                String[] param_insert_int_result = new String[2];

                for(int row=0; row < data_select_applicant.size(); row++)
                {
                    pa_refid = data_select_applicant.get(row).get(0);
                    param_insert_int_result[0] = ic_refid;
                    param_insert_int_result[1] = pa_refid;
                    mc.setQuery(sql_insert_int_result, param_insert_int_result, "IR_REFID");
                }
            }
        }
    }
    
//    String ic_interview_datetime2 = request.getParameter("ic_interview_date2");
//    String ic_start_time2 = request.getParameter("ic_start_time2");
//    String ic_end_time2 = request.getParameter("ic_end_time2");
//    String ic_venue2 = request.getParameter("ic_venue2");
//    String chairman_u_refid2 = request.getParameter("chairman2");
//    String[] panel2 = request.getParameterValues("panels2");
//    int itotal_panels2 = panel2.length;
//    
//    for(int a=0;a<pph_refid.length; a++)
//    {
//        //Insert Interview Chairman
//        String sql_insert_chairman = "INSERT INTO INTERVIEW_CHAIRMAN(IC_INTERVIEW_DATETIME, IC_VENUE) "
//                                   + "VALUES( ? , ? ) ";
//        String param_insert_chairman[] = { ic_interview_datetime2, ic_venue2 }; 
//        String ic_refid = mc.setQuery(sql_insert_chairman, param_insert_chairman, "IC_REFID");
//
//        //Insert Chairman to Assigned list
//        String sql_assign_chairman = "INSERT INTO INTERVIEW_ASSIGN_LIST (IC_REFID, U_REFID) "
//                                    + "VALUES( ? , ? )";
//        String param_assign_chairman[] = { ic_refid, chairman_u_refid2 };
//        mc.setQuery(sql_assign_chairman, param_assign_chairman);
//
//        //Select Interview Chairman
//        String pa_status_pass_ptj = "PASS_PTJ";
//        String sql_select_applicant = "SELECT PA.PA_REFID "
//                + "FROM POSITION_PTJ_HR PPH, POS_APPLIED PA "
//                + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
//                + "AND PA.PPH_REFID = ? "
//                + "AND PA.PA_STATUS = ? ";
//        String param_select_applicant[] = { pph_refid[0], pa_status_pass_ptj };
//        ArrayList<ArrayList<String>> data_select_applicant = mc.getQuery(sql_select_applicant, param_select_applicant);
//
//        if(data_select_applicant.size() > 0)
//        {
//            String pa_refid = "";
//            String sql_insert_int_result = "INSERT INTO INTERVIEW_RESULT (IC_REFID, PA_REFID) "
//                                     + "VALUES ( ? , ? )";
//            String[] param_insert_int_result = new String[2];
//            String ir_refid = "";
//
//            String sql_insert_panel = "INSERT INTO INTERVIEW_PANELS(IR_REFID) "
//                    + "VALUES( ? )";
//            String[] param_insert_panel = new String[1];
//            
//            String sql_assign_panel = "INSERT INTO INTERVIEW_ASSIGN_LIST (IP_REFID, U_REFID) "
//                                    + "VALUES( ? , ? )";
//            String[] param_assign_panel = new String[2];
//            String ip_refid = "";
//            for(int row=0; row < data_select_applicant.size(); row++)
//            {
//                pa_refid = data_select_applicant.get(row).get(0);
//                param_insert_int_result[0] = ic_refid;
//                param_insert_int_result[1] = pa_refid;
//                ir_refid = mc.setQuery(sql_insert_int_result, param_insert_int_result, "IR_REFID");
//
//                for(int panel_count = 1; panel_count <= itotal_panels2; panel_count++)
//                {
//                    param_insert_panel[0] = ir_refid;
//                    ip_refid = mc.setQuery(sql_insert_panel, param_insert_panel, "IP_REFID");
//                    
//                    param_assign_panel[0] = ip_refid;
//                    param_assign_panel[1] = panel2[panel_count-1];
//                    mc.setQuery(sql_assign_panel, param_assign_panel);
//                }
//            }
//        }
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_pos_list.jsp");
%>