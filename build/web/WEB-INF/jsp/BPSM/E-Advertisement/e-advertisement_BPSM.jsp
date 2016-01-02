<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String query3 = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, SUM(vpp.vpp_total), pph.pph_status, pph.w_refid "
        + "FROM vacancy_pos_ptj vpp, position_ptj_hr pph "
        + "WHERE pph.pph_refid = vpp.pph_refid "
        + "AND pph.pph_status = 'HR' "
        + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_status, pph.w_refid ";
MainClient mc3 = new MainClient(DBConn.getHost());
String params3[] = {};
ArrayList<ArrayList<String>> pph = mc3.getQuery(query3, params3);
%>

<div class="row">
    <h2>List of Positions</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Grade</th>
                <th>Position</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < pph.size(); i++) {%>
            <tr>
                <td><%=i + 1%></td>
                <td><a href="process.jsp?p=BPSM/E-Advertisement/e-advertisement_BPSM_setup.jsp&pph_refid=<%=pph.get(i).get(0)%>"><%=pph.get(i).get(1)%></a></td>
                <td><a href="process.jsp?p=BPSM/E-Advertisement/e-advertisement_BPSM_setup.jsp&pph_refid=<%=pph.get(i).get(0)%>"><%=pph.get(i).get(2)%></a></td>
                <td><%=pph.get(i).get(3)%></td>
            </tr>
            <% }%>
        </tbody>
    </table>
</div>