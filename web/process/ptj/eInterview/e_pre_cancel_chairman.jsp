<%-- 
    Document   : e_pre_cancel_chairman
    Created on : Feb 17, 2016, 11:36:03 AM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "21";
    String canceled = "24";
    String is_refid = request.getParameter("is_refid");
    String dept_code = request.getParameter("dept_code");
    String sm_staff_id = request.getParameter("sm_staff_id");
    
    String sql_cancel_chairman = "UPDATE interview_chairman_list "
                            + "SET icl_status = ? "
                            + "WHERE is_refid = ? "
                            + "AND sm_staff_id = ? ";
    String param_cancel_chairman[] = { canceled, is_refid, sm_staff_id };
    String res = mc.setQuery(sql_cancel_chairman, param_cancel_chairman);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_committee_setup.jsp&dept_code="+dept_code+"&is_refid="+is_refid+"&alert=0");
%>