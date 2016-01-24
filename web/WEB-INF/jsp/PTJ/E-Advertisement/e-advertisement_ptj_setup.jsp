<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String wjc = session.getAttribute("wjc").toString();
String wdc = session.getAttribute("wdc").toString();

//String query = "SELECT * "
//        + "FROM warrant w, vacancy_pos vp "
//        + "WHERE vp.w_refid = w.w_refid "
//        + "AND w.w_refid = ? ";
String query = "SELECT "
        
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
        + "AND WMH_JOB_CODE = ? "
        + "AND WO_DEPT_CODE = ? "
        + "GROUP BY WMH_JOB_CODE, WO_DEPT_CODE, SS_SERVICE_DESC, DM_DEPT_DESC, WO_ORGANIZATION_DESC "
        + "ORDER BY DM_DEPT_DESC ";
String params[] = { wjc, wdc };
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data1 = mc.getQuery(query, params);

if (data1.size() == 0) {
    %>
<ul>
    <li><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj.jsp">&lt;&lt; Back to List Position from E-Warrant</a></li>
</ul>
    <%
    return;
}

String query2 = "SELECT * "
        + "FROM area_expertise ";
MainClient mc2 = new MainClient(DBConn.getHost());
String params2[] = {};
ArrayList<ArrayList<String>> ae = mc2.getQuery(query2, params2);

String sql_campus = "SELECT ld.ld_desc "
        + "FROM lookup_detail ld, lookup_master lm "
        + "WHERE ld.lm_refid = lm.lm_refid "
        + "AND lm.lm_desc = 'Campus' ";
String param_campus[] = {};
MainClient mc_campus = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d_campus = mc_campus.getQuery(sql_campus, param_campus);
%>

<ul>
    <li><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj.jsp">&lt;&lt; Back to List Position from E-Warrant</a></li>
</ul>

<form action="process/ptj/eAds/eAds1.jsp" method="post" id="form_eads1">
    <div class="row">
        Grade: <%=data1.get(0).get(1) %> <br />
        Position: <%=data1.get(0).get(2) %> <br />
        PTJ: <%=data1.get(0).get(3) %> <br />
        <input type="hidden" name="pph_grade" value="<%=data1.get(0).get(1) %>" />
        <input type="hidden" name="pph_position" value="<%=data1.get(0).get(2) %>" />
        <input type="hidden" name="pph_ptj" value="<%=data1.get(0).get(3) %>" />
    </div>
    <hr />
    <div class="row">
        Vacancy Position:- <br />
        <table class="table">
            <thead>
                <tr>
                    <th>Job Status</th>
                    <th>Total</th>
                    <th>Campus</th>
<!--                    <th>Add</th>-->
                </tr>
            </thead>
            <tbody>
                <% int num_vp_refid = 0; %>
                <% for (int i = 0; i < data1.size(); i++) { num_vp_refid += 1; %>
                <tr>
                    <td><%=data1.get(i).get(6) %></td>
                    <td>
                        <input type="hidden" name="vp_refid_<%=i %>" value="<%=data1.get(i).get(5) %>" />
                        <input type="hidden" name="vpp_job_status_<%=i %>" value="<%=data1.get(i).get(6) %>" />
                        <select name="vpp_total_<%=i %>">
                            <% for (int j = 0; j <= Integer.parseInt(data1.get(i).get(7)); j++) { %>
                            <option value="<%=j %>"><%=j %></option>
                            <% } %>
                        </select>
                    </td>
                    <td>
                        <select name="vpp_campus_<%=i %>">
                            <% for (int j = 0; j < d_campus.size(); j++) { %>
                            <option value="<%=d_campus.get(j).get(0) %>"><%=d_campus.get(j).get(0) %></option>
                            <% } %>
                        </select>
                    </td>
<!--                    <td>
                        <button type="button">
                            <i class="glyphicon glyphicon-plus"></i> Add
                        </button>
                    </td>-->
                </tr>
                <% } %>
            </tbody>
        </table>
            <input type="hidden" name="num_vp_refid" value="<%=num_vp_refid %>" />
    </div>
    <hr />
    <div class="row">            
        Special Competence (PTJ):- <br />
        <div class="tabbable boxed parentTabs">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#set1">Skill</a>  
                </li>
                <li><a href="#set2">Attitude</a>
                </li>
                <li><a href="#set3">Knowledge</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="set1">
                    <textarea name="pph_skill" id="editor1" rows="10" cols="80"></textarea>
                    <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace('editor1');
                    </script>

                </div>

                <div class="tab-pane fade" id="set2">
                    <textarea name="pph_attitude" id="editor2" rows="10" cols="80"></textarea>
                    <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace('editor2');
                    </script>

                </div>

                <div class="tab-pane fade" id="set3">

                    <textarea name="pph_knowledge" id="editor3" rows="10" cols="80"></textarea>
                    <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace('editor3');
                    </script>

                </div>
            </div>
        </div>

        <script>
            $("ul.nav-tabs a").click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        </script>
    </div>
    <hr />
    <div class="row">
        Area of Expertise  (PTJ):- <br />
        <% int num_ae_refid = 0; %>
        <% for (int i = 0; i < ae.size(); i++) { num_ae_refid += 1; %>
        <input type="checkbox" value="<%=ae.get(i).get(0) %>" name="ae_refid_<%=i %>" /> <%=ae.get(i).get(1) %> <br />
        <% } %>
        <input type="hidden" name="num_ae_refid" value="<%=num_ae_refid %>" />
    </div>
    <hr />
    <div class="row">
        Additional conditions (if any) (PTJ):- <br />
        <textarea name="pph_add_cond_ptj" id="editor4" rows="10" cols="80"></textarea>
        <script>
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.
            CKEDITOR.replace('editor4');
        </script>
    </div>
    <hr />
    <div class="row">
        <input type="button" value="SAVE" id="btn_save" /> 
        <input type="button" value="SUBMIT TO HR" id="btn_hr" />
    </div>
    <hr />
    <input type="hidden" name="pph_status" id="button_type" value="-" />
</form>
    
<script>
    $(document).ready(function() {
        $("#btn_save").click(function() {
            $("#button_type").val("ENTRY");
            $("#form_eads1").submit();
        });
        $("#btn_hr").click(function() {
            $("#button_type").val("SUBMIT");
            $("#form_eads1").submit();
        });
    });
</script>

