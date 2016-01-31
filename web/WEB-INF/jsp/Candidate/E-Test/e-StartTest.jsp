<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="libraries.My_func"%>
<%
String tsdb_refid = session.getAttribute("tsdb").toString();
String pa_refid = session.getAttribute("pa").toString();

String sql1 = "SELECT tsdb.tsdb_set_name, tst.tst_type "
        + "FROM test_set_db tsdb, test_set_type tst "
        + "WHERE tsdb.tst_refid = tst.tst_refid "
        + "AND tsdb.tsdb_refid = ? ";
String param1[] = { tsdb_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> test = mc1.getQuery(sql1, param1);
%>

<h4>E-Test</h4>

<button type="button" onclick="location.href='process.jsp?<%=My_func.URL_KEY %>=Candidate/E-Test/e-ReviewTest.jsp&pa=<%=pa_refid %>';">Back</button>
<br /><br />

<div class="row">
    <div class="col-md-12">
        
        <table class="table table-bordered">
            <tr>
                <th width="20%">Test Set Name</th>
                <th width="5%">:</th>
                <td><%=test.get(0).get(0) %></td>
            </tr>
            <tr>
                <th>Test Type</th>
                <th>:</th>
                <td><%=test.get(0).get(1) %></td>
            </tr>
        </table>
        
    </div>
</div>
            
<script>
function ask() {
    return confirm('Once entering the test, you cannot undo the test.\nAre you ready to start the test?');
}
</script>

<button type="button" onclick="if (ask()) { location.href='process.jsp?<%=My_func.URL_KEY %>=Candidate/E-Test/e-EnterTest.jsp&tsdb=<%=tsdb_refid %>&pa=<%=pa_refid %>'; }">ENTER TEST</button>