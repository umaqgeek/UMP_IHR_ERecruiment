<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT w.w_grade, w.w_position, w.w_ptj, w.w_total, w.w_refid "
      + "FROM warrant w "
      + "WHERE w.w_status = 1 ";
String params[] = {};

MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);

String query3 = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, SUM(vpp.vpp_total), pph.pph_status, pph.w_refid "
            + "FROM vacancy_pos_ptj vpp, position_ptj_hr pph "
            + "WHERE pph.pph_refid = vpp.pph_refid "
            + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_status, pph.w_refid ";
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
                <td><span class="badge"><%=data.get(i).get(3) %></span></td>
                <td><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj_setup.jsp&w_refid=<%=data.get(i).get(4) %>" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
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
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < pph.size(); i++) {%>
            <tr>
                <td><%=i + 1%></td>
                <td><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj_detail.jsp&w_refid=<%=pph.get(i).get(5)%>"><%=pph.get(i).get(1)%></a></td>
                <td><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj_detail.jsp&w_refid=<%=pph.get(i).get(5)%>"><%=pph.get(i).get(2)%></a></td>
                <td><%=pph.get(i).get(3)%></td>
            </tr>
            <% }%>
        </tbody>
    </table>
</div>