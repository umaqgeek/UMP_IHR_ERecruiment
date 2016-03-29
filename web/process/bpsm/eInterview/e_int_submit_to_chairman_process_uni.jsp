<%-- 
    Document   : e_int_submit_to_chairman_process_uni
    Created on : Mar 27, 2016, 4:41:49 AM
    Author     : Habib
--%>

<%
    String is_refid = request.getParameter("is_refid");
    String ipl_refid = request.getParameter("ipl_refid");
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_panel_start_uni_pos_list.jsp&is_refid="+is_refid+"&ipl_refid="+ipl_refid);
%>
