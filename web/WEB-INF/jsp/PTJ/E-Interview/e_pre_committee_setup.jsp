<%-- 
    Document   : e_pre_committee_setup
    Created on : Feb 17, 2016, 12:29:20 AM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
//MainClient mc = new MainClient(DBConn.getHost());
//String alert = session.getAttribute("alert").toString();
//if(alert.equals("1"))
//{
//    %>
<!--    <script type="text/javascript">
//        alert("Please select one Chairman");
    </script>-->
    <%
//    session.setAttribute("alert", "0");
//}
//else
//if(alert.equals("2"))
//{
//    %>
<!--    <script type="text/javascript">
//        alert("Please at least one panel");
    </script>-->
    <%
//    session.setAttribute("alert", "0");
//}
//else
//if(alert.equals("3"))
//{
//    %>
<!--    <script type="text/javascript">
//        alert("Chairman and panel cannot be the same person");
    </script>-->
    <%
//    session.setAttribute("alert", "0");
//}
//else
//if(alert.equals("4"))
//{
//    %>
<!--    <script type="text/javascript">
//        alert("One panel in one interview session is for one person only");
    </script>-->
    <%
//    session.setAttribute("alert", "0");
//}
%>
<%
MainClient mc = new MainClient(DBConn.getHost());
String is_refid = session.getAttribute("is_refid").toString();
String dept_code = session.getAttribute("dept_code").toString();

String btn_invite_new = "";
String pass_ptj = "PASS_PTJ";
String sent = "21";
String accepted = "22";
String rejected = "23";
String canceled = "24";
String set = "2";

String sql_pos_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj "
                    +"FROM interview_setup iss, interview_result_mark irm, position_ptj_hr pph, pos_applied pa "
                    +"WHERE pph.pph_refid = pa.pph_refid "
                    +"AND pa.pa_refid = irm.pa_refid "
                    +"AND iss.is_refid = irm.is_refid "
                    +"AND iss.is_refid = ? "
                    +"GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj";
String param_pos_list[] = { is_refid };
ArrayList<ArrayList<String>> data_pos_list = mc.getQuery(sql_pos_list, param_pos_list);

String sql_count_pass = "SELECT COUNT(pa.pa_refid) "
                    + "FROM position_ptj_hr pph, pos_applied pa, filter f "
                    + "WHERE pph.pph_refid = pa.pph_refid "
                    + "AND pa.pa_refid = f.pa_refid "
                    + "AND f.f_ptj_status = ? "
                    + "AND pa.pph_refid = ? ";
String[] param_count_pass = new String[2];
ArrayList<ArrayList<String>> data_count_pass;

String sql_interview_detail = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type "
                            +"FROM interview_setup iss "
                            +"WHERE iss.is_refid = ? ";
String param_interview_detail[] = { is_refid };
ArrayList<ArrayList<String>> data_interview_detail = mc.getQuery(sql_interview_detail, param_interview_detail);

String sql_chairman_list = "SELECT sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, icl.icl_status, iis.iis_desc, sm.sm_job_code "
                        +"FROM interview_setup iss, interview_chairman_list icl, staff_main sm, department_main dm, interview_invite_status iis, staff_main_archive052014 sma "
                        +"WHERE iss.is_refid = icl.is_refid "
                        +"AND sm.sm_staff_id = icl.sm_staff_id "
                        +"AND dm.dm_dept_code = sm.sm_dept_code "
                        +"AND sm.sm_staff_id = sma.sm_staff_id "
                        +"AND iis.iis_code = icl.icl_status "
                        +"AND iss.is_refid = ? ";
String param_chairman_list[] = { is_refid };
ArrayList<ArrayList<String>> data_chairman_list = mc.getQuery(sql_chairman_list, param_chairman_list);

