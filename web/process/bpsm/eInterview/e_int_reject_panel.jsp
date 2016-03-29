<%-- 
    Document   : e_int_reject_panel
    Created on : Feb 4, 2016, 1:50:31 AM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "21";
    String canceled = "24";
    String accepted = "22";
    String rejected = "23";
    
    String ipl_refid = request.getParameter("ipl_refid");
    
    String sql_reject_panel = "UPDATE interview_panel_list "
                            + "SET ipl_status = ? "
                            + "WHERE ipl_refid = ? ";
    String param_reject_panel[] = { rejected, ipl_refid };
    String res = mc.setQuery(sql_reject_panel, param_reject_panel);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp");
%>
