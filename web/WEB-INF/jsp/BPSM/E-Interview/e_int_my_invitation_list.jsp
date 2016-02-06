<%-- 
    Document   : e_int_my_invitation_list
    Created on : Feb 4, 2016, 3:57:26 PM
    Author     : Habib
--%>

<%@page import="controller.Session"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_list.jsp">PUBLISHED INTERVIEW</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_to_setup_list.jsp">POSITION TO SETUP</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">SAVED SETUP POSITION</a></li>
              <li class="active"><a>MY INVITATION</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_criteria_bank.jsp">CRITERIA BANK</a></li>
            </ul>
        </div>
        
        <div class="row">
            <div class="col-sm-12"><h4>INVITATION LIST</h4></div>
            <%
            MainClient mc = new MainClient(DBConn.getHost());
            String sent = "SENT";
            String accepted = "ACCEPTED";
            String rejected = "REJECTED";
            String canceled = "CANCELED";
            String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();
//            String sql_invite = "SELECT IAL.U_REFID, IAL.IAL_REFID "
//                            + "FROM INTERVIEW_ASSIGN_LIST IAL, INTERVIEW_CHAIRMAN IC, INTERVIEW_RESULT IR, INTERVIEW_PANELS IP, "
//                            + "USERS1 U, LOGIN1 L "
//                            + "WHERE U.U_REFID = L.U_REFID "
//                            + "AND U.U_REFID = IAL.U_REFID "
//                            + "AND L.L_REFID = ? "
//                            + "GROUP BY IAL.U_REFID, IAL.IAL_REFID";
//            String param_invite[] = { l_refid };
//            ArrayList<ArrayList<String>> data_invite = mc.getQuery(sql_invite, param_invite);
            String null_data = "null";
            String sql_invited_as_chairman = "SELECT IAL.IAL_REFID, U.U_REFID, U.U_NAME, IAL.IC_REFID, IAL.IAL_STATUS "
                                            +"FROM INTERVIEW_ASSIGN_LIST IAL, USERS1 U, LOGIN1 L "
                                            +"WHERE U.U_REFID = IAL.U_REFID "
                                            +"AND U.U_REFID = L.U_REFID "
                                            +"AND IAL.IC_REFID != ? "
                                            +"AND L.L_REFID = ? ";
            String param_invited_as_chairman[] = { null_data, l_refid };
            ArrayList<ArrayList<String>> data_invited_as_chairman = mc.getQuery(sql_invited_as_chairman, param_invited_as_chairman);
            //out.print(l_refid);
