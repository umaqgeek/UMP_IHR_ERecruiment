<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pph_refid = request.getParameter("pph");

String sql_pph = "UPDATE position_ptj_hr "
        + "SET pph_status = 'SAVE' "
        + "WHERE pph_refid = ? ";
String param_pph[] = { pph_refid };
MainClient mc_pph = new MainClient(DBConn.getHost());
mc_pph.setQuery(sql_pph, param_pph);

response.sendRedirect("../../../index.jsp");
%>