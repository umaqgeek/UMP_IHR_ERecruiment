<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="libraries.My_func"%>
<%
String tsdb_refid = session.getAttribute("tsdb").toString();

String sql1 = "SELECT tdb.tdb_refid, tdb.tdb_qno, tdb.tdb_quest, tdb.tsdb_refid "
        + "FROM test_db tdb, test_set_db tsdb "
        + "WHERE tdb.tsdb_refid = ? "
        + "GROUP BY tdb.tdb_refid, tdb.tdb_qno, tdb.tdb_quest, tdb.tsdb_refid ";
String param1[] = { tsdb_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d1 = mc1.getQuery(sql1, param1);

String sql2 = "SELECT tsdb.tsdb_set_name, tst.tst_type "
        + "FROM test_set_db tsdb, test_set_type tst "
        + "WHERE tsdb.tst_refid = tst.tst_refid "
        + "AND tsdb.tsdb_refid = ? "
        + "GROUP BY tsdb.tsdb_set_name, tst.tst_type ";
String param2[] = { tsdb_refid };
MainClient mc2 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d2 = mc2.getQuery(sql2, param2);
%>

<script>
$(document).ready(function(){
    $('#myTable1').DataTable();
});
</script>

<button type="button" onclick="location.href='process.jsp?<%=My_func.URL_KEY %>=BPSM/E-Test/e-Test.jsp';"> Back </button>

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
<br />

<button type="button" data-toggle="modal" data-target="#myModal1"> Add </button>

<div class="row">
    <div class="col-md-12">
        
        <table class="table table-bordered" id="myTable1">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Question No.</th>
                    <th>Question</th>
                    <th>Set Answers</th>
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
                        <a href="process.jsp?<%=My_func.URL_KEY %>=BPSM/E-Test/e-Answers.jsp&tdb=<%=d1.get(i).get(0) %>&tsdb=<%=d1.get(i).get(3) %>">Set Answers</a>
                    </td>
                    <td>
                        <a href="#!" data-toggle="modal" data-target="#myModal_<%=i %>"><span class="glyphicon glyphicon-edit"></span></a>
                        <a href="process/bpsm/eTest/setDeleteQuestion.jsp?tdb=<%=d1.get(i).get(0) %>&tsdb=<%=d1.get(i).get(3) %>"><span class="glyphicon glyphicon-remove"></span></a>
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
            <form method="post" action="process/bpsm/eTest/setSetupQuestion.jsp">
                <input type="hidden" name="tsdb_refid" value="<%=tsdb_refid %>" />
                <div class="modal-header">
                    <h4 class="modal-title">Question Setup</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <label for="id">Question No.</label>
                        <input type="text" id="tdb_qno" name="tdb_qno" class="form-control" placeholder="Example: 1">
                        <label for="id">Question</label>
                        <textarea id="tdb_quest" name="tdb_quest" class="form-control" placeholder="Example: What is the output of 2 + 1 ?"></textarea>                        
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
            <form method="post" action="process/bpsm/eTest/setSetupUpdateQuestion.jsp">
                <input type="hidden" name="tsdb_refid" value="<%=tsdb_refid %>" />
                <input type="hidden" name="tdb_refid" value="<%=d1.get(i).get(0) %>" />
                <div class="modal-header">
                    <h4 class="modal-title">Question Setup</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <label for="id">Question No.</label>
                        <input type="text" id="tdb_qno" name="tdb_qno" class="form-control" placeholder="Example: 1" value="<%=d1.get(i).get(1) %>">
                        <label for="id">Question</label>
                        <textarea id="tdb_quest" name="tdb_quest" class="form-control" placeholder="Example: What is the output of 2 + 1 ?"><%=d1.get(i).get(2) %></textarea>                        
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