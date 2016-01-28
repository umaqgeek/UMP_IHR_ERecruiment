<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "UPDATE position_ptj_hr "
        + "SET pph_status = 'PUBLISH' "
        + "WHERE pph.pph_status = 'SUBMIT' "
        + "AND (NVL(pph.pph_startdate, '01-JAN-1970') <> '01-JAN-1970' "
        + "AND NVL(pph.pph_enddate, '01-JAN-1970') <> '01-JAN-1970' "
        + "AND NVL(pph.pph_salary_min, 0) <> 0 "
        + "AND NVL(pph.pph_salary_max, 0) <> 0) ";
String param[] = {};
MainClient mc = new MainClient(DBConn.getHost());
String isUpdate = mc.setQuery(sql, param);

response.sendRedirect("../../../index.jsp");
%>