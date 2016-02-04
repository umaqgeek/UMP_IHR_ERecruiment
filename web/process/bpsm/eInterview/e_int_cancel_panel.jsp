<%-- 
    Document   : e_int_cancel_panel
    Created on : Feb 3, 2016, 10:13:24 AM
    Author     : Habib
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "SENT";
    String canceled = "CANCELED";
    String pph_refid = request.getParameter("pph_refid");
    String ic_refid = request.getParameter("ic_refid");
    String u_refid = request.getParameter("u_refid");
    
    String sql_select_panel = "SELECT IAL.IAL_REFID "
                            + "FROM INTERVIEW_CHAIRMAN IC, INTERVIEW_RESULT IR, INTERVIEW_PANELS IP, INTERVIEW_ASSIGN_LIST IAL "
                            + "WHERE IC.IC_REFID = IR.IC_REFID "
                            + "AND IC.IC_REFID = IR.IC_REFID "
                            + "AND IR.IR_REFID = IP.IR_REFID "
                            + "AND IP.IP_REFID = IAL.IP_REFID "
                            + "AND IC.IC_REFID = ? "
                            + "AND IAL.U_REFID = ? ";
    String param_select_panel[] = { ic_refid, u_refid };
    ArrayList<ArrayList<String>> data_select_panel = mc.getQuery(sql_select_panel, param_select_panel);
//    out.print(data_select_panel);
//    if(true)
//    {
//       return; 
//    }
    
    String sql_cancel_panel = "UPDATE INTERVIEW_ASSIGN_LIST "
                            + "SET IAL_STATUS = ? "
                            + "WHERE IAL_REFID = ? ";
    String[] param_cancel_panel = new String[2];
    
    for(int a = 0; a < data_select_panel.size(); a++)
    {
        param_cancel_panel[0] = canceled;
        param_cancel_panel[1] = data_select_panel.get(a).get(0);
        mc.setQuery(sql_cancel_panel, param_cancel_panel);
    }
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&ic_refid="+ic_refid+"&alert=0");
%>
