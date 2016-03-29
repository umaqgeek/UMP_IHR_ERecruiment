<%-- 
    Document   : e_pre_submit_to_chairman_process_uni
    Created on : Mar 26, 2016, 3:21:35 AM
    Author     : Habib
--%>

<%
    String is_refid = request.getParameter("is_refid");
    String ipl_refid = request.getParameter("ipl_refid");
    
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_panel_start_uni_pos_list.jsp&is_refid="+is_refid+"&ipl_refid="+ipl_refid);
%>
