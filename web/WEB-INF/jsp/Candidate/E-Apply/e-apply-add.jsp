<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
String q5 = "SELECT * "
        + "FROM position_ptj_hr pph "
        + "WHERE pph.pph_status = 'PUBLISH' ";
String p5[] = {};
MainClient mc5 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> pph5 = mc5.getQuery(q5, p5);
%>
<div class="row">
    <div class="col-md-12">

        <button type="button" onclick="location.href='process.jsp?p=Candidate/E-Apply/e-apply.jsp';"> Back </button>

        <h2>List of Published Positions</h2>
        
        <script>
            $(document).ready(function(){
                $('#myTable1').DataTable();
            });
        </script>
        
        <table class="table-bordered" id="myTable1">
            <thead>
                <tr>
                    <th rowspan="2">#</th>
                    <th rowspan="2">Position</th>
                    <th rowspan="2">Grade</th>
                    <th rowspan="2">PTJ</th>
                    <th colspan="2">Advertisement Date</th>
                    <th rowspan="2">Job Status</th>
                    <th rowspan="2">Number of Availability</th>
                    <th rowspan="2">Action</th>
                </tr>
                <tr>
                    <th>Open Date</th>
                    <th>Closing Date</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < pph5.size(); i++) {
                String pph_refid = pph5.get(i).get(0);%>
                <tr>
                    <td rowspan="3"><%=i + 1%></td>
                    <td rowspan="3"><a href="process.jsp?p=Public/e-publish.jsp&pph_refid=<%=pph5.get(i).get(0)%>&prev_url=Candidate/E-Apply/e-apply-add.jsp"><%=pph5.get(i).get(2)%></a></td>
                    <td rowspan="3"><%=pph5.get(i).get(1)%></td>
                    <td rowspan="3"><%=pph5.get(i).get(3)%></td>
                    <td rowspan="3"><%=pph5.get(i).get(8)%></td>
                    <td rowspan="3"><%=pph5.get(i).get(9)%>
                    <%
                        String sql_t1 = "SELECT vp.vp_campus, vpp.vpp_total, "
                                + "vpp.vpp_refid "
                                + "FROM vacancy_pos_ptj vpp, vacancy_pos vp "
                                + "WHERE vpp.vp_refid = vp.vp_refid "
                                + "AND vpp.pph_refid = ? "
                                + "AND vp.vp_job_status = 'PERMANENT' ";
                        String params_t1[] = {pph_refid};
                        MainClient mc_t1 = new MainClient(DBConn.getHost());
                        ArrayList<ArrayList<String>> d_t1 = mc_t1.getQuery(sql_t1, params_t1);

                        String sql_t2 = "SELECT vp.vp_campus, vpp.vpp_total, "
                                + "vpp.vpp_refid "
                                + "FROM vacancy_pos_ptj vpp, vacancy_pos vp "
                                + "WHERE vpp.vp_refid = vp.vp_refid "
                                + "AND vpp.pph_refid = ? "
                                + "AND vp.vp_job_status = 'CONTRACT' ";
                        String params_t2[] = {pph_refid};
                        MainClient mc_t2 = new MainClient(DBConn.getHost());
                        ArrayList<ArrayList<String>> d_t2 = mc_t2.getQuery(sql_t2, params_t2);

                        String sql_t3 = "SELECT vp.vp_campus, vpp.vpp_total, "
                                + "vpp.vpp_refid "
                                + "FROM vacancy_pos_ptj vpp, vacancy_pos vp "
                                + "WHERE vpp.vp_refid = vp.vp_refid "
                                + "AND vpp.pph_refid = ? "
                                + "AND vp.vp_job_status = 'FELLOWSHIP' ";
                        String params_t3[] = {pph_refid};
                        MainClient mc_t3 = new MainClient(DBConn.getHost());
                        ArrayList<ArrayList<String>> d_t3 = mc_t3.getQuery(sql_t3, params_t3);
                        %>
                    </td>
                    <td rowspan="2">Permanent & Contract</td>
                    <td rowspan="2"><% 
                        int num = (d_t1.size() > 0) ? (Integer.parseInt(d_t1.get(0).get(1))) : (0);
                        num += (d_t2.size() > 0) ? (Integer.parseInt(d_t2.get(0).get(1))) : (0);
                        out.print(num);
                  %></td>
                    <td rowspan="2">
                        <% if (d_t1.size() > 0 || d_t2.size() > 0) { 
                        %>
                        <a href="process/candidate/eApply/eApply_job.jsp?pph=<%=pph_refid %>">Apply</a>
                        <% } %>
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td>Fellowship</td>
                    <td><% if (d_t3.size() > 0) {
                            out.print(d_t3.get(0).get(1));
                        } else {
                    out.print("0");
                } %></td>
                    <td>
                        <% if (d_t3.size() > 0) { 
                        %>
                        <a href="process/candidate/eApply/eApply_job.jsp?pph=<%=pph_refid %>">Apply</a>
                        <% } %>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
        
    </div>
</div>