<%@page import="libraries.My_func"%>
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pph_refid = session.getAttribute("pph").toString();
    
String sql = "SELECT c.c_name, l.l_icno, pa.pa_dateapplied, c.c_refid "
        + "FROM pos_applied pa, position_ptj_hr pph, candidate c, login1 l "
        + "WHERE pa.pph_refid = pph.pph_refid "
        + "AND pa.c_refid = c.c_refid "
        + "AND l.c_refid = c.c_refid "
        + "AND pph.pph_refid = ? ";  
String param[] = { pph_refid };
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d = mc.getQuery(sql, param);
%>

<h4>E-Apply</h4>

<button type="button" onclick="location.href='process.jsp?<%=My_func.URL_KEY %>=PTJ/E-Apply/e-apply_ptj.jsp';">Back</button>

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
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < d.size(); i++) { %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><a href="process.jsp?p=Public/e-applypersonal/e-applyinformation1.jsp&c=<%=d.get(i).get(3) %>"><%=d.get(i).get(0) %></a></td>
                    <td><a href="process.jsp?p=Public/e-applypersonal/e-applyinformation1.jsp&c=<%=d.get(i).get(3) %>"><%=d.get(i).get(1) %></a></td>
                    <td><%=Func.getDate(d.get(i).get(2)) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</div>
