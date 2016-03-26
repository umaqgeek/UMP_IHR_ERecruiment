<%-- 
    Document   : e_int_cand_accept_process
    Created on : Mar 3, 2016, 4:52:38 PM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayDeque"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    
    String irm_refid[] = request.getParameterValues("irm_refid");
    String cand_status_accepted = "22";
    String sql_accept = "UPDATE interview_result_mark "
                    + "SET irm_cand_status = ? "
                    + "WHERE irm_refid = ? ";
    String[] param_accept = new String[2];
    String res = "";
    for(int a = 0; a < irm_refid.length; a++)
    {
        param_accept[0] = cand_status_accepted;
        param_accept[1] = irm_refid[a];
        res = mc.setQuery(sql_accept, param_accept);
    }
    response.sendRedirect("../../../process.jsp?p=Candidate/E-Interview/e_int_cand_invitation_list.jsp");
%>
