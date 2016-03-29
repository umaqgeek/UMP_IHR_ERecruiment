<%-- 
    Document   : e_int_cand_reject_process
    Created on : Mar 3, 2016, 4:53:37 PM
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
    String cand_status_rejected = "23";
    String sql_reject = "UPDATE interview_result_mark "
                    + "SET irm_cand_status = ? "
                    + "WHERE irm_refid = ? ";
    String[] param_reject = new String[2];
    String res = "";
    
    for(int a = 0; a < irm_refid.length; a++)
    {
        param_reject[0] = cand_status_rejected;
        param_reject[1] = irm_refid[a];
        res = mc.setQuery(sql_reject, param_reject);
    }
    
    response.sendRedirect("../../../process.jsp?p=Candidate/E-Interview/e_int_cand_invitation_list.jsp");
%>