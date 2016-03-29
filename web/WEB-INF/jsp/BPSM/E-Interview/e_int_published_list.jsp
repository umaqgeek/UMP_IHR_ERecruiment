<%-- 
    Document   : e_int_pos_list
    Created on : Jan 28, 2016, 4:38:16 PM
    Author     : Habib
--%>
<%@page import="helpers.Func"%>
<%@page import="eInterview.EInterview"%>
<%@page import="controller.Session"%>
<%@page import="config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
EInterview eint = new EInterview();

String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();
String sql_dept_code = "SELECT l.l_username, l.l_icno "
                    + "FROM login1 l "
                    + "WHERE l.l_refid = ? ";
String param_dept_code[] = { l_refid };
ArrayList<ArrayList<String>> data_dept_code = mc.getQuery(sql_dept_code, param_dept_code);

String dept_code = data_dept_code.get(0).get(0);
String staff_id = data_dept_code.get(0).get(1);

boolean informed_exist;

String published = "41";
String result = "44";
String is_type = "UNIVERSITY";
String sql_saved_list = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, iis.iis_desc "
                    + "FROM interview_setup iss, interview_invite_status iis "
                    + "WHERE iis.iis_code = iss.is_status "
                    + "AND iss.is_type = ? "
                    + "AND (iss.is_status = ? OR iss.is_status = ? ) ";
String param_saved_list[] = { is_type, published, result };
ArrayList<ArrayList<String>> data_saved_list = mc.getQuery(sql_saved_list, param_saved_list);
//out.print(data_saved_list);
String rejected = "12";
String accepted = "11";
String informed = "1";
String sql_interview_pos_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status "
                            +"FROM interview_setup iss, interview_result_mark irm, pos_applied pa, position_ptj_hr pph, interview_invite_status iis "
                            +"WHERE iss.is_refid = irm.is_refid "
                            +"AND pa.pa_refid = irm.pa_refid "
                            +"AND pph.pph_refid = pa.pph_refid "
                            +"AND iis.iis_code = irm.irm_ptj_status "
                            +"AND iss.is_refid = ? "
                            +"GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status";
String[] param_interview_pos_list = new String[1];
ArrayList<ArrayList<String>> data_interview_pos_list;

String sql_irm_reason = "SELECT irm.irm_reason "
                    + "FROM interview_result_mark irm, pos_applie pa, position_ptj_hr pph "
                    + "WHERE pph.pph_refid = pa.pph_refid "
                    + "AND pa.pa_refid = irm.irm_refid "
                    + "AND pph.pph_refid = ? "
                    + "GROUP BY irm.irm_reason";
String[] param_irm_reason = new String[1];
ArrayList<ArrayList<String>> data_irm_reason;

String sql_informed_pos_list = "SELECT pph.pph_refid "
                            +"FROM interview_setup iss, interview_result_mark irm, pos_applied pa, position_ptj_hr pph, interview_invite_status iis "
                            +"WHERE iss.is_refid = irm.is_refid "
                            +"AND pa.pa_refid = irm.pa_refid "
                            +"AND pph.pph_refid = pa.pph_refid "
                            +"AND iis.iis_code = irm.irm_ptj_status "
                            +"AND iss.is_refid = ? "
                            +"AND irm.irm_ptj_status = ? "
                            +"GROUP BY pph.pph_refid";
String[] param_informed_pos_list = new String[2];
ArrayList<ArrayList<String>> data_informed_pos_list;

String is_type_ptj = "PTJ";
String sql_preinterview_detail  = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, iis.iis_desc "
                                + "FROM interview_setup iss, interview_result_mark irm, position_ptj_hr pph, pos_applied pa, interview_invite_status iis "
                                + "WHERE pph.pph_refid = pa.pph_refid "
                                + "AND iis.iis_code = iss.is_status "
                                + "AND pa.pa_refid = irm.pa_refid "
                                + "AND iss.is_refid = irm.is_refid "
                                + "AND iss.is_type = ? "
                                + "AND pph.pph_refid = ? "
                                + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, iis.iis_desc";
String[] param_preinterview_detail = new String[2];
ArrayList<ArrayList<String>> data_preinterview_detail;