String sql_accepted_chairman_list = "SELECT sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, icl.icl_status "
                        +"FROM interview_setup iss, interview_chairman_list icl, staff_main sm, department_main dm, staff_main_archive052014 sma "
                        +"WHERE iss.is_refid = icl.is_refid "
                        +"AND sm.sm_staff_id = icl.sm_staff_id "
                        +"AND dm.dm_dept_code = sm.sm_dept_code "
                        +"AND sm.sm_staff_id = sma.sm_staff_id "
                        +"AND iss.is_refid = ? "
                        +"AND icl.icl_status = ? ";
String param_accepted_chairman_list[] = { is_refid, accepted };
ArrayList<ArrayList<String>> data_accepted_chairman_list = mc.getQuery(sql_accepted_chairman_list, param_accepted_chairman_list);

String sql_sent_chairman_list = "SELECT sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, icl.icl_status "
                        +"FROM interview_setup iss, interview_chairman_list icl, staff_main sm, department_main dm, staff_main_archive052014 sma "
                        +"WHERE iss.is_refid = icl.is_refid "
                        +"AND sm.sm_staff_id = icl.sm_staff_id "
                        +"AND dm.dm_dept_code = sm.sm_dept_code "
                        +"AND sm.sm_staff_id = sma.sm_staff_id "
                        +"AND iss.is_refid = ? "
                        +"AND icl.icl_status = ? ";
String param_sent_chairman_list[] = { is_refid, sent };
ArrayList<ArrayList<String>> data_sent_chairman_list = mc.getQuery(sql_sent_chairman_list, param_sent_chairman_list);

String status_active = "ACTIVE";
String sql_staff_list = "SELECT sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_desc, sm.sm_job_code "
                    + "FROM staff_main sm, department_main dm, staff_main_archive052014 sma "
                    + "WHERE dm.dm_dept_code = sm.sm_dept_code "
                    + "AND sm.sm_staff_id = sma.sm_staff_id "
                    + "AND sm.sm_dept_code = ? "
                    + "AND sm.sm_staff_status = ? "
                    + "ORDER BY sm.sm_job_code, sma.sm_staff_name";
String param_staff_list[] = { dept_code, status_active };
ArrayList<ArrayList<String>> data_staff_list = mc.getQuery(sql_staff_list, param_staff_list);

String sql_panel_list = "SELECT sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, ipl.ipl_status, iis.iis_desc, ipl.ipl_refid, sm.sm_job_code "
                    +"FROM interview_setup iss, interview_result_mark irm, interview_panel_list ipl, interview_irm_icm iii, staff_main sm, department_main dm, interview_invite_status iis, staff_main_archive052014 sma "
                    +"WHERE iss.is_refid = irm.is_refid "
                    +"AND irm.irm_refid = iii.irm_refid "
                    +"AND ipl.ipl_refid = iii.ipl_refid "
                    +"AND sm.sm_staff_id = ipl.sm_staff_id "
                    +"AND dm.dm_dept_code = sm.sm_dept_code "
                    +"AND sm.sm_staff_id = sma.sm_staff_id "
                    +"AND iis.iis_code = ipl.ipl_status "
                    +"AND iss.is_refid = ? "
                    +"GROUP BY sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, ipl.ipl_status, iis.iis_desc, ipl.ipl_refid, sm.sm_job_code";
