<%-- 
    Document   : e_int_reject_chairman
    Created on : Feb 4, 2016, 1:04:10 AM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "21";
    String accepted = "22";
    String rejected = "23";
    String canceled = "24";
    String is_refid = request.getParameter("is_refid");
    String sm_staff_id = request.getParameter("chairman_sm_staff_id");
    
    String sql_reject_chairman = "UPDATE interview_chairman_list "
                            + "SET icl_status = ? "
                            + "WHERE is_refid = ? "
                            + "AND sm_staff_id = ? ";
    String param_reject_chairman[] = { rejected, is_refid, sm_staff_id };
    String res = mc.setQuery(sql_reject_chairman, param_reject_chairman);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp");
%>
