<%@page import="helpers.Func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%
ArrayList<ArrayList<String>> params_req = new ArrayList<ArrayList<String>>();
    
Enumeration en = request.getParameterNames();
while (en.hasMoreElements()) {
    Object objOri = en.nextElement();
    String param = (String) objOri;
    String value = request.getParameter(param);
    
    out.print(param+" | "+value+"<br />");
    
    if (param.contains("date")) {
        String value_temp[] = value.split("-");
//        value = value_temp[2] + "/" + value_temp[1] + "/" + value_temp[0];
//        value = value_temp[2] + "-Jan-" + value_temp[0];
        value = Func.getOracleDate(value, "yyyy-MM-dd");
    }
    
    ArrayList<String> pr1 = new ArrayList<String>();
    pr1.add(param);
    pr1.add(value);
    params_req.add(pr1);
}

out.print(params_req);

//if (true) { return; }

int s = params_req.size();
String pph_refid = "-1";
String params[] = new String[s+1];
for (int i = 0; i < s; i++) {
    if (params_req.get(i).get(0).toUpperCase().equals("pph_refid".toUpperCase())) {
        pph_refid = params_req.get(i).get(1);
    }
    params[i] = params_req.get(i).get(1);
}

String query = "UPDATE position_ptj_hr SET ";
for (int i = 0; i < s-1; i++) {
    query += params_req.get(i).get(0) + "=?, ";
}
if (s > 0) {
    query += params_req.get(s-1).get(0) + "=? WHERE pph_refid=?";
}
params[s] = pph_refid;

out.print("<br />query:"+query+"<br />");
for (int i = 0; i < params.length; i++) {
    out.print((i+1)+"| "+params[i]+"<br />");
}

MainClient mc = new MainClient(DBConn.getHost());
mc.setQuery(query, params);

response.sendRedirect("../../../process.jsp?p=BPSM/E-Advertisement/e-advertisement_BPSM.jsp");
%>