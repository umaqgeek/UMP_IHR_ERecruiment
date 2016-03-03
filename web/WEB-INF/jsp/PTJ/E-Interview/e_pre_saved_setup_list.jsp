<%-- 
    Document   : e_pre_saved_setup_list
    Created on : Feb 16, 2016, 10:21:18 AM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="controller.Session"%>
<%@page import="config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
MainClient mc = new MainClient(DBConn.getHost());

String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();

String sql_dept_code = "SELECT l.l_username "
                        + "FROM login1 l "
                        + "WHERE l.l_refid = ? ";
String param_dept_code[] = { l_refid };
ArrayList<ArrayList<String>> data_dept_code = mc.getQuery(sql_dept_code, param_dept_code);

String dept_code = data_dept_code.get(0).get(0);
out.print(dept_code);

String is_type_ptj = "PTJ";
String accepted = "11";
String rejected = "12";
String informed = "1";
String saved = "4";

String chairman_accepted = "22";
String panel_accepted = "22";
String panel_sent = "21";

String sql_saved_list   = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, "
                        + "pph.pph_ptj "
                        + "FROM interview_setup iss, interview_result_mark irm, position_ptj_hr pph, pos_applied pa, department_main dm "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND pph.pph_refid = pa.pph_refid "
                        + "AND pph.pph_ptj = dm.dm_dept_desc "
                        + "AND iss.is_type = ? "
                        + "AND dm.dm_dept_code = ? "
                        + "AND iss.is_status = ? "
                        + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, "
                        + "pph.pph_ptj";
String param_saved_list[] = { is_type_ptj, dept_code, saved };
ArrayList<ArrayList<String>> data_saved_list = mc.getQuery(sql_saved_list, param_saved_list);

String sql_accepted_chairman = "SELECT icl.icl_refid "
                            + "FROM interview_setup iss, interview_chairman_list icl "
                            + "WHERE iss.is_refid = icl.is_refid "
                            + "AND iss.is_refid = ? "
                            + "AND icl.icl_status = ? ";
String[] param_accepted_chairman = new String[2];
ArrayList<ArrayList<String>> data_accepted_chairman;

String sql_accepted_panel = "SELECT ipl.ipl_refid "
                        + "FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii, interview_panel_list ipl "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND irm.irm_refid = iii.irm_refid "
                        + "AND ipl.ipl_refid = iii.ipl_refid "
                        + "AND iss.is_refid = ? "
                        + "AND ipl.ipl_status = ? "
                        + "GROUP BY ipl.ipl_refid";
String[] param_accepted_panel = new String[2];
ArrayList<ArrayList<String>> data_accepted_panel;

String sql_sent_panel = "SELECT ipl.ipl_refid "
                        + "FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii, interview_panel_list ipl "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND irm.irm_refid = iii.irm_refid "
                        + "AND ipl.ipl_refid = iii.ipl_refid "
                        + "AND iss.is_refid = ? "
                        + "AND ipl.ipl_status = ? "
                        + "GROUP BY ipl.ipl_refid";
String[] param_sent_panel = new String[2];
ArrayList<ArrayList<String>> data_sent_panel;

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

String is_type_uni = "UNIVERSITY";
String sql_uni_details = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, pph.pph_ptj "
                    + "FROM interview_setup iss, interview_result_mark irm, position_ptj_hr pph, pos_applied pa, department_main dm "
                    + "WHERE pph.pph_refid = pa.pph_refid "
                    + "AND pa.pa_refid = irm.pa_refid "
                    + "AND dm.dm_dept_desc = pph.pph_ptj "
                    + "AND iss.is_type = ? "
                    + "AND irm.irm_ptj_status = ? "
                    + "AND dm.dm_dept_code = ? "
                    + "AND pph.pph_refid = ? "
                    + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, pph.pph_ptj";
String[] param_uni_details = new String[4];
ArrayList<ArrayList<String>> data_uni_details;

String pass_ptj = "PASS_PTJ";
String sql_count_candidate = "SELECT COUNT(*) "
                        + "FROM position_ptj_hr pph, pos_applied pa, filter f "
                        + "WHERE pph.pph_refid = pa.pph_refid "
                        + "AND pa.pa_refid = f.pa_refid "
                        + "AND f.f_ptj_status = ? "
                        + "AND pph.pph_refid = ? ";
String[] param_count_candidate = new String[2];
ArrayList<ArrayList<String>> data_count_candidate;

