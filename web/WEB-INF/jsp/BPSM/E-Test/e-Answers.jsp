<%@page import="libraries.My_func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
String tdb_refid = session.getAttribute("tdb").toString();
String tsdb_refid = session.getAttribute("tsdb").toString();

String sql1 = "SELECT adb.adb_refid, adb.adb_ans, adb.adb_set_score, adb.tdb_refid "
        + "FROM answer_db adb, test_db tdb "
        + "WHERE adb.tdb_refid = ? "
        + "GROUP BY adb.adb_refid, adb.adb_ans, adb.adb_set_score, adb.tdb_refid ";
String param1[] = { tdb_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d1 = mc1.getQuery(sql1, param1);

String sql2 = "SELECT tsdb.tsdb_set_name, tst.tst_type, tdb.tdb_qno, tdb.tdb_quest "
        + "FROM test_db tdb, test_set_db tsdb, test_set_type tst "
        + "WHERE tdb.tsdb_refid = tsdb.tsdb_refid "
        + "AND tsdb.tst_refid = tst.tst_refid "
        + "AND tdb.tdb_refid = ? ";
String param2[] = { tdb_refid };
MainClient mc2 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d2 = mc2.getQuery(sql2, param2);
%>

<script>
$(document).ready(function(){
    $('#myTable1').DataTable();
});
</script>

<button type="button" onclick="location.href='process.jsp?<%=My_func.URL_KEY %>=BPSM/E-Test/e-Questions.jsp&tsdb=<%=tsdb_refid %>';"> Back </button>

<% 
//out.print(d2); if (true) { return; } 
%>

<br /><Br />
<div class="row">
    <div class="col-md-2">Set Name</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=d2.get(0).get(0) %></div>
</div>
<div class="row">
    <div class="col-md-2">Type</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=d2.get(0).get(1) %></div>
</div>
<div class="row">
    <div class="col-md-2">Question No.</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=d2.get(0).get(2) %></div>
</div>
<div class="row">
    <div class="col-md-2">Question</div>
    <div class="col-md-1">:</div>
    <div class="col-md-9"><%=d2.get(0).get(3) %></div>
</div>
<br />

<button type="button" data-toggle="modal" data-target="#myModal1"> Add </button>

<div class="row">
    <div class="col-md-12">
        
        <table class="table table-bordered" id="myTable1">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Answer</th>
                    <th>Score</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < d1.size(); i++) { %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=d1.get(i).get(1) %></td>
                    <td><%=d1.get(i).get(2) %></td>
                    <td>
                        <a href="#!" data-toggle="modal" data-target="#myModal_<%=i %>"><span class="glyphicon glyphicon-edit"></span></a>
                        <a href="process/bpsm/eTest/setDeleteAnswer.jsp?adb=<%=d1.get(i).get(0) %>&tdb=<%=tdb_refid %>&tsdb=<%=tsdb_refid %>"><span class="glyphicon glyphicon-remove"></span></a>
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
            <form method="post" action="process/bpsm/eTest/setSetupAnswer.jsp">
                <input type="hidden" name="tsdb_refid" value="<%=tsdb_refid %>" />
                <input type="hidden" name="tdb_refid" value="<%=tdb_refid %>" />
                <div class="modal-header">
                    <h4 class="modal-title">Answer Setup</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <label for="id">Answer</label>
                        <textarea id="adb_ans" name="adb_ans" class="form-control" placeholder="Example: Any answer."></textarea>
                        <label for="id">Score</label>
                        <input type="text" id="adb_set_score" name="adb_set_score" class="form-control" placeholder="Example: 4">                        
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
              
<% for (int i = 0; i < d1.size(); i++) { %>
<!-- Modal -->
<div id="myModal_<%=i %>" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->

        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="process/bpsm/eTest/setSetupUpdateAnswer.jsp">
                <input type="hidden" name="tsdb_refid" value="<%=tsdb_refid %>" />
                <input type="hidden" name="tdb_refid" value="<%=tdb_refid %>" />
                <input type="hidden" name="adb_refid" value="<%=d1.get(i).get(0) %>" />
                <div class="modal-header">
                    <h4 class="modal-title">Answer Setup</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <label for="id">Answer</label>
                        <textarea id="adb_ans" name="adb_ans" class="form-control" placeholder="Example: Any answer."><%=d1.get(i).get(1) %></textarea>
                        <label for="id">Score</label>
                        <input type="text" id="adb_set_score" name="adb_set_score" class="form-control" placeholder="Example: 4" value="<%=d1.get(i).get(2) %>">                      
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
<% } %>