<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql1 = "SELECT * FROM grade";
String params1[] = {};
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data1 = mc1.getQuery(sql1, params1);
%>

<div class="row">
    <button type="button" onclick="location.href='process.jsp?p=BPSM/E-Setup/e-setupAdd.jsp';">Add New Grade</button>
</div>
<br /><br />
<div class="row">
    <table class="table" id="dataTables-example">
        <thead>
            <tr>
                <th>#</th>
                <th>Grade</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < data1.size(); i++) { %>
            <tr>
                <td><%=i+1 %></td>
                <td><%=data1.get(i).get(1) %></td>
                <td><a href="process.jsp?p=BPSM/E-Setup/e-setupDetail.jsp&g_refid=<%=data1.get(i).get(0) %>">Setup</a></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function() {
        $('#ddataTables-example').DataTable({
            responsive: true
        });
    });
</script>