<%@page import="libraries.My_func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>
<%
String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();

String sql1 = "SELECT "
        + "pph.pph_grade, " //0
        + "pph.pph_position, " //1
        + "pph.pph_startdate, " //2
        + "pph.pph_enddate, " //3
        + "pa.pa_status, " //4
        + "pa.pa_refid, " //5
        + "pph.pph_refid, " //6
        + "fs.fs_desc, " //7
        + "pph.pph_ptj " //8
        + "FROM position_ptj_hr pph, login1 l, pos_applied pa, filter f, "
        + "filter_status fs, test_result tr "
        + "WHERE l.c_refid = pa.c_refid "
        + "AND pa.pph_refid = pph.pph_refid "
        + "AND pa.pa_refid = f.pa_refid "
        + "AND f.fs_code = fs.fs_code "
        + "AND pa.pa_refid = tr.pa_refid "
        + "AND l.l_refid = ? "
//        + "AND SYSDATE >= pph.pph_startdate "
//        + "AND SYSDATE <= pph.pph_enddate "
        + "GROUP BY pph.pph_grade, " //0
        + "pph.pph_position, " //1
        + "pph.pph_startdate, " //2
        + "pph.pph_enddate, " //3
        + "pa.pa_status, " //4
        + "pa.pa_refid, " //5
        + "pph.pph_refid, " //6
        + "fs.fs_desc, " //7
        + "pph.pph_ptj ";
String param1[] = { l_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data1 = mc1.getQuery(sql1, param1);

//out.print(data1); if (true) { return; }
%>

<h4>E-Test</h4>

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
                    <th>Grade</th>
                    <th>Position</th>
                    <th>PTJ</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < data1.size(); i++) { String pa_refid = data1.get(i).get(5); %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=data1.get(i).get(0) %></td>
                    <td><%=data1.get(i).get(1) %></td>
                    <td><%=data1.get(i).get(8) %></td>
                    <td>
                        <a href="process.jsp?<%=My_func.URL_KEY %>=Candidate/E-Test/e-ReviewTest.jsp&pa=<%=pa_refid %>">Review Test</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</div>
