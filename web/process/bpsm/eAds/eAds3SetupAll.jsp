<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helpers.Func"%>
<%@page import="java.util.Enumeration"%>
<%
String pph_refid = request.getParameter("pph_refid");

ArrayList<ArrayList<String>> params_req = new ArrayList<ArrayList<String>>();

Enumeration en = request.getParameterNames();
while (en.hasMoreElements()) {
    Object objOri = en.nextElement();
    String param = (String) objOri;
    String value = request.getParameter(param);
    
    if (param.contains("date")) {
        String value_temp[] = value.split("-");
//        value = value_temp[2] + "/" + value_temp[1] + "/" + value_temp[0];
//        value = value_temp[2] + "-Jan-" + value_temp[0];
        value = Func.getOracleDate(value, "yyyy-MM-dd");
    }
    
    out.print(param+" | "+value+"<br />");
    
    ArrayList<String> data_temp = new ArrayList<String>();
    data_temp.add(param);
    data_temp.add(value);
    params_req.add(data_temp);
}

String sql = "UPDATE position_ptj_hr SET ";
int s = params_req.size();
String param[] = new String[s+1];
for (int i = 0; i < s-1; i++) {
    sql += params_req.get(i).get(0) + "=?, ";
    param[i] = params_req.get(i).get(1);
}
if (s > 0) {
    sql += params_req.get(s-1).get(0) + "=? ";
    param[s-1] = params_req.get(s-1).get(1);
}
sql += "WHERE pph_refid=? ";
param[s] = pph_refid;
MainClient mc = new MainClient(DBConn.getHost());
mc.setQuery(sql, param);

response.sendRedirect("../../../process.jsp?p=BPSM/E-Advertisement/e-advertisement_BPSM.jsp");
%>