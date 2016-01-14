<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT w.w_grade, w.w_position, w.w_ptj, w.w_refid, SUM(vp.vp_total) "
          + "FROM warrant w, vacancy_pos vp "
          + "WHERE w.w_status = 1 "
          + "AND vp.w_refid = w.w_refid "
          + "GROUP BY w.w_grade, w.w_position, w.w_ptj, w.w_refid ";
String params[] = {};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);

String query3 = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, SUM(vpp.vpp_total), pph.pph_status "
            + "FROM vacancy_pos_ptj vpp, position_ptj_hr pph "
            + "WHERE pph.pph_refid = vpp.pph_refid "
            + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_status ";
MainClient mc3 = new MainClient(DBConn.getHost());
String params3[] = {};
ArrayList<ArrayList<String>> pph = mc3.getQuery(query3, params3);
%>

<div class="row">
    <h2>E-Warrant</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Grade</th>
                <th>Position </th>
                <th>Total</th>
                <th>Setup</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < data.size(); i++) { %>
            <tr>
                <td><%=i+1 %></td>
                <td><%=data.get(i).get(0) %></td>
                <td><%=data.get(i).get(1) %></td>
                <td><span class="badge"><%=data.get(i).get(4) %></span></td>
                <td><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj_setup.jsp&w_refid=<%=data.get(i).get(3) %>" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<hr />
        
<div class="row">
    <h2>Saved Position</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Grade</th>
                <th>Position</th>
                <th>Total</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < pph.size(); i++) {%>
            <tr>
                <td><%=i + 1%></td>
                <td><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj_detail.jsp&pph=<%=pph.get(i).get(0)%>"><%=pph.get(i).get(1)%></a></td>
                <td><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj_detail.jsp&pph=<%=pph.get(i).get(0)%>"><%=pph.get(i).get(2)%></a></td>
                <td><%=pph.get(i).get(3)%></td>
                <td><%=pph.get(i).get(4)%></td>
                <td>
                    <% if (pph.get(i).get(4).toUpperCase().equals("SAVE".toUpperCase())) { %>
                    <a href="process/ptj/eAds/eAdsSavedDelete.jsp?pph=<%=pph.get(i).get(0) %>"> X </a>
                    <% } %>
                </td>
            </tr>
            <% }%>
        </tbody>
    </table>
</div>