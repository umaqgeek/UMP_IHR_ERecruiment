<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "UPDATE position_ptj_hr "
        + "SET pph_status = 'SUBMIT' "
        + "WHERE pph_status = 'ENTRY' ";
String param[] = {};
MainClient mc = new MainClient(DBConn.getHost());
String isUpdate = mc.setQuery(sql, param);

response.sendRedirect("../../../index.jsp");
%>