<%@page import="libraries.My_func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT tsd.tsdb_refid, tsd.tsdb_set_name, tst.tst_type, tst.tst_refid "
        + "FROM test_set_db tsd, test_set_type tst "
        + "WHERE tsd.tst_refid = tst.tst_refid ";  
String param[] = {};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d = mc.getQuery(sql, param);

//out.print(d); if (true) { return; }
%>

<h4>E-Test</h4>

<button type="button" onclick="location.href='process.jsp?<%=My_func.URL_KEY %>=BPSM/E-Test/e-AssignTest.jsp';"> Assign Test </button> <br />

<script>
$(document).ready(function(){
    $('#myTable1').DataTable();
});
</script>

<button type="button" data-toggle="modal" data-target="#myModal1"> Add </button>

<div class="row">
    <div class="col-md-12">
        
        <table class="table table-bordered" id="myTable1">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Set Name</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < d.size(); i++) { %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><a href="process.jsp?<%=My_func.URL_KEY %>=BPSM/E-Test/e-Questions.jsp&tsdb=<%=d.get(i).get(0) %>"><%=d.get(i).get(1) %></a></td>
                    <td><%=d.get(i).get(2) %></td>
                    <td>
                        <a href="#!" data-toggle="modal" data-target="#myModal_<%=i %>"><span class="glyphicon glyphicon-edit"></span></a>
                        <a href="process/bpsm/eTest/setDelete.jsp?tsdb=<%=d.get(i).get(0) %>"><span class="glyphicon glyphicon-remove"></span></a>
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
            <form method="post" action="process/bpsm/eTest/setSetup.jsp">
                <div class="modal-header">
                    <h4 class="modal-title">E-Test Setup</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <label for="id">Test Set Name</label>
                        <input type="text" id="tsdb_set_name" name="tsdb_set_name" class="form-control" placeholder="Example: Math 1">
                        <label for="name">Category</label>
                        <%
                        String sql2 = "SELECT tst.tst_refid, tst.tst_type "
                                + "FROM test_set_type tst ";
                        String param2[] = {};
                        MainClient mc2 = new MainClient(DBConn.getHost());
                        ArrayList<ArrayList<String>> d2 = mc2.getQuery(sql2, param2);
                        %>
                        <select name="tst_refid">
                            <% for (int i = 0; i < d2.size(); i++) { %>
                            <option value="<%=d2.get(i).get(0) %>"><%=d2.get(i).get(1).toUpperCase() %></option>
                            <% } %>
                        </select>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
              
<% for (int i = 0; i < d.size(); i++) { %>
<!-- Modal -->
<div id="myModal_<%=i %>" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->

        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="process/bpsm/eTest/setSetupUpdate.jsp">
                <input type="hidden" name="tsdb_refid" value="<%=d.get(i).get(0) %>" />
                <div class="modal-header">
                    <h4 class="modal-title">E-Test Setup</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <label for="id">Test Set Name</label>
                        <input type="text" id="tsdb_set_name" name="tsdb_set_name" class="form-control" placeholder="Example: Math 1" value="<%=d.get(i).get(1) %>">
                        <label for="name">Category</label>
                        <%
                        String sql3 = "SELECT tst.tst_refid, tst.tst_type "
                                + "FROM test_set_type tst ";
                        String param3[] = {};
                        MainClient mc3 = new MainClient(DBConn.getHost());
                        ArrayList<ArrayList<String>> d3 = mc3.getQuery(sql3, param3);
                        %>
                        <select name="tst_refid">
                            <% for (int j = 0; j < d3.size(); j++) { %>
                            <option value="<%=d3.get(j).get(0) %>" 
                                    <% if (d.get(i).get(3).equals(d3.get(j).get(0))) { out.print("selected"); }  %>><%=d3.get(j).get(1).toUpperCase() %></option>
                            <% } %>
                        </select>
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