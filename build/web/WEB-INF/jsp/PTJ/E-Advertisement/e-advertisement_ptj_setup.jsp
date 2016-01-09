<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String w_refid = session.getAttribute("w_refid").toString();
String query = "SELECT * "
        + "FROM warrant w "
        + "LEFT JOIN vacancy_pos vp ON vp.w_refid = w.w_refid "
        + "WHERE w.w_refid = ? ";
String params[] = {w_refid};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data1 = mc.getQuery(query, params);

String query2 = "SELECT * "
        + "FROM area_expertise ";
MainClient mc2 = new MainClient(DBConn.getHost());
String params2[] = {};
ArrayList<ArrayList<String>> ae = mc2.getQuery(query2, params2);
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
                    <td><%=data1.get(i).get(7) %></td>
                    <td>
                        <input type="hidden" name="vp_refid_<%=i %>" value="<%=data1.get(i).get(6) %>" />
                        <select name="vpp_total_<%=i %>">
                            <% for (int j = 0; j <= Integer.parseInt(data1.get(i).get(8)); j++) { %>
                            <option value="<%=j %>"><%=j %></option>
                            <% } %>
                        </select>
                    </td>
                    <td><%=data1.get(i).get(9) %></td>
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
                    <textarea name="pph_skill" id="editor1" rows="10" cols="80">

                    </textarea>
                    <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace('editor1');
                    </script>

                </div>

                <div class="tab-pane fade" id="set2">
                    <textarea name="pph_attitude" id="editor2" rows="10" cols="80">

                    </textarea>
                    <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace('editor2');
                    </script>

                </div>

                <div class="tab-pane fade" id="set3">

                    <textarea name="pph_knowledge" id="editor3" rows="10" cols="80">

                    </textarea>
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
        <textarea name="pph_add_cond_ptj" id="editor4" rows="10" cols="80">

        </textarea>
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
    <input type="hidden" name="w_refid" value="<%=w_refid %>" />
</form>
    
<script>
    $(document).ready(function() {
        $("#btn_save").click(function() {
            $("#button_type").val("SAVE");
            //$("#form_eads1").submit();
        });
        $("#btn_hr").click(function() {
            $("#button_type").val("HR");
            $("#form_eads1").submit();
        });
    });
</script>