String param_panel_list[] = { is_refid };
ArrayList<ArrayList<String>> data_panel_list = mc.getQuery(sql_panel_list, param_panel_list);
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        
        <form method="post" action="process/bpsm/eInterview/e_int_set_committee_process.jsp">
        <div class="row">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab">
                        <h4 class="panel-title">
                                SELECTED POSITION
                        </h4>
                    </div>
                    <div class="panel-body">              
                        <div class="row">
                            <table class="table-bordered" style="width: 100%">
                                <thead style="vertical-align: middle;">
                                <tr style="vertical-align: middle;">
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">#</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Grade</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Total Interviewee</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                for(int a = 0; a < data_pos_list.size(); a++)
                                {
                                    param_count_pass[0] = pass_ptj;
                                    param_count_pass[1] = data_pos_list.get(a).get(0);
                                    data_count_pass = mc.getQuery(sql_count_pass, param_count_pass);
                                    %>
                                    <input type="hidden" name="pph_refid" value="<%=data_pos_list.get(a).get(0) %>">
                                    <tr>
                                        <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                                        <td style="vertical-align: middle; text-align: center"><%=data_pos_list.get(a).get(1) %></td>
                                        <td style="vertical-align: middle"><%=data_pos_list.get(a).get(2) %></td>
                                        <td style="vertical-align: middle"><%=data_pos_list.get(a).get(3) %></td>
                                        <td style="vertical-align: middle; text-align: center"><a><%=data_count_pass.get(0).get(0) %></a></td>
                                    </tr>
                                    <%
                                }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                    
        <div class="row">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab">
                        <h4 class="panel-title">
                            GENERAL SETUP
                        </h4>
                        <input type="hidden" name="ic_type" value="UNIVERSITY">
                        <input type="hidden" value="<%=Func.sqlToDate2(data_interview_detail.get(0).get(1)) %>" id="setDate">
                        <input type="hidden" value="<%=data_interview_detail.get(0).get(2) %>" id="setStart">
                        <input type="hidden" value="<%=data_interview_detail.get(0).get(3) %>" id="setEnd">
                    </div>
                    <div class="panel-body">                                        
                        <div class="row">
                            <table class="table-condensed" width="100%">
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Date</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input readonly id="intDate" type="date" class="form-control" name="ic_interview_date" required></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Start</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input readonly id="intStart" type="time" class="form-control" name="ic_start_time" required></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">End</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input readonly id="intEnd" type="time" class="form-control" name="ic_end_time" required></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle">Venue</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center">:</td>
                                    <td style="vertical-align: middle"><input readonly type="text" class="form-control" name="ic_venue" placeholder="Example: HR BUILDING" value="<%=data_interview_detail.get(0).get(4) %>" required></td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="font-weight: bold; vertical-align: middle"><a class="btn btn-success disabled form-control">SAVE CHANGE</a></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab">
                        <h4 class="panel-title">
                               INVITATION PROGRESS
                        </h4>
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <%
                                if(data_accepted_chairman_list.size() > 0 || data_sent_chairman_list.size() > 0)
                                {
                                    btn_invite_new = "disabled";
                                }
                                else
                                {
                                    btn_invite_new = "";
                                }
                            %>
                            <a data-toggle="modal" href="#modalInviteNewChairman" class="btn btn-default <%=btn_invite_new %>">Invite New Chairman</a><br/>
                        </div>
                        <div class="row">
                            <p></p>
                        </div>
                        <div class="row">
                            <table class="table-bordered" width="100%">
                                <thead style="vertical-align: middle;">
                                    <tr style="vertical-align: middle;">
                                        <th colspan="8" style="vertical-align: middle; text-align: center; font-weight: bold">CHAIRMAN</th>
                                    </tr>
                                    <tr style="vertical-align: middle;">
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">Name</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 5%">Grade</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">PTJ</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Invited As</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Invitation Status</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                for(int a = 0; a < data_chairman_list.size(); a++)
                                {
                                    %>
                                    <tr>
                                        <td style="vertical-align: middle; text-align: center;"><%=a+1 %></td>
                                        <td style="vertical-align: middle"><%=data_chairman_list.get(a).get(1) %></td>
                                        <td style="vertical-align: middle; text-align: center"><%=data_chairman_list.get(a).get(6) %></td>
                                        <td style="vertical-align: middle"><%=data_chairman_list.get(a).get(3) %></td>
                                        <td style="vertical-align: middle; text-align: center;">CHAIRMAN</td>
                                        <%
                                        if(data_chairman_list.get(a).get(4).equals(sent))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold"><%=data_chairman_list.get(a).get(5) %></td>
                                            <%
                                        }
                                        else if(data_chairman_list.get(a).get(4).equals(accepted))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold"><%=data_chairman_list.get(a).get(5) %></td>
                                            <%
                                        }
                                        else if(data_chairman_list.get(a).get(4).equals(rejected))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center; color: red; font-weight: bold"><%=data_chairman_list.get(a).get(5) %></td>
                                            <%
                                        }
                                        else if(data_chairman_list.get(a).get(4).equals(canceled))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center; color: #ee5f5b; font-weight: bold"><%=data_chairman_list.get(a).get(5) %></td>
                                            <%
                                        }
                                        else if(data_chairman_list.get(a).get(4).equals(set))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold"><%=data_chairman_list.get(a).get(5) %></td>
                                            <%
                                        }
                                        ////////////////////////Separator////////////////////////////
                                        if(data_chairman_list.get(a).get(4).equals(canceled) || data_chairman_list.get(a).get(4).equals(rejected))
                                        {
                                            if(data_accepted_chairman_list.size() > 0 || data_sent_chairman_list.size() > 0)
                                            {
                                                %>
                                                <td style="vertical-align: middle; text-align: center;"><a class="btn btn-default  disabled">Re-invite</a></td>
                                                <%
                                            }
                                            else
                                            {
                                                %>
                                                <td style="vertical-align: middle; text-align: center;"><a href="#modalReinviteChairman<%=a %>" data-toggle="modal" class="btn btn-default">Re-invite</a></td>
                                                <%
                                            }
                                        }
                                        else if(data_chairman_list.get(a).get(4).equals(sent) || data_chairman_list.get(a).get(4).equals(accepted))
                                        {    
                                            %>
                                            <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman<%=a %>" class="btn btn-danger">Cancel Invitation</a></td>
                                            <%
                                        }
                                        else if(data_chairman_list.get(a).get(4).equals(set))
                                        {    
                                            %>
                                            <td style="vertical-align: middle; text-align: center;"><a class="btn btn-danger disabled">Cancel Invitation</a></td>
                                            <%
                                        }
                                        %>
                                    </tr>
                                    <%
                                }
                                %>
