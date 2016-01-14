<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.Enumeration"%>
<%
Enumeration en = request.getParameterNames();
while (en.hasMoreElements()) {
    Object objOri = en.nextElement();
    String param = (String) objOri;
    String value = request.getParameter(param);
    
    out.print(param+"|"+value+"<br />");
}

//if (true) { return; }

String params_arr[][] = {
    {"pph_grade", request.getParameter("pph_grade")},
    {"pph_position", request.getParameter("pph_position")},
    {"pph_ptj", request.getParameter("pph_ptj")},
    {"pph_skill", request.getParameter("pph_skill")},
    {"pph_attitude", request.getParameter("pph_attitude")},
    {"pph_knowledge", request.getParameter("pph_knowledge")},
    {"pph_add_cond_ptj", request.getParameter("pph_add_cond_ptj")},
    {"pph_status", request.getParameter("pph_status")}
};

String query1 = "INSERT INTO position_ptj_hr(";
String quesMark = "";
int l = params_arr.length;
String params[] = new String[l];
for (int i = 0; i < l-1; i++) {
    query1 += params_arr[i][0] + ", ";
    quesMark += "?, ";
    params[i] = params_arr[i][1];
}
query1 += params_arr[l-1][0] + ") VALUES(" + quesMark + "?)";
params[l-1] = params_arr[l-1][1];
MainClient mc1 = new MainClient(DBConn.getHost());
String pph_refid = mc1.setQuery(query1, params, "pph_refid");

if (pph_refid != "0" && pph_refid != null && pph_refid != "-1") {
    
    for (int i = 0; i < Integer.parseInt(request.getParameter("num_vp_refid")); i++) {
        String query_VPP = "INSERT INTO vacancy_pos_ptj(pph_refid, vpp_total, "
                + "vpp_campus, vpp_job_status, vp_refid) VALUES(?, ?, ?, ?, ?)";
        String vpp_total = request.getParameter("vpp_total_"+i);
        String vp_refid = request.getParameter("vp_refid_"+i);
        String vpp_campus = request.getParameter("vpp_campus_"+i);
        String vpp_job_status = request.getParameter("vpp_job_status_"+i);
        String params_vpp[] = {
            pph_refid,
            vpp_total,
            vpp_campus,
            vpp_job_status,
            vp_refid
        };
//        if (Integer.parseInt(vpp_total) > 0) {
            MainClient mc_vpp = new MainClient(DBConn.getHost());
            mc_vpp.setQuery(query_VPP, params_vpp);
            
            String query_vp1 = "SELECT vp.vp_total FROM vacancy_pos vp WHERE vp.vp_refid = ? ";
            String params_vp1[] = { vp_refid };
            MainClient mc_vp1 = new MainClient(DBConn.getHost());
            ArrayList<ArrayList<String>> data_vp1 = mc_vp1.getQuery(query_vp1, params_vp1);
            
            int vp_total_old = (data_vp1.size() > 0) ? (Integer.parseInt(data_vp1.get(0).get(0))) : (0);
            int vpp_total_new = Integer.parseInt(vpp_total);
            int vp_total_new = (vp_total_old - vpp_total_new <= 0) ? (0) : (vp_total_old - vpp_total_new);
            String vp_total = String.valueOf(vp_total_new);
            
            String query_vp2 = "UPDATE vacancy_pos SET vp_total = ? WHERE vp_refid = ? ";
            String params_vp2[] = {vp_total, vp_refid};
            MainClient mc_vp2 = new MainClient(DBConn.getHost());
            mc_vp2.setQuery(query_vp2, params_vp2);
//        }
    }
    
    for (int i = 0; i < Integer.parseInt(request.getParameter("num_ae_refid")); i++) {
        String query_AE = "INSERT INTO area_expertise_ptj(ae_refid, pph_refid) VALUES(?, ?)";
        String ae_refid = request.getParameter("ae_refid_"+i);
        String params_AE[] = {
            ae_refid,
            pph_refid
        };
        if (ae_refid != "" && ae_refid != null) {
            MainClient mc_ae = new MainClient(DBConn.getHost());
            mc_ae.setQuery(query_AE, params_AE);
        }
    } // end for
} // end if

response.sendRedirect("../../../process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj.jsp");
%>