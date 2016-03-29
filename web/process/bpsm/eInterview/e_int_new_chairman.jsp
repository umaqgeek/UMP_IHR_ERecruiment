<%-- 
    Document   : e_int_new_chairman
    Created on : Feb 3, 2016, 1:17:04 AM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "21";
    String chairman_staff_id = request.getParameter("chairman_staff_id");
    String is_refid = request.getParameter("is_refid");
    
    String sql_assign_chairman = "INSERT INTO interview_chairman_list (icl_status, sm_staff_id, is_refid) "
                                + "VALUES( ? , ? , ? )";
    String param_assign_chairman[] = { sent, chairman_staff_id, is_refid };
    mc.setQuery(sql_assign_chairman, param_assign_chairman);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&is_refid="+is_refid+"&alert=0");
%>
