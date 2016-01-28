<%@page import="libraries.My_func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String tsdb_refid = request.getParameter("tsdb_refid");
String tdb_qno = request.getParameter("tdb_qno");
String tdb_quest = request.getParameter("tdb_quest");
String tdb_refid = request.getParameter("tdb_refid");

String sql = "UPDATE test_db "
        + "SET tdb_qno = ?, tdb_quest = ? "
        + "WHERE tdb_refid = ? ";
String param[] = { tdb_qno, tdb_quest, tdb_refid };
MainClient mc = new MainClient(DBConn.getHost());
String isUpdate = mc.setQuery(sql, param);

session.setAttribute("tsdb", tsdb_refid);
response.sendRedirect("../../../process.jsp?"+My_func.URL_KEY+"=BPSM/E-Test/e-Questions.jsp");
%>