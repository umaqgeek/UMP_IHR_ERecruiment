<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="controller.Session"%>
<%
String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();
String status_new = "NEW";

String sql1 = "SELECT "
        + "pph.pph_grade, " //0
        + "pph.pph_position, " //1
        + "pph.pph_startdate, " //2
        + "pph.pph_enddate, " //3
        + "pa.pa_status, " //4
        + "pa.pa_refid, " //5
        + "pph.pph_refid, " //6
        + "fs.fs_desc " //7
        + "FROM position_ptj_hr pph, login1 l, pos_applied pa, filter f, filter_status fs "
        + "WHERE l.c_refid = pa.c_refid "
        + "AND pa.pph_refid = pph.pph_refid "
        + "AND pa.pa_refid = f.pa_refid "
        + "AND f.fs_code = fs.fs_code "
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
        + "fs.fs_desc ";
String param1[] = { l_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data1 = mc1.getQuery(sql1, param1);

//out.print(sql1); if (true) { return; }
%>



<script>
    $(document).ready(function(){
        $('#myTable2').DataTable();
    });
</script>
<table class="table table-bordered" id="myTable2">
    <thead>
        <tr>
            <th>#</th>
            <th>Grade</th>
            <th>Position</th>
            <th>Start date</th>
            <th>Close Date</th>
            <th>Status</th>
            <th>Action</th>

        </tr>
    </thead>
    <tbody>
        <% if (data1.size() > 0) { for (int i = 0; i < data1.size(); i++) { %>
        <tr>
            <td><%=i+1 %></td>
            <td><%=data1.get(i).get(0) %></td>
            <!--<td><a href="#" data-toggle="modal" data-target="#myModal_<%=i %>"><%=data1.get(i).get(1) %></a></td>-->
            <td><a href="process.jsp?p=Public/e-publish.jsp&pph_refid=<%=data1.get(i).get(6)%>&prev_url=Candidate/e-recruitment-home.jsp"><%=data1.get(i).get(1) %></a></td>
            <td><%=Func.getDate(data1.get(i).get(2)) %></td>
            <td><%=Func.getDate(data1.get(i).get(3)) %></td>
            <td><%=data1.get(i).get(7) %></td>
            <td>
                <% if (data1.get(i).get(4).toUpperCase().equals(status_new.toUpperCase())) { %>
                <a href="process/candidate/eApply/eApply_deleteJob.jsp?pa=<%=data1.get(i).get(5) %>"><i class="glyphicon glyphicon-remove"></i></a>
                <% } %>
            </td>
        </tr>
        <% } } else { %>
        <tr>
            <td colspan="7"><em>.. No Job Apply Yet ..</em></td>
        </tr>
        <% } %>
    </tbody>
</table>

    
    
<% if (data1.size() > 0) { for (int i = 0; i < data1.size(); i++) { %>
<!-- Modal -->
<div id="myModal_<%=i %>" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content--->
        <div class="modal-content">
            <div class="well">


                <div class="modal-body">
                    <h2><%=data1.get(i).get(1) %></h2>
                    <p>Start Date: <%=data1.get(i).get(2) %> <br />
                        Close Date: <%=data1.get(i).get(3) %> <br />

                        Syarat-Syarat:
                        1.
                        2.
                        3.
                        4.

                        Penerangan Tugas

                        seprti yg di maklumkan.

                    </p>


                </div>
                <div class="modal-footer">
                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Apply</button>-->
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>

    </div>



</div>
<% } } %>