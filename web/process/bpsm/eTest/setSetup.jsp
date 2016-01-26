<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String tsdb_set_name = request.getParameter("tsdb_set_name");
String tst_refid = request.getParameter("tst_refid");

String sql = "INSERT INTO test_set_db(tsdb_set_name, tst_refid) "
        + "VALUES(?, ?) ";
String param[] = { tsdb_set_name, tst_refid };
MainClient mc = new MainClient(DBConn.getHost());
String isInsert = mc.setQuery(sql, param);

response.sendRedirect("../../../process.jsp?p=BPSM/E-Test/e-Test.jsp");
%>