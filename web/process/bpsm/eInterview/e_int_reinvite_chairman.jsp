<%-- 
    Document   : e_int_reinvite_chairman
    Created on : Feb 2, 2016, 10:45:37 PM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "SENT";
    String canceled = "CANCELED";
    String pph_refid = request.getParameter("pph_refid");
    String ic_refid = request.getParameter("ic_refid");
    String u_refid = request.getParameter("u_refid");
    
    String sql_cancel_chairman = "UPDATE INTERVIEW_ASSIGN_LIST "
                            + "SET IAL_STATUS = ? "
                            + "WHERE IC_REFID = ? "
                            + "AND U_REFID = ? ";
    String param_cancel_chairman[] = { sent, ic_refid, u_refid };
    String res = mc.setQuery(sql_cancel_chairman, param_cancel_chairman);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&ic_refid="+ic_refid+"&alert=0");
%>