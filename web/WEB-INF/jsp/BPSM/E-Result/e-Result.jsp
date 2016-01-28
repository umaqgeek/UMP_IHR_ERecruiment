<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT pph.pph_grade, pph.pph_position, c.c_name, l.l_icno, "
        + "pa.pa_dateapplied, c.c_refid, pph.pph_refid, pa.pa_refid, f.f_ptj, "
        + "f.f_system, f.f_system_status, f.f_ptj_status, f.f_intvptj_status, f.f_intuni_status, f_all_status "
        + "FROM pos_applied pa, position_ptj_hr pph, candidate c, filter f, "
        + "login1 l, filter_status fs "
        + "WHERE pa.pph_refid = pph.pph_refid "
        + "AND pa.c_refid = c.c_refid "
        + "AND f.pa_refid = pa.pa_refid "
        + "AND c.c_refid = l.c_refid "
        + "AND f.fs_code = fs.fs_code "
        + "GROUP BY pph.pph_grade, pph.pph_position, c.c_name, l.l_icno, "
        + "pa.pa_dateapplied, c.c_refid, pph.pph_refid, pa.pa_refid, f.f_ptj, "
        + "f.f_system, f.f_system_status, f.f_ptj_status, f.f_intvptj_status, f.f_intuni_status, f_all_status ";
String param[] = {};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d = mc.getQuery(sql, param);

//out.print(sql); if (true) { return; }
%>

<h4>E-Result</h4>

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
                    <th rowspan="2">#</th>
                    <th rowspan="2">Grade</th>
                    <th rowspan="2">Position</th>
                    <th rowspan="2">Candidate</th>
                    <th rowspan="2">IC/No Passport</th>
                    <th rowspan="2">Apply Date</th>
                    <th colspan="5">Filter Level</th>
                    <th rowspan="2">All</th>
                </tr>
                <tr>
                    <th>System</th>
                    <th>PTJ</th>
                    <th>Test</th>
                    <th>Pre-Interview</th>
                    <th>Interview</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < d.size(); i++) { %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=d.get(i).get(0) %></td>
                    <td><a href="process.jsp?p=Public/e-publish.jsp&pph_refid=<%=d.get(i).get(6)%>&prev_url=BPSM/E-Result/e-Result.jsp"><%=d.get(i).get(1) %></a></td>
                    <td><%=d.get(i).get(2) %></td>
                    <td><a href="process.jsp?p=Public/e-applypersonal/e-applyinformation1.jsp&c=<%=d.get(i).get(5) %>"><%=d.get(i).get(3) %></a></td>
                    <td><%=Func.getDate(d.get(i).get(4)) %></td>
                    <td><%
                    String f_system_status = d.get(i).get(10);
                    String sql_f1 = "SELECT fs.fs_desc "
                            + "FROM filter_status fs "
                            + "WHERE fs.fs_code = ? ";
                    String param_f1[] = { f_system_status };
                    MainClient mc_f1 = new MainClient(DBConn.getHost());
                    ArrayList<ArrayList<String>> d_f1 = mc_f1.getQuery(sql_f1, param_f1);
                    if (d_f1.size() > 0) {
                        out.print(d_f1.get(0).get(0));
                    }
                    %>&nbsp;</td>
                    <td>
                        <% if (d.get(i).get(8) == null || d.get(i).get(8) == "") { %>
                        
                        <% } else { 
                            String f_ptj_status = d.get(i).get(11);
                            String sql_f2 = "SELECT fs.fs_desc "
                                    + "FROM filter_status fs "
                                    + "WHERE fs.fs_code = ? ";
                            String param_f2[] = { f_ptj_status };
                            MainClient mc_f2 = new MainClient(DBConn.getHost());
                            ArrayList<ArrayList<String>> d_f2 = mc_f2.getQuery(sql_f2, param_f2);
                            if (d_f2.size() > 0) {
                                out.print(d_f2.get(0).get(0));
                            }
                        } %>
                    </td>
                    <td></td>
                    <td><%
                    String f_intvptj_status = d.get(i).get(12);
                    String sql_f4 = "SELECT fs.fs_desc "
                            + "FROM filter_status fs "
                            + "WHERE fs.fs_code = ? ";
                    String param_f4[] = { f_intvptj_status };
                    MainClient mc_f4 = new MainClient(DBConn.getHost());
                    ArrayList<ArrayList<String>> d_f4 = mc_f4.getQuery(sql_f4, param_f4);
                    if (d_f4.size() > 0) {
                        out.print(d_f4.get(0).get(0));
                    }
                    %></td>
                    <td><%
                    String f_intuni_status = d.get(i).get(13);
                    String sql_f5 = "SELECT fs.fs_desc "
                            + "FROM filter_status fs "
                            + "WHERE fs.fs_code = ? ";
                    String param_f5[] = { f_intuni_status };
                    MainClient mc_f5 = new MainClient(DBConn.getHost());
                    ArrayList<ArrayList<String>> d_f5 = mc_f5.getQuery(sql_f5, param_f5);
                    if (d_f5.size() > 0) {
                        out.print(d_f5.get(0).get(0));
                    }
                    %></td>
                    <td><%
                    String f_all_status = d.get(i).get(14);
                    String sql_f6 = "SELECT fs.fs_desc "
                            + "FROM filter_status fs "
                            + "WHERE fs.fs_code = ? ";
                    String param_f6[] = { f_all_status };
                    MainClient mc_f6 = new MainClient(DBConn.getHost());
                    ArrayList<ArrayList<String>> d_f6 = mc_f6.getQuery(sql_f6, param_f6);
                    if (d_f6.size() > 0) {
                        out.print(d_f6.get(0).get(0));
                    } else {
                        %>
                        <a href="#!">Set</a>
                        <%
                    }
                    %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</div>