String sql_shorlisted_candidate = "SELECT irm.irm_refid, irm.irm_cand_status, irm.irm_ptj_status "
                                + "FROM interview_setup iss, interview_result_mark irm "
                                + "WHERE iss.is_refid = irm.is_refid "
                                + "AND iss.is_refid = ? ";
String[] param_shorlisted_candidate = new String[1];
ArrayList<ArrayList<String>> data_shorlisted_candidate;

String cand_set = "2";
String cand_sent = "21";
String cand_accepted = "22";
String sql_pending_decision_cand = "SELECT irm.irm_refid "
                        + "FROM interview_result_mark irm, interview_setup iss "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND iss.is_refid = ? "
                        + "AND (irm.irm_cand_status = ? OR irm.irm_cand_status = ? )";
String[] param_pending_decision_cand = new String[3];
ArrayList<ArrayList<String>> data_pending_decision_cand;

String panel_chairman_accepted = "22";

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

String pass_ptj = "PASS_PTJ";
String sql_count_candidate_accepted = "SELECT COUNT(*) "
                        + "FROM pos_applied pa, filter f, interview_setup iss, interview_result_mark irm "
                        + "WHERE pa.pa_refid = f.pa_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND iss.is_refid = irm.is_refid "
                        + "AND iss.is_refid = ? "
                        + "AND f.f_ptj_status = ? "
                        + "AND irm.irm_cand_status = ? ";
String[] param_count_candidate_accepted = new String[3];
ArrayList<ArrayList<String>> data_count_candidate_accepted;
%>

