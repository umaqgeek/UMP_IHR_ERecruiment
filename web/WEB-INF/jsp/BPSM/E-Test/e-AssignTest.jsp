<%@page import="libraries.My_func"%>
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid "
        + "FROM pos_applied pa, position_ptj_hr pph, candidate c, login1 l "
        + "WHERE pa.pph_refid = pph.pph_refid "
        + "AND pa.c_refid = c.c_refid "
        + "AND l.c_refid = c.c_refid "
        + "AND pa.pa_status = 'PASS_PTJ' "
        + "GROUP BY pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid ";  
String param[] = {};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d = mc.getQuery(sql, param);
%>

<h4>E-Test</h4>

<button type="button" onclick="location.href='process.jsp?<%=My_func.URL_KEY %>=BPSM/E-Test/e-Test.jsp';"> Back </button>

<script>
$(document).ready(function(){
    $('#myTable1').DataTable();
});
</script>
<div class="row">
    <div class="col-md-12">
        
        <table class="table table-bordered" id="myTable1">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Grade</th>
                    <th>Position</th>
                    <th>PTJ</th>
                    <th>Number of Application</th>
                    <th>Assign Test</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < d.size(); i++) { %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=d.get(i).get(0) %></td>
                    <td><a href="process.jsp?<%=My_func.URL_KEY %>=Public/e-publish.jsp&pph_refid=<%=d.get(i).get(3)%>&prev_url=BPSM/E-Test/e-AssignTest.jsp"><%=d.get(i).get(1) %></a></td>
                    <td><%=d.get(i).get(2) %></td>
                    <td><%
                    String pph_refid = d.get(i).get(3);
                    String sql_in = "SELECT COUNT(pa.pa_refid) "
                            + "FROM pos_applied pa "
                            + "WHERE pa.pph_refid = ? ";
                    String param_in[] = { pph_refid };
                    MainClient mc_in = new MainClient(DBConn.getHost());
                    ArrayList<ArrayList<String>> d_in = mc_in.getQuery(sql_in, param_in);
                    if (d_in.size() > 0) {
                        out.print(d_in.get(0).get(0));
                    } else {
                        out.print("0");
                    }
                    %></td>
                    <td>
                        <a href="process.jsp?<%=My_func.URL_KEY %>=BPSM/E-Test/e-AssignTest2.jsp&pph=<%=d.get(i).get(3)%>">Assign Test</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</div>
