<%-- 
    Document   : e_int_pos_saved_setup_list
    Created on : Feb 4, 2016, 3:32:45 PM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayDeque"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
boolean informed_exist;

String is_type = "UNIVERSITY";
String sql_saved_list = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type "
                    + "FROM interview_setup iss "
                    + "WHERE iss.is_type = ? ";
String param_saved_list[] = { is_type };
ArrayList<ArrayList<String>> data_saved_list = mc.getQuery(sql_saved_list, param_saved_list);
//out.print(data_saved_list);
String rejected = "12";
String accepted = "11";
String informed = "1";
String sql_interview_pos_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status, irm.irm_reason "
                            +"FROM interview_setup iss, interview_result_mark irm, pos_applied pa, position_ptj_hr pph, interview_invite_status iis "
                            +"WHERE iss.is_refid = irm.is_refid "
                            +"AND pa.pa_refid = irm.pa_refid "
                            +"AND pph.pph_refid = pa.pph_refid "
                            +"AND iis.iis_code = irm.irm_ptj_status "
                            +"AND iss.is_refid = ? "
                            +"GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status, irm.irm_reason";
String[] param_interview_pos_list = new String[1];
ArrayList<ArrayList<String>> data_interview_pos_list;

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
String sql_preinterview_detail  = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type "
                                + "FROM interview_setup iss, interview_result_mark irm, position_ptj_hr pph, pos_applied pa "
                                + "WHERE pph.pph_refid = pa.pph_refid "
                                + "AND pa.pa_refid = irm.pa_refid "
                                + "AND iss.is_refid = irm.is_refid "
                                + "AND iss.is_type = ? "
                                + "AND pph.pph_refid = ? "
                                + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type";
String[] param_preinterview_detail = new String[2];
ArrayList<ArrayList<String>> data_preinterview_detail;
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_published_list.jsp">PUBLISHED INTERVIEW</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_to_setup_list.jsp">POSITION READY TO SETUP</a></li>
              <li class="active"><a>SAVED INTERVIEW SETUP</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">MY INVITATION</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_criteria_bank.jsp">CRITERIA BANK</a></li>
            </ul>
        </div>
        
        <div class="row">
            <div class="col-sm-12"><h4>SAVED INTERVIEW LIST</h4></div>
            <table id="intList" class="table-bordered" width="100%">
                <thead>
                    <tr style="vertical-align: middle;">
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                        <th colspan="3" style="vertical-align: middle; text-align: center; font-weight: bold">Interview</th>
                        <th colspan="4" style="vertical-align: middle; text-align: center; font-weight: bold">Pre-Interview</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Action</th>
                    </tr>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Venue</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Details</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="5%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Approval Status</th>
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
                    %>
                    <tr>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center"><%=Func.getDate(data_saved_list.get(a).get(1)) %></td>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center"><%=data_saved_list.get(a).get(4) %></td>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalUniDetail<%=a %>" class="btn btn-default">Details</a></td>
                        <td style="vertical-align: middle"><%=data_interview_pos_list.get(0).get(1) %></td>
                        <td style="vertical-align: middle"><%=data_interview_pos_list.get(0).get(2) %></td>
                        <td style="vertical-align: middle"><%=data_interview_pos_list.get(0).get(3) %></td>
                        <%
                        if(data_interview_pos_list.get(0).get(5).equals(informed))
                        {
                            %>
                            <td style="vertical-align: middle; font-weight: bold"><%=data_interview_pos_list.get(0).get(4) %></td>
                            <%
                        }
                        else if(data_interview_pos_list.get(0).get(5).equals(accepted))
                        {
                            %>
                            <td style="vertical-align: middle"><a style="color: limegreen; font-weight: bold" href="#modalPreInterviewDetail<%=a+"_0" %>" data-toggle="modal"><%=data_interview_pos_list.get(0).get(4) %></a></td>
                            <%
                        }
                        else if(data_interview_pos_list.get(0).get(5).equals(rejected))
                        {
                            %>
                            <td style="vertical-align: middle"><a style="color: red; font-weight: bold" href="#modalReason<%=a+"_0" %>" data-toggle="modal"><%=data_interview_pos_list.get(0).get(4) %></a></td>
                            <%
                        }
                        %>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center">
                            <div class="btn-group">
                                <a class="btn btn-default dropdown-toggle form-control" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Action <span class="glyphicon glyphicon-menu-down"></span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="btn btn-default form-control" href="process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&is_refid=<%=data_saved_list.get(a).get(0) %>">General Setup</a>
                                    <a class="btn btn-success form-control" href="process.jsp?p=BPSM/E-Interview/e_int_question_setup.jsp&is_refid=<%=data_saved_list.get(a).get(0) %>">Question Setup</a>
                                    <%
                                    if(informed_exist)
                                    {
                                        %>
                                            <a class="btn btn-warning form-control disabled">Invite Candidate</a>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                            <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_invite_candidate.jsp&is_refid=<%=data_saved_list.get(a).get(0) %>">Invite Candidate</a>
                                        <%
                                    }
                                    %>
                                    <a class="btn btn-primary form-control disabled" href="#modalPublish" data-toggle="modal">Publish</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                    for(int b = 1; b < data_interview_pos_list.size(); b++)
                    {
                        %>
                        <tr>
                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(1) %></td>
                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(2) %></td>
                            <td style="vertical-align: middle"><%=data_interview_pos_list.get(b).get(3) %></td>
                            <%
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
    for(int b = 0; b < data_interview_pos_list.size(); b++)
    {
        param_preinterview_detail[0] = is_type_ptj;
        param_preinterview_detail[1] = data_interview_pos_list.get(b).get(0);
        data_preinterview_detail = mc.getQuery(sql_preinterview_detail, param_preinterview_detail);
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
        if(data_interview_pos_list.get(b).get(5).equals(accepted))
        {
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
                                            <td style="vertical-align: middle"><%=data_preinterview_detail.get(0).get(2) %></td>
                                         </tr>
                                         <tr>
                                            <td style="vertical-align: middle; font-weight: bold">End</td>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                            <td style="vertical-align: middle"><%=data_preinterview_detail.get(0).get(3) %></td>
                                         </tr>
                                         <tr>
                                            <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                            <td style="vertical-align: middle"><%=data_preinterview_detail.get(0).get(4) %></td>
                                         </tr>
                                    </tbody>
                                </table>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End modal pre -->
            <%
        }
    }
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
    $('#intList').DataTable();
});
</script>