<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
              <li class="active"><a>PUBLISHED INTERVIEW</a></li>
              <li>
                <a href="process.jsp?p=BPSM/E-Interview/e_int_pos_to_setup_list.jsp">POSITION READY TO SETUP 
                <% 
                if(eint.get_to_setup_list() > 0)
                {
                    %>
                    <span class="badge" style="background-color: red"><%=eint.get_to_setup_list() %></span>
                    <%
                }
                %>
                </a>
              </li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">SAVED SETUP INTERVIEW</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">MY INVITATION <% 
                    if(eint.getInvitationList(l_refid) > 0)
                    { 
                        %>
                        <span class="badge" style="background-color: red"><%=eint.getInvitationList(l_refid) %></span>
                        <%
                    }
                    %></a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_criteria_bank.jsp">CRITERIA BANK</a></li>
            </ul>
        </div>
        
        <div class="row">
            <div class="col-sm-12"><h4>PUBLISHED INTERVIEW LIST</h4></div>
            <table id="publishedList" style="background-color: white" class="table table-bordered" width="100%">
                <thead>
                    <tr style="vertical-align: middle;">
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                        <th colspan="6" style="vertical-align: middle; text-align: center; font-weight: bold">Pre-Interview</th>
                        <th colspan="3" style="vertical-align: middle; text-align: center; font-weight: bold">Interview</th>
                    </tr>
                    <tr style="vertical-align: middle;">
                        
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="7%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Details</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Status</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Details</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_saved_list.size(); a++)
                {
                    informed_exist = false;
                    param_interview_pos_list[0] = data_saved_list.get(a).get(0);
                    data_interview_pos_list = mc.getQuery(sql_interview_pos_list, param_interview_pos_list);
                    
                    for(int b = 0; b < data_interview_pos_list.size(); b++)
                    {
                        if(data_interview_pos_list.get(b).get(5).equals(informed))
                        {
                            informed_exist = true;
                            b = data_interview_pos_list.size();
                        }
                    }
                    
                    param_accepted_chairman_list[0] = data_saved_list.get(a).get(0);
                    param_accepted_chairman_list[1] = panel_chairman_accepted;
                    data_accepted_chairman_list = mc.getQuery(sql_accepted_chairman_list, param_accepted_chairman_list);
                    
                    param_accepted_panel_list[0] = data_saved_list.get(a).get(0);
                    param_accepted_panel_list[1] = panel_chairman_accepted;
                    data_accepted_panel_list = mc.getQuery(sql_accepted_panel_list, param_accepted_panel_list);
                    
                    param_pending_decision_cand[0] = data_saved_list.get(a).get(0);
                    param_pending_decision_cand[1] = cand_set;
                    param_pending_decision_cand[2] = cand_sent;
                    data_pending_decision_cand = mc.getQuery(sql_pending_decision_cand, param_pending_decision_cand);
                    
                    param_preinterview_detail[0] = is_type_ptj;
                    if(data_interview_pos_list.size() > 0)
                    {
                        param_preinterview_detail[1] = data_interview_pos_list.get(0).get(0);
                    }
                    data_preinterview_detail = mc.getQuery(sql_preinterview_detail, param_preinterview_detail);
                    //out.print(data_pending_decision_cand);
                    %>
                    <tr>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <%
                        if(data_interview_pos_list.size() > 0)
                        {
                            %>
                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(0).get(1) %></td>
                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(0).get(2) %></td>
                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(0).get(3) %></td>
                            <td style="vertical-align: middle"><%=Func.getDate(data_preinterview_detail.get(0).get(1)) %></td>
                            <td style="vertical-align: middle; text-align: center">
                                <a data-toggle="modal" href="#modalPreInterviewDetail<%=a+"_0" %>" class="btn btn-default form-control">Details</a>
                            </td>
                            <%
                            if(data_preinterview_detail.get(0).get(6).equals(result))
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_ptj_result.jsp&is_refid=<%=data_preinterview_detail.get(0).get(0) %>&prev_page=BPSM/E-Interview/e_int_published_list.jsp" style="color: purple; font-weight: bold"><%=data_preinterview_detail.get(0).get(7) %></a></td>
                                <%
                            }
                            else
                            {
                                if(data_interview_pos_list.get(0).get(5).equals(informed))
                                {
                                    %>
                                    <td style="vertical-align: middle; font-weight: bold"><%=data_interview_pos_list.get(0).get(4) %></td>
                                    <%
                                }
                                else if(data_interview_pos_list.get(0).get(5).equals(accepted))
                                {
                                    %>
                                    <td style="vertical-align: middle"><a style="color: limegreen; font-weight: bold"><%=data_interview_pos_list.get(0).get(4) %></a></td>
                                    <%
                                }
                                else if(data_interview_pos_list.get(0).get(5).equals(rejected))
                                {
                                    %>
                                    <td style="vertical-align: middle"><a style="color: red; font-weight: bold" href="#modalReason<%=a+"_0" %>" data-toggle="modal"><%=data_interview_pos_list.get(0).get(4) %></a></td>
                                    <%
                                }
                            }
                        }
                        else
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center" colspan="6">There is no selected position</td>
                            <%
                        }
                        %>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center"><%=Func.getDate(data_saved_list.get(a).get(1)) %></td>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalUniDetail<%=a %>" class="btn btn-default">Details</a></td>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center">
                            <%
                            if(data_saved_list.get(a).get(6).equals(published))
                            {
                                %>
                                <span style="color: darkblue; font-weight: bold"><%=data_saved_list.get(a).get(7) %></span>
                                <%
                            }
                            else if(data_saved_list.get(a).get(6).equals(result))
                            {
                                %>
                                <a style="color: purple; font-weight: bold" href="process.jsp?p=BPSM/E-Interview/e_int_full_result_summary.jsp&is_refid=<%=data_saved_list.get(a).get(0) %>"><%=data_saved_list.get(a).get(7) %></a>
                                <%
                            }
                            %>
                        </td>
                    </tr>
                    <%
                    for(int b = 1; b < data_interview_pos_list.size(); b++)
                    {
                        param_preinterview_detail[0] = is_type_ptj;
                        param_preinterview_detail[1] = data_interview_pos_list.get(b).get(0);
                        data_preinterview_detail = mc.getQuery(sql_preinterview_detail, param_preinterview_detail);
                        %>
                        <tr>
                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(1) %></td>
                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(2) %></td>
                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(3) %></td>
                            <td style="vertical-align: middle"><%=Func.getDate(data_preinterview_detail.get(0).get(1)) %></td>
                            <td style="vertical-align: middle; text-align: center">
                               <a data-toggle="modal" href="#modalPreInterviewDetail<%=a+"_"+b %>" class="btn btn-default form-control">Details</a>
                            </td>
                            <%
                            if(data_preinterview_detail.get(0).get(6).equals(result))
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_ptj_result.jsp&is_refid=<%=data_preinterview_detail.get(0).get(0) %>&prev_page=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp" style="color: purple; font-weight: bold"><%=data_preinterview_detail.get(0).get(7) %></a></td>
                                <%
                            }
                            else
                            {
                                if(data_interview_pos_list.get(b).get(5).equals(informed))
                                {
                                    %>
                                    <td style="vertical-align: middle; font-weight: bold"><%=data_interview_pos_list.get(b).get(4) %></td>
                                    <%
                                }
                                else if(data_interview_pos_list.get(b).get(5).equals(accepted))
                                {
                                    %>
                                    <td style="vertical-align: middle"><a style="color: limegreen; font-weight: bold" href="#modalPreInterviewDetail<%=a+"_"+b %>" data-toggle="modal"><%=data_interview_pos_list.get(b).get(4) %></a></td>
                                    <%
                                }
                                else if(data_interview_pos_list.get(b).get(5).equals(rejected))
                                {
                                    %>
                                    <td style="vertical-align: middle"><a style="color: red; font-weight: bold" href="#modalReason<%=a+"_"+b %>" data-toggle="modal"><%=data_interview_pos_list.get(b).get(4) %></a></td>
                                    <%
                                }
                            }
                            %>
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
  
