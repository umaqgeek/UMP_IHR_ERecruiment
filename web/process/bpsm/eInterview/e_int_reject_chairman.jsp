<%-- 
    Document   : e_int_reject_chairman
    Created on : Feb 4, 2016, 1:04:10 AM
    Author     : User
--%>

<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
//    MainClient mc = new MainClient(DBConn.getHost());
//    String ial_refid = request.getParameter("ial_refid");
//    String u_refid = request.getParameter("u_refid");
//    String ic_refid = request.getParameter("ic_refid");
//    //out.print("ial = "+ial_refid+"<br>"+"ic = "+ic_refid+"<br>"+"u = "+u_refid+"<br>");
//    String rejected =  "REJECTED";
//    String sql_accept = "UPDATE INTERVIEW_ASSIGN_LIST "
//                    + "SET IAL_STATUS = ? "
//                    + "WHERE IAL_REFID = ? ";
//    String param_accept[] = { rejected, ial_refid };
//    String result = mc.setQuery(sql_accept, param_accept);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp");
%>