//            out.print(data_invited_as_chairman);
            
            String interview_position = "";
            String sql_int_chairman = "";
            String[] param_int_chairman = new String[1];
            ArrayList<ArrayList<String>> data_int_chairman;

            String sql_int_detail = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, PPH.PPH_PTJ, PPH.PPH_REFID, "
                    + "IC.IC_STARTTIME, IC.IC_ENDTIME, IC.IC_VENUE, IC.IC_TYPE "
                    + "FROM INTERVIEW_CHAIRMAN IC, INTERVIEW_RESULT IR, POS_APPLIED PA, POSITION_PTJ_HR PPH "
                    + "WHERE IC.IC_REFID = IR.IC_REFID "
                    + "AND PA.PA_REFID = IR.PA_REFID "
                    + "AND PPH.PPH_REFID = PA.PPH_REFID "
                    + "AND IC.IC_REFID = ? "
                    + "GROUP BY PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, PPH.PPH_PTJ, PPH.PPH_REFID, IC.IC_STARTTIME, IC.IC_ENDTIME, IC.IC_VENUE, IC.IC_TYPE";
            String[] param_int_detail = new String[1]; 
            ArrayList<ArrayList<String>> data_int_detail;
            %>
            <table id="invite_list" class="table-bordered" width="100%">
                <thead>
                <tr style="vertical-align: middle;">
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Grade</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Position</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">PTJ</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Date</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Start</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">End</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Venue</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Interview Stage</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Invited As</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                int row_num = 1;
                for(int a = 0; a < data_invited_as_chairman.size(); a++)
                {
                    param_int_detail[0] = data_invited_as_chairman.get(a).get(3);
                    data_int_detail = mc.getQuery(sql_int_detail, param_int_detail);
                    %>
                    <tr>
                        <td style="vertical-align: middle; text-align: center"><%=row_num %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(0) %></td>
                        <td style="vertical-align: middle"><%=data_int_detail.get(0).get(1) %></td>
                        <td style="vertical-align: middle"><%=data_int_detail.get(0).get(4) %></td>
                        <td style="vertical-align: middle"><%=data_int_detail.get(0).get(3) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(6) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(7) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(8) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(9) %></td>
                        <td style="vertical-align: middle; text-align: center">CHAIRMAN</td>
                        <%
                        if(data_invited_as_chairman.get(a).get(4).equals(sent))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-success form-control" data-toggle="modal" href="#modalChairmanAccept<%=a %>">Accept</a>
                            <a class="btn btn-warning form-control" data-toggle="modal" href="#modalChairmanReject<%=a %>">Reject</a></td>
                            <%
                        }
                        else if(data_invited_as_chairman.get(a).get(4).equals(accepted))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold"><%=data_invited_as_chairman.get(a).get(4) %></td>
                            <%
                        }
                        else if(data_invited_as_chairman.get(a).get(4).equals(rejected))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; color: red; font-weight: bold"><%=data_invited_as_chairman.get(a).get(4) %></td>
                            <%
                        }
                        else if(data_invited_as_chairman.get(a).get(4).equals(canceled))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; color: #ee5f5b;; font-weight: bold"><%=data_invited_as_chairman.get(a).get(4) %></td>
                            <%
                        }
                        %>
                    </tr>
                    <%
                    row_num++;
                }
                
                String sql_ic_refid_panel = "SELECT IC.IC_REFID "
                        +"FROM INTERVIEW_CHAIRMAN IC, LOGIN1 L, USERS1 U, INTERVIEW_PANELS IP, INTERVIEW_RESULT IR, INTERVIEW_ASSIGN_LIST IAL "
                        +"WHERE U.U_REFID = L.U_REFID "
                        +"AND U.U_REFID = IAL.U_REFID "
                        +"AND IP.IP_REFID = IAL.IP_REFID "
                        +"AND IR.IR_REFID = IP.IR_REFID "
                        +"AND IC.IC_REFID = IR.IC_REFID "
                        +"AND L.L_REFID = ? "
                        +"GROUP BY IC.IC_REFID";
                String param_ic_refid_panel[] = { l_refid };
                ArrayList<ArrayList<String>> data_ic_refid_panel = mc.getQuery(sql_ic_refid_panel, param_ic_refid_panel);
                
                String sql_u_refid = "SELECT IC.IC_REFID, IAL.U_REFID, U.U_NAME, IAL.IAL_STATUS "
                        +"FROM INTERVIEW_CHAIRMAN IC, LOGIN1 L, USERS1 U, INTERVIEW_PANELS IP, INTERVIEW_RESULT IR, INTERVIEW_ASSIGN_LIST IAL "
                        +"WHERE U.U_REFID = IAL.U_REFID "
                        +"AND IP.IP_REFID = IAL.IP_REFID "
                        +"AND IR.IR_REFID = IP.IR_REFID "
                        +"AND IC.IC_REFID = IR.IC_REFID "
                        +"AND U.U_REFID = L.U_REFID "
                        +"AND IAL.IP_REFID != ? "
                        +"AND IC.IC_REFID = ? "
                        +"AND L.L_REFID = ? "
                        +"GROUP BY IC.IC_REFID, IAL.U_REFID, U.U_NAME, IAL.IAL_STATUS";
                String[] param_u_refid = new String[3];
                ArrayList<ArrayList<String>> data_u_refid;
                for(int a = 0; a < data_ic_refid_panel.size(); a++)
                {
                    param_u_refid[0] = null_data;
                    param_u_refid[1] = data_ic_refid_panel.get(a).get(0);
                    param_u_refid[2] = l_refid;
                    data_u_refid = mc.getQuery(sql_u_refid, param_u_refid);
                    for(int b=0; b<data_u_refid.size(); b++)
                    {
                        param_int_detail[0] = data_ic_refid_panel.get(a).get(0);
                        data_int_detail = mc.getQuery(sql_int_detail, param_int_detail);
                        %>
                        <tr>
                            <td style="vertical-align: middle; text-align: center"><%=row_num %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(0) %></td>
                            <td style="vertical-align: middle"><%=data_int_detail.get(0).get(1) %></td>
                            <td style="vertical-align: middle"><%=data_int_detail.get(0).get(4) %></td>
                            <td style="vertical-align: middle"><%=data_int_detail.get(0).get(3) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(6) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(7) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(8) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_int_detail.get(0).get(9) %></td>
                            <td style="vertical-align: middle; text-align: center">PANEL</td>
                            <%
                            if(data_u_refid.get(a).get(3).equals(sent))
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center"><a class="btn btn-success form-control" data-toggle="modal" href="#modalPanelAccept<%=a %>">Accept</a>
                                <a class="btn btn-warning form-control" data-toggle="modal" href="#modalPanelReject<%=a %>">Reject</a></td>
                                <%
                            }else if(data_u_refid.get(a).get(3).equals(accepted))
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold"><%=data_u_refid.get(a).get(3) %></td>
                                <%
                            }
                            else if(data_u_refid.get(a).get(3).equals(rejected))
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center; color: red; font-weight: bold"><%=data_u_refid.get(a).get(3) %></td>
                                <%
                            }
                            else if(data_u_refid.get(a).get(3).equals(canceled))
                            {
                                %>
                                <td style="vertical-align: middle; text-align: center; color: #ee5f5b;; font-weight: bold"><%=data_u_refid.get(a).get(3) %></td>
                                <%
                            }
                            %>
                        </tr>
                        <%
                    }
                    row_num++;
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Start Modal -->
<!-- Modal Chairman Accept -->
<%
for(int a = 0; a < data_invited_as_chairman.size(); a++)
{
    param_int_detail[0] = data_invited_as_chairman.get(a).get(3);
    data_int_detail = mc.getQuery(sql_int_detail, param_int_detail);
    %>
    <div id="modalChairmanAccept<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <form action="process/bpsm/eInterview/e_int_accept_chairman.jsp" method="post">
            <input name="ial_refid" type="hidden" value="<%=data_invited_as_chairman.get(a).get(0) %>">
            <input name="u_refid" type="hidden" value="<%=data_invited_as_chairman.get(a).get(1) %>">
            <input name="ic_refid" type="hidden" value="<%=data_invited_as_chairman.get(a).get(3) %>">
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
            <form action="process/bpsm/eInterview/e_int_reject_chairman.jsp" method="post">
            <input name="ial_refid" type="hidden" value="<%=data_invited_as_chairman.get(a).get(0) %>">
            <input name="u_refid" type="hidden" value="<%=data_invited_as_chairman.get(a).get(1) %>">
            <input name="ic_refid" type="hidden" value="<%=data_invited_as_chairman.get(a).get(3) %>">
            <div class="modal-content">
                <div class="modal-body" align="center">
                    <fieldset>
                        <h4 class="modal-title" style="font-weight: bold">Reject This Invitation</h4>
                        <h6 class="modal-title">Are You Sure ?</h6>
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
for(int a = 0; a < data_ic_refid_panel.size(); a++)
{
    param_u_refid[0] = null_data;
    param_u_refid[1] = data_ic_refid_panel.get(a).get(0);
    param_u_refid[2] = l_refid;
    data_u_refid = mc.getQuery(sql_u_refid, param_u_refid);
    for(int b=0; b<data_u_refid.size(); b++)
    {
        param_int_detail[0] = data_ic_refid_panel.get(a).get(0);
        data_int_detail = mc.getQuery(sql_int_detail, param_int_detail);
        %>
        <div id="modalPanelAccept<%=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/bpsm/eInterview/e_int_accept_panel.jsp" method="post">
                    <input name="ic_refid" type="hidden" value="<%=data_u_refid.get(b).get(0) %>">
                <input name="u_refid" type="hidden" value="<%=data_u_refid.get(b).get(1) %>">
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
                
       <div id="modalPanelReject<%=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/bpsm/eInterview/e_int_reject_panel.jsp" method="post">
                    <input name="ic_refid" type="hidden" value="<%=data_u_refid.get(b).get(0) %>">
                <input name="u_refid" type="hidden" value="<%=data_u_refid.get(b).get(1) %>">
                <div class="modal-content">
                    <div class="modal-body" align="center">
                        <fieldset>
                            <h4 class="modal-title" style="font-weight: bold">Reject This Invitation</h4>
                            <h6 class="modal-title">Are You Sure ?</h6>
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
}
%>
<!-- End Panel Accept -->
<!-- End Modal -->
<script type="text/javascript">
$(document).ready(function()
{
    $('#invite_list').DataTable();
});
</script>