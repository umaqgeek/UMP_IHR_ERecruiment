<%@page import="helpers.Func"%>
<%@page import="libraries.My_func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pph_refid = session.getAttribute("pph").toString();

String sql1 = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj "
        + "FROM position_ptj_hr pph "
        + "WHERE pph.pph_refid = ? ";
String param1[] = { pph_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> posi = mc1.getQuery(sql1, param1);

String sql2 = "SELECT c.c_name, l.l_icno, pa.pa_dateapplied, c.c_refid, "
        + "pph.pph_grade, pph.pph_position, pph.pph_ptj "
        + "FROM pos_applied pa, position_ptj_hr pph, candidate c, login1 l "
        + "WHERE pa.pph_refid = pph.pph_refid "
        + "AND pa.c_refid = c.c_refid "
        + "AND l.c_refid = c.c_refid "
        + "AND pph.pph_refid = ? ";  
String param2[] = { pph_refid };
MainClient mc2 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> cand = mc2.getQuery(sql2, param2);

String sql3 = "SELECT tsdb.tsdb_set_name, tst.tst_type, tsdb.tsdb_refid "
        + "FROM test_set_db tsdb, test_set_type tst "
        + "WHERE tsdb.tst_refid = tst.tst_refid ";
String param3[] = {};
MainClient mc3 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> test = mc3.getQuery(sql3, param3);
%>

<h4>E-Test</h4>
<h5>Assign Test Set</h5>

<br />
<button type="button" onclick="location.href='process.jsp?<%=My_func.URL_KEY %>=BPSM/E-Test/e-AssignTest.jsp';"> Back </button><br /><br />

<div class="row">
    <div class="col-md-2">Grade</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=posi.get(0).get(0) %></div>
</div>
<div class="row">
    <div class="col-md-2">Position</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=posi.get(0).get(1) %></div>
</div>
<div class="row">
    <div class="col-md-2">PTJ</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=posi.get(0).get(2) %></div>
</div>

<br />
<button type="button" data-toggle="modal" data-target="#myModal1"> Assign Question Set </button>

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
                    <th>Candidate's Name</th>
                    <th>IC/No Passport</th>
                    <th>Apply Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < cand.size(); i++) { String c_refid = cand.get(i).get(3); %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><a href="process.jsp?p=Public/e-applypersonal/e-applyinformation1.jsp&c=<%=c_refid %>"><%=cand.get(i).get(0) %></a></td>
                    <td><a href="process.jsp?p=Public/e-applypersonal/e-applyinformation1.jsp&c=<%=c_refid %>"><%=cand.get(i).get(1) %></a></td>
                    <td><%=Func.getDate(cand.get(i).get(2)) %></td>
                    <td>
                        <%
                        String sql_ts = "SELECT tr.tr_refid "
                                + "FROM test_result tr, pos_applied pa, candidate c "
                                + "WHERE tr.pa_refid = pa.pa_refid "
                                + "AND pa.c_refid = c.c_refid "
                                + "AND pa.c_refid = ? "
                                + "AND pa.pph_refid = ? ";
                        String param_ts[] = { c_refid, pph_refid };
                        MainClient mc_ts = new MainClient(DBConn.getHost());
                        ArrayList<ArrayList<String>> d_ts = mc_ts.getQuery(sql_ts, param_ts);
                        
                        if (d_ts.size() > 0) {
                            %>
                            <span class="glyphicon glyphicon-ok" style="color:green;"> Assigned </span>
                            <%
                        } else {
                            %>
                            <span class="glyphicon glyphicon-remove" style="color:red;"> Not Yet Assigned </span>
                            <%
                        }
                        %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</div>

<!-- Modal -->
<div id="myModal1" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->

        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="process/bpsm/eTest/setAssignSetup.jsp">
                <input type="hidden" name="pph" value="<%=pph_refid %>" />
                <div class="modal-header">
                    <h4 class="modal-title">Assign Question Setup</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <label for="id">Test Set Name</label>
                        
                        <% int num_test = 0; for (int i = 0; i < test.size(); i++) { %>
                        <br />
                        <label>
                            <input type="checkbox" name="tsdb_refid_<%=i %>" value="<%=test.get(i).get(2) %>" /> <%=test.get(i).get(0) %>
                        </label>
                        <% num_test += 1; } %>
                        
                        <input type="hidden" name="num_test" value="<%=num_test %>" />
                        
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>