<%@page import="libraries.My_func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String tdb_refid = request.getParameter("tdb");
String tsdb_refid = request.getParameter("tsdb");

String sql = "DELETE FROM test_db "
        + "WHERE tdb_refid = ? ";
String param[] = { tdb_refid };
MainClient mc = new MainClient(DBConn.getHost());
String isDelete = mc.setQuery(sql, param);

session.setAttribute("tsdb", tsdb_refid);
response.sendRedirect("../../../process.jsp?"+My_func.URL_KEY+"=BPSM/E-Test/e-Questions.jsp");
%>