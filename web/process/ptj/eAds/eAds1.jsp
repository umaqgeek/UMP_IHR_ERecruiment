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

String w_refid = request.getParameter("w_refid");

String params_arr[][] = {
    {"pph_grade", request.getParameter("pph_grade")},
    {"pph_position", request.getParameter("pph_position")},
    {"pph_ptj", request.getParameter("pph_ptj")},
    {"pph_skill", request.getParameter("pph_skill")},
    {"pph_attitude", request.getParameter("pph_attitude")},
    {"pph_knowledge", request.getParameter("pph_knowledge")},
    {"pph_add_cond_ptj", request.getParameter("pph_add_cond_ptj")},
    {"pph_status", request.getParameter("pph_status")},
    {"w_refid", w_refid}
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
    
    int w_total_grand = 0;
    
    for (int i = 0; i < Integer.parseInt(request.getParameter("num_vp_refid")); i++) {
        String query_VPP = "INSERT INTO vacancy_pos_ptj(vp_refid, pph_refid, vpp_total) VALUES(?, ?, ?)";
        String vpp_total = request.getParameter("vpp_total_"+i);
        String vp_refid = request.getParameter("vp_refid_"+i);
        String params_vpp[] = {
            vp_refid,
            pph_refid,
            vpp_total
        };
        if (Integer.parseInt(vpp_total) > 0) {
            MainClient mc_vpp = new MainClient(DBConn.getHost());
            mc_vpp.setQuery(query_VPP, params_vpp);
            
            String query_vp1 = "SELECT vp.vp_total FROM vacancy_pos vp WHERE vp.vp_refid = ? ";
            String params_vp1[] = {vp_refid};
            MainClient mc_vp1 = new MainClient(DBConn.getHost());
            ArrayList<ArrayList<String>> data_vp1 = mc_vp1.getQuery(query_vp1, params_vp1);
            int vp_total_old = (data_vp1.size() > 0) ? (Integer.parseInt(data_vp1.get(0).get(0))) : (0);
            int vpp_total_new = Integer.parseInt(vpp_total);
            w_total_grand += vpp_total_new;
            int vp_total_new = (vp_total_old - vpp_total_new <= 0) ? (0) : (vp_total_old - vpp_total_new);
            String vp_total = String.valueOf(vp_total_new);
            
            String query_vp2 = "UPDATE vacancy_pos SET vp_total = ? WHERE vp_refid = ? ";
            String params_vp2[] = {vp_total, vp_refid};
            MainClient mc_vp2 = new MainClient(DBConn.getHost());
            mc_vp2.setQuery(query_vp2, params_vp2);
        }
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
    }
    
    String query_war1 = "SELECT w.w_total "
            + "FROM warrant w "
            + "WHERE w.w_refid = ? ";
    String params_war1[] = {w_refid};
    MainClient mc_war1 = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data_war1 = mc_war1.getQuery(query_war1, params_war1);
    int w_total_old = (data_war1.size() > 0) ? (Integer.parseInt(data_war1.get(0).get(0))) : (0);
    int w_total_new = (w_total_old - w_total_grand <= 0) ? (0) : (w_total_old - w_total_grand);
    String w_total = String.valueOf(w_total_new);
    
    String query_war2 = "UPDATE warrant SET w_total = ? WHERE w_refid = ? ";
    String params_war2[] = {w_total, w_refid};
    MainClient mc_war2 = new MainClient(DBConn.getHost());
    mc_war2.setQuery(query_war2, params_war2);
}

response.sendRedirect("../../../process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj.jsp");
%>