<%
for(int a = 0; a < data_saved_list.size(); a++)
{
    param_interview_pos_list[0] = data_saved_list.get(a).get(0);
    data_interview_pos_list = mc.getQuery(sql_interview_pos_list, param_interview_pos_list);
    
    param_accepted_chairman_list[0] = data_saved_list.get(a).get(0);
    param_accepted_chairman_list[1] = panel_chairman_accepted;
    data_accepted_chairman_list = mc.getQuery(sql_accepted_chairman_list, param_accepted_chairman_list);
    
    param_accepted_panel_list[0] = data_saved_list.get(a).get(0);
    param_accepted_panel_list[1] = panel_chairman_accepted;
    data_accepted_panel_list = mc.getQuery(sql_accepted_panel_list, param_accepted_panel_list);
    
    param_count_candidate_accepted[0] = data_saved_list.get(a).get(0);
    param_count_candidate_accepted[1] = pass_ptj;
    param_count_candidate_accepted[2] = cand_accepted;
    data_count_candidate_accepted = mc.getQuery(sql_count_candidate_accepted, param_count_candidate_accepted);
    for(int b = 0; b < data_interview_pos_list.size(); b++)
    {
        param_preinterview_detail[0] = is_type_ptj;
        param_preinterview_detail[1] = data_interview_pos_list.get(b).get(0);
        data_preinterview_detail = mc.getQuery(sql_preinterview_detail, param_preinterview_detail);
        
        param_shorlisted_candidate[0] = data_preinterview_detail.get(0).get(0);
        data_shorlisted_candidate = mc.getQuery(sql_shorlisted_candidate, param_shorlisted_candidate);
        
        if(data_interview_pos_list.get(b).get(5).equals(rejected))
        {
            param_irm_reason[0] = data_interview_pos_list.get(b).get(0);
            data_irm_reason = mc.getQuery(sql_irm_reason, param_irm_reason);
            
            if(data_irm_reason.size() > 0)
            {
                %>
                <!-- Modal Reason -->
                <div id="modalReason<%=a+"_"+b %>" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header" align="center">
                                <h4 class="modal-title" style="font-weight: bold">REJECT REASON</h4>
                            </div>
                            <div class="modal-body" align="center">
                                <fieldset>
                                    <h6><%=data_interview_pos_list.get(b).get(6) %></h6>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End modal reason -->
                <%
            }
        }
        %>
        
        <!-- Modal Pre Interview Detail -->
        <div id="modalPreInterviewDetail<%=a+"_"+b %>" class="modal fade" role="dialog">
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
                                        <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(1) %></td>
                                     </tr>
                                     <tr>
                                        <td style="vertical-align: middle; font-weight: bold">Position</td>
                                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                        <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(2) %></td>
                                     </tr>
                                     <tr>
                                        <td style="vertical-align: middle; font-weight: bold">PTJ</td>
                                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                        <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(3) %></td>
                                     </tr>
                                     <tr>
                                        <td style="vertical-align: middle; font-weight: bold">Date</td>
                                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                        <td style="vertical-align: middle"><%=Func.getDate(data_preinterview_detail.get(0).get(1)) %></td>
                                     </tr>
                                     <tr>
                                        <td style="vertical-align: middle; font-weight: bold">Start</td>
                                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                        <td style="vertical-align: middle"><%=Func.get12HourTime(data_preinterview_detail.get(0).get(2)) %></td>
                                     </tr>
                                     <tr>
                                        <td style="vertical-align: middle; font-weight: bold">End</td>
                                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                        <td style="vertical-align: middle"><%=Func.get12HourTime(data_preinterview_detail.get(0).get(3)) %></td>
                                     </tr>
                                     <tr>
                                        <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                        <td style="vertical-align: middle">
                                            <%
                                                if(data_preinterview_detail.get(0).get(4) == null)
                                                {
                                                    out.print("<strong>NOT SET YET</strong>"); 
                                                }
                                                else
                                                {
                                                    out.print(data_preinterview_detail.get(0).get(4)); 
                                                }
                                            %>
                                        </td>
                                     </tr>
                                     <tr>
                                        <td style="vertical-align: middle; font-weight: bold">Candidate</td>
                                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                        <td style="vertical-align: middle"><a href="process.jsp?p=BPSM/E-Interview/e_int_invite_candidate.jsp&is_refid=<%=data_preinterview_detail.get(0).get(0) %>"><%=data_shorlisted_candidate.size() %></a></td>
                                     </tr>
                                </tbody>
                            </table>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
        <!-- End modal pre --> 
        
        <!-- Modal Remove -->
        <%
        if(!data_interview_pos_list.get(b).get(5).equals(accepted))
        {
            %>
            <form method="post" action="process/bpsm/eInterview/e_int_remove_pos_process.jsp">
            <input type="hidden" name="uni_is_refid" value="<%=data_saved_list.get(a).get(0) %>" />
            <input type="hidden" name="ptj_is_refid" value="<%=data_preinterview_detail.get(0).get(0) %>"/>
            <input type="hidden" name="pph_refid" value="<%=data_interview_pos_list.get(b).get(0) %>"/>
            <div id="modalRemove<%=a+"_"+b %>" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body" align="center">
                            <fieldset>
                                <h4 class="modal-title" style="font-weight: bold">REMOVE POSITION FROM THIS INTERVIEW SESSION</h4>
                                <h6 class="modal-title">Are You Sure ?</h6>
                            </fieldset>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger form-control">YES</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            <%
        }
        %>
        <!-- ENd Modal Discard Setup -->
        
        <!-- Modal Suggest New -->
        <%
        if(data_interview_pos_list.get(b).get(5).equals(rejected))
        {
            %>
            <form method="post" action="process/bpsm/eInterview/e_int_suggestnew_process.jsp">
            <input type="hidden" name="uni_is_refid" value="<%=data_saved_list.get(a).get(0) %>" />
            <input type="hidden" name="ptj_is_refid" value="<%=data_preinterview_detail.get(0).get(0) %>"/>
            <input type="hidden" name="pph_refid" value="<%=data_interview_pos_list.get(b).get(0) %>"/>
            <div id="modalSuggestNewDate<%=a+"_"+b %>" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" align="center">
                            <h4 class="modal-title" style="font-weight: bold">SUGGEST NEW DATE</h4>
                        </div>
                        <div class="modal-body" align="center">
                            <fieldset>
                                <table style="width: 100%" class="table-condensed">
                                    <tbody>
                                         <tr>
                                            <td style="vertical-align: middle; font-weight: bold; width: 20%">Grade</td>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">:</td>
                                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(1) %></td>
                                         </tr>
                                         <tr>
                                            <td style="vertical-align: middle; font-weight: bold">Position</td>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(2) %></td>
                                         </tr>
                                         <tr>
                                            <td style="vertical-align: middle; font-weight: bold">PTJ</td>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(3) %></td>
                                         </tr>
                                         <tr>
                                            <td style="vertical-align: middle; font-weight: bold">Date</td>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                            <td style="vertical-align: middle">
                                                <input type="date" class="form-control" name="new_ptj_is_date" min="<%=Func.getTodayDate3() %>" max="<%=Func.sqlToDate2(data_saved_list.get(a).get(1)) %>"  value="<%=Func.sqlToDate2(data_preinterview_detail.get(0).get(1)) %>" required>
                                            </td>
                                         </tr>
                                         <tr>
                                            <td style="vertical-align: middle; font-weight: bold">Start</td>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                            <td style="vertical-align: middle">
                                                <input type="time" class="form-control" name="new_ptj_is_starttime" value="<%=data_preinterview_detail.get(0).get(2) %>" required>
                                            </td>
                                         </tr>
                                         <tr>
                                            <td style="vertical-align: middle; font-weight: bold">End</td>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                            <td style="vertical-align: middle">
                                                <input type="time" class="form-control" name="new_ptj_is_endtime" value="<%=data_preinterview_detail.get(0).get(3) %>" required>
                                            </td>
                                         </tr>
                                    </tbody>
                                </table>
                                <hr/>
                                <button type="submit" class="btn btn-primary form-control"><span style="color: white">Submit</span></button>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            <%
        }
        %>
        <!-- End Suggest New --> 
        <%
    }
    %>
    <!-- Modal Publish -->
    <form method="post" action="process/bpsm/eInterview/e_int_publish_process.jsp">
        <input type="hidden" name="is_refid" value="<%=data_saved_list.get(a).get(0) %>" />
        <div id="modalPublish<%=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <h4 class="modal-title" style="font-weight: bold">INTERVIEW SUMMARY</h4>
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
                                       <td style="vertical-align: middle"><%=data_count_candidate_accepted.get(0).get(0) %></td>
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
                                
    <!--Modal Postpone -->
    <form method="post" action="process/bpsm/eInterview/e_int_postpone_process.jsp">
        <input type="hidden" name="is_refid" value="<%=data_saved_list.get(a).get(0) %>" />
        <div id="modalPostpone<%=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <h4 class="modal-title" style="font-weight: bold; color: red">POSTPONE</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <fieldset>
                            <table style="width: 100%" class="table-condensed">
                                <tbody>
                                     <tr>
                                       <td style="vertical-align: middle; font-weight: bold">Date</td>
                                       <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                       <td style="vertical-align: middle">
                                           <input class="form-control" name="is_date" type="date" value="<%=Func.sqlToDate2(data_saved_list.get(a).get(1)) %>" min="<%=Func.sqlToDate2(data_saved_list.get(a).get(1)) %>"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td style="vertical-align: middle; font-weight: bold">Start</td>
                                       <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                       <td style="vertical-align: middle">
                                           <input class="form-control" name="is_starttime" type="time" value="<%=data_saved_list.get(a).get(2) %>"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td style="vertical-align: middle; font-weight: bold">End</td>
                                       <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                       <td style="vertical-align: middle">
                                           <input class="form-control" name="is_endtime" type="time" value="<%=data_saved_list.get(a).get(3) %>"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                       <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                       <td style="vertical-align: middle">
                                           <input class="form-control" name="is_venue" type="text" value="<%=data_saved_list.get(a).get(4) %>"/>
                                       </td>
                                    </tr>
                                </tbody>
                            </table>
                            <hr/>
                            <button type="submit" class="btn btn-primary form-control"><span style="color: white">Submit</span></button>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <%
}
%>

<!-- Modal Uni Interview Detail -->
<%
for(int a = 0; a < data_saved_list.size(); a++)
{
    %>
    <div id="modalUniDetail<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">INTERVIEW DETAIL</h4>
                </div>
                <div class="modal-body" align="center">
                    <fieldset>
                        <table style="width: 100%" class="table-condensed">
                            <tbody>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Date</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=Func.getDate(data_saved_list.get(a).get(1)) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Start</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=Func.get12HourTime(data_saved_list.get(a).get(2)) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">End</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=Func.get12HourTime(data_saved_list.get(a).get(3)) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_saved_list.get(a).get(4) %></td>
                                 </tr>
                            </tbody>
                        </table>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <%
}
%>
<!-- End modal uni -->
<script type="text/javascript">
$(document).ready(function()
{
    $('#publishedList').DataTable();
});
</script>