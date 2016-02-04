<%-- 
    Document   : e_int_new_chairman
    Created on : Feb 3, 2016, 1:17:04 AM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "SENT";
    String pph_refid = request.getParameter("pph_refid");
    String ic_refid = request.getParameter("ic_refid");
    String u_refid = request.getParameter("new_chairman");
    
    String sql_assign_chairman = "INSERT INTO INTERVIEW_ASSIGN_LIST (IC_REFID, U_REFID, IAL_STATUS) "
                            + "VALUES( ? , ? , ? )";
    String param_assign_chairman[] = { ic_refid, u_refid, sent };
    mc.setQuery(sql_assign_chairman, param_assign_chairman);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&ic_refid="+ic_refid+"&alert=0");
%>
