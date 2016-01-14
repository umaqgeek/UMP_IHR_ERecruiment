<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT pph.pph_grade, pph.pph_position, c.c_name, c.c_icno, "
        + "pa.pa_dateapplied, c.c_refid, pph.pph_refid, pa.pa_refid, f.f_ptj, "
        + "pa.pa_status "
        + "FROM pos_applied pa, position_ptj_hr pph, candidate c, filter f "
        + "WHERE pa.pph_refid = pph.pph_refid "
        + "AND pa.c_refid = c.c_refid "
        + "AND f.pa_refid = pa.pa_refid ";  
String param[] = {};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d = mc.getQuery(sql, param);
%>

<div class="row">
    <div class="col-md-12">
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th rowspan="2">#</th>
                    <th rowspan="2">Grade</th>
                    <th rowspan="2">Position</th>
                    <th rowspan="2">Candidate</th>
                    <th rowspan="2">IC/No Passport</th>
                    <th rowspan="2">Filter Date</th>
                    <th colspan="2">Filter Level</th>
                </tr>
                <tr>
                    <th>System</th>
                    <th>PTJ</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < d.size(); i++) { %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=d.get(i).get(0) %></td>
                    <td><a href="process.jsp?p=Public/e-publish.jsp&pph_refid=<%=d.get(i).get(6)%>&prev_url=BPSM/E-Filter/e-filter_BPSM.jsp"><%=d.get(i).get(1) %></a></td>
                    <td><%=d.get(i).get(2) %></td>
                    <td><a href="process.jsp?p=Public/e-applypersonal/e-applyinformation1.jsp&c=<%=d.get(i).get(5) %>"><%=d.get(i).get(3) %></a></td>
                    <td><%=d.get(i).get(4) %></td>
                    <td>PASS</td>
                    <td>
                        <% if (d.get(i).get(8) == null || d.get(i).get(8) == "") { %>
                        <a href="process/ptj/eFilter/eFilter_set.jsp?pa=<%=d.get(i).get(7) %>&status=1">SET PASS</a> <br />
                        <a href="process/ptj/eFilter/eFilter_set.jsp?pa=<%=d.get(i).get(7) %>&status=2">SET FAIL</a>
                        <% } else { out.print(d.get(i).get(9)); } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</div>
