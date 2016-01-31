<%-- 
    Document   : e_int_set_committee_process
    Created on : Jan 31, 2016, 11:24:25 PM
    Author     : Habib
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "SENT";
    String pph_refid = request.getParameter("pph_refid");
    String ic_refid_pre = request.getParameter("ic_refid_pre");
    String ic_refid_main = request.getParameter("ic_refid_main");
    String chairman = request.getParameter("chairman");
    String chairman2 = request.getParameter("chairman2");
    String[] panels = request.getParameterValues("panels");
    String[] panels2 = request.getParameterValues("panels2");
    /**************************************** Validator **************************************************************/
    for(int a=0; a<panels.length; a++)
    {
        if(chairman.equals(panels[a]))
        {
            response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&alert=3");
        }
    };
    
    for(int b=0; b<panels2.length; b++)
    {
        if(chairman2.equals(panels2[b]))
        {
            response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&alert=3");
        }
    };

    for (int j=0;j<panels.length;j++)
    {
        for (int k=j+1;k<panels.length;k++)
        {
            if (k != j && panels[k].equals(panels[j]))
            {
                response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&alert=4");
            }
        }
    }
    
    for (int j=0;j<panels2.length;j++)
    {
        for (int k=j+1;k<panels2.length;k++)
        {
            if (k!=j && panels2[k].equals(panels2[j]))
            {
                response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&alert=4");
            }
        }
    }
    
    if(chairman == null || chairman2 == null)
    {
        response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&alert=1");
        return;
    }
    else 
    if(panels.length < 1 || panels2.length < 1)
    {
        response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid="+pph_refid+"&alert=2");
        return;
    }
    /****************************************End Validator **************************************************************/
    /************************************ Setup For Pre Interview *******************************************************/
    String sql_assign_chairman = "INSERT INTO INTERVIEW_ASSIGN_LIST(IC_REFID, U_REFID, IAL_STATUS) "
                               + "VALUES ( ? , ? , ? )";
    String param_assign_chairman[] = { ic_refid_pre, chairman, sent };
    mc.setQuery(sql_assign_chairman, param_assign_chairman);
    
    String sql_select_ir = "SELECT IR.IR_REFID "
                        + "FROM INTERVIEW_RESULT IR, INTERVIEW_CHAIRMAN IC "
                        + "WHERE IC.IC_REFID = IR.IC_REFID "
                        + "AND IC.IC_REFID = ? ";
    String param_select_ir[] = { ic_refid_pre };
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
            for(int a=0; a<panels.length; a++)
            {
                param_insert_panels[0] = data_select_ir.get(row).get(0);
                String ip_refid = mc.setQuery(sql_insert_panels, param_insert_panels, "IP_REFID");
                
                param_insert_assigned[0] = ip_refid;
                param_insert_assigned[1] = panels[a];
                param_insert_assigned[2] = sent;
                mc.setQuery(sql_insert_assigned, param_insert_assigned);
            }
        }
    }
    /********************************** End Setup For Pre Interview *****************************************************/
    /************************************ Setup For Main Interview *******************************************************/
    String sql_assign_chairman2 = "INSERT INTO INTERVIEW_ASSIGN_LIST(IC_REFID, U_REFID, IAL_STATUS) "
                               + "VALUES ( ? , ? , ? )";
    String param_assign_chairman2[] = { ic_refid_main, chairman2, sent };
    mc.setQuery(sql_assign_chairman2, param_assign_chairman2);
    
    String sql_select_ir2 = "SELECT IR.IR_REFID "
                        + "FROM INTERVIEW_RESULT IR, INTERVIEW_CHAIRMAN IC "
                        + "WHERE IC.IC_REFID = IR.IC_REFID "
                        + "AND IC.IC_REFID = ? ";
    String param_select_ir2[] = { ic_refid_main };
    ArrayList<ArrayList<String>> data_select_ir2 = mc.getQuery(sql_select_ir2, param_select_ir2);
    
    if(data_select_ir2.size() > 0)
    {
        String sql_insert_panels2 = "INSERT INTO INTERVIEW_PANELS(IR_REFID) "
                                + "VALUES ( ? )";
        String[] param_insert_panels2 = new String[1];
        
        String sql_insert_assigned2 = "INSERT INTO INTERVIEW_ASSIGN_LIST(IP_REFID, U_REFID, IAL_STATUS) "
                                + "VALUES ( ? , ? , ?)";
        String[] param_insert_assigned2 = new String[3];
        for(int row=0; row<data_select_ir2.size(); row++)
        {
            for(int a=0; a<panels2.length; a++)
            {
                param_insert_panels2[0] = data_select_ir2.get(row).get(0);
                String ip_refid2 = mc.setQuery(sql_insert_panels2, param_insert_panels2, "IP_REFID");
                
                param_insert_assigned2[0] = ip_refid2;
                param_insert_assigned2[1] = panels2[a];
                param_insert_assigned2[2] = sent;
                mc.setQuery(sql_insert_assigned2, param_insert_assigned2);
            }
        }
    }
    /********************************** End Setup For Main Interview *****************************************************/
    
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_pos_list.jsp");
%>