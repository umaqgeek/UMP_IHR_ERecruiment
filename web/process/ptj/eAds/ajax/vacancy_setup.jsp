<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
String i = request.getParameter("i");

String sql_job_status = "SELECT JSM.JSM_JOB_CODE, JSM.JSM_JOD_DESC "
        + "FROM JOB_STATUS_MAIN JSM "
        + "WHERE JSM.JSM_JOD_DESC LIKE 'TETAP' "
        + "OR JSM.JSM_JOD_DESC LIKE 'KONTRAK' "
        + "OR JSM.JSM_JOD_DESC LIKE 'FELLOW' "
        + "ORDER BY JSM.JSM_JOD_DESC ASC ";
String param_job_status[] = {};
MainClient mc_job_status = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d_job_status = mc_job_status.getQuery(sql_job_status, param_job_status);

String sql_campus = "SELECT cm.cm_code, cm.cm_description "
        + "FROM campus_main cm ";
String param_campus[] = {};
MainClient mc_campus = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d_campus = mc_campus.getQuery(sql_campus, param_campus);

// out.print(d_job_status); if (true) { return; }
%>
<tr id="oriAdd">
                    <td>
                    <select name="vpp_job_status_<%=i %>">
                        <% for (int j = 0; j < d_job_status.size(); j++) { %>
                        <option value="<%=d_job_status.get(j).get(0) %>"><%=d_job_status.get(j).get(1) %></option>
                        <% } %>
                    </select>
                    </td>
                    <td>
                        <select name="vpp_total_<%=i %>">
                            <% for (int j = 0; j <= 50; j++) { %>
                            <option value="<%=j %>"><%=j %></option>
                            <% } %>
                        </select>
                    </td>
                    <td>
                        <select name="vpp_campus_<%=i %>">
                            <% for (int j = 0; j < d_campus.size(); j++) { %>
                            <option value="<%=d_campus.get(j).get(1) %>"><%=d_campus.get(j).get(1) %></option>
                            <% } %>
                        </select>
                    </td>
                    <td>
                        <button type="button" class="delRow1">
                            <i class="glyphicon glyphicon-remove"></i>
                        </button>
                    </td>
                </tr>