<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT pph.pph_grade, pph.pph_position, c.c_name, l.l_icno, "
        + "pa.pa_dateapplied, c.c_refid, pph.pph_refid "
        + "FROM pos_applied pa, position_ptj_hr pph, candidate c, login1 l "
        + "WHERE pa.pph_refid = pph.pph_refid "
        + "AND pa.c_refid = c.c_refid "
        + "AND l.c_refid = c.c_refid ";  
String param[] = {};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d = mc.getQuery(sql, param);
%>

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
                    <th >#</th>
                    <th >Grade</th>
                    <th >Position</th>
                    <th >Candidate</th>
                    <th >IC/No Passport</th>
                    <th >Register Date</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < d.size(); i++) { %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=d.get(i).get(0) %></td>
                    <td><a href="process.jsp?p=Public/e-publish.jsp&pph_refid=<%=d.get(i).get(6)%>&prev_url=BPSM/E-Apply/e-apply_BPSM.jsp"><%=d.get(i).get(1) %></a></td>
                    <td><%=d.get(i).get(2) %></td>
                    <td><a href="process.jsp?p=Public/e-applypersonal/e-applyinformation1.jsp&c=<%=d.get(i).get(5) %>"><%=d.get(i).get(3) %></a></td>
                    <td><%=Func.getDate(d.get(i).get(4)) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</div>
