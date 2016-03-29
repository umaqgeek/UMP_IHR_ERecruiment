<%-- 
    Document   : e_int_start_chairman
    Created on : Feb 6, 2016, 10:55:20 PM
    Author     : Habib
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
String ptj_is_refid = session.getAttribute("is_refid").toString();
String icl_refid = session.getAttribute("icl_refid").toString();
boolean all_submitted = false;

String sql_position_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, dm.dm_dept_desc "
                + "FROM interview_setup iss, interview_result_mark irm, department_main dm, pos_applied pa, position_ptj_hr pph "
                + "WHERE iss.is_refid = irm.is_refid "
                + "AND pa.pa_refid = irm.pa_refid "
                + "AND pph.pph_refid = pa.pph_refid "
                + "AND pph.pph_ptj = dm.dm_dept_desc "
                + "AND iss.is_refid = ? "
                + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, dm.dm_dept_desc";
String param_position_list[] = { ptj_is_refid };
ArrayList<ArrayList<String>> data_position_list = mc.getQuery(sql_position_list, param_position_list);

String invite_accepted = "22";
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
                    +"AND ipl.ipl_status = ? "
                    +"GROUP BY sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, ipl.ipl_status, iis.iis_desc, ipl.ipl_refid, sm.sm_job_code";
String param_panel_list[] = { ptj_is_refid, invite_accepted };
ArrayList<ArrayList<String>> data_panel_list = mc.getQuery(sql_panel_list, param_panel_list);

String sql_check_null_mark  = "SELECT iii.iii_refid, iii.iii_status "
                            + "FROM interview_panel_list ipl, interview_irm_icm iii "
                            + "WHERE ipl.ipl_refid = iii.ipl_refid "
                            + "AND ipl.ipl_refid = ? "
                            + "AND iii.iii_status IS NULL ";
String[] param_check_null_mark = new String[1];
ArrayList<ArrayList<String>> data_check_null_mark;

String ptj_accepted = "11";
String sql_check_decided = "SELECT irm.irm_refid "
                        + "FROM interview_result_mark irm, interview_setup iss, position_ptj_hr pph, pos_applied pa "
                        + "WHERE pph.pph_refid = pa.pph_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND iss.is_refid = irm.is_refid "
                        + "AND iss.is_refid = ? "
                        + "AND pph.pph_refid = ? "
                        + "AND irm.irm_cand_status = ? "
                        + "AND irm.irm_ptj_status = ? "
                        + "AND irm.irm_status IS NULL";
String[] param_check_decided = new String[4];
ArrayList<ArrayList<String>> data_check_decided;

String sql_check_all_decided = "SELECT irm.irm_refid "
                        + "FROM interview_result_mark irm, interview_setup iss "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND iss.is_refid = ? "
                        + "AND irm.irm_cand_status = ? "
                        + "AND irm.irm_ptj_status = ? "
                        + "AND irm.irm_status IS NULL";
String param_check_all_decided[] = { ptj_is_refid, invite_accepted, ptj_accepted };
ArrayList<ArrayList<String>> data_check_all_decided = mc.getQuery(sql_check_all_decided, param_check_all_decided);
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <br/>
        <div class="row">
            <table style="background-color: white" class="table table-bordered" id="candidate_list" width="100%" style="font-size: 90%">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th colspan="4" style="vertical-align: middle; text-align: center; font-weight: bold">Application</th>
                        <th colspan="<%=data_panel_list.size() %>" style="vertical-align: middle; text-align: center; font-weight: bold">Panels</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                    </tr>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                        <%
                        for(int a = 0; a < data_panel_list.size(); a++)
                        {
                            %>
                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Panel <%=a+1 %></th>
                            <%
                        }
                        %>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_position_list.size(); a++)
                {
                    all_submitted = false;

                    param_check_decided[0] = ptj_is_refid;
                    param_check_decided[1] = data_position_list.get(a).get(0);
                    param_check_decided[2] = invite_accepted;
                    param_check_decided[3] = ptj_accepted;
                    data_check_decided = mc.getQuery(sql_check_decided, param_check_decided);
                    %>
                    <tr>
                        <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(a).get(1) %></td>
                        <td style="vertical-align: middle"><%=data_position_list.get(a).get(2) %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle"><%=data_position_list.get(a).get(3) %></td>
                        <%
                        for(int b = 0; b < data_panel_list.size(); b++)
                        {
                            param_check_null_mark[0] = data_panel_list.get(b).get(6);
                            data_check_null_mark = mc.getQuery(sql_check_null_mark, param_check_null_mark);

                            if(data_check_null_mark.size() > 0)
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">IN PROGRESS</td>
                                <%
                            }
                            else
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITTED</td>
                                <%
                            }
                        }

                        for(int b = 0; b < data_panel_list.size(); b++)
                        {
                            param_check_null_mark[0] = data_panel_list.get(b).get(6);
                            data_check_null_mark = mc.getQuery(sql_check_null_mark, param_check_null_mark);

                            if(data_check_null_mark.size() > 0)
                            {
                                all_submitted = false;
                                b = data_panel_list.size();
                            }
                            else
                            {
                                all_submitted = true;
                            }
                        }

                        if(all_submitted)
                        {
                            if(data_check_decided.size() > 0)
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center;"><a href="process.jsp?p=BPSM/E-Interview/e_int_chairman_decide.jsp&is_refid=<%=ptj_is_refid %>&icl_refid=<%=icl_refid %>&pph_refid=<%=data_position_list.get(a).get(0) %>" class="btn btn-danger">Decide</a></td>
                                <%
                            }
                            else
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center;"><a href="process.jsp?p=BPSM/E-Interview/e_int_chairman_decide.jsp&is_refid=<%=ptj_is_refid %>&icl_refid=<%=icl_refid %>&pph_refid=<%=data_position_list.get(a).get(0) %>" class="btn btn-primary">Decide</a></td>
                                <%
                            }
                        }
                        else
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center;"><a class="btn btn-primary disabled">Decide</a></td>
                            <%
                        }
                        %>
                    </tr>
                    <%
                }
                %>
                </tbody>
            </table>
        </div>
        <div class="row">
            <form method="post" action="process/bpsm/eInterview/e_int_end_interview_process.jsp">
            <input type="hidden" name="is_refid" value="<%=ptj_is_refid %>"/>
            <%
            if(data_check_all_decided.size() > 0)
            {
                %>
                <div class="col-sm-12"><button type="submit" class="btn btn-success form-control disabled"><span style="color: white">End Interview & Submit</span></button></div>
                <%
            }
            else
            {
                %>
                <div class="col-sm-12"><button type="submit" class="btn btn-success form-control"><span style="color: white">End Interview & Submit</span></button></div>
                <%
            }
            %>
            </form>
        </div>
    </div>
</div>

<!-- Modal Go Back -->
<div id="modalDiscard" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title" style="font-weight: bold">GO BACK</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<script type="text/javascript">
$(document).ready(function()
{
    $("#interview").prop('disabled', true);
});

function checkTotalCheckedBoxes()
{
     var checkLength = 0;
     var boxes = document.getElementById("candidate_list").getElementsByTagName("input");
     for (var i = 0; i < boxes.length; i++)
     {
         boxes[i].checked ? checkLength++ : null;
     }

     if(checkLength > 0)
     {
         $("#interview").prop('disabled', false);
     }
     else if(checkLength == 0)
     {
         $("#interview").prop('disabled', true);
     }
     //alert (checkLength + " boxes are checked." );
}
</script>