String sql_accepted_chairman_list = "SELECT sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, icl.icl_status "
                        +"FROM interview_setup iss, interview_chairman_list icl, staff_main sm, department_main dm, staff_main_archive052014 sma "
                        +"WHERE iss.is_refid = icl.is_refid "
                        +"AND sm.sm_staff_id = icl.sm_staff_id "
                        +"AND dm.dm_dept_code = sm.sm_dept_code "
                        +"AND sm.sm_staff_id = sma.sm_staff_id "
                        +"AND iss.is_refid = ? "
                        +"AND icl.icl_status = ? ";
String[] param_accepted_chairman_list = new String[2];
ArrayList<ArrayList<String>> data_accepted_chairman_list;

String sql_accepted_panel_list = "SELECT sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, ipl.ipl_status, iis.iis_desc, ipl.ipl_refid, sm.sm_job_code "
                    +"FROM interview_setup iss, interview_result_mark irm, interview_panel_list ipl, interview_irm_icm iii, staff_main sm, department_main dm, interview_invite_status iis, staff_main_archive052014 sma "
                    +"WHERE iss.is_refid = irm.is_refid "
                    +"AND irm.irm_refid = iii.irm_refid "
                    +"AND ipl.ipl_refid = iii.ipl_refid "
                    +"AND sm.sm_staff_id = ipl.sm_staff_id "
                    +"AND dm.dm_dept_code = sm.sm_dept_code "
                    +"AND sm.sm_staff_id = sma.sm_staff_id "
                    +"AND iis.iis_code = ipl.ipl_status "
                    +"AND iss.is_refid = ? "
                    +"AND ipl.ipl_status = ? "
                    +"GROUP BY sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, ipl.ipl_status, iis.iis_desc, ipl.ipl_refid, sm.sm_job_code";
