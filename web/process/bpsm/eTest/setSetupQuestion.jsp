<%@page import="libraries.My_func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String tsdb_refid = request.getParameter("tsdb_refid");
String tdb_qno = request.getParameter("tdb_qno");
String tdb_quest = request.getParameter("tdb_quest");

String sql = "INSERT INTO test_db(tsdb_refid, tdb_qno, tdb_quest) "
        + "VALUES(?, ?, ?) ";
String param[] = { tsdb_refid, tdb_qno, tdb_quest };
MainClient mc = new MainClient(DBConn.getHost());
String isInsert = mc.setQuery(sql, param);

session.setAttribute("tsdb", tsdb_refid);
response.sendRedirect("../../../process.jsp?"+My_func.URL_KEY+"=BPSM/E-Test/e-Questions.jsp");
%>