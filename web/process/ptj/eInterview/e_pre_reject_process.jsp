<%-- 
    Document   : e_pre_reject_process.jsp
    Created on : Feb 13, 2016, 10:10:10 PM
    Author     : Habib
--%>

<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String uni_is_refid = request.getParameter("uni_is_refid");
    String ptj_is_refid = request.getParameter("ptj_is_refid");
    String pph_refid = request.getParameter("pph_refid");
    String dept_code = request.getParameter("dept_code");
    String irm_reason = request.getParameter("irm_reason");
    
    String pass_ptj = "PASS_PTJ";
    String reject = "12";
    String sql_irm_list = "SELECT irm.irm_refid "
                + "FROM interview_setup iss, interview_result_mark irm, department_main dm, position_ptj_hr pph, pos_applied pa "
                + "WHERE iss.is_refid = irm.is_refid "
                + "AND pph.pph_refid = pa.pph_refid "
                + "AND pa.pa_refid = irm.pa_refid "
                + "AND dm.dm_dept_desc = pph.pph_ptj "
                + "AND pph.pph_refid = ? "
                + "AND dm.dm_dept_code = ? "
                + "AND iss.is_refid = ? ";
    String param_irm_list[] = { pph_refid, dept_code, uni_is_refid };
    ArrayList<ArrayList<String>> data_irm_list = mc.getQuery(sql_irm_list, param_irm_list);
//    out.print(data_irm_list);
//    if(true)
//    {
//        return;
//    }
    String sql_reject = "UPDATE interview_result_mark "
                    + "SET irm_reason = ? , "
                    + "irm_ptj_status = ? "
                    + "WHERE irm_refid = ? ";
    String[] param_reject = new String[3];
    param_reject[0] = irm_reason;
    param_reject[1] = reject;
    
    for(int a = 0; a < data_irm_list.size(); a++)
    {
        param_reject[2] = data_irm_list.get(a).get(0);
        String res = mc.setQuery(sql_reject, param_reject);
    }
    
    String sql_ptj_reject = "UPDATE interview_result_mark "
                        + "SET irm_reason = ? , "
                        + "irm_ptj_status = ? "
                        + "WHERE is_refid = ? ";
    String param_ptj_reject[] = { irm_reason, reject, ptj_is_refid };
    String res2 = mc.setQuery(sql_ptj_reject, param_ptj_reject);
    
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_memo_list.jsp");
%>