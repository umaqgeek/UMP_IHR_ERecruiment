<%-- 
    Document   : e_int_update_criteria_process
    Created on : Feb 10, 2016, 10:04:28 PM
    Author     : Habib
--%>

<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String icm_refid = request.getParameter("icm_refid");
    String icm_criteria = request.getParameter("icm_criteria").toUpperCase();
    String icm_minmark = request.getParameter("icm_minmark");
    String icm_maxmark = request.getParameter("icm_maxmark");
    
    String sql_insert_criteria = "UPDATE interview_criteria_mark "
                            + "SET icm_criteria = ? , "
                            + "icm_minmark = ? , "
                            + "icm_maxmark = ? "
                            + "WHERE icm_refid = ? ";
    String param_insert_criteria[] = { icm_criteria, icm_minmark, icm_maxmark, icm_refid };
    String result = mc.setQuery(sql_insert_criteria, param_insert_criteria);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_criteria_bank.jsp");
%>
