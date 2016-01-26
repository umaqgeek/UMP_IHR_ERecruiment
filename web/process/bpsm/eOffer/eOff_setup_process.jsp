<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    String pa_refid = request.getParameter("pa_refid");
    String pa_job_status = request.getParameter("pa_job_status");
    String pa_campus = request.getParameter("pa_campus");
    String pa_salary = request.getParameter("pa_salary");
    
    String mc_pa_result = "";
    MainClient mc_pa = new MainClient(DBConn.getHost());
    String sql_update_pa = "UPDATE POS_APPLIED "
            + "SET PA_SALARY = ? , PA_CAMPUS = ? , PA_JOB_STATUS = ? "
            + "WHERE PA_REFID = ? ";
    String params_update_pa[] = { pa_salary, pa_campus, pa_job_status, pa_refid };
    mc_pa_result = mc_pa.setQuery(sql_update_pa, params_update_pa);
    
    int ap_size = Integer.parseInt(request.getParameter("ap_size"));
    String ap_desc[] = new String[ap_size];
    String ap_allowance[] = new String[ap_size];
    
    String mc_ap_result = "";
    MainClient mc_ap = new MainClient(DBConn.getHost());
    String sql_ap_check = "SELECT AP.AP_REFID "
            + "FROM ALLOWANCE_POS AP "
            + "WHERE AP.PA_REFID = ? ";
    String params_check[] = { pa_refid };
    ArrayList<ArrayList<String>> data_ap = mc_ap.getQuery(sql_ap_check, params_check);
    if(data_ap.size() > 0)
    {
        String sql_del_ap = "DELETE "
                + "FROM ALLOWANCE_POS "
                + "WHERE PA_REFID = ? ";
        String params_del[] = { pa_refid };
        mc_ap.setQuery(sql_del_ap, params_del);
    }
    
    String sql_insert_ap = "INSERT INTO ALLOWANCE_POS(ap_desc, ap_allowance, pa_refid) "
            + "VALUES( ? , ? , ? )";
    String params_insert_ap[] = new String[3];
    
    for (int i = 0; i < ap_size; i++)
    {
        ap_desc[i] = request.getParameter("ap_desc_"+(i+1));
        ap_allowance[i] = request.getParameter("ap_allowance_"+(i+1));
        if (ap_desc[i] != null)
        {
            params_insert_ap[0] = ap_desc[i];
            params_insert_ap[1] = ap_allowance[i];
            params_insert_ap[2] = pa_refid;
            mc_ap_result = mc_ap.setQuery(sql_insert_ap, params_insert_ap);
            //out.print(ap_desc[i] + " | " + ap_allowance[i] + "<br />");
        }
    }
    //if (true) { return; }
    
    
//    for(int row=0; row< ap_desc.length; row++)
//    {
//        params_insert_ap[0] = ap_desc[row];
//        params_insert_ap[1] = ap_allowance[row];
//        params_insert_ap[2] = pa_refid;
//        
//        //mc_ap_result = mc_ap.setQuery(sql_insert_ap, params_insert_ap);
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Offer/off_bpsm_list.jsp");
%>