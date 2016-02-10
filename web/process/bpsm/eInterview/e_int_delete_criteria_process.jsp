<%-- 
    Document   : e_int_delete_criteria_process
    Created on : Feb 10, 2016, 10:13:30 PM
    Author     : Habib
--%>

<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String icm_refid = request.getParameter("icm_refid");
    
    String sql_insert_criteria = "DELETE FROM interview_criteria_mark "
                            + "WHERE icm_refid = ? ";
    String param_insert_criteria[] = { icm_refid };
    String result = mc.setQuery(sql_insert_criteria, param_insert_criteria);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_criteria_bank.jsp");
%>
