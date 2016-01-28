<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>
<%
String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();

String sql1 = "SELECT "
        + "pph.pph_grade, " //0
        + "pph.pph_position, " //1
        + "pph.pph_startdate, " //2
        + "pph.pph_enddate, " //3
        + "pa.pa_status, " //4
        + "pa.pa_refid, " //5
        + "pph.pph_refid, " //6
        + "fs.fs_desc " //7
        + "FROM position_ptj_hr pph, login1 l, pos_applied pa, filter f, filter_status fs "
        + "WHERE l.c_refid = pa.c_refid "
        + "AND pa.pph_refid = pph.pph_refid "
        + "AND pa.pa_refid = f.pa_refid "
        + "AND f.fs_code = fs.fs_code "
        + "AND l.l_refid = ? "
//        + "AND SYSDATE >= pph.pph_startdate "
//        + "AND SYSDATE <= pph.pph_enddate "
        + "GROUP BY pph.pph_grade, " //0
        + "pph.pph_position, " //1
        + "pph.pph_startdate, " //2
        + "pph.pph_enddate, " //3
        + "pa.pa_status, " //4
        + "pa.pa_refid, " //5
        + "pph.pph_refid, " //6
        + "fs.fs_desc ";
String param1[] = { l_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data1 = mc1.getQuery(sql1, param1);
%>
<h4>E-Test</h4>