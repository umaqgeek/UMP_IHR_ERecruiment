<%-- 
    Document   : e_int_save_criteria_process
    Created on : Feb 10, 2016, 9:30:01 PM
    Author     : Habib
--%>

<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String icm_criteria = request.getParameter("icm_criteria").toUpperCase();
    String icm_minmark = request.getParameter("icm_minmark");
    String icm_maxmark = request.getParameter("icm_maxmark");
    
    String sql_insert_criteria = "INSERT INTO interview_criteria_mark(icm_criteria, icm_minmark, icm_maxmark) "
                            + "VALUES( ? , ? , ? )";
    String param_insert_criteria[] = { icm_criteria, icm_minmark, icm_maxmark };
    String result = mc.setQuery(sql_insert_criteria, param_insert_criteria);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_criteria_bank.jsp");
%>