String[] param_accepted_panel_list = new String[2];
ArrayList<ArrayList<String>> data_accepted_panel_list;
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
                <li><a href="process.jsp?p=PTJ/E-Interview/e_pre_published_list.jsp">PUBLISHED PRE-INTERVIEW</a></li>
                <li><a href="process.jsp?p=PTJ/E-Interview/e_pre_memo_list.jsp">INTERVIEW MEMO</a></li>
                <li class="active"><a>SAVED PRE-INTERVIEW SETUP</a></li>
                <li><a href="process.jsp?p=PTJ/E-Interview/e_pre_my_invitation_list.jsp">MY INVITATION</a></li>
            </ul>
        </div>
        
        <div class="row">
            <div class="col-sm-12"><h4>SAVED PRE-INTERVIEW LIST</h4></div>
            <table class="table-bordered" id="memoList" width="100%">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">INTERVIEW (UNIVERSITY LEVEL)</th>
                        <th colspan="5" style="vertical-align: middle; text-align: center; font-weight: bold">PRE-INTERVIEW (PTJ LEVEL)</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                    </tr>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 5%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Details</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 5%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Details</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Shortlisted Candidate</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_saved_list.size(); a++)
                {
                    param_position_list[0] = data_saved_list.get(a).get(0);
                    data_position_list = mc.getQuery(sql_position_list, param_position_list);
                    
                    param_count_candidate[0] = pass_ptj;
                    param_count_candidate[1] = data_position_list.get(0).get(0);
                    data_count_candidate = mc.getQuery(sql_count_candidate, param_count_candidate);
                    
                    param_uni_details[0] = is_type_uni;
                    param_uni_details[1] = accepted;
                    param_uni_details[2] = dept_code;
                    param_uni_details[3] = data_position_list.get(0).get(0);
                    data_uni_details = mc.getQuery(sql_uni_details, param_uni_details);
                    
                    param_accepted_chairman[0] = data_saved_list.get(a).get(0);
                    param_accepted_chairman[1] = chairman_accepted;
                    data_accepted_chairman = mc.getQuery(sql_accepted_chairman, param_accepted_chairman);
                    
                    param_accepted_panel[0] = data_saved_list.get(a).get(0);
                    param_accepted_panel[1] = panel_accepted;
                    data_accepted_panel = mc.getQuery(sql_accepted_panel, param_accepted_panel);
                    
                    param_sent_panel[0] = data_saved_list.get(a).get(0);
                    param_sent_panel[1] = panel_sent;
                    data_sent_panel = mc.getQuery(sql_sent_panel, param_sent_panel);
                    %>
                    <tr>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=Func.getDate(data_uni_details.get(a).get(1)) %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><a href="#modalUniDetail<%=a %>" data-toggle="modal" class="btn btn-warning">Details</a></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=Func.getDate(data_saved_list.get(a).get(1)) %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><a href="#modalPreDetail<%=a %>" data-toggle="modal" class="btn btn-warning">Details</a></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(0).get(1) %></td>
                        <td style="vertical-align: middle"><%=data_position_list.get(0).get(2) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_count_candidate.get(0).get(0) %></td>
<!--                        <td rowspan="<%//=data_position_list.get(0).size() %>" style="vertical-align: middle; text-align: center"><%//=data_memo_list.get(a).get(7) %></td>-->
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center; font-weight: bold; color: #0055cc">
                            <div class="btn-group">
                                <a class="btn btn-default dropdown-toggle form-control" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Action <span class="glyphicon glyphicon-menu-down"></span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item btn btn-default form-control" href="process.jsp?p=PTJ/E-Interview/e_pre_committee_setup.jsp&is_refid=<%=data_saved_list.get(a).get(0) %>&dept_code=<%=dept_code %>&alert=0">Interview Setup</a>
                                    <%
                                    if(data_accepted_chairman.size() > 0 && data_accepted_panel.size() > 0 && data_sent_panel.size() == 0)
                                    {
//                                        out.print(data_accepted_chairman.size());
//                                        out.print(data_accepted_panel.size());
                                        %>
                                        <a class="dropdown-item btn btn-primary form-control" href="#modalPublish<%=a %>" data-toggle="modal">Publish</a>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <a class="dropdown-item btn btn-primary form-control disabled">Publish</a>
                                        <%
                                    }
                                    %>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                    for(int b = 1; b < data_position_list.size(); b++)
                    {
                        param_count_candidate[1] = data_position_list.get(b).get(0);
                        data_count_candidate = mc.getQuery(sql_count_candidate, param_count_candidate);
                        %>
                        <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(b).get(1) %></td>
                        <td style="vertical-align: middle"><%=data_position_list.get(b).get(2) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_count_candidate.get(0).get(0) %></td>
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
<%
int total_candidate_combined;
for(int a = 0; a < data_saved_list.size(); a++)
{
    total_candidate_combined = 0;
    
    param_position_list[0] = data_saved_list.get(a).get(0);
    data_position_list = mc.getQuery(sql_position_list, param_position_list);

    for(int b = 0; b < data_position_list.size(); b++)
    {
        param_count_candidate[0] = pass_ptj;
        param_count_candidate[1] = data_position_list.get(b).get(0);
        data_count_candidate = mc.getQuery(sql_count_candidate, param_count_candidate);
        total_candidate_combined = total_candidate_combined + Integer.parseInt(data_count_candidate.get(0).get(0));
    }
                                
    param_uni_details[0] = is_type_uni;
    param_uni_details[1] = accepted;
    param_uni_details[2] = dept_code;
    param_uni_details[3] = data_position_list.get(0).get(0);
    data_uni_details = mc.getQuery(sql_uni_details, param_uni_details);
    
    param_accepted_chairman_list[0] = data_saved_list.get(a).get(0);
    param_accepted_chairman_list[1] = chairman_accepted;
    data_accepted_chairman_list = mc.getQuery(sql_accepted_chairman_list, param_accepted_chairman_list);
    
    param_accepted_panel_list[0] = data_saved_list.get(a).get(0);
    param_accepted_panel_list[1] = panel_accepted;
    data_accepted_panel_list = mc.getQuery(sql_accepted_panel_list, param_accepted_panel_list);
    %>
    <div id="modalPreDetail<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">PRE-INTERVIEW (PTJ LEVEL) DETAIL</h4>
                </div>
                <div class="modal-body" align="center">
                    <fieldset>
                        <table style="width: 100%" class="table-condensed">
                            <tbody>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold; width: 20%">Interview Level</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">:</td>
                                    <td style="vertical-align: middle"><%=data_saved_list.get(a).get(5) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Date</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=Func.getDate(data_saved_list.get(a).get(1)) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Start</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_saved_list.get(a).get(2) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">End</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_saved_list.get(a).get(3) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_saved_list.get(a).get(4) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Total Candidate</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=total_candidate_combined %></td>
                                 </tr
                            </tbody>
                        </table>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
        
    <div id="modalUniDetail<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">INTERVIEW (UNIVERSITY LEVEL) DETAIL</h4>
                </div>
                <div class="modal-body" align="center">
                    <fieldset>
                        <table style="width: 100%" class="table-condensed">
                            <tbody>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold; width: 20%">Interview Level</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">:</td>
                                    <td style="vertical-align: middle"><%=data_uni_details.get(a).get(5) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Date</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=Func.getDate(data_uni_details.get(a).get(1)) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Start</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_uni_details.get(a).get(2) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">End</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_uni_details.get(a).get(3) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_uni_details.get(a).get(4) %></td>
                                 </tr>
                            </tbody>
                        </table>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
                                 
    <form method="post" action="process/ptj/eInterview/e_pre_publish_process.jsp">
    <input type="hidden" name="is_refid" value="<%=data_saved_list.get(a).get(0) %>" />
    <div id="modalPublish<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">PRE-INTERVIEW SUMMARY</h4>
                </div>
                <div class="modal-body" align="center">
                    <fieldset>
                        <table style="width: 100%" class="table-condensed">
                            <tbody>
                                <tr>
                                   <td style="vertical-align: middle; font-weight: bold; width: 20%">Interview Level</td>
                                   <td style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">:</td>
                                   <td style="vertical-align: middle"><%=data_saved_list.get(a).get(5) %></td>
                                </tr>
                                <tr>
                                   <td style="vertical-align: middle; font-weight: bold">Date</td>
                                   <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                   <td style="vertical-align: middle"><%=Func.getDate(data_saved_list.get(a).get(1)) %></td>
                                </tr>
                                <tr>
                                   <td style="vertical-align: middle; font-weight: bold">Start</td>
                                   <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                   <td style="vertical-align: middle"><%=data_saved_list.get(a).get(2) %></td>
                                </tr>
                                <tr>
                                   <td style="vertical-align: middle; font-weight: bold">End</td>
                                   <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                   <td style="vertical-align: middle"><%=data_saved_list.get(a).get(3) %></td>
                                </tr>
                                <tr>
                                   <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                   <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                   <td style="vertical-align: middle"><%=data_saved_list.get(a).get(4) %></td>
                                </tr>
                                <tr>
                                   <td style="vertical-align: middle; font-weight: bold">Total Candidate</td>
                                   <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                   <td style="vertical-align: middle"><%=total_candidate_combined %></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Interview Chairman</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle">
                                    <% 
                                    if(data_accepted_chairman_list.size() > 0)
                                    {
                                        out.print(data_accepted_chairman_list.get(0).get(1));
                                    }
                                    %>
                                    </td>
                                </tr>
                                <%
                                for(int b = 0; b < data_accepted_panel_list.size(); b++)
                                {
                                    %>
                                    <tr>
                                        <td style="vertical-align: middle; font-weight: bold">Panel <%=b+1 %></td>
                                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                        <td style="vertical-align: middle"><%=data_accepted_panel_list.get(b).get(1) %></td>
                                    </tr>
                                    <%
                                }
                                %>
                            </tbody>
                        </table>
                    </fieldset>
                </div>
                <div class="modal-footer" align="center">
                    <button type="submit" class="btn btn-primary form-control"><span style="color: white">PUBLISH</span></button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <%
}
%>
<!-- End modal pre -->
<!-- Modal Accept -->
<%
for(int a = 0; a < data_saved_list.size(); a++)
{
    %>
    <form method="post" action="process/ptj/eInterview/e_pre_go_to_setup.jsp">
    <input type="hidden" name="is_refid" value="<%=data_saved_list.get(a).get(0) %>">
    <input type="hidden" name="dept_code" value="<%=dept_code %>">
    <div id="modalAcceptInterview<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">ACCEPT</h4>
                </div>
                <div class="modal-body" align="center">
                    <fieldset>
                        <h4>To <span style="color: limegreen; font-weight: bold">Accept</span>, Do you agree to perform <span style="font-weight: bold">Pre-Interview (PTJ Level)</span> before <span style="font-weight: bold">Interview (Universty Level)</span> start ?</h4>
                    </fieldset>
                </div>
                <div class="modal-footer" align="center">
                    <button type="submit" class="btn btn-success form-control"><span style="color: white">YES</span></button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <%
}
%>
<!-- End modal accept -->
                
<!-- Modal Reject Interview -->
<%
for(int a = 0; a < data_saved_list.size(); a++)
{
    %>
    <form method="post" action="process/ptj/eInterview/e_pre_reject_process.jsp">
    <input type="hidden" name="is_refid" value="<%=data_saved_list.get(a).get(0) %>">
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