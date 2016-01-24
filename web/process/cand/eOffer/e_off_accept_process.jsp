<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    if(!request.getParameter("accept_confirm").isEmpty() && !request.getParameter("pa_refid").isEmpty() && !request.getParameter("c_refid").isEmpty())
    {
        String stat_accepted = "OFFER_ACCEPTED";
        String stat_accepted_another = "ANOTHER_OFFER_ACCEPTED";
        String stat_rejected = "OFFER_REJECTED";
        String stat_pending = "OFFER_PENDING";
        String stat_sent= "OFFER_SENT";
        String stat_activated = "ACTIVATED";
        String sPa_refid = request.getParameter("pa_refid");
        String sC_refid = request.getParameter("c_refid");
        
        MainClient mc = new MainClient(DBConn.getHost());
        
        //Update PA_STATUS to OFFER ACCEPTED into the current row ID
        String sql = "UPDATE POS_APPLIED "
                + "SET PA_STATUS = ? "
                + "WHERE PA_REFID = ? ";
        String params[] = { stat_accepted, sPa_refid };
        mc.setQuery(sql, params);
        
        //Update another SENT OFFER to OFFER REJECTED
        String sql3 = "UPDATE POS_APPLIED "
                + "SET PA_STATUS = ? "
                + "WHERE PA_REFID != ? "
                + "AND C_REFID = ? "
                + "AND PA_STATUS = ? ";
        String params3[] = { stat_rejected, sPa_refid, sC_refid, stat_sent };
        mc.setQuery(sql3, params3);
        
        //Update another SENT OFFER to OFFER REJECTED
        String sql4 = "UPDATE POS_APPLIED "
                + "SET PA_STATUS = ? "
                + "WHERE PA_REFID != ? "
                + "AND C_REFID = ? "
                + "AND PA_STATUS = ? ";
        String params4[] = { stat_accepted_another , sPa_refid, sC_refid, stat_pending };
        mc.setQuery(sql4, params4);
    }
    response.sendRedirect("../../../process.jsp?p=Candidate/E-Offer/off_cand.jsp");
%>
