<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="controller.Session"%>
<%
String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();
String status_new = "NEW";

String sql1 = "SELECT pph.pph_grade, pph.pph_position, pph.pph_startdate, "
        + "pph.pph_enddate, pa.pa_status, pa.pa_refid, pph.pph_refid "
        + "FROM position_ptj_hr pph, login1 l, pos_applied pa "
        + "WHERE l.c_refid = pa.c_refid "
        + "AND pa.pph_refid = pph.pph_refid "
        + "AND l.l_refid = ? ";
String param1[] = { l_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data1 = mc1.getQuery(sql1, param1);

//out.print(l_refid);
%>

<button type="button" onclick="location.href='process.jsp?p=Candidate/E-Apply/e-apply-add.jsp';">Apply Job</button>
<br /><br />
<table class="table table-bordered">
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
            <td><a href="process.jsp?p=Public/e-publish.jsp&pph_refid=<%=data1.get(i).get(6)%>&prev_url=Candidate/E-Apply/e-apply.jsp"><%=data1.get(i).get(1) %></a></td>
            <td><%=data1.get(i).get(2) %></td>
            <td><%=data1.get(i).get(3) %></td>
            <td><%=data1.get(i).get(4) %></td>
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