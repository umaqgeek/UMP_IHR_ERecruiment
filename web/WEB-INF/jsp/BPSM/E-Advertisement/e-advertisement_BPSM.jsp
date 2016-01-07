<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String query3 = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, "
        + "SUM(vpp.vpp_total), pph.pph_status, pph.w_refid "
        + "FROM vacancy_pos_ptj vpp, position_ptj_hr pph "
        + "WHERE pph.pph_refid = vpp.pph_refid "
        + "AND pph.pph_status = 'HR' "
        + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_status, pph.w_refid ";
MainClient mc3 = new MainClient(DBConn.getHost());
String params3[] = {};
ArrayList<ArrayList<String>> pph = mc3.getQuery(query3, params3);

String query4 = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, SUM(vpp.vpp_total), pph.pph_status, pph.w_refid "
        + "FROM vacancy_pos_ptj vpp, position_ptj_hr pph "
        + "WHERE pph.pph_refid = vpp.pph_refid "
        + "AND pph.pph_status = 'PUBLISH' "
        + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_status, pph.w_refid ";
MainClient mc4 = new MainClient(DBConn.getHost());
String params4[] = {};
ArrayList<ArrayList<String>> pph_publish = mc4.getQuery(query4, params4);

String q5 = "SELECT * "
        + "FROM position_ptj_hr pph "
        + "WHERE pph.pph_status = 'PUBLISH' ";
String p5[] = {};
MainClient mc5 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> pph5 = mc5.getQuery(q5, p5);
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
        
<hr />

<div class="row">
    <h2>List of Published Positions</h2>
    <table class="table-bordered">
        <thead>
            <tr>
                <th rowspan="2">#</th>
                <th rowspan="2">Position</th>
                <th rowspan="2">Grade</th>
                <th rowspan="2">PTJ</th>
                <th rowspan="2">Campus</th>
                <th rowspan="2">Job Status</th>
                <th rowspan="2">Number of Availability</th>
                <th colspan="2">Advertisement Date</th>
            </tr>
            <tr>
                <th>Open Date</th>
                <th>Closing Date</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < pph5.size(); i++) { String pph_refid = pph5.get(i).get(0); %>
            <tr>
                <td rowspan="2"><%=i + 1%></td>
                <td rowspan="2"><a href="process.jsp?p=BPSM/E-Advertisement/e-publish.jsp&pph_refid=<%=pph5.get(i).get(0)%>"><%=pph5.get(i).get(2)%></a></td>
                <td rowspan="2"><a href="process.jsp?p=BPSM/E-Advertisement/e-publish.jsp&pph_refid=<%=pph5.get(i).get(0)%>"><%=pph5.get(i).get(1)%></a></td>
                <td rowspan="2"><%=pph5.get(i).get(3)%></td>
                <td><% 
                String sql_t1 = "SELECT vp.vp_campus, vpp.vpp_total "
                        + "FROM vacancy_pos_ptj vpp, vacancy_pos vp "
                        + "WHERE vpp.vp_refid = vp.vp_refid "
                        + "AND vpp.pph_refid = ? "
                        + "AND vp.vp_job_status = 'PERMANENT' ";
                String params_t1[] = {pph_refid};
                MainClient mc_t1 = new MainClient(DBConn.getHost());
                ArrayList<ArrayList<String>> d_t1 = mc_t1.getQuery(sql_t1, params_t1);
                
                String sql_t2 = "SELECT vp.vp_campus, vpp.vpp_total "
                        + "FROM vacancy_pos_ptj vpp, vacancy_pos vp "
                        + "WHERE vpp.vp_refid = vp.vp_refid "
                        + "AND vpp.pph_refid = ? "
                        + "AND vp.vp_job_status = 'CONTRACT' ";
                String params_t2[] = {pph_refid};
                MainClient mc_t2 = new MainClient(DBConn.getHost());
                ArrayList<ArrayList<String>> d_t2 = mc_t2.getQuery(sql_t2, params_t2);
                %>
                <% if (d_t1.size() > 0) { out.print(d_t1.get(0).get(0)); } else { out.print("-"); } %>
                </td>
                <td>Permanent</td>
                <td><% if (d_t1.size() > 0) { out.print(d_t1.get(0).get(1)); } else { out.print("0"); } %></td>
                <td rowspan="2"><%=pph5.get(i).get(8)%></td>
                <td rowspan="2"><%=pph5.get(i).get(9)%></td>
            </tr>
            <tr>
                <td><% if (d_t2.size() > 0) { out.print(d_t2.get(0).get(0)); } else { out.print("-"); } %></td>
                <td>Contract</td>
                <td><% if (d_t2.size() > 0) { out.print(d_t2.get(0).get(1)); } else { out.print("0"); } %></td>
            </tr>
            <% }%>
        </tbody>
    </table>
</div>