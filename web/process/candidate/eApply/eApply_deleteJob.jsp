<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pa_refid = request.getParameter("pa");

String sql1 = "DELETE FROM pos_applied "
        + "WHERE pa_refid = ? ";
String param1[] = { pa_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
String isDelete = mc1.setQuery(sql1, param1);

if (isDelete.equals("0")) {
    
}

response.sendRedirect("../../../process.jsp?p=Candidate/E-Apply/e-apply.jsp");
%>