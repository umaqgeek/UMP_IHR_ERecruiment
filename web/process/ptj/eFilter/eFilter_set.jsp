<%@page import="helpers.Func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pa_refid = request.getParameter("pa");
String status = request.getParameter("status");

out.print(pa_refid);

String pa_status = (status.equals("1")) ? ("PASS_PTJ") : ("FAIL_PTJ");

String sql = "UPDATE pos_applied "
        + "SET pa_status = ? "
        + "WHERE pa_refid = ? ";
String param[] = { pa_status, pa_refid };
MainClient mc = new MainClient(DBConn.getHost());
String isUpdate = mc.setQuery(sql, param);

if (isUpdate.equals("0")) {
    
    String f_ptj = Func.getOracleDate(Func.getTodayDate3(), "yyyy-MM-dd");
    
    String sql2 = "UPDATE filter "
            + "SET f_ptj = ?, "
            + "fs_code = ? "
            + "WHERE pa_refid = ? ";
    String param2[] = { f_ptj, pa_status, pa_refid };
    MainClient mc2 = new MainClient(DBConn.getHost());
    mc2.setQuery(sql2, param2);
}

response.sendRedirect("../../../index.jsp");
%>