<%-- 
    Document   : e_int_remove_pos_process
    Created on : Mar 22, 2016, 1:42:53 AM
    Author     : Habib
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String pph_refid = request.getParameter("pph_refid");
    String uni_is_refid = request.getParameter("uni_is_refid");
    String ptj_is_refid = request.getParameter("ptj_is_refid");
    
    String sql_irm_pa = "SELECT irm.irm_refid "
                    + "FROM interview_result_mark irm, interview_setup iss, pos_applied pa, position_ptj_hr pph "
                    + "WHERE iss.is_refid = irm.is_refid "
                    + "AND pph.pph_refid = pa.pph_refid "
                    + "AND pa.pa_refid = irm.pa_refid "
                    + "AND iss.is_refid = ? "
                    + "AND pph.pph_refid = ? ";
    String param_irm_pa[] = { uni_is_refid, pph_refid };
    ArrayList<ArrayList<String>> data_irm_pa = mc.getQuery(sql_irm_pa, param_irm_pa);
    
    String sql_remove_uni = "DELETE FROM interview_result_mark "
                        + "WHERE irm_refid = ? ";
    String[] param_remove_uni = new String[1];
    
    for(int a = 0; a < data_irm_pa.size(); a++)
    {
        param_remove_uni[0] = data_irm_pa.get(a).get(0);
        mc.setQuery(sql_remove_uni, param_remove_uni);
    }
    
    String sql_remove_ptj = "DELETE FROM interview_setup "
                        + "WHERE is_refid = ? ";
    String param_remove_ptj[] = { ptj_is_refid };
    mc.setQuery(sql_remove_ptj, param_remove_ptj);
    
    String sql_is_irm = "SELECT irm.irm_refid "
                    + "FROM interview_setup iss, interview_result_mark irm "
                    + "WHERE iss.is_refid = irm.is_refid "
                    + "AND iss.is_refid = ? ";
    String param_is_irm[] = { uni_is_refid };
    ArrayList<ArrayList<String>> data_is_irm = mc.getQuery(sql_is_irm, param_is_irm);
    
    if(data_is_irm.size() < 1)
    {
        String sql_remove_uni_setup = "DELETE FROM interview_setup "
                                    + "WHERE is_refid = ? ";
        String param_remove_uni_setup[] = { uni_is_refid };
        mc.setQuery(sql_remove_uni_setup, param_remove_uni_setup);
    }
    
    String sql_ipl = "SELECT ipl.ipl_refid "
                    + "FROM interview_panel_list ipl";
    String param_ipl[] = {};
    ArrayList<ArrayList<String>> data_ipl = mc.getQuery(sql_ipl, param_ipl);
    
    String sql_ipl_irm = "SELECT ipl.ipl_refid "
                        + "FROM interview_irm_icm iii, interview_panel_list ipl "
                        + "WHERE ipl.ipl_refid = iii.ipl_refid "
                        + "AND ipl.ipl_refid = ? ";
    String[] param_ipl_irm = new String[1];
    ArrayList<ArrayList<String>> data_ipl_irm;
    
    for(int a = 0; a < data_ipl.size(); a++)
    {
        param_ipl_irm[0] = data_ipl.get(a).get(0);
        data_ipl_irm = mc.getQuery(sql_ipl_irm, param_ipl_irm);
        
        if(data_ipl_irm.size() < 1)
        {
            String sql_delete_ipl = "DELETE FROM interview_panel_list "
                            + "WHERE ipl_refid = ? ";
            String param_delete_ipl[] = { data_ipl.get(a).get(0) };
            mc.setQuery(sql_delete_ipl, param_delete_ipl);
        }
    }
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp");
%>