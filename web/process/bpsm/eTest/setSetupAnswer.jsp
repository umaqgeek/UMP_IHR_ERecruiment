<%@page import="libraries.My_func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String tsdb_refid = request.getParameter("tsdb_refid");
String tdb_refid = request.getParameter("tdb_refid");
String adb_ans = request.getParameter("adb_ans");
String adb_set_score = request.getParameter("adb_set_score");

String sql = "INSERT INTO answer_db(tdb_refid, adb_ans, adb_set_score) "
        + "VALUES(?, ?, ?) ";
String param[] = { tdb_refid, adb_ans, adb_set_score };
MainClient mc = new MainClient(DBConn.getHost());
String isInsert = mc.setQuery(sql, param);

session.setAttribute("tsdb", tsdb_refid);
session.setAttribute("tdb", tdb_refid);
response.sendRedirect("../../../process.jsp?"+My_func.URL_KEY+"=BPSM/E-Test/e-Answers.jsp");
%>