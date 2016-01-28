<%@page import="libraries.My_func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String tdb_refid = request.getParameter("tdb");
String tsdb_refid = request.getParameter("tsdb");
String adb_refid = request.getParameter("adb");

String sql = "DELETE FROM answer_db "
        + "WHERE adb_refid = ? ";
String param[] = { adb_refid };
MainClient mc = new MainClient(DBConn.getHost());
String isDelete = mc.setQuery(sql, param);

session.setAttribute("tsdb", tsdb_refid);
session.setAttribute("tdb", tdb_refid);
response.sendRedirect("../../../process.jsp?"+My_func.URL_KEY+"=BPSM/E-Test/e-Answers.jsp");
%>