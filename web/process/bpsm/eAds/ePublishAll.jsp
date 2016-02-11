<%@page import="libraries.My_func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql1 = "SELECT pph.pph_startdate, pph.pph_enddate, pph.pph_salary_min, pph.pph_salary_max "
        + "FROM position_ptj_hr pph "
        + "WHERE pph.pph_status = 'SUBMIT' "
        + "AND (NVL(pph.pph_startdate, '01-JAN-1970') <> '01-JAN-1970' "
        + "AND NVL(pph.pph_enddate, '01-JAN-1970') <> '01-JAN-1970' "
        + "AND NVL(pph.pph_salary_min, 0) <> 0 "
        + "AND NVL(pph.pph_salary_max, 0) <> 0) ";
String param1[] = {};
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d1 = mc1.getQuery(sql1, param1);

//out.print(d1); if (true) { return; }

String error = "";
if (d1.size() > 0) {
    String sql = "UPDATE position_ptj_hr "
            + "SET pph_status = 'PUBLISH' "
            + "WHERE pph.pph_status = 'SUBMIT' ";
    String param[] = {};
    MainClient mc = new MainClient(DBConn.getHost());
    String isUpdate = mc.setQuery(sql, param);
} else {
    error = "?" + My_func.ERROR_KEY + "=Information that you want to publish is incomplete!";
}

response.sendRedirect("../../../index.jsp");
%>