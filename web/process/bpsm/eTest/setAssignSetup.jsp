<%@page import="libraries.My_func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
String pph_refid = request.getParameter("pph");
String num_test = request.getParameter("num_test");
ArrayList<String> test = new ArrayList<String>();
int nt = Integer.parseInt(num_test);
for (int i = 0; i < nt; i++) {
    if (request.getParameter("tsdb_refid_"+i) != null && request.getParameter("tsdb_refid_"+i) != "") {
        test.add(request.getParameter("tsdb_refid_"+i));
    }
}

String sql1 = "SELECT pa.pa_refid "
        + "FROM pos_applied pa "
        + "WHERE pa.pph_refid = ? ";
String param1[] = { pph_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> pa = mc1.getQuery(sql1, param1);

for (int i = 0; i < pa.size(); i++) {
    String pa_refid = pa.get(i).get(0);
    
    for (int j = 0; j < test.size(); j++) {
        String tsdb_refid = test.get(j);
        
        String sql_insert = "INSERT INTO test_result(pa_refid, tsdb_refid) "
                + "VALUES(?, ?) ";
        String param_insert[] = { pa_refid, tsdb_refid };
        MainClient mc_insert = new MainClient(DBConn.getHost());
        mc_insert.setQuery(sql_insert, param_insert);
    }
}

session.setAttribute("pph", pph_refid);
response.sendRedirect("../../../process.jsp?"+My_func.URL_KEY+"=BPSM/E-Test/e-AssignTest2.jsp");
%>