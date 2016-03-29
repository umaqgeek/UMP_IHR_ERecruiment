<%-- 
    Document   : e_int_invite_candidate_process
    Created on : Feb 5, 2016, 12:15:22 PM
    Author     : Habib
--%>
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayDeque"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String uni_is_refid = request.getParameter("is_refid");
    String uni_irm_refid[] = request.getParameterValues("irm_refid");
    String cand_sent = "21";
    String ptj_status_accepted = "11";
    String pass_ptj = "PASS_PTJ";
    String is_type_ptj = "PTJ";
//    out.print("IS_REFID : "+is_refid);
//    out.print("<br>");
//    for(int a = 0; a < irm_refid.length; a++)
//    {
//        out.print("IRM_REFID : "+irm_refid[a]);
//        out.print("<br>");
//    }
//    if(true)
//    {
//        return;
//    }
    
    String sql_send_invitation  = "UPDATE interview_result_mark "
                                + "SET irm_cand_status = ? "
                                + "WHERE irm_refid = ? ";
    String[] param_send_invitation = new String[2];
    String result = "";
    for(int a = 0; a < uni_irm_refid.length; a++)
    {
        param_send_invitation[0] = cand_sent;
        param_send_invitation[1] = uni_irm_refid[a];
        result = mc.setQuery(sql_send_invitation, param_send_invitation);
    }
    
//    //********************************SELECT pph from UNI Interview******************************************************
    String sql_select_ptj_pph = "SELECT pph.pph_refid "
                            + "FROM interview_setup iss, interview_result_mark irm, position_ptj_hr pph, pos_applied pa, filter f "
                            + "WHERE pph.pph_refid = pa.pph_refid "
                            + "AND pa.pa_refid = irm.pa_refid "
                            + "AND iss.is_refid = irm.is_refid "
                            + "AND pa.pa_refid = f.pa_refid "
                            + "AND irm.irm_ptj_status = ? "
                            + "AND f.f_ptj_status = ? "
                            + "AND iss.is_refid = ? "
                            + "GROUP BY pph.pph_refid";
    String param_select_ptj_pph[] = { ptj_status_accepted, pass_ptj, uni_is_refid };
    ArrayList<ArrayList<String>> data_select_ptj_pph = mc.getQuery(sql_select_ptj_pph, param_select_ptj_pph);
    //*****************************Select irm from ptj interview*******************************************
    String sql_ptj_irm = "SELECT iss.is_refid, iss.is_type, irm.irm_refid "
                            + "FROM interview_setup iss, interview_result_mark irm, position_ptj_hr pph, pos_applied pa, filter f "
                            + "WHERE pph.pph_refid = pa.pph_refid "
                            + "AND pa.pa_refid = irm.pa_refid "
                            + "AND iss.is_refid = irm.is_refid "
                            + "AND pa.pa_refid = f.pa_refid "
                            + "AND iss.is_type = ? "
                            + "AND irm.irm_ptj_status = ? "
                            + "AND f.f_ptj_status = ? "
                            + "AND pph.pph_refid = ? "
                            + "GROUP BY iss.is_refid, iss.is_type, irm.irm_refid";
    String[] param_ptj_irm = new String[4];
    ArrayList<ArrayList<String>> data_ptj_irm;
    //********************************************************************************************************
    String sql_send_invitation_ptj  = "UPDATE interview_result_mark "
                                + "SET irm_cand_status = ? "
                                + "WHERE irm_refid = ? ";
    String[] param_send_invitation_ptj = new String[2];
    String result_ptj = "";
    for(int a = 0; a < data_select_ptj_pph.size(); a++)
    {
        param_ptj_irm[0] = is_type_ptj;
        param_ptj_irm[1] = ptj_status_accepted;
        param_ptj_irm[2] = pass_ptj;
        param_ptj_irm[3] = data_select_ptj_pph.get(a).get(0);
//        out.print((a+1)+" . "+data_select_ptj_pph.get(a).get(0)+"<br>");
        data_ptj_irm = mc.getQuery(sql_ptj_irm, param_ptj_irm);
        
        for(int b = 0; b < data_ptj_irm.size(); b++)
        {
            param_send_invitation_ptj[0] = cand_sent;
            param_send_invitation_ptj[1] = data_ptj_irm.get(b).get(2);
            result_ptj = mc.setQuery(sql_send_invitation_ptj, param_send_invitation_ptj);
//            out.print((a+1+"."+(b+1))+" . "+data_ptj_irm.get(b).get(2)+"<br>");
        }
    }
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_invite_candidate.jsp&is_refid="+uni_is_refid);
%>
