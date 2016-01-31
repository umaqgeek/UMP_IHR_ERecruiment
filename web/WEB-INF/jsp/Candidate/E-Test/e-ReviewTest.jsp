<%@page import="libraries.My_func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pa_refid = session.getAttribute("pa").toString();

String sql1 = "SELECT tsdb.tsdb_refid, tsdb.tsdb_set_name, tr.tr_marks "
        + "FROM test_set_db tsdb, test_result tr "
        + "WHERE tsdb.tsdb_refid = tr.tsdb_refid "
        + "AND tr.pa_refid = ? ";
String param1[] = { pa_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> test = mc1.getQuery(sql1, param1);

String sql2 = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj "
        + "FROM position_ptj_hr pph, pos_applied pa "
        + "WHERE pph.pph_refid = pa.pph_refid "
        + "AND pa.pa_refid = ? ";
String param2[] = { pa_refid };
MainClient mc2 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> jobs = mc2.getQuery(sql2, param2);
%>

<h4>E-Test</h4>

<button type="button" onclick="location.href='process.jsp?<%=My_func.URL_KEY %>=Candidate/E-Test/e-Test.jsp';">Back</button>
<br /><br />

<div class="row">
    <div class="col-md-2">Grade</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=jobs.get(0).get(0) %></div>
</div>
<div class="row">
    <div class="col-md-2">Position</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=jobs.get(0).get(1) %></div>
</div>
<div class="row">
    <div class="col-md-2">PTJ</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=jobs.get(0).get(2) %></div>
</div>

<br />

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
                    <th>Set Name</th>
                    <th>Score</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < test.size(); i++) { String tsdb_refid = test.get(i).get(0); %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=test.get(i).get(1) %></td>
                    <td><%
                    String tr_marks = test.get(i).get(2);
                    if (tr_marks != "null" && tr_marks != null && tr_marks != "" && tr_marks != "0") {
                        out.print(tr_marks);
                    } else {
                        out.print("-");
                    }
                    %></td>
                    <td>
                        <% if (tr_marks != "null" && tr_marks != null && tr_marks != "" && tr_marks != "0") { } else { %>
                        <a href="process.jsp?<%=My_func.URL_KEY %>=Candidate/E-Test/e-StartTest.jsp&tsdb=<%=tsdb_refid %>&pa=<%=pa_refid %>">Enter Test</a>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
            
        </table>
    </div>
</div>