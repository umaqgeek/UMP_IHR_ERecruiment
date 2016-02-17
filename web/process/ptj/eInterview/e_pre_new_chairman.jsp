<%-- 
    Document   : e_pre_new_chairman
    Created on : Feb 17, 2016, 11:52:13 PM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    String is_refid = request.getParameter("is_refid");
    String dept_code = request.getParameter("dept_code");
    String sm_staff_id = request.getParameter("sm_staff_id");
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_committee_setup.jsp&is_refid="+is_refid+"&dept_code="+dept_code+"&alert=0");
%>
