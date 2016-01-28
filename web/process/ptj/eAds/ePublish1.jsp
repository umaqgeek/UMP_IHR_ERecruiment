<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pph_refid = request.getParameter("pph");

String sql = "UPDATE position_ptj_hr "
        + "SET pph_status = 'SUBMIT' "
        + "WHERE pph_refid = ? ";
String param[] = { pph_refid };
MainClient mc = new MainClient(DBConn.getHost());
String isUpdate = mc.setQuery(sql, param);

response.sendRedirect("../../../index.jsp");
%>