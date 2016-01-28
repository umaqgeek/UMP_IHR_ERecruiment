<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String tsdb_refid = request.getParameter("tsdb");

String sql = "DELETE FROM test_set_db "
        + "WHERE tsdb_refid = ? ";
String param[] = { tsdb_refid };
MainClient mc = new MainClient(DBConn.getHost());
String isDelete = mc.setQuery(sql, param);

response.sendRedirect("../../../process.jsp?p=BPSM/E-Test/e-Test.jsp");
%>