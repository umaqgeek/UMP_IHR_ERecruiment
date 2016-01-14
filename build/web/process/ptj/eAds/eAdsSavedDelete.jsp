<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pph_refid = request.getParameter("pph");

String sql1 = "SELECT vpp.vp_refid, vpp.vpp_total "
        + "FROM vacancy_pos_ptj vpp, position_ptj_hr pph, warrant w, vacancy_pos vp "
        + "WHERE vpp.pph_refid = pph.pph_refid "
        + "AND vp.w_refid = w.w_refid "
        + "AND vpp.vp_refid = vp.vp_refid "
        + "AND vpp.pph_refid = ? ";
String params1[] = { pph_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d1 = mc1.getQuery(sql1, params1);

//out.print(d1);

if (d1.size() > 0) {
    for (int i = 0; i < d1.size(); i++) {

        String vp_refid = d1.get(i).get(0);
        String vpp_total = d1.get(i).get(1);

        String sql11 = "SELECT vp.vp_total "
                + "FROM vacancy_pos vp "
                + "WHERE vp.vp_refid = ? ";
        String params11[] = {vp_refid};
        MainClient mc11 = new MainClient(DBConn.getHost());
        ArrayList<ArrayList<String>> d11 = mc11.getQuery(sql11, params11);

        int vp_total_old = Integer.parseInt(d11.get(0).get(0));
        int vpp_total_old = Integer.parseInt(vpp_total);
        int vp_total_new = vp_total_old + vpp_total_old;
        String vp_total = String.valueOf(vp_total_new);

        String sql12 = "UPDATE vacancy_pos "
                + "SET vp_total = ? "
                + "WHERE vp_refid = ? ";
        String params12[] = {vp_total, vp_refid};
        MainClient mc12 = new MainClient(DBConn.getHost());
        mc12.setQuery(sql12, params12);
    }

//out.print(w_total);
//if (true) { return; };

    String sql3 = "DELETE FROM position_ptj_hr "
            + "WHERE pph_refid = ? ";
    String params3[] = {pph_refid};
    MainClient mc3 = new MainClient(DBConn.getHost());
    mc3.setQuery(sql3, params3);
}

response.sendRedirect("../../../index.jsp");
%>