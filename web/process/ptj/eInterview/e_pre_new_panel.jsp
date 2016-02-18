<%-- 
    Document   : e_pre_new_panel
    Created on : Feb 18, 2016, 12:46:04 AM
    Author     : Habib
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String is_refid = request.getParameter("is_refid");
    String dept_code = request.getParameter("dept_code");
    String sm_staff_id = request.getParameter("panel_sm_staff_id");
    
    String sent = "21";
    
    String sql_irm_list = "SELECT irm.irm_refid "
                    + "FROM interview_setup iss, interview_result_mark irm "
                    + "WHERE iss.is_refid = ? ";
    String param_irm_list[] = { is_refid };
    ArrayList<ArrayList<String>> data_irm_list = mc.getQuery(sql_irm_list, param_irm_list);
    
    String sql_new_panel    = "INSERT INTO interview_panel_list(ipl_status, sm_staff_id) "
                            + "VALUES( ? , ? )";
    String param_new_panel[] = { sent, sm_staff_id };
    String ipl_refid = mc.setQuery(sql_new_panel, param_new_panel, "ipl_refid");
    
    String sql_insert_result    = "INSERT INTO interview_irm_icm(irm_refid, ipl_refid) "
                                + "VALUES( ? , ? )";
    String[] param_insert_result = new String[2];
    for(int a = 0; a < data_irm_list.size(); a++)
    {
        param_insert_result[0] = data_irm_list.get(a).get(0);
        param_insert_result[1] = ipl_refid;
        mc.setQuery(sql_insert_result, param_insert_result);
    }
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_committee_setup.jsp&is_refid="+is_refid+"&dept_code="+dept_code+"&alert=0");
%>