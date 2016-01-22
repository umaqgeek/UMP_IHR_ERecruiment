<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    
    
    if(!request.getParameter("accept_confirm").isEmpty() && !request.getParameter("pa_refid").isEmpty() && !request.getParameter("c_refid").isEmpty())
    {
        String stat_accepted = "OFFER ACCEPTED";
        String stat_accepted_another = "ANOTHER OFFER ACCEPTED";
        String stat_rejected = "OFFER REJECTED";
        String stat_pending = "OFFER PENDING";
        String stat_sent= "OFFER SENT";
        String sPa_refid = request.getParameter("pa_refid");
        String sC_refid = request.getParameter("c_refid");
        
        MainClient mc = new MainClient(DBConn.getHost());
        
        String sql_another_offer_pending = "SELECT PA.PA_REFID "
                + "FROM POS_APPLIED PA "
                + "WHERE C.C_REFID = ? "
                + "AND (PA.PA_STATUS != ? OR PA.PA_STATUS != ? PA.PA_STATUS != ?)";
        String param_another_offer_pending[] = { sPa_refid, stat_accepted, stat_rejected, stat_sent }; 
        ArrayList<ArrayList<String>> data_another_offer_pending = mc.getQuery(sql_another_offer_pending, param_another_offer_pending);
        
        String sql = "UPDATE POS_APPLIED "
                + "SET PA_STATUS = ? "
                + "WHERE PA_REFID = ? ";
        String params[] = { stat_accepted, sPa_refid };
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
            String sql3 = "UPDATE POS_APPLIED "
                    + "SET PA_STATUS = ? "
                    + "WHERE PA_REFID != ? "
                    + "AND C_REFID = ? ";
            String[] params3 = new String[3];
            
            if(data_another_offer_pending.size() > 0)
            {
                params3[0] = stat_accepted_another;
                params3[1] = sPa_refid;
                params3[2] = sC_refid;
            }
            else////////////////////////////////////////Buat yang ni duluuuuuuuuuuuuuuuuuu
            {
                params3[0] = stat_accepted_another;
                params3[1] = sPa_refid;
                params3[2] = sC_refid;
            }
            mc.setQuery(sql3, params3);
        }
    }
    
    response.sendRedirect("../../../process.jsp?p=Candidate/E-Offer/off_cand.jsp");
%>
