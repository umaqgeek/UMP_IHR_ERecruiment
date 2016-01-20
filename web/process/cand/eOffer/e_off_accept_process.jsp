<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    
    
    if(!request.getParameter("accept_confirm").isEmpty() && !request.getParameter("pa_refid").isEmpty() && !request.getParameter("c_refid").isEmpty())
    {
        String stat_accepted = "OFFER ACCEPTED";
        String stat_rejected = "OFFER REJECTED";
        String stat_sent= "OFFER SENT";
        
        String sPa_refid = request.getParameter("pa_refid");
        String sC_refid = request.getParameter("c_refid");
        
        MainClient mc = new MainClient(DBConn.getHost());
        
        String params[] = { stat_accepted, sPa_refid };
        String sql = "UPDATE POS_APPLIED "
                + "SET PA_STATUS = ? "
                + "WHERE PA_REFID = ? ";
        
        mc.setQuery(sql, params);
        
        String params2[] = { sPa_refid, sC_refid };
        String sql2 = "SELECT PA.PA_REFID "
                + "FROM POS_APPLIED PA "
                + "WHERE PA.PA_REFID != ? "
                + "AND PA.C_REFID = ? ";
        
        ArrayList<ArrayList<String>> data = mc.getQuery(sql2, params2);
        /* If more than one offer for one candidate */
        if(data.size() > 0)
        {
            String params3[] = { stat_rejected, sPa_refid, sC_refid };
            String sql3 = "UPDATE POS_APPLIED "
                    + "SET PA_STATUS = ? "
                    + "WHERE PA_REFID != ? "
                    + "AND C_REFID = ? ";
            mc.setQuery(sql3, params3);
        }
    }
    
    response.sendRedirect("../../../process.jsp?p=Candidate/E-Offer/off_cand.jsp");
%>
