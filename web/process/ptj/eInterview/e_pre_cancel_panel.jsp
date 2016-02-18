<%-- 
    Document   : e_pre_cancel_panel
    Created on : Feb 17, 2016, 1:56:14 PM
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
    String ipl_refid = request.getParameter("ipl_refid");
    
    String sql_cancel_panel = "UPDATE interview_panel_list "
                            + "SET ipl_status = ? "
                            + "WHERE ipl_refid = ? "
                            + "AND sm_staff_id = ? ";
    String param_cancel_panel[] = { canceled, ipl_refid, sm_staff_id };
    String res = mc.setQuery(sql_cancel_panel, param_cancel_panel);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_committee_setup.jsp&is_refid="+is_refid+"&dept_code="+dept_code+"&alert=0");
%>
