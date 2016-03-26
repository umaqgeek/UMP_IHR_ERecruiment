<%-- 
    Document   : e_int_save_mark_process
    Created on : Feb 6, 2016, 9:54:46 PM
    Author     : Habib
--%>

<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    
    String is_refid = request.getParameter("is_refid");
    String ipl_refid = request.getParameter("ipl_refid");
    String iii_refid[] = request.getParameterValues("iii_refid");
    String iim_mark;
    String iii_status;
    
    int total_mark =0 ;
//    for(int a = 0; a < iii_refid.length; a++)
//    {
//        out.print(iii_refid[a]+" : "+request.getParameter("decision_"+iii_refid[a])+" - "+request.getParameter("reason_"+iii_refid[a]));
//        out.print("<br>");
//        
//        for(int b = 0; b < iim_refid.length; b++)
//        {
//            out.print(iim_refid[b]+" : "+request.getParameter(iim_refid[b]));
//            out.print("<br>");
//            total_mark = total_mark + Integer.parseInt(request.getParameter(iim_refid[b])); 
//        }
//        out.print("Total mark : "+total_mark);
//    }
//    if(true)
//    {
//        return;
//    }
    
    String sql_iim_mark = "UPDATE interview_iii_mark "
                        + "SET iim_mark = ? "
                        + "WHERE iim_refid = ? ";
    String[] param_iim_mark = new String[2];
    
    String sql_iii_total = "UPDATE interview_irm_icm "
                        + "SET iii_mark = ? , "
                        + "iii_status = ? , "
                        + "iii_reason = ? "
                        + "WHERE iii_refid = ? ";
    String[] param_iii_total = new String[4];
    
    for(int a = 0; a < iii_refid.length; a++)
    {
        total_mark = 0;
        String iim_refid[] = request.getParameterValues("iim_refid_"+iii_refid[a]);
        for(int b = 0; b < iim_refid.length; b++)
        {
            param_iim_mark[0] = request.getParameter(iim_refid[b]);
            param_iim_mark[1] = iim_refid[b];
            String res1 = mc.setQuery(sql_iim_mark, param_iim_mark);
            //out.print(res1+"<br>");
//            out.print(request.getParameter(iim_refid[b])+"<br>");
            total_mark = total_mark + Integer.parseInt(request.getParameter(iim_refid[b])); 
        }
//        out.print(total_mark+"<br>");
        param_iii_total[0] = Integer.toString(total_mark);
        param_iii_total[1] = request.getParameter("decision_"+iii_refid[a]);
        param_iii_total[2] = request.getParameter("reason_"+iii_refid[a]);
        param_iii_total[3] = iii_refid[a];
        String res2 = mc.setQuery(sql_iii_total, param_iii_total);
        //out.print(res2+"<br>");
    }
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_panel_start.jsp&is_refid="+is_refid+"&ipl_refid="+ipl_refid);
%>