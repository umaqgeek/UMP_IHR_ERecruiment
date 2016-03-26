<%-- 
    Document   : e_pre_go_to_setup
    Created on : Feb 14, 2016, 2:18:15 PM
    Author     : Habib
--%>

<%
    String is_refid = request.getParameter("ptj_is_refid");
    String dept_code = request.getParameter("dept_code");
    String uni_is_refid = request.getParameter("uni_is_refid");
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_setup.jsp&ptj_is_refid="+is_refid+"&dept_code="+dept_code+"&uni_is_refid="+uni_is_refid+"&alert=0");
%>