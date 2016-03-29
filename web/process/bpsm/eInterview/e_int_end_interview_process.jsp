<%-- 
    Document   : e_int_end_interview_process
    Created on : Feb 7, 2016, 1:29:39 AM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String is_refid = request.getParameter("is_refid");
    String result = "44";
    String sql_finish_interview = "UPDATE interview_setup "
                                + "SET is_status = ? "
                                + "WHERE is_refid = ? "; 
    String param_finish_interview[] = { result, is_refid };
    mc.setQuery(sql_finish_interview, param_finish_interview);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp");
%>