<!--                                        <tr>
                                        <td style="vertical-align: middle; text-align: center;">1</td>
                                        <td style="vertical-align: middle">Chairman's Name 1</td>
                                        <td style="vertical-align: middle">Chairman's 1 Grade</td>
                                        <td style="vertical-align: middle">Chairman's 1 Position</td>
                                        <td style="vertical-align: middle">Chairman's 1 PTJ</td>
                                        <td style="vertical-align: middle; text-align: center;">CHAIRMAN</td>
                                        <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold">SET</td>
                                        <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman" class="btn btn-danger disabled">Cancel Invitation</a></td>
                                    </tr>-->
                                </tbody>
                            </table>
                        </div>

                        <div class="row">
                            <h1></h1>
                        </div>        
                        <div class="row">
                            <a href="#modalInviteNewPanel" data-toggle="modal" class="btn btn-default">Invite New Panels</a><br/>
                        </div>
                        <div class="row">
                            <p></p>
                        </div>
                        <div class="row">
                            <table class="table-bordered" width="100%">
                                <thead style="vertical-align: middle;">
                                    <tr style="vertical-align: middle;">
                                        <th colspan="8" style="vertical-align: middle; text-align: center; font-weight: bold">PANELS</th>
                                    </tr>
                                    <tr style="vertical-align: middle;">
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">Name</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 5%">Grade</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">PTJ</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Invited As</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Invitation Status</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                    for(int a = 0; a < data_panel_list.size(); a++)
                                    {
                                    %>
                                        <tr>
                                        <td style="vertical-align: middle; text-align: center;"><%=a+1 %></td>
                                        <td style="vertical-align: middle"><%=data_panel_list.get(a).get(1) %></td>
                                        <td style="vertical-align: middle; text-align: center"><%=data_panel_list.get(a).get(7) %></td>
                                        <td style="vertical-align: middle"><%=data_panel_list.get(a).get(3) %></td>
                                        <td style="vertical-align: middle; text-align: center;">PANEL</td>
                                        <%
                                            if(data_panel_list.get(a).get(4).equals(sent))
                                            {
                                                %>
                                                <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold"><%=data_panel_list.get(a).get(5) %></td>
                                                <%
                                            }
                                            else if(data_panel_list.get(a).get(4).equals(accepted))
                                            {
                                                %>
                                                <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold"><%=data_panel_list.get(a).get(5) %></td>
                                                <%
                                            }
                                            else if(data_panel_list.get(a).get(4).equals(rejected))
                                            {
                                                %>
                                                <td style="vertical-align: middle; text-align: center; color: red; font-weight: bold"><%=data_panel_list.get(a).get(5) %></td>
                                                <%
                                            }
                                            else if(data_panel_list.get(a).get(4).equals(canceled))
                                            {
                                                %>
                                                <td style="vertical-align: middle; text-align: center; color: #ee5f5b;; font-weight: bold"><%=data_panel_list.get(a).get(5) %></td>
                                                <%
                                            }
                                            else if(data_panel_list.get(a).get(4).equals(set))
                                            {
                                                %>
                                                <td style="vertical-align: middle; text-align: center; font-weight: bold"><%=data_panel_list.get(a).get(5) %></td>
                                                <%
                                            }
                                            
                                            if(data_panel_list.get(a).get(4).equals(canceled) || data_panel_list.get(a).get(4).equals(rejected))
                                            {    
                                                %>
                                                <td style="vertical-align: middle; text-align: center;"><a href="#modalReinvitePanel<%=a %>" data-toggle="modal" class="btn btn-default">Re-invite</a></td>
                                                <%
                                            }
                                            else if(data_panel_list.get(a).get(4).equals(sent) || data_panel_list.get(a).get(4).equals(accepted))
                                            {    
                                                %>
                                                <td style="vertical-align: middle; text-align: center;"><a href="#modalCancelPanel<%=a %>" data-toggle="modal" class="btn btn-danger">Cancel Invitation</a></td>
                                                <%
                                            }
                                            else if(data_panel_list.get(a).get(4).equals(set))
                                            {    
                                                %>
                                                <td style="vertical-align: middle; text-align: center;"><a class="btn btn-danger disabled">Cancel Invitation</a></td>
                                                <%
                                            }
                                            %>
                                        </tr>
                                    <%
                                    }
                                %>
