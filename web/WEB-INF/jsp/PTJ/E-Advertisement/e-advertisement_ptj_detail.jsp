<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pph_refid = session.getAttribute("pph").toString();

String query = "SELECT pph.pph_refid, " //0
        + "pph.pph_grade, " //1
        + "pph.pph_position, " //2
        + "pph.pph_ptj, " //3
        + "pph.pph_skill, " //4
        + "pph.pph_attitude, " //5
        + "pph.pph_knowledge, " //6
        + "pph.pph_add_cond_ptj, " //7
        + "vp.vp_refid, " //8
        + "vp.vp_job_status, " //9
        + "vp.vp_total, " //10
        + "vp.vp_campus, " //11
        + "vpp.vpp_total, " //12
        + "vpp.vpp_refid, " //13
        + "pph.w_refid, " //14
        + "w.w_refid, " //15
        + "w.w_total, " //16
        + "pph.pph_status " //17
        + "FROM position_ptj_hr pph, vacancy_pos_ptj vpp, vacancy_pos vp, warrant w "
        + "WHERE pph.pph_refid = vpp.pph_refid "
        + "AND vpp.vp_refid = vp.vp_refid "
        + "AND pph.w_refid = w.w_refid "
        + "AND pph.pph_refid = ? ";
String params[] = {pph_refid};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data1 = mc.getQuery(query, params);

//out.print(data1);

String query2 = "SELECT * "
        + "FROM area_expertise ";
MainClient mc2 = new MainClient(DBConn.getHost());
String params2[] = {};
ArrayList<ArrayList<String>> ae = mc2.getQuery(query2, params2);

String query3 = "SELECT aep.ae_refid "
        + "FROM position_ptj_hr pph, area_expertise_ptj aep "
        + "WHERE pph.pph_refid = aep.pph_refid "
        + "AND pph.pph_refid = ? ";
String params3[] = {pph_refid};
MainClient mc3 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data3 = mc3.getQuery(query3, params3);

//out.print(data3);
%>

<ul>
    <li><a href="process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj.jsp">&lt;&lt; Back to List Position from E-Warrant</a></li>
</ul>

<% if (data1.get(0).get(17).toUpperCase().equals("SAVE".toUpperCase())) { %>
<form action="process/ptj/eAds/eAds2Detail.jsp" method="post" id="form_eads1">
<% } %>
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
                    <td><%=data1.get(i).get(9) %></td>
                    <td>
                        <input type="hidden" name="vp_refid_<%=i %>" value="<%=data1.get(i).get(8) %>" />
                        <input type="hidden" name="vpp_refid_<%=i %>" value="<%=data1.get(i).get(13) %>" />
                        <input type="hidden" name="vpp_total_<%=i %>" value="<%=data1.get(i).get(12) %>" />
                        <input type="hidden" name="vp_total_<%=i %>" value="<%=data1.get(i).get(10) %>" />
                        <select name="vpp_total_new_<%=i %>">
                            <% 
                            int parent_total = Integer.parseInt(data1.get(i).get(10));
                            int child_total = Integer.parseInt(data1.get(i).get(12));
                            int parent_child_total = parent_total + child_total;
                            for (int j = 0; j <= parent_child_total; j++) { 
                            %>
                            <option value="<%=j %>" <% if (j==child_total) { out.print("selected"); } %>><%=j %></option>
                            <% } %>
                        </select>
                    </td>
                    <td><%=data1.get(i).get(11) %></td>
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
                    <textarea name="pph_skill" id="editor1" rows="10" cols="80"><%=data1.get(0).get(4) %></textarea>
                    <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace('editor1');
                    </script>

                </div>

                <div class="tab-pane fade" id="set2">
                    <textarea name="pph_attitude" id="editor2" rows="10" cols="80"><%=data1.get(0).get(5) %></textarea>
                    <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace('editor2');
                    </script>

                </div>

                <div class="tab-pane fade" id="set3">

                    <textarea name="pph_knowledge" id="editor3" rows="10" cols="80"><%=data1.get(0).get(6) %></textarea>
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
        <input type="checkbox" value="<%=ae.get(i).get(0) %>" name="ae_refid_<%=i %>" <% 
        for (int j = 0; j < data3.size(); j++) {
            if (data3.get(j).get(0).equals(ae.get(i).get(0))) {
                out.print("checked");
                break;
            }
        }
        %> /> <%=ae.get(i).get(1) %> <br />
        <% } %>
        <input type="hidden" name="num_ae_refid" value="<%=num_ae_refid %>" />
    </div>
    <hr />
    <div class="row">
        Additional conditions (if any) (PTJ):- <br />
        <textarea name="pph_add_cond_ptj" id="editor4" rows="10" cols="80"><%=data1.get(0).get(7) %></textarea>
        <script>
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.
            CKEDITOR.replace('editor4');
        </script>
    </div>
<% if (data1.get(0).get(17).toUpperCase().equals("SAVE".toUpperCase())) { %>
    <hr />
    <div class="row">
        <input type="button" value="SAVE" id="btn_save" /> 
        <input type="button" value="SUBMIT TO HR" id="btn_hr" />
    </div>
<% } %>
    <hr />
    <input type="hidden" name="pph_status" id="button_type" value="-" />
    <input type="hidden" name="pph_refid" value="<%=pph_refid %>" />
    <input type="hidden" name="w_refid" value="<%=data1.get(0).get(15) %>" />
    <input type="hidden" name="w_total" value="<%=data1.get(0).get(16) %>" />
<% if (data1.get(0).get(17).toUpperCase().equals("SAVE".toUpperCase())) { %>
</form>
    
<script>
    $(document).ready(function() {
        $("#btn_save").click(function() {
            $("#button_type").val("SAVE");
            $("#form_eads1").submit();
        });
        $("#btn_hr").click(function() {
            $("#button_type").val("HR");
            $("#form_eads1").submit();
        });
    });
</script>
<% } %>
