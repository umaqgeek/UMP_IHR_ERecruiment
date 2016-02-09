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
//    MainClient mc = new MainClient(DBConn.getHost());
//    String[] pph_refid = request.getParameterValues("pph_refid");
//    String ic_type = request.getParameter("ic_type");
//    String ic_interview_datetime = Func.getDate(request.getParameter("ic_interview_date"));
//    String ic_start_time = request.getParameter("ic_start_time");
//    String ic_end_time = request.getParameter("ic_end_time");
//    String ic_venue = request.getParameter("ic_venue").toUpperCase();
//    not this
/*    for(int a =0; a < pph_refid.length; a++)
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
//    }*/
    
 //   this
//    for(int a=0;a<pph_refid.length; a++)
//    {
//        //Insert Interview Chairman
//        String sql_insert_chairman = "INSERT INTO INTERVIEW_CHAIRMAN(IC_TYPE, IC_INTERVIEW_DATETIME, IC_STARTTIME, IC_ENDTIME, IC_VENUE) "
//                                   + "VALUES( ? , ? , ? , ? , ? ) ";
//        String param_insert_chairman[] = { ic_type, ic_interview_datetime, ic_start_time, ic_end_time, ic_venue }; 
//        String ic_refid = mc.setQuery(sql_insert_chairman, param_insert_chairman, "IC_REFID");
//
//        String pa_status_pass_ptj = "PASS_PTJ";
//        String sql_select_applicant = "SELECT PA.PA_REFID "
//                + "FROM POSITION_PTJ_HR PPH, POS_APPLIED PA "
//                + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
//                + "AND PA.PPH_REFID = ? "
//                + "AND PA.PA_STATUS = ? ";
//        String param_select_applicant[] = { pph_refid[a], pa_status_pass_ptj };
//        ArrayList<ArrayList<String>> data_select_applicant = mc.getQuery(sql_select_applicant, param_select_applicant);
//
//        if(data_select_applicant.size() > 0)
//        {
//            String pa_refid = "";
//            String sql_insert_int_result = "INSERT INTO INTERVIEW_RESULT (IC_REFID, PA_REFID) "
//                                     + "VALUES ( ? , ? )";
//            String[] param_insert_int_result = new String[2];
//
//            for(int row=0; row < data_select_applicant.size(); row++)
//            {
//                pa_refid = data_select_applicant.get(row).get(0);
//                param_insert_int_result[0] = ic_refid;
//                param_insert_int_result[1] = pa_refid;
//                mc.setQuery(sql_insert_int_result, param_insert_int_result, "IR_REFID");
//            }
//
//        }
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp");
%>