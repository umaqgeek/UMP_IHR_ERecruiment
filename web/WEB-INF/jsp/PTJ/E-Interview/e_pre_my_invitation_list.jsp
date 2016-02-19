<%-- 
    Document   : e_pre_my_invitation_list
    Created on : Feb 18, 2016, 12:47:02 PM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page import="controller.Session"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    
    String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();
    String sql_dept_code = "SELECT l.l_username, l.l_icno "
                        + "FROM login1 l "
                        + "WHERE l.l_refid = ? ";
    String param_dept_code[] = { l_refid };
    ArrayList<ArrayList<String>> data_dept_code = mc.getQuery(sql_dept_code, param_dept_code);

    String dept_code = data_dept_code.get(0).get(0);
    String staff_id = data_dept_code.get(0).get(1);
    
    String sent = "21";
    String accepted = "22";
    String rejected = "23";
    String canceled = "24";
    
    String sql_chairman_invitation  = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, icl.icl_status, iis.iis_desc "
                                    + "FROM interview_setup iss, interview_chairman_list icl, staff_main sm, staff_main_archive052014 sma, interview_invite_status iis "
                                    + "WHERE iss.is_refid = icl.is_refid "
                                    + "AND iis.iis_code = icl.icl_status "
                                    + "AND sm.sm_staff_id = icl.sm_staff_id "
                                    + "AND sm.sm_staff_id = sma.sm_staff_id "
                                    + "AND sm.sm_staff_id = ? "
                                    + "AND icl.icl_status != ? ";
    String param_chairman_invitation[] = { staff_id, canceled };
    ArrayList<ArrayList<String>> data_chairman_invitation = mc.getQuery(sql_chairman_invitation, param_chairman_invitation);
    
    String sql_position_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj "
                    + "FROM interview_setup iss, interview_result_mark irm, department_main dm, pos_applied pa, position_ptj_hr pph "
                    + "WHERE iss.is_refid = irm.is_refid "
                    + "AND pa.pa_refid = irm.pa_refid "
                    + "AND pph.pph_refid = pa.pph_refid "
                    + "AND pph.pph_ptj = dm.dm_dept_desc "
                    + "AND iss.is_refid = ? "
                    + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj ";
    String[] param_position_list = new String[1];
    ArrayList<ArrayList<String>> data_position_list;
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
                <li><a href="process.jsp?p=PTJ/E-Interview/e_pre_memo_list.jsp">INTERVIEW MEMO</a></li>
                <li><a href="process.jsp?p=PTJ/E-Interview/e_pre_saved_setup_list.jsp">SAVED PRE-INTERVIEW SETUP</a></li>
                <li class="active" ><a>MY INVITATION</a></li>
            </ul>
        </div>
        
        <div class="row">
            <div class="col-sm-12"><h4>INVITATION LIST</h4></div>
            <table id="invite_list" class="table-bordered" width="100%">
                <thead>
                    <tr style="vertical-align: middle;">
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                        <th colspan="3" style="vertical-align: middle; text-align: center; font-weight: bold">Interview For</th>
                        <th colspan="5" style="vertical-align: middle; text-align: center; font-weight: bold">Interview Detail</th>
                    </tr>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="3%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Interview Level</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Invited As</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Detail</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_chairman_invitation.size(); a++)
                {
                    param_position_list[0] = data_chairman_invitation.get(a).get(0);
                    data_position_list = mc.getQuery(sql_position_list, param_position_list);
                    %>
                    <tr>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(0).get(1) %></td>
                        <td style="vertical-align: middle"><%=data_position_list.get(0).get(2) %></td>
                        <td style="vertical-align: middle"><%=data_position_list.get(0).get(3) %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=Func.getDate(data_chairman_invitation.get(a).get(1)) %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><%=data_chairman_invitation.get(a).get(5) %></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center">CHAIRMAN</td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center"><a class="btn btn-warning form-control" data-toggle="modal" href="#modalAsChairmanDetail<%=a %>">Detail</a></td>
                        <td rowspan="<%=data_position_list.size() %>" style="vertical-align: middle; text-align: center">
                        <%
                        if(data_chairman_invitation.get(a).get(7).equals(sent))
                        {
                            %>
                            <div class="btn-group">
                                <a class="btn btn-default dropdown-toggle form-control" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Action <span class="glyphicon glyphicon-menu-down"></span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="btn btn-success form-control" data-toggle="modal" href="#modalChairmanAccept<%=a %>">Accept</a>
                                    <a class="btn btn-danger form-control" data-toggle="modal" href="#modalChairmanReject<%=a %>">Reject</a>
                                </div>
                            </div>
                            <%
                        }
                        else if(data_chairman_invitation.get(a).get(7).equals(accepted))
                        {
                            %>
                            <a  title="You've been accepted. Wait until interview day" class="btn btn-primary form-control" data-toggle="modal" href="#modalStart<%=a %>">Start</a>
                            <%
                        }
                        else if(data_chairman_invitation.get(a).get(7).equals(rejected))
                        {
                            %>
                            <span style="color: red; font-weight: bold">REJECTED</span>
                            <%
                        }
                        %>
                        </td>
                    </tr>
                    <%
                    for(int b = 1; b < data_position_list.size(); b++)
                    {
                        %>
                        <tr>
                            <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(b).get(1) %></td>
                            <td style="vertical-align: middle"><%=data_position_list.get(b).get(2) %></td>
                            <td style="vertical-align: middle"><%=data_position_list.get(b).get(3) %></td>
                        </tr>
                        <%
                    }  
                }
                %>
                    <tr>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">2</td>
                        <td style="vertical-align: middle; text-align: center">Grade 2</td>
                        <td style="vertical-align: middle">Position 2</td>
                        <td rowspan="3" style="vertical-align: middle">12/02/2016</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">3:00PM</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">UNIVERSITY</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">PANEL</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center"><a class="btn btn-primary form-control" href="process.jsp?p=BPSM/E-Interview/e_int_start.jsp">Start</a></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Grade 2</td>
                        <td style="vertical-align: middle">Position 1</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Grade 3</td>
                        <td style="vertical-align: middle">Position 4</td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">3</td>
                        <td style="vertical-align: middle; text-align: center">Grade 2</td>
                        <td style="vertical-align: middle">Position 2</td>
                        <td rowspan="3" style="vertical-align: middle">12/02/2016</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">3:00PM</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">UNIVERSITY</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">CHAIRMAN</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center"><a class="btn btn-primary form-control" href="process.jsp?p=BPSM/E-Interview/e_int_start_chairman.jsp">Start</a></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Grade 2</td>
                        <td style="vertical-align: middle">Position 1</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Grade 3</td>
                        <td style="vertical-align: middle">Position 4</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Start Modal -->
