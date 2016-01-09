<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.Enumeration"%>
<%
Enumeration en = request.getParameterNames();
while (en.hasMoreElements()) {
    Object objOri = en.nextElement();
    String param = (String) objOri;
    String value = request.getParameter(param);
    
    out.print(param+" | "+value+"<br />");
}

String params_req[][] = {
    {"g_grade", request.getParameter("g_grade")},
    {"g_spm_bm", request.getParameter("g_spm_bm")},
    {"g_spm_bi", request.getParameter("g_spm_bi")},
    {"g_cgpa", request.getParameter("g_cgpa")},
    {"g_muet", request.getParameter("g_muet")},
    {"g_level", request.getParameter("g_level")}
};
String g_refid = request.getParameter("g_refid");

int s = params_req.length;
String sql = "UPDATE grade SET ";
String params[] = new String[s+1];
for (int i = 0; i < s-1; i++) {
    sql += params_req[i][0] + "=?, ";
    params[i] = params_req[i][1];
}
if (s > 0) {
    sql += params_req[s-1][0] + "=? ";
    params[s-1] = params_req[s-1][1];
}
sql += "WHERE g_refid=? ";
params[s] = g_refid;

MainClient mc = new MainClient(DBConn.getHost());
String is_g = mc.setQuery(sql, params);

// reset all child
String sql_child = "DELETE FROM grade_area_expertise WHERE g_refid = ? ";
String params_child[] = {g_refid};
MainClient mc_child = new MainClient(DBConn.getHost());
String is_child = mc_child.setQuery(sql_child, params_child);

if (is_g != null && is_g != "-1" && is_child != null && is_child != "-1") {
    
    int num_ae = Integer.parseInt(request.getParameter("num_ae_refid"));
    for (int i = 0; i < num_ae; i++) {
        String ae_refid = request.getParameter("ae_refid_"+i);
        if (ae_refid != null && ae_refid != "") {
            
            String sql2 = "INSERT INTO grade_area_expertise(g_refid, ae_refid) "
                    + "VALUES(?, ?) ";
            String params_gae[] = {g_refid, ae_refid};
            MainClient mc_gae = new MainClient(DBConn.getHost());
            mc_gae.setQuery(sql2, params_gae);
        }
    }
}

response.sendRedirect("../../../process.jsp?p=BPSM/E-Setup/e-setup.jsp");
%>