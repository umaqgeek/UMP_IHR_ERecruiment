<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT w.w_grade, w.w_position, w.w_ptj, w.w_refid, SUM(vp.vp_total) "
          + "FROM warrant w, vacancy_pos vp "
          + "WHERE w.w_status = 1 "
          + "AND vp.w_refid = w.w_refid "
          + "GROUP BY w.w_grade, w.w_position, w.w_ptj, w.w_refid ";
String params[] = {};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);

String query3 = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, SUM(vpp.vpp_total), pph.pph_status "
            + "FROM vacancy_pos_ptj vpp, position_ptj_hr pph "
            + "WHERE pph.pph_refid = vpp.pph_refid "
            + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_status ";
MainClient mc3 = new MainClient(DBConn.getHost());
String params3[] = {};
ArrayList<ArrayList<String>> pph = mc3.getQuery(query3, params3);

String sql_test = "SELECT "
        
        + "WMH_JOB_CODE, "
        + "WO_DEPT_CODE, "
        + "SS_SERVICE_DESC, "
        + "NVL(DM_DEPT_DESC, WO_ORGANIZATION_DESC) DM_DEPT_DESC, "
        + "count(1) "
        
        + "FROM WARRANT_MAIN_HEAD,WARRANT_MAIN_DETL,SERVICE_SCHEME,"
        + "WARRANT_SKP_NO,WARRANT_ORGANIZATION,DEPARTMENT_MAIN "
        + "WHERE WMH_WARRANT_REF = WMD_WARRANT_REF "
        + "AND WMH_JOB_CODE = SS_SERVICE_CODE "
        + "AND WMD_SKP_REF = WSN_SKP_REF "
        + "AND WMD_ORGANIZATION_REF_BU = WO_ORGANIZATION_REF "
        + "AND WO_DEPT_CODE = DM_DEPT_CODE(+) "
        + "AND WMD_WARRANT_POST_STATUS <> 'MANSUH' "
        + "AND WMD_WARRANT_POST_STATUS = 'BELUM SANDANG' "
        + "GROUP BY WMH_JOB_CODE, WO_DEPT_CODE, SS_SERVICE_DESC, DM_DEPT_DESC, WO_ORGANIZATION_DESC "
        + "ORDER BY DM_DEPT_DESC ";
String param_test[] = {};
MainClient mc_test = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d_test = mc_test.getQuery(sql_test, param_test);

//out.print(d_test); if (true) { return; };
%>

<script>
    $(document).ready(function () {
        $('#myTable1').DataTable();
    });
</script>

<div class="row">
    <div class="col-md-12">
    <h2>E-Warrant</h2>
    <table class="table table-bordered" id="myTable1">
        <thead>
            <tr>
                <th>#</th>
                <th>Grade</th>
                <th>Department</th>
                <th>Position</th>
                <th>Placement</th>
                <th>Total</th>
                <th>Setup</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < d_test.size(); i++) { %>
            <tr>
                <td><%=i+1 %></td>
                <td><%=d_test.get(i).get(0) %></td>
                <td><%=d_test.get(i).get(1) %></td>
                <td><%=d_test.get(i).get(2) %></td>
                <td><%=d_test.get(i).get(3) %></td>
                <td><span class="badge"><%=d_test.get(i).get(4) %></span></td>
                <td><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj_setup.jsp&w_refid=<%=d_test.get(i).get(0) %>" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </div>
</div>

<hr />
        
<script>
    $(document).ready(function () {
        $('#myTable2').DataTable();
    });
</script>

<div class="row">
    <div class="col-md-12">
    <h2>Saved Position</h2>
    <table class="table table-bordered" id="myTable2">
        <thead>
            <tr>
                <th>#</th>
                <th>Grade</th>
                <th>Position</th>
                <th>Total</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < pph.size(); i++) {%>
            <tr>
                <td><%=i + 1%></td>
                <td><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj_detail.jsp&pph=<%=pph.get(i).get(0)%>"><%=pph.get(i).get(1)%></a></td>
                <td><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj_detail.jsp&pph=<%=pph.get(i).get(0)%>"><%=pph.get(i).get(2)%></a></td>
                <td><%=pph.get(i).get(3)%></td>
                <td><%=pph.get(i).get(4)%></td>
                <td>
                    <% if (pph.get(i).get(4).toUpperCase().equals("ENTRY".toUpperCase())) { %>
                    <a href="process/ptj/eAds/eAdsSavedDelete.jsp?pph=<%=pph.get(i).get(0) %>"> X </a>
                    <% } %>
                </td>
            </tr>
            <% }%>
        </tbody>
    </table>
    </div>
</div>