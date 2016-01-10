<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    if(!request.getParameter("reject_confirm").isEmpty() && !request.getParameter("pa_refid").isEmpty())
    {
        String sPa_refid = request.getParameter("pa_refid");
        
        String params[] = {};
        String sql = "UPDATE POS_APPLIED SET PA_STATUS='Rejected' WHERE PA_REFID='"+sPa_refid+"'";
        
        MainClient mc = new MainClient(DBConn.getHost());
        mc.setQuery(sql, params);
        
    }
    response.sendRedirect("../../../process.jsp?p=Candidate/E-Offer/off_cand.jsp");
%>
