<%-- 
    Document   : e_pre_accept_panel
    Created on : Feb 26, 2016, 3:49:50 PM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "21";
    String canceled = "24";
    String accepted = "22";
    String ipl_refid = request.getParameter("ipl_refid");
    
    String sql_accept_panel = "UPDATE interview_panel_list "
                            + "SET ipl_status = ? "
                            + "WHERE ipl_refid = ? ";
    String param_accept_panel[] = { accepted, ipl_refid };
    String res = mc.setQuery(sql_accept_panel, param_accept_panel);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_my_invitation_list.jsp");
%>