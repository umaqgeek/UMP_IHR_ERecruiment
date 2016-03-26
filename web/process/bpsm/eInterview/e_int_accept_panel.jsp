<%-- 
    Document   : e_int_accept_panel
    Created on : Feb 4, 2016, 1:29:49 AM
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
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp");
%>