<!-- Modal Chairman Accept -->
<%
for(int a = 0; a < data_chairman_invitation.size(); a++)
{
    %>
    <div id="modalChairmanAccept<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <form action="process/ptj/eInterview/e_pre_accept_chairman.jsp" method="post">
            <input type="hidden" name="is_refid" value="<%=data_chairman_invitation.get(a).get(0) %>">
            <input type="hidden" name="chairman_sm_staff_id" value="<%=staff_id %>">
            <div class="modal-content">
                <div class="modal-body" align="center">
                    <fieldset>
                        <h4 class="modal-title" style="font-weight: bold">Accept This Invitation As Chairman</h4>
                        <h6 class="modal-title">Are You Sure ?</h6>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success form-control" type="submit">YES</button>
                </div>
            </div>
            </form>
        </div>
    </div>
            
    <div id="modalChairmanReject<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <form action="process/ptj/eInterview/e_pre_reject_chairman.jsp" method="post">
            <input type="hidden" name="is_refid" value="<%=data_chairman_invitation.get(a).get(0) %>">
            <input type="hidden" name="chairman_sm_staff_id" value="<%=staff_id %>">
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">Reject This Invitation</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <h6 class="modal-title">State Your Reason:</h6>
                        <textarea class="form-control" placeholder="REASON" required></textarea>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning form-control" type="submit">YES</button>
                </div>
            </div>
            </form>
        </div>
    </div>
    <%
}
%>
<!-- Modal Panel Accept -->
<%
//for(int a = 0; a < data_ic_refid_panel.size(); a++)
//{
//    param_u_refid[0] = null_data;
//    param_u_refid[1] = data_ic_refid_panel.get(a).get(0);
//    param_u_refid[2] = l_refid;
//    data_u_refid = mc.getQuery(sql_u_refid, param_u_refid);
//    for(int b=0; b<data_u_refid.size(); b++)
//    {
//        param_int_detail[0] = data_ic_refid_panel.get(a).get(0);
//        data_int_detail = mc.getQuery(sql_int_detail, param_int_detail);
        %>
        <div id="modalPanelAccept<%//=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/bpsm/eInterview/e_int_accept_panel.jsp" method="post">
                    <input name="ic_refid" type="hidden" value="<%//=data_u_refid.get(b).get(0) %>">
                <input name="u_refid" type="hidden" value="<%//=data_u_refid.get(b).get(1) %>">
                <div class="modal-content">
                    <div class="modal-body" align="center">
                        <fieldset>
                            <h4 class="modal-title" style="font-weight: bold">Accept This Invitation As Panel</h4>
                            <h6 class="modal-title">Are You Sure ?</h6>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success form-control" type="submit">YES</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
                
       <div id="modalPanelReject<%//=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/bpsm/eInterview/e_int_reject_panel.jsp" method="post">
                <input name="ic_refid" type="hidden" value="<%//=data_u_refid.get(b).get(0) %>">
                <input name="u_refid" type="hidden" value="<%//=data_u_refid.get(b).get(1) %>">
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <h4 class="modal-title" style="font-weight: bold">Reject This Invitation</h4>
                        <h6 class="modal-title">Are You Sure ?</h6>
                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <h6 class="modal-title">State Your Reason:</h6>
                            <textarea class="form-control" placeholder="REASON" required></textarea>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-warning form-control" type="submit">YES</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <%
    //}
//}
%>
<!-- End Panel Accept -->
<%-- Modal Interview Detail --%>
<%
for(int a = 0; a < data_chairman_invitation.size(); a++)
{
    %>
    <div id="modalAsChairmanDetail<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">INVITATION DETAIL</h4>
                </div>
                <div class="modal-body" align="center">
                    <fieldset>
                        <table style="width: 100%" class="table-condensed">
                            <tbody>
                                <tr>
                                    <td style="vertical-align: middle; font-weight: bold; width: 20%">Invited As</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">:</td>
                                    <td style="vertical-align: middle">CHAIRMAN</td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: middle; font-weight: bold; width: 20%">Interview Level</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">:</td>
                                    <td style="vertical-align: middle"><%=data_chairman_invitation.get(a).get(5) %></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Date</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=Func.getDate(data_chairman_invitation.get(a).get(1)) %></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Start</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_chairman_invitation.get(a).get(2) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">End</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_chairman_invitation.get(a).get(3) %></td>
                                 </tr>
                                 <tr>
                                    <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                    <td style="vertical-align: middle"><%=data_chairman_invitation.get(a).get(4) %></td>
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
<%-- End Modal Detail --%>
<!-- End Modal -->
<script type="text/javascript">
$(document).ready(function()
{
    $('#invite_list').DataTable();
});
</script>


