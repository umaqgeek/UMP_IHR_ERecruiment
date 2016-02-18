<%-- 
    Document   : e_pre_go_to_setup
    Created on : Feb 14, 2016, 2:18:15 PM
    Author     : Habib
--%>

<%
    String is_refid = request.getParameter("is_refid");
    String dept_code = request.getParameter("dept_code");
    
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_setup.jsp&is_refid="+is_refid+"&dept_code="+dept_code+"&alert=0");
%>