<!--                                    <tr>
                                        <td style="vertical-align: middle; text-align: center;">1</td>
                                        <td style="vertical-align: middle">Panel's Name 1</td>
                                        <td style="vertical-align: middle">Panel's 1 Grade</td>
                                        <td style="vertical-align: middle">Panel's 1 Position</td>
                                        <td style="vertical-align: middle">Panel's 1 PTJ</td>
                                        <td style="vertical-align: middle; text-align: center;">PANEL</td>
                                        <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold">SET</td>
                                        <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman" class="btn btn-danger disabled">Cancel Invitation</a></td>
                                    </tr>-->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>

<!-- Modal Discard Setup -->
<div id="modalDiscard" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title" style="font-weight: bold">DISCARD THIS SETUP</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
               <a class="btn btn-warning form-control" href="process.jsp?p=PTJ/E-Interview/e_pre_saved_setup_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->

<!-- Modal Invite New Chairman-->
<div id="modalInviteNewChairman" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="process/ptj/eInterview/e_pre_new_chairman.jsp" method="post">
        <input name="is_refid" type="hidden" value="<%=is_refid %>">
        <input name="dept_code" type="hidden" value="<%=dept_code %>">  
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <table class="table-condensed" width="100%">
                        <tr>
                            <td style="font-weight: bold; vertical-align: middle" width="20%">Chairman</td>
                            <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                            <td style="vertical-align: middle">
                                <select name="chairman_sm_staff_id" class="form-control">
                                <%
                                boolean yes_chairman = false;
                                int count_list2 = 0;
                                for(int a = 0; a < data_staff_list.size(); a++)
                                {
                                    for(int b = 0; b < data_chairman_list.size(); b++)
                                    {
                                        if(data_chairman_list.get(b).get(0).equals(data_staff_list.get(a).get(0)))
                                        {
                                            yes_chairman = true;
                                        }
                                    }
                                    
                                    if(!yes_chairman)
                                    {
                                        %>
                                        <option value="<%=data_staff_list.get(a).get(0)%>"><%=data_staff_list.get(a).get(1)%> ( <%=data_staff_list.get(a).get(3)%> )</option>
                                        <%
                                        count_list2++;
                                    }
                                    yes_chairman = false;
                                }
                                %>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div class="modal-footer">
                <%
                if(count_list2 > 0)
                {
                    %>
                    <button class="btn btn-default form-control" type="submit">INVITE</button>
                    <%
                }
                else
                {
                    %>
                    <button class="btn btn-default form-control disabled" type="submit">INVITE</button>
                    <%
                }
                %>
                <!--<button class="btn btn-default form-control">INVITE</button>-->
            </div>
        </div>
        </form>
    </div>
