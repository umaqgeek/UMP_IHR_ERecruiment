<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    String query3 = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, "
            + "SUM(vpp.vpp_total), pph.pph_status, pph.pph_startdate, pph.pph_enddate, pph.pph_ptj "
            + "FROM vacancy_pos_ptj vpp, position_ptj_hr pph "
            + "WHERE pph.pph_refid = vpp.pph_refid "
            + "AND pph.pph_status = 'SUBMIT' "
            + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_status, "
            + "pph.pph_startdate, pph.pph_enddate, pph.pph_ptj ";
    MainClient mc3 = new MainClient(DBConn.getHost());
    String params3[] = {};
    ArrayList<ArrayList<String>> pph = mc3.getQuery(query3, params3);

    String query4 = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, SUM(vpp.vpp_total), pph.pph_status "
            + "FROM vacancy_pos_ptj vpp, position_ptj_hr pph "
            + "WHERE pph.pph_refid = vpp.pph_refid "
            + "AND pph.pph_status = 'PUBLISH' "
            + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_status ";
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

<script>
    $(document).ready(function () {
        $('#myTable1').DataTable();
    });
</script>

<div class="row">
    <div class="col-md-12">
        <h2>List of Positions</h2>
        <table class="table table-bordered" id="myTable1">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Grade</th>
                    <th>Position</th>
                    <th>PTJ</th>
                    <th>Total</th>
                    <th>Action</th>
                    <th>
                        ( <input type="checkbox" id="pph_refid_all" /> Tick All ) 
                        <a href="#!" data-toggle="modal" data-target="#myModalAll" id="idsetupall">Set Date All</a>
                    </th>
                    <th>Open Date</th>
                    <th>Closing Date</th>
                    <th>Status to Publish</th>
                    <th><a href="process/bpsm/eAds/ePublishAll.jsp">Publish All</a></th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < pph.size(); i++) {%>
                <tr>
                    <td><%=i + 1%></td>
                    <td><a href="process.jsp?p=BPSM/E-Advertisement/e-advertisement_BPSM_setup.jsp&pph_refid=<%=pph.get(i).get(0)%>"><%=pph.get(i).get(1)%></a></td>
                    <td><a href="process.jsp?p=BPSM/E-Advertisement/e-advertisement_BPSM_setup.jsp&pph_refid=<%=pph.get(i).get(0)%>"><%=pph.get(i).get(2)%></a></td>
                    <td><a href="process.jsp?p=BPSM/E-Advertisement/e-advertisement_BPSM_setup.jsp&pph_refid=<%=pph.get(i).get(0)%>"><%=pph.get(i).get(7)%></a></td>
                    <td><%=pph.get(i).get(3)%></td>
                    <td>
                        <a href="process/bpsm/eAds/eAds2ReturnToPtj.jsp?pph=<%=pph.get(i).get(0)%>"> Return to PTJ </a>

                    </td>
                    <td>
                        <input type="checkbox" name="pph_refid_<%=i%>" id="pph_refid_<%=i%>" value="<%=pph.get(i).get(0)%>" />
                        <a href="#!" data-toggle="modal" data-target="#myModal_<%=i%>"> Set Date </a>
                    </td>
                    <td><%=Func.getDate(pph.get(i).get(5))%></td>
                    <td><%=Func.getDate(pph.get(i).get(6))%></td>
                    <td>
                        <%
                        String sql1 = "SELECT pph.pph_startdate, pph.pph_enddate, pph.pph_salary_min, pph.pph_salary_max "
                                + "FROM position_ptj_hr pph "
                                + "WHERE pph.pph_status = 'SUBMIT' "
                                + "AND (NVL(pph.pph_startdate, '01-JAN-1970') <> '01-JAN-1970' "
                                + "AND NVL(pph.pph_enddate, '01-JAN-1970') <> '01-JAN-1970' "
                                + "AND NVL(pph.pph_salary_min, 0) <> 0 "
                                + "AND NVL(pph.pph_salary_max, 0) <> 0) "
                                + "AND pph.pph_refid = ? ";
                        String param1[] = { pph.get(i).get(0) };
                        MainClient mc1 = new MainClient(DBConn.getHost());
                        ArrayList<ArrayList<String>> d1 = mc1.getQuery(sql1, param1);
                        %>
                        <% if (d1.size() > 0) { %>
                        <span class="glyphicon glyphicon-ok"></span>
                        <% } else { %>
                        <span class="glyphicon glyphicon-remove"></span>
                        <% } %>
                    </td>
                    <td>
                        <% if (Func.getDate(pph.get(i).get(5)) != "" && Func.getDate(pph.get(i).get(6)) != "") { %>
                        <a href="process/bpsm/eAds/ePublish.jsp?pph=<%=pph.get(i).get(0)%>">Publish</a>
                        <% } %>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>

    </div>
</div>

<script>
    $(document).ready(function () {
        $("#idsetupall").hide();
        $("#pph_refid_all").click(function () {
            var val = $(this).is(':checked');
            for (i = 0; i <<%=pph.size()%>; i++) {
                $("#pph_refid_" + i).prop('checked', val);
            }
            if (val) {
                $("#idsetupall").show();
            } else {
                $("#idsetupall").hide();
            }
        });
    });
</script>

<% for (int i = 0; i < pph.size(); i++) {%>
<!-- Modal -->
<div id="myModal_<%=i%>" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">

            <form method="post" action="process/bpsm/eAds/eAds3SetupAll.jsp">
                <input type="hidden" name="pph_refid" value="<%=pph.get(i).get(0)%>" />
                <input type="hidden" name="pph_status" value="SUBMIT" />
                <div class="modal-header">
                    <h4 class="modal-title">Setup Positions</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <label for="pph_startdate">Start Date</label>
                        <input type="date" id="pph_startdate" name="pph_startdate" class="form-control" value="<%=Func.getTodayDate3()%>" />
                        <label for="pph_enddate">End Date</label>
                        <input type="date" id="pph_enddate" name="pph_enddate" class="form-control" value="<%=Func.getTodayDate3()%>" />
                        <!--                        <label for="pph_salary_min">Minimum Salary</label>
                                                <input type="text" class="form-control" id="pph_salary_min" name="pph_salary_min" placeholder="Example: 1500" />
                                                <label for="pph_salary_max">Maximum Salary</label>
                                                <input type="text" class="form-control" id="pph_salary_max" name="pph_salary_max" placeholder="Example: 5000" />-->
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Save</button>
                </div>
            </form>

        </div>
    </div>
</div>
<% }%>

<div id="myModalAll" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">

            <form method="post" action="process/bpsm/eAds/eAds3SetupAll2.jsp">
                <div class="modal-header">
                    <h4 class="modal-title">Setup All Positions</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <label for="pph_startdate">Start Date</label>
                        <input type="date" id="pph_startdate" name="pph_startdate" class="form-control" value="<%=Func.getTodayDate3()%>" />
                        <label for="pph_enddate">End Date</label>
                        <input type="date" id="pph_enddate" name="pph_enddate" class="form-control" value="<%=Func.getTodayDate3()%>" />
                        <!--                        <label for="pph_salary_min">Minimum Salary</label>
                                                <input type="text" class="form-control" id="pph_salary_min" name="pph_salary_min" placeholder="Example: 1500" />
                                                <label for="pph_salary_max">Maximum Salary</label>
                                                <input type="text" class="form-control" id="pph_salary_max" name="pph_salary_max" placeholder="Example: 5000" />-->
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Save</button>
                </div>
            </form>

        </div>
    </div>
</div>

<hr />

<script>
    $(document).ready(function () {
        $('#myTable2').DataTable();
    });
</script>

<div class="row">
    <div class="col-md-12">
        <h2>List of Published Positions</h2>
        <table class="table-bordered" id="myTable2">
            <thead>
                <tr>
                    <th rowspan="2">#</th>
                    <th rowspan="2">Position</th>
                    <th rowspan="2">Grade</th>
                    <th rowspan="2">PTJ</th>
                    <!--<th rowspan="2">Campus</th>-->
                    <th rowspan="2">Job Status</th>
                    <th rowspan="2">Number of Availability</th>
                    <th colspan="2">Advertisement Date</th>
                    <th rowspan="2">Edit</th>
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
                    <td rowspan="3"><a href="process.jsp?p=BPSM/E-Advertisement/e-publish.jsp&pph_refid=<%=pph5.get(i).get(0)%>"><%=pph5.get(i).get(2)%></a></td>
                    <td rowspan="3"><a href="process.jsp?p=BPSM/E-Advertisement/e-publish.jsp&pph_refid=<%=pph5.get(i).get(0)%>"><%=pph5.get(i).get(1)%></a></td>
                    <td rowspan="3"><%=pph5.get(i).get(3)%>
                        <%
                            String sql_t1 = "SELECT vpp.vpp_campus, vpp.vpp_total "
                                    + "FROM vacancy_pos_ptj vpp "
                                    + "WHERE vpp.pph_refid = ? "
                                    + "AND vpp.vpp_job_status = 'TETAP' ";
                            String params_t1[] = {pph_refid};
                            MainClient mc_t1 = new MainClient(DBConn.getHost());
                            ArrayList<ArrayList<String>> d_t1 = mc_t1.getQuery(sql_t1, params_t1);

                            String sql_t2 = "SELECT vpp.vpp_campus, vpp.vpp_total "
                                    + "FROM vacancy_pos_ptj vpp "
                                    + "WHERE vpp.pph_refid = ? "
                                    + "AND vpp.vpp_job_status = 'KONTRAK' ";
                            String params_t2[] = {pph_refid};
                            MainClient mc_t2 = new MainClient(DBConn.getHost());
                            ArrayList<ArrayList<String>> d_t2 = mc_t2.getQuery(sql_t2, params_t2);

                            String sql_t3 = "SELECT vpp.vpp_campus, vpp.vpp_total "
                                    + "FROM vacancy_pos_ptj vpp "
                                    + "WHERE vpp.pph_refid = ? "
                                    + "AND vpp.vpp_job_status = 'FELLOW' ";
                            String params_t3[] = {pph_refid};
                            MainClient mc_t3 = new MainClient(DBConn.getHost());
                            ArrayList<ArrayList<String>> d_t3 = mc_t3.getQuery(sql_t3, params_t3);
                        %>
                    </td>
                    <td rowspan="2">Permanent &amp; Contract</td>
                    <td rowspan="2"><%
                        int t1 = (d_t1.size() > 0) ? (Integer.parseInt(d_t1.get(0).get(1))) : (0);
                        int t2 = (d_t2.size() > 0) ? (Integer.parseInt(d_t2.get(0).get(1))) : (0);
                        int tt = t1 + t2;
                        out.print(tt);
                        if (d_t1.size() > 0) {
    //                    out.print(d_t1.get(0).get(1)); 
                        } else {
    //                    out.print("0"); 
                        }%></td>
                    <td rowspan="3"><%=Func.getDate(pph5.get(i).get(8))%></td>
                    <td rowspan="3"><%=Func.getDate(pph5.get(i).get(9))%></td>
                    <td rowspan="3">
                        <a href="process/bpsm/eAds/eEditBack.jsp?pph=<%=pph5.get(i).get(0) %>">
                            <span class="glyphicon glyphicon-edit"></span>
                        </a>
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
                </tr>
                <% }%>
            </tbody>
        </table>
    </div>
</div>