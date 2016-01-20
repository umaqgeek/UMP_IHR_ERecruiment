<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    String pa_refid = request.getParameter("pa_refid");
    String pa_campus = request.getParameter("pa_campus");
    String pa_salary = request.getParameter("pa_salary");
    String ap_desc[] = request.getParameterValues("ap_desc");
    String ap_allowance[] = request.getParameterValues("ap_allowance");
    String mc_ap_result = "";
    String mc_pa_result = "";
    
    MainClient mc_pa = new MainClient(DBConn.getHost());
    String sql_update_pa = "UPDATE POS_APPLIED "
            + "SET PA_SALARY = ? , PA_CAMPUS = ? "
            + "WHERE PA_REFID = ? ";
    String params_update_pa[] = { pa_salary, pa_campus, pa_refid };
    //mc_pa_result = mc_pa.setQuery(sql_update_pa, params_update_pa);
    
    MainClient mc_ap = new MainClient(DBConn.getHost());
    String sql_insert_ap = "INSERT INTO ALLOWANCE_POS(ap_desc, ap_allowance, pa_refid) "
            + "VALUES( ? , ? , ? )";
    String params_insert_ap[] = new String[3];
    for(int row=0; row< ap_desc.length; row++)
    {
        params_insert_ap[0] = ap_desc[row];
        params_insert_ap[1] = ap_allowance[row];
        params_insert_ap[2] = pa_refid;
        
        //mc_ap_result = mc_ap.setQuery(sql_insert_ap, params_insert_ap);
    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Offer/off_bpsm_list.jsp");
%>