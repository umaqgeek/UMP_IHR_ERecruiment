<%-- 
    Document   : e_int_pos_list
    Created on : Jan 28, 2016, 4:38:16 PM
    Author     : Habib
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "21";
    String canceled = "24";
    String ipl_refid = request.getParameter("ipl_refid");
    String is_refid = request.getParameter("is_refid");
    
    String sql_cancel_panel = "UPDATE interview_panel_list "
                            + "SET ipl_status = ? "
                            + "WHERE ipl_refid = ? ";
    String param_cancel_panel[] = { sent, ipl_refid };
    mc.setQuery(sql_cancel_panel, param_cancel_panel);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&is_refid="+is_refid+"&alert=0");
%>