<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    if(!request.getParameter("reject_confirm").isEmpty() && !request.getParameter("pa_refid").isEmpty())
    {
        String stat_accepted = "Accepted";
        String stat_rejected = "Rejected";
        String stat_pending= "Pending";
        
        String sPa_refid = request.getParameter("pa_refid");
        
        String params[] = {stat_rejected, sPa_refid};
        String sql = "UPDATE POS_APPLIED "
                + "SET PA_STATUS = ? "
                + "WHERE PA_REFID = ? ";
        
        MainClient mc = new MainClient(DBConn.getHost());
        mc.setQuery(sql, params);
        
    }
    response.sendRedirect("../../../process.jsp?p=Candidate/E-Offer/off_cand.jsp");
%>
