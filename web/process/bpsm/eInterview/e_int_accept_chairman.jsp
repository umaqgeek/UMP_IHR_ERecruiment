<%-- 
    Document   : e_int_accept_chairman
    Created on : Feb 4, 2016, 12:44:01 AM
    Author     : Habib
--%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "21";
    String canceled = "24";
    String accepted = "22";
    String is_refid = request.getParameter("is_refid");
    String sm_staff_id = request.getParameter("chairman_sm_staff_id");
    
    String sql_accept_chairman = "UPDATE interview_chairman_list "
                            + "SET icl_status = ? "
                            + "WHERE is_refid = ? "
                            + "AND sm_staff_id = ? ";
    String param_accept_chairman[] = { accepted, is_refid, sm_staff_id };
    String res = mc.setQuery(sql_accept_chairman, param_accept_chairman);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp");
%>
