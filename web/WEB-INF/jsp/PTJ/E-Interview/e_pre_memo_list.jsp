<%-- 
    Document   : e_pre_memo_list
    Created on : Feb 12, 2016, 12:46:22 PM
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
String accepted = "11";
String rejected = "12";
String informed = "1";
String sql_memo_list = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, "
                + "pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status, pph.pph_refid, pph.pph_grade, pph.pph_position "
                + "FROM interview_setup iss, interview_result_mark irm, department_main dm, pos_applied pa, position_ptj_hr pph, interview_invite_status iis "
                + "WHERE iss.is_refid = irm.is_refid "
                + "AND pa.pa_refid = irm.pa_refid "
                + "AND pph.pph_refid = pa.pph_refid "
                + "AND pph.pph_ptj = dm.dm_dept_desc "
                + "AND iis.iis_code = irm_ptj_status "
                + "AND iss.is_type = ? "
                + "AND irm.irm_ptj_status != ? "
                + "AND dm.dm_dept_code = ? "
                + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, "
                + "pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status, pph.pph_refid, pph.pph_grade, pph.pph_position";
String param_memo_list[] = { is_type_ptj, accepted, dept_code };
ArrayList<ArrayList<String>> data_memo_list = mc.getQuery(sql_memo_list, param_memo_list);
//out.print(data_memo_list);

String is_type_uni = "UNIVERSITY";
String sql_uni_detail = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type "
                        + "FROM interview_setup iss, position_ptj_hr pph, pos_applied pa, interview_result_mark irm "
                        + "WHERE pph.pph_refid = pa.pph_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND iss.is_refid = irm.is_refid "
                        + "AND pph.pph_refid = ? "
                        + "AND iss.is_type = ? "
                        + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type";
String[] param_uni_detail = new String[2];
ArrayList<ArrayList<String>> data_uni_detail;

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
                <li><a href="process.jsp?p=PTJ/E-Interview/e_pre_published_list.jsp">PUBLISHED PRE-INTERVIEW</a></li>
                <li class="active">
                    <a>INTERVIEW MEMO <% 
                    if(eint.getMemoList(dept_code) > 0)
                    { 
                        %>
                        <span class="badge" style="background-color: red"><%=eint.getMemoList(dept_code) %></span>
                        <%
                    }
                    %>
                    </a></li>
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
            <div class="col-sm-12"><h4>INTERVIEW MEMO LIST</h4></div>
            <table style="background-color: white" class="table table-bordered" id="memoList" width="100%">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th colspan="4" style="vertical-align: middle; text-align: center; font-weight: bold">INTERVIEW (UNIVERSITY LEVEL)</th>
                        <th colspan="3" style="vertical-align: middle; text-align: center; font-weight: bold">PRE-INTERVIEW (PTJ LEVEL)</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">Grade</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Shortlisted Candidate</th>
<!--                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>-->
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                    </tr>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Start</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">End</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Venue</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Start</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">End</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_memo_list.size(); a++)
                {
                    param_uni_detail[0] = data_memo_list.get(a).get(10);
                    param_uni_detail[1] = is_type_uni;
                    data_uni_detail = mc.getQuery(sql_uni_detail, param_uni_detail);
                    
                    param_count_candidate[0] = pass_ptj;
                    param_count_candidate[1] = data_memo_list.get(a).get(10);
                    data_count_candidate = mc.getQuery(sql_count_candidate, param_count_candidate);
                    %>
                    <tr>
                        <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td style="vertical-align: middle; text-align: center"><%=Func.getDate(data_uni_detail.get(0).get(1)) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=Func.get12HourTime(data_uni_detail.get(0).get(2)) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=Func.get12HourTime(data_uni_detail.get(0).get(3)) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_uni_detail.get(0).get(4) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=Func.getDate(data_memo_list.get(a).get(1)) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=Func.get12HourTime(data_memo_list.get(a).get(2)) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=Func.get12HourTime(data_memo_list.get(a).get(3)) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_memo_list.get(a).get(11) %></td>
                        <td style="vertical-align: middle"><%=data_memo_list.get(a).get(12) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_count_candidate.get(0).get(0) %></td>
                        <td style="vertical-align: middle; text-align: center; font-weight: bold; color: #0055cc">
                        <%
                        if(data_memo_list.get(a).get(9).equals(rejected))
                        {
                            %>
                            <a style="color: red; font-weight: bold"><%=data_memo_list.get(a).get(8) %></a>
                            <%
                        }
                        else
                        {
                            %>
                            <div class="btn-group">
                                <a class="btn btn-default dropdown-toggle form-control" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Action <span class="glyphicon glyphicon-menu-down"></span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item btn btn-primary form-control" href="#modalAcceptInterview<%=a %>" data-toggle="modal">Accept</a>
                                    <a class="dropdown-item btn btn-danger form-control" href="#modalRejectInterview<%=a %>" data-toggle="modal">Reject</a>
                                </div>
                            </div>
                            <%
                        }
                        %>
                        </td>
                    </tr>
                    <%
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Accept -->
<%
for(int a = 0; a < data_memo_list.size(); a++)
{
    param_uni_detail[0] = data_memo_list.get(a).get(10);
    param_uni_detail[1] = is_type_uni;
    data_uni_detail = mc.getQuery(sql_uni_detail, param_uni_detail);

    param_count_candidate[0] = pass_ptj;
    param_count_candidate[1] = data_memo_list.get(a).get(10);
    data_count_candidate = mc.getQuery(sql_count_candidate, param_count_candidate);
    %>
    <form method="post" action="process/ptj/eInterview/e_pre_go_to_setup.jsp">
    <input type="hidden" name="ptj_is_refid" value="<%=data_memo_list.get(a).get(0) %>">
    <input type="hidden" name="uni_is_refid" value="<%=data_uni_detail.get(0).get(0) %>">
    <input type="hidden" name="dept_code" value="<%=dept_code %>">
    <div id="modalAcceptInterview<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">ACCEPT WITH THIS SUGGESTION DETAIL ?</h4>
                </div>
                <div class="modal-body" align="center">
                    <table style="width: 100%" class="table-condensed">
                        <tbody>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Date</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle"><%=Func.getDate(data_memo_list.get(a).get(1)) %></td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Start</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle"><%=Func.get12HourTime(data_memo_list.get(a).get(2)) %></td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">End</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle"><%=Func.get12HourTime(data_memo_list.get(a).get(3)) %></td>
                             </tr>
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-success form-control"><span style="color: white">YES</span></button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- End modal accept -->
    
    <!-- Modal Reject Interview -->
    <form method="post" action="process/ptj/eInterview/e_pre_reject_process.jsp">
    <input type="hidden" name="uni_is_refid" value="<%=data_uni_detail.get(0).get(0) %>">
    <input type="hidden" name="ptj_is_refid" value="<%=data_memo_list.get(a).get(0) %>">
    <input type="hidden" name="pph_refid" value="<%=data_memo_list.get(a).get(10) %>">
    <input type="hidden" name="dept_code" value="<%=dept_code %>">
    <div id="modalRejectInterview<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">REJECT</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <h6>STATE THE REASON</h6>
                        <textarea class="form-control" name="irm_reason" required placeholder="State Rejection Reason"></textarea>
                    </fieldset>
                </div>
                <div class="modal-footer" align="center">
                    <button type="submit" class="btn btn-danger form-control">SUBMIT</button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <%
}
%>
<!-- End reject interview -->
<script type="text/javascript">
$(document).ready(function()
{
    $('#memoList').DataTable();
});
</script>
