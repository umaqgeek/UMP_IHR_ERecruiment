<%--
    Document   : e_int_pos_list
    Created on : Jan 28, 2016, 4:38:16 PM
    Author     : Habib
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String pph_refid = request.getParameter("pph_refid");
    String ic_interview_datetime = request.getParameter("ic_interview_datetime");
    String ic_venue = request.getParameter("ic_venue");
    String total_panels = request.getParameter("total_panels");
    int itotal_panels = Integer.parseInt(total_panels);
    //Insert Interview Chairman
    String sql_insert_chairman = "INSERT INTO INTERVIEW_CHAIRMAN(IC_INTERVIEW_DATETIME, IC_VENUE) "
                               + "VALUES( ? , ? ) ";
    String param_insert_chairman[] = { ic_interview_datetime, ic_venue }; 
    String ic_refid = mc.setQuery(sql_insert_chairman, param_insert_chairman, "IC_REFID");
    
    //Select INterview Chairman
    String sql_select_applicant = "SELECT PA.PA_REFID "
            + "FROM POSITION_PTJ_HR PPH, POS_APPLIED PA "
            + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
            + "AND PA.PPH_REFID = ? ";
    String param_select_applicant[] = { pph_refid };
    ArrayList<ArrayList<String>> data_select_applicant = mc.getQuery(sql_select_applicant, param_select_applicant);

    if(data_select_applicant.size() > 0)
    {
        String pa_refid = "";
        String sql_insert_int_result = "INSERT INTO INTERVIEW_RESULT (IC_REFID, PA_REFID) "
                                 + "VALUES ( ? , ? )";
        String[] param_insert_int_result = new String[2];
        String ir_refid = "";
        
        String sql_insert_panel = "INSERT INTO INTERVIEW_PANELS(IR_REFID) "
                + "VALUES( ? )";
        String[] param_insert_panel = new String[1];
        for(int row=0; row < data_select_applicant.size(); row++)
        {
            pa_refid = data_select_applicant.get(row).get(0);
            param_insert_int_result[0] = ic_refid;
            param_insert_int_result[1] = pa_refid;
            ir_refid = mc.setQuery(sql_insert_int_result, param_insert_int_result, "IR_REFID");
            
            for(int panel_count = 1; panel_count <= itotal_panels; panel_count++)
            {
                param_insert_panel[0] = ir_refid;
                mc.setQuery(sql_insert_panel, param_insert_panel);
            }
        }
    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_pos_list.jsp");
%>