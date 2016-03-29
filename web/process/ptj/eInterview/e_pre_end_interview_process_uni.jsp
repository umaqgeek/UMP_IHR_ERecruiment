<%-- 
    Document   : e_pre_end_interview_process_uni
    Created on : Mar 26, 2016, 6:28:48 AM
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
    
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_my_invitation_list.jsp");
%>