<%-- 
    Document   : e_pre_publiched_list
    Created on : Feb 28, 2016, 4:05:27 PM
    Author     : Habib
--%>

<%@page import="eInterview.EInterview"%>
<%@page import="helpers.Func"%>
<%@page import="controller.Session"%>
<%@page import="config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
EInterview eint = new EInterview();
String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();

String sql_dept_code = "SELECT l.l_username "
                        + "FROM login1 l "
                        + "WHERE l.l_refid = ? ";
String param_dept_code[] = { l_refid };
ArrayList<ArrayList<String>> data_dept_code = mc.getQuery(sql_dept_code, param_dept_code);

String dept_code = data_dept_code.get(0).get(0);
//out.print(dept_code);

String is_type_ptj = "PTJ";


String informed = "1";
String accepted = "11";
String rejected = "12";

String panel_sent = "21";
String chairman_accepted = "22";
String panel_accepted = "22";

String saved = "4";
String published = "41";
String result ="44";

String sql_published_list   = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, "
                        + "pph.pph_ptj, iss.is_status, iis.iis_desc "
                        + "FROM interview_setup iss, interview_result_mark irm, position_ptj_hr pph, pos_applied pa, department_main dm, interview_invite_status iis "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND pph.pph_refid = pa.pph_refid "
                        + "AND pph.pph_ptj = dm.dm_dept_desc "
                        + "AND iis.iis_code = iss.is_status "
                        + "AND iss.is_type = ? "
                        + "AND dm.dm_dept_code = ? "
                        + "AND ( iss.is_status = ? OR iss.is_status = ? ) "
                        + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, "
                        + "pph.pph_ptj, iss.is_status, iis.iis_desc ";
String param_published_list[] = { is_type_ptj, dept_code, published, result };
ArrayList<ArrayList<String>> data_published_list = mc.getQuery(sql_published_list, param_published_list);

String sql_position_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position "
                    + "FROM interview_setup iss, interview_result_mark irm, department_main dm, pos_applied pa, position_ptj_hr pph "
                    + "WHERE iss.is_refid = irm.is_refid "
                    + "AND pa.pa_refid = irm.pa_refid "
                    + "AND pph.pph_refid = pa.pph_refid "
                    + "AND pph.pph_ptj = dm.dm_dept_desc "
                    + "AND iss.is_refid = ? "
                    + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position";
String[] param_position_list = new String[1];
ArrayList<ArrayList<String>> data_position_list;

String pass_ptj = "PASS_PTJ";
String sql_count_candidate = "SELECT COUNT(*) "
                        + "FROM position_ptj_hr pph, pos_applied pa, filter f "
                        + "WHERE pph.pph_refid = pa.pph_refid "
                        + "AND pa.pa_refid = f.pa_refid "
                        + "AND f.f_ptj_status = ? "
                        + "AND pph.pph_refid = ? ";
String[] param_count_candidate = new String[2];
ArrayList<ArrayList<String>> data_count_candidate;
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
                <li class="active"><a>PUBLISHED PRE-INTERVIEW</a></li>
                <li><a href="process.jsp?p=PTJ/E-Interview/e_pre_memo_list.jsp">INTERVIEW MEMO <% 
                    if(eint.getMemoList(dept_code) > 0)
                    { 
                        %>
                        <span class="badge" style="background-color: red"><%=eint.getMemoList(dept_code) %></span>
                        <%
                    }
                    %></a></li>
                <li><a href="process.jsp?p=PTJ/E-Interview/e_pre_saved_setup_list.jsp">SAVED PRE-INTERVIEW SETUP</a></li>
                <li><a href="process.jsp?p=PTJ/E-Interview/e_pre_my_invitation_list.jsp">MY INVITATION <% 
                    if(eint.getInvitationList(l_refid) > 0)
                    { 
                        %>
                        <span class="badge" style="background-color: red"><%=eint.getInvitationList(l_refid) %></span>
                        <%
                    }
                    %></a></li>
            </ul>
        </div>
        
        <div class="row">
            <div class="col-sm-12"><h4>PUBLISHED INTERVIEW LIST</h4></div>
            <table style="background-color: white" class="table table-bordered" id="publishedList" width="100%">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Start</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">End</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Shortlisted Candidate</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_published_list.size(); a++)
                {
                    param_position_list[0] = data_published_list.get(a).get(0);
                    data_position_list = mc.getQuery(sql_position_list, param_position_list);
                    
                    param_count_candidate[0] = pass_ptj;
                    param_count_candidate[1] = data_position_list.get(0).get(0);
                    data_count_candidate = mc.getQuery(sql_count_candidate, param_count_candidate);
                    %>
                    <tr>
                        <td rowspan="<%=data_position_list.size() %>"  style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=Func.getDate(data_published_list.get(a).get(1)) %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=Func.get12HourTime(data_published_list.get(a).get(2)) %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=Func.get12HourTime(data_published_list.get(a).get(3)) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(0).get(1) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(0).get(2) %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=data_published_list.get(a).get(6) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_count_candidate.get(0).get(0) %></td>
                        <%
                        if(data_published_list.get(a).get(7).equals(published))
                        {
                            %>
                            <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center; font-weight: bold; color: #0055cc"><%=data_published_list.get(a).get(8) %></td>
                            <%
                        }
                        else if(data_published_list.get(a).get(7).equals(result))
                        {
                            %>
                            <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><a href="process.jsp?p=PTJ/E-Interview/e_pre_result.jsp&is_refid=<%=data_published_list.get(a).get(0) %>" style="color: limegreen; font-weight: bold">RESULT</a></td>
                            <%
                        }
                        %>
                    </tr>
                    <%
                    for(int b = 1; b < data_position_list.size(); b++)
                    {
                        param_count_candidate[1] = data_position_list.get(b).get(0);
                        data_count_candidate = mc.getQuery(sql_count_candidate, param_count_candidate);
                        %>
                        <tr>
                            <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(b).get(1) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(b).get(2) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_count_candidate.get(0).get(0) %></td>
                        </tr>
                        <%
                    }
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Pre Interview Detail -->
<div id="modalPreInterviewDetail" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4 class="modal-title" style="font-weight: bold">PRE-INTERVIEW DETAIL</h4>
            </div>
            <div class="modal-body" align="center">
                <fieldset>
                    <table style="width: 100%" class="table-condensed">
                        <tbody>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold; width: 20%">Grade</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">:</td>
                                <td style="vertical-align: middle">Grade 1</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Position</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">Position 1</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">PTJ</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">PTJ 1</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Date</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">20/02/2016</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Start</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">8:00 PM</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">End</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">11:00 PM</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">PTJ 1 BUILDING</td>
                             </tr>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<!-- End modal pre -->
<script type="text/javascript">
$(document).ready(function()
{
    $('#publishedList').DataTable();
});
</script>