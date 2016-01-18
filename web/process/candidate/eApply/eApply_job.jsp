<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="controller.Session"%>
<%
String pph_refid = request.getParameter("pph");
String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();

String sql1 = "SELECT c.c_refid "
        + "FROM candidate c, login1 l "
        + "WHERE c.c_refid = l.c_refid "
        + "AND l.l_refid = ? ";
String param1[] = { l_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d1 = mc1.getQuery(sql1, param1);

if (d1.size() > 0) {
    
    String c_refid = d1.get(0).get(0);
    String pa_dateApplied = Func.getOracleDate(Func.getTodayDate3(), "yyyy-MM-dd");
    String new_status = "PASS SYSTEM";
    
    String sql2 = "INSERT INTO pos_applied(pph_refid, c_refid, pa_dateapplied, pa_status) "
            + "VALUES(?, ?, ?, ?) ";
    String param2[] = { pph_refid, c_refid, pa_dateApplied, new_status };
    MainClient mc2 = new MainClient(DBConn.getHost());
    String pa_refid = mc2.setQuery(sql2, param2, "pa_refid");
    
    if (!pa_refid.equals("-1") && !pa_refid.equals("0")) {
        
        String sql3 = "INSERT INTO filter(pa_refid, f_status, f_system) "
                + "VALUES(?, ?, ?) ";
        String param3[] = { pa_refid, new_status, Func.getOracleDate(Func.getTodayDate3(), "yyyy-MM-dd") };
        MainClient mc3 = new MainClient(DBConn.getHost());
        String f_refid = mc3.setQuery(sql3, param3, "f_refid");
    }
}

response.sendRedirect("../../../process.jsp?p=Candidate/E-Apply/e-apply.jsp");
%>