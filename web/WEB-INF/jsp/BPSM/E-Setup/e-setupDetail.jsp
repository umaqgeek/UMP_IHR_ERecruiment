<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT * FROM lookup_detail ld, lookup_master lm "
        + "WHERE ld.lm_refid = lm.lm_refid "
        + "AND lm.lm_desc = 'SPM Grade' "
        + "ORDER BY ld.ld_refid ASC ";
String params[] = {};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> spm = mc.getQuery(sql, params);

String sql2 = "SELECT * "
        + "FROM area_expertise "
        + "ORDER BY ae_desc ASC ";
String params2[] = {};
MainClient mc2 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> ae = mc2.getQuery(sql2, params2);

String g_refid = session.getAttribute("g_refid").toString();

String sql_g = "SELECT * "
        + "FROM grade g "
        + "WHERE g.g_refid = ? ";
String params_g[] = {g_refid};
MainClient mc_g = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> g = mc_g.getQuery(sql_g, params_g);

String sql_gae = "SELECT ae.ae_refid "
        + "FROM grade_area_expertise gae, area_expertise ae "
        + "WHERE gae.ae_refid = ae.ae_refid "
        + "AND gae.g_refid = ? ";
String params_gae[] = {g_refid};
MainClient mc_gae = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> gae = mc_gae.getQuery(sql_gae, params_gae);

String sql3 = "SELECT ld.ld_desc "
        + "FROM lookup_detail ld, lookup_master lm "
        + "WHERE ld.lm_refid = lm.lm_refid "
        + "AND lm.lm_desc = 'Education Level' "
        + "ORDER BY ld.ld_refid ASC ";
String params3[] = {};
MainClient mc3 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> level = mc3.getQuery(sql3, params3);
%>

<button type="button" onClick="location.href='process.jsp?p=BPSM/E-Setup/e-setup.jsp';"> &lt;&lt; Back </button>
<br />

<form method="post" action="process/bpsm/eSetup/eSetupDetailProcess.jsp">
    <input type="hidden" name="g_refid" value="<%=g_refid %>" />
    <table class="table">
        <tr>
            <th>Grade</th>
            <th>:</th>
            <th><input type="text" class="form-control" placeholder="Insert grade. Example: N22" name="g_grade" 
                       value="<%=g.get(0).get(1) %>" /></th>
        </tr>
        <tr>
            <th>SPM BM</th>
            <th>:</th>
            <th>
                <select name="g_spm_bm">
                    <% for (int i = 0; i < spm.size(); i++) { %>
                    <option value="<%=spm.get(i).get(1) %>" <%
                    if (g.get(0).get(2).equals(spm.get(i).get(1))) {
                        out.print("selected");
                    }
                    %>><%=spm.get(i).get(1) %></option>
                    <% } %>
                </select>
            </th>
        </tr>
        <tr>
            <th>SPM BI</th>
            <th>:</th>
            <th>
                <select name="g_spm_bi">
                    <% for (int i = 0; i < spm.size(); i++) { %>
                    <option value="<%=spm.get(i).get(1) %>" <%
                    if (g.get(0).get(3).equals(spm.get(i).get(1))) {
                        out.print("selected");
                    }
                    %>><%=spm.get(i).get(1) %></option>
                    <% } %>
                </select>
            </th>
        </tr>
        <tr>
            <th>CGPA</th>
            <th>:</th>
            <th><input type="text" class="form-control" placeholder="Insert CGPA. Example: 3.23" name="g_cgpa" 
                       value="<%=g.get(0).get(4) %>" /></th>
        </tr>
        <tr>
            <th>MUET</th>
            <th>:</th>
            <th><input type="text" class="form-control" placeholder="Insert muet. Example: 3" name="g_muet" 
                       value="<%=g.get(0).get(5) %>" /></th>
        </tr>
        <tr>
            <th>Area of Expertise</th>
            <th>:</th>
            <th>
                <% int num_ae_refid = 0; %>
                <% for (int i = 0; i < ae.size(); i++) { num_ae_refid += 1; %>
                    <input type="checkbox" name="ae_refid_<%=i %>" value="<%=ae.get(i).get(0) %>" <%
                    for (int j_ae = 0; j_ae < gae.size(); j_ae++) {
                        if (gae.get(j_ae).get(0).equals(ae.get(i).get(0))) {
                            out.print("checked");
                        }
                    }
                    %> />
                    <%=ae.get(i).get(1) %> <br />
                <% } %>
                <input type="hidden" name="num_ae_refid" value="<%=num_ae_refid %>" />
            </th>
        </tr>
        <tr>
            <th>Level of Education</th>
            <th>:</th>
            <th>
                <% for (int i = 0; i < level.size(); i++) { %>
                    <input type="radio" name="g_level" value="<%=level.get(i).get(0) %>" 
                           <% 
                           if (g.get(0).get(6) != null && g.get(0).get(6).toUpperCase().equals(level.get(i).get(0).toUpperCase())) {
                               out.print("checked"); 
                           } 
                           %> />
                    <%=level.get(i).get(0) %> <br />
                <% } %>
            </th>
        </tr>
        <tr>
            <th colspan="3">
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </th>
        </tr>
    </table>
</form>