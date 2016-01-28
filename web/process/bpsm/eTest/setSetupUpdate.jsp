<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String tsdb_set_name = request.getParameter("tsdb_set_name");
String tst_refid = request.getParameter("tst_refid");
String tsdb_refid = request.getParameter("tsdb_refid");

String sql = "UPDATE test_set_db "
        + "SET tsdb_set_name = ?, tst_refid = ? "
        + "WHERE tsdb_refid = ? ";
String param[] = { tsdb_set_name, tst_refid, tsdb_refid };
MainClient mc = new MainClient(DBConn.getHost());
String isUpdate = mc.setQuery(sql, param);

response.sendRedirect("../../../process.jsp?p=BPSM/E-Test/e-Test.jsp");
%>