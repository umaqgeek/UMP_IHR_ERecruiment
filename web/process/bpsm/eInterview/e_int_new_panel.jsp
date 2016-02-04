<%-- 
    Document   : e_int_new_panel
    Created on : Feb 3, 2016, 8:15:00 PM
    Author     : Habib
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "SENT";
    String pph_refid = request.getParameter("pph_refid");
    String ic_refid = request.getParameter("ic_refid");
    String u_refid = request.getParameter("new_panel");
    
    String sql_select_ir = "SELECT IR.IR_REFID "
                        + "FROM INTERVIEW_RESULT IR, INTERVIEW_CHAIRMAN IC "
                        + "WHERE IC.IC_REFID = IR.IC_REFID "
                        + "AND IC.IC_REFID = ? ";
    String param_select_ir[] = { ic_refid };
    ArrayList<ArrayList<String>> data_select_ir = mc.getQuery(sql_select_ir, param_select_ir);
    
    if(data_select_ir.size() > 0)
    {
        String sql_insert_panels = "INSERT INTO INTERVIEW_PANELS(IR_REFID) "
                                + "VALUES ( ? )";
        String[] param_insert_panels = new String[1];
        
        String sql_insert_assigned = "INSERT INTO INTERVIEW_ASSIGN_LIST(IP_REFID, U_REFID, IAL_STATUS) "
                                + "VALUES ( ? , ? , ? )";
        String[] param_insert_assigned = new String[3];
        for(int row=0; row<data_select_ir.size(); row++)
        {
            param_insert_panels[0] = data_select_ir.get(row).get(0);
            String ip_refid = mc.setQuery(sql_insert_panels, param_insert_panels, "IP_REFID");

            param_insert_assigned[0] = ip_refid;
            param_insert_assigned[1] = u_refid;
            param_insert_assigned[2] = sent;
            mc.setQuery(sql_insert_assigned, param_insert_assigned);
        }
    }
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&ic_refid="+ic_refid+"&alert=0");
%>
