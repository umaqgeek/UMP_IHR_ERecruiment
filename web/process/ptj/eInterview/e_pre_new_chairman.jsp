<%-- 
    Document   : e_pre_new_chairman
    Created on : Feb 17, 2016, 11:52:13 PM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String is_refid = request.getParameter("is_refid");
    String dept_code = request.getParameter("dept_code");
    String sm_staff_id = request.getParameter("chairman_sm_staff_id");
    
    String sent = "21";
    String sql_new_chairman = "INSERT INTO interview_chairman_list(is_refid, icl_status, sm_staff_id) "
                            + "VALUES( ? , ? , ? )";
    String param_new_chairman[] = { is_refid, sent, sm_staff_id };
    mc.setQuery(sql_new_chairman, param_new_chairman);
    
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_committee_setup.jsp&is_refid="+is_refid+"&dept_code="+dept_code+"&alert=0");
%>