</div>

<!---- Modal Cancel  Chairman---->
<%
if(data_chairman_list.size() > 0)
{
    for(int a = 0; a < data_chairman_list.size(); a++)
    {
        %>
        <div id="modalCancelChairman<%=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/ptj/eInterview/e_pre_cancel_chairman.jsp" method="post">
                <input name="is_refid" type="hidden" value="<%=is_refid %>">
                <input name="dept_code" type="hidden" value="<%=dept_code %>">
                <input name="sm_staff_id" type="hidden" value="<%=data_chairman_list.get(a).get(0) %>">
                <div class="modal-content">
                    <div class="modal-body" align="center">
                        <fieldset>
                            <h4 class="modal-title" style="font-weight: bold">Cancel This Invitation</h4>
                            <h6 class="modal-title">Are You Sure ?</h6>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger form-control" type="submit">YES</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
                
        <div id="modalReinviteChairman<%=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/ptj/eInterview/e_pre_reinvite_chairman.jsp" method="post">
                <input name="is_refid" type="hidden" value="<%=is_refid %>">
                <input name="dept_code" type="hidden" value="<%=dept_code %>">
                <input name="sm_staff_id" type="hidden" value="<%=data_chairman_list.get(a).get(0) %>">
                <div class="modal-content">
                    <div class="modal-body" align="center">
                        <fieldset>
                            <h4 class="modal-title" style="font-weight: bold">Re-invite</h4>
                            <h6 class="modal-title">Are You Sure ?</h6>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-default form-control" type="submit">YES</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <%
    }
}
%>
<!-- End Modal Cancel Chairman -->
<!---- Modal Cancel  Panel---->
<%
if(data_panel_list.size() > 0)
{
    for(int a = 0; a < data_panel_list.size(); a++)
    {
        %>
        <div id="modalCancelPanel<%=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/ptj/eInterview/e_pre_cancel_panel.jsp" method="post">
                <input name="is_refid" type="hidden" value="<%=is_refid %>">
                <input name="dept_code" type="hidden" value="<%=dept_code %>">
                <input name="ipl_refid" type="hidden" value="<%=data_panel_list.get(a).get(6) %>">
                <input name="sm_staff_id" type="hidden" value="<%=data_panel_list.get(a).get(0) %>">
                <div class="modal-content">
                    <div class="modal-body" align="center">
                        <fieldset>
                            <h4 class="modal-title" style="font-weight: bold">Cancel This Invitation</h4>
                            <h6 class="modal-title">Are You Sure ?</h6>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger form-control" type="submit">YES</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
                
        <div id="modalReinvitePanel<%=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/ptj/eInterview/e_pre_reinvite_panel.jsp" method="post">
                <input name="is_refid" type="hidden" value="<%=is_refid %>">
                <input name="dept_code" type="hidden" value="<%=dept_code %>">
                <input name="ipl_refid" type="hidden" value="<%=data_panel_list.get(a).get(6) %>">
                <input name="sm_staff_id" type="hidden" value="<%=data_panel_list.get(a).get(0) %>">
                <div class="modal-content">
                    <div class="modal-body" align="center">
                        <fieldset>
                            <h4 class="modal-title" style="font-weight: bold">Re-invite</h4>
                            <h6 class="modal-title">Are You Sure ?</h6>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-default form-control" type="submit">YES</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <%
    }
}
%>
<!-- End Modal Cancel Panel -->
<!-- Modal Invite New Panel-->
<div id="modalInviteNewPanel" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="process/ptj/eInterview/e_pre_new_panel.jsp" method="post">
        <input name="is_refid" type="hidden" value="<%=is_refid %>">
        <input name="dept_code" type="hidden" value="<%=dept_code %>">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <table class="table-condensed" width="100%">
                        <tr>
                            <td style="font-weight: bold; vertical-align: middle" width="20%">Panel</td>
                            <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                            <td style="vertical-align: middle">
                                <select name="panel_sm_staff_id" class="form-control">
                                <%
                                boolean yes_panel = false;
                                int count_list = 0;
                                for(int a = 0; a < data_staff_list.size(); a++)
                                {
                                    for(int b = 0; b < data_panel_list.size(); b++)
                                    {
                                        if(data_panel_list.get(b).get(0).equals(data_staff_list.get(a).get(0)))
                                        {
                                            yes_panel = true;
                                        }
                                    }
                                    
                                    if(!yes_panel)
                                    {
                                        %>
                                        <option value="<%=data_staff_list.get(a).get(0)%>"><%=data_staff_list.get(a).get(1)%> ( <%=data_staff_list.get(a).get(3)%> )</option>
                                        <%
                                        count_list++;
                                    }
                                    yes_panel = false;
                                }
                                %>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div class="modal-footer">
                <%
                if(count_list > 0)
                {
                    %>
                    <button class="btn btn-default form-control" type="submit">INVITE</button>
                    <%
                }
                else
                {
                    %>
                    <button class="btn btn-default form-control disabled" type="submit">INVITE</button>
                    <%
                }
                %>
            </div>
        </div>
        </form>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function ()
{
    document.getElementById("intDate").value = document.getElementById("setDate").value;
    document.getElementById("intStart").value = document.getElementById("setStart").value;
    document.getElementById("intEnd").value = document.getElementById("setEnd").value;
    
    $("#panelSize").val('1');
    var selection = $("#selection").html();
    //var selection = document.getElementById("selection");
    var rowNum = document.getElementById("rowExistId").value;
    $('#addButton').click(function addRow()
    {
        rowNum ++;
        //var row = '<p id="rowNum'+rowNum+'">Item quantity: <input type="text" name="qty[]" size="4" value="'+frm.add_qty.value+'"> Item name: <input type="text" name="name[]" value="'+frm.add_name.value+'"> <input type="button" value="Remove" onclick="removeRow('+rowNum+');"></p>';
        var row = '<div class="form-group" id="rowNum'+rowNum+'">'
                        +'<div class="col-md-10">'
                            +selection
                        +'</div>'
                        +'<div class="col-md-2"  style="text-align: center">'
                                +'<button type="button" id="removeButton" data-rnum="'+rowNum+'" class="btn open-removeButton btn-danger form-control"><strong style="color: white"><i class="fa fa-minus"></i></strong></button>'
                        +'</div>'
                    +'</div>';
        $("#panelSize").val( rowNum+1 );
        jQuery('#itemRows').append(row);
    });
    
    $(document).on("click", ".open-removeButton", function ()
    {
        var rnum = $(this).data('rnum');
        $("#panelSize").val(rnum);
        jQuery('#rowNum'+rnum).remove();
    });
});
</script>