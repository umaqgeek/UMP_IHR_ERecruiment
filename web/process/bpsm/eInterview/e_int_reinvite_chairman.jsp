<%-- 
    Document   : e_int_reinvite_chairman
    Created on : Feb 2, 2016, 10:45:37 PM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "21";
    String canceled = "24";
    String is_refid = request.getParameter("is_refid");
    String icl_refid = request.getParameter("icl_refid");
    
    String sql_sent_chairman = "UPDATE interview_chairman_list "
                            + "SET icl_status = ? "
                            + "WHERE icl_refid = ? ";
    String param_sent_chairman[] = { sent, icl_refid };
    String res = mc.setQuery(sql_sent_chairman, param_sent_chairman);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&is_refid="+is_refid);
%>