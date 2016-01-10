<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    if(!request.getParameter("accept_confirm").isEmpty() && !request.getParameter("pa_refid").isEmpty() && !request.getParameter("c_refid").isEmpty())
    {
        String sPa_refid = request.getParameter("pa_refid");
        String sC_refid = request.getParameter("c_refid");
        
        String params[] = {};
        String sql = "UPDATE POS_APPLIED SET PA_STATUS='Accepted' WHERE PA_REFID='"+sPa_refid+"'";
        
        MainClient mc = new MainClient(DBConn.getHost());
        mc.setQuery(sql, params);
        
        String params2[] = {};
        String sql2 = "SELECT PA.PA_REFID FROM POS_APPLIED PA WHERE PA.PA_REFID != '"+sPa_refid+"' AND PA.C_REFID = '"+sC_refid+"'";
        
        ArrayList<ArrayList<String>> data = mc.getQuery(sql2, params2);
        /* If more than one offer for one candidate */
        if(data.size() > 0)
        {
            String params3[] = {};
            String sql3 = "UPDATE POS_APPLIED SET PA_STATUS='Rejected' WHERE PA_REFID != '"+sPa_refid+"' AND C_REFID = '"+sC_refid+"'";
            mc.setQuery(sql3, params3);
        }
    }
    
    response.sendRedirect("../../../process.jsp?p=Candidate/E-Offer/off_cand.jsp");
%>
