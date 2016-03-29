<%-- 
    Document   : e_int_suggestnew_process
    Created on : Mar 21, 2016, 5:49:38 PM
    Author     : Habib
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String pph_refid = request.getParameter("pph_refid");
    String uni_is_refid = request.getParameter("uni_is_refid");
    String ptj_is_refid = request.getParameter("ptj_is_refid");
    
    String is_date = request.getParameter("new_ptj_is_date");
    String is_starttime = request.getParameter("new_ptj_is_starttime");
    String is_endtime = request.getParameter("new_ptj_is_endtime");
    //out.print(uni_is_refid+" "+pph_refid+" "+ptj_is_refid);
    
    String sql_new_suggest  = "UPDATE interview_setup "
                            + "SET is_date = ? , "
                            + "is_starttime = ? , "
                            + "is_endtime = ? "
                            + "WHERE is_refid = ? ";
    String param_new_suggest[] = { is_date, is_starttime, is_endtime, ptj_is_refid };
    mc.setQuery(sql_new_suggest, param_new_suggest);
    
    String sql_irm_pa = "SELECT irm.irm_refid "
                    + "FROM interview_result_mark irm, interview_setup iss, pos_applied pa, position_ptj_hr pph "
                    + "WHERE iss.is_refid = irm.is_refid "
                    + "AND pph.pph_refid = pa.pph_refid "
                    + "AND pa.pa_refid = irm.pa_refid "
                    + "AND iss.is_refid = ? "
                    + "AND pph.pph_refid = ? ";
    String param_irm_pa[] = { uni_is_refid, pph_refid };
    ArrayList<ArrayList<String>> data_irm_pa = mc.getQuery(sql_irm_pa, param_irm_pa);
//    out.print(data_irm_pa);
//    if(true)
//    {
//        return;
//    }
    
    String informed = "1";
    String irm_reason = "";
    String sql_uni_inform_ptj = "UPDATE interview_result_mark "
                            + "SET irm_ptj_status = ? , "
                            + "irm_reason = ? "
                            + "WHERE irm_refid = ? ";
    String[] param_uni_inform_ptj = new String[3];
    
    for(int a = 0; a < data_irm_pa.size(); a++)
    {
        param_uni_inform_ptj[0] = informed;
        param_uni_inform_ptj[1] = irm_reason;
        param_uni_inform_ptj[2] = data_irm_pa.get(a).get(0);
        mc.setQuery(sql_uni_inform_ptj, param_uni_inform_ptj);
    }
    
    String sql_ptj_inform_ptj = "UPDATE interview_result_mark "
                            + "SET irm_ptj_status = ? , "
                            + "irm_reason = ? "
                            + "WHERE is_refid = ? ";
    String param_ptj_inform_ptj[] = { informed, irm_reason, ptj_is_refid };
    mc.setQuery(sql_ptj_inform_ptj, param_ptj_inform_ptj);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp");
%>
