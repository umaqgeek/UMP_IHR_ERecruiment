<%-- 
    Document   : e_int_pos_setup
    Created on : Jan 29, 2016, 7:07:31 PM
    Author     : Habib
--%>
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
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <%
//            String pph_refid = session.getAttribute("pph_refid").toString();
//            String ic_refid = session.getAttribute("ic_refid").toString();
//            
//            String sent = "SENT";
//            String accepted = "ACCEPTED";
//            String rejected = "REJECTED";
//            String canceled = "CANCELED";
//            
//            String sql_pos_list = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid "
//                        + "FROM pos_applied pa, position_ptj_hr pph, candidate c, login1 l "
//                        + "WHERE pa.pph_refid = pph.pph_refid "
//                        + "AND pa.c_refid = c.c_refid "
//                        + "AND l.c_refid = c.c_refid "
//                        + "AND pph.pph_refid = ? ";
//            String[] param_pos_list = new String[1];
//            ArrayList<ArrayList<String>> data_pos_list;
//            
//            String sql_count_pass = "SELECT COUNT(PA.PA_REFID) "
//                                    + "FROM POS_APPLIED PA, POSITION_PTJ_HR PPH "
//                                    + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
//                                    + "AND PA.PA_STATUS = ? "
//                                    + "AND PA.PPH_REFID = ? ";
//            String[] param_count_pass = new String[2];
//            ArrayList<ArrayList<String>> data_count_pass;
//            
            %>
            <div class="col-sm-12"><h4>E-INTERVIEW: Setup Interview</h4></div>
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
//                                    String pass_ptj = "PASS_PTJ";
//                                    param_pos_list[0] =  pph_refid;
//                                    data_pos_list = mc.getQuery(sql_pos_list, param_pos_list);
//                                    param_count_pass[0] = pass_ptj;
//                                    param_count_pass[1] = data_pos_list.get(0).get(3);
//                                    data_count_pass = mc.getQuery(sql_count_pass, param_count_pass);
                                    %>
<!--                                    <input type="hidden" name="pph_refid" value="<%//=pph_refid %>">
                                    <input type="hidden" name="ic_refid" value="<%//=ic_refid %>">
                                    <tr>
                                        <td style="vertical-align: middle; text-align: center"><%//=data_pos_list.get(0).get(0) %></td>
                                        <td style="vertical-align: middle"><%//=data_pos_list.get(0).get(1) %></td>
                                        <td style="vertical-align: middle"><%//=data_pos_list.get(0).get(2) %></td>
                                        <td style="vertical-align: middle; text-align: center"><%//=data_count_pass.get(0).get(0) %></td>
                                    </tr>-->
                                    <tr>
                                        <td style="vertical-align: middle; text-align: center">1</td>
                                        <td style="vertical-align: middle; text-align: center">Grade 1</td>
                                        <td style="vertical-align: middle">Position 1</td>
                                        <td style="vertical-align: middle">PTJ 1</td>
                                        <td style="vertical-align: middle; text-align: center">3</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle; text-align: center">2</td>
                                        <td style="vertical-align: middle; text-align: center">Grade 2</td>
                                        <td style="vertical-align: middle">Position 2</td>
                                        <td style="vertical-align: middle">PTJ 2</td>
                                        <td style="vertical-align: middle; text-align: center">6</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle; text-align: center">3</td>
                                        <td style="vertical-align: middle; text-align: center">Grade 3</td>
                                        <td style="vertical-align: middle">Position 3</td>
                                        <td style="vertical-align: middle">PTJ 3</td>
                                        <td style="vertical-align: middle; text-align: center">9</td>
                                    </tr>
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
                        <input type="hidden" value="2014-02-09" id="setDate">
                        <input type="hidden" value="14:00" id="setStart">
                        <input type="hidden" value="17:00" id="setEnd">
                    </div>
                    <div class="panel-body">                                        
                        <div class="row">
                            <table class="table-condensed" width="100%">
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Date</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input readonly id="intDate" type="date" class="form-control" name="ic_interview_date" required="" placeholder="30/02/2015"></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Start</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input readonly id="intStart" type="time" class="form-control" name="ic_start_time" required="" placeholder="03:00PM"></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">End</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input readonly id="intEnd" type="time" class="form-control" name="ic_end_time" required="" placeholder="03:00PM"></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle">Venue</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center">:</td>
                                    <td style="vertical-align: middle"><input readonly type="text" class="form-control" name="ic_venue" placeholder="Example: HR BUILDING" value="HR BUILDING" required></td>
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
        
        <%
//        String sql_select_chairman = "SELECT IAL.U_REFID, U.U_NAME, RL.RL_ROLE, IAL.IAL_STATUS "
//                                + "FROM INTERVIEW_ASSIGN_LIST IAL, USERS1 U, ROLE RL, LOGIN1 L "
//                                + "WHERE U.U_REFID = IAL.U_REFID "
//                                + "AND U.U_REFID = L.U_REFID "
//                                + "AND RL.RL_REFID = L.RL_REFID "
//                                + "AND IAL.IC_REFID = ? ";
//        String param_select_chairman[] = { ic_refid };
//        ArrayList<ArrayList<String>> data_select_chairman = mc.getQuery(sql_select_chairman, param_select_chairman);
//        
//        String sql_select_panel = "SELECT IAL.U_REFID, U.U_NAME, RL.RL_ROLE, IAL.IAL_STATUS, IC.IC_REFID "
//                                + "FROM INTERVIEW_ASSIGN_LIST IAL, INTERVIEW_CHAIRMAN IC, INTERVIEW_RESULT IR, INTERVIEW_PANELS IP, "
//                                + "USERS1 U, ROLE RL, LOGIN1 L "
//                                + "WHERE IC.IC_REFID = IR.IC_REFID "
//                                + "AND IR.IR_REFID = IP.IR_REFID "
//                                + "AND IP.IP_REFID = IAL.IP_REFID "
//                                + "AND U.U_REFID = IAL.U_REFID "
//                                + "AND U.U_REFID = L.U_REFID "
//                                + "AND RL.RL_REFID = L.RL_REFID "
//                                + "AND  IC.IC_REFID = ? "
//                                + "GROUP BY IAL.U_REFID, U.U_NAME, RL.RL_ROLE, IAL.IAL_STATUS, IC.IC_REFID ";
//        String param_select_panel[] = { ic_refid };
//        ArrayList<ArrayList<String>> data_select_panel = mc.getQuery(sql_select_panel, param_select_panel);
//        //out.print(data_select_panel);
//        String btn_invite_new = "";
//        String sql_sent_chairman = "SELECT IAL.IAL_REFID, IAL.IAL_STATUS "
//                                + "FROM INTERVIEW_ASSIGN_LIST IAL "
//                                + "WHERE IAL.IC_REFID = ? "
//                                + "AND IAL.IAL_STATUS = ? ";
//        String param_sent_chairman[] = { ic_refid, sent };
//        ArrayList<ArrayList<String>> data_sent_chairman = mc.getQuery(sql_sent_chairman, param_sent_chairman);
//
//        String sql_rejected_chairman = "SELECT IAL.IAL_REFID, IAL.IAL_STATUS "
//                                + "FROM INTERVIEW_ASSIGN_LIST IAL "
//                                + "WHERE IAL.IC_REFID = ? "
//                                + "AND IAL.IAL_STATUS = ? ";
//        String param_rejected_chairman[] = { ic_refid, rejected };
//        ArrayList<ArrayList<String>> data_rejected_chairman = mc.getQuery(sql_rejected_chairman, param_rejected_chairman);
//
//        String sql_canceled_chairman = "SELECT IAL.IAL_REFID, IAL.IAL_STATUS "
//                                + "FROM INTERVIEW_ASSIGN_LIST IAL "
//                                + "WHERE IAL.IC_REFID = ? "
//                                + "AND IAL.IAL_STATUS = ? ";
//        String param_canceled_chairman[] = { ic_refid, canceled };
//        ArrayList<ArrayList<String>> data_canceled_chairman = mc.getQuery(sql_canceled_chairman, param_canceled_chairman);
//
//        String sql_accepted_chairman = "SELECT IAL.IAL_REFID, IAL.IAL_STATUS "
//                                + "FROM INTERVIEW_ASSIGN_LIST IAL "
//                                + "WHERE IAL.IC_REFID = ? "
//                                + "AND IAL.IAL_STATUS = ? ";
//        String param_accepted_chairman[] = { ic_refid, accepted };
//        ArrayList<ArrayList<String>> data_accepted_chairman = mc.getQuery(sql_accepted_chairman, param_accepted_chairman);
//        //out.print(data_accepted_chairman+" "+data_canceled_chairman+" "+data_rejected_chairman+" "+data_sent_chairman);
//        
//        String role_candidate = "CANDIDATE";
//        String sql_select_user = "SELECT U.U_REFID, U.U_NAME, RL.RL_ROLE "
//                                + "FROM USERS1 U, LOGIN1 L, ROLE RL "
//                                + "WHERE RL.RL_REFID = L.RL_REFID "
//                                + "AND U.U_REFID = L.U_REFID "
//                                + "AND RL.RL_ROLE != ? ";
//        String param_select_user[] = { role_candidate };
//        ArrayList<ArrayList<String>> data_select_user = mc.getQuery(sql_select_user, param_select_user);
//                                            
//        if(data_select_chairman.size() > 0)
//        {
            %>  
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
//                                if(data_accepted_chairman.size() > 0 || data_sent_chairman.size() > 0)
//                                {
//                                    btn_invite_new = "disabled";
//                                }
//                                else
//                                {
//                                    btn_invite_new = "";
//                                }
                                %>
                                <a data-toggle="modal" href="#modalInviteNewChairman" class="btn btn-default <%//=btn_invite_new %> disabled">Invite New Chairman</a><br/>
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
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">Grade</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">Position</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">PTJ</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Invited As</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Invitation Status</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
//                                    for(int a = 0; a < data_select_chairman.size(); a++)
//                                    {
                                        %>
<!--                                        <tr>
                                            <td style="vertical-align: middle; text-align: center;"><%//=a+1 %></td>
                                            <td style="vertical-align: middle"><%//=data_select_chairman.get(a).get(1) %></td>
                                            <td style="vertical-align: middle; text-align: center;">CHAIRMAN</td>
                                            <%
//                                            if(data_select_chairman.get(a).get(3).equals(sent))
//                                            {
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold"><%//=data_select_chairman.get(a).get(3) %></td>
//                                                <%
//                                            }
//                                            else if(data_select_chairman.get(a).get(3).equals(accepted))
//                                            {
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold"><%//=data_select_chairman.get(a).get(3) %></td>
//                                                <%
//                                            }
//                                            else if(data_select_chairman.get(a).get(3).equals(rejected))
//                                            {
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center; color: red; font-weight: bold"><%//=data_select_chairman.get(a).get(3) %></td>
//                                                <%
//                                            }
//                                            else if(data_select_chairman.get(a).get(3).equals(canceled))
//                                            {
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center; color: #ee5f5b; font-weight: bold"><%//=data_select_chairman.get(a).get(3) %></td>
//                                                <%
//                                            }
//                                            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                            if(data_select_chairman.get(a).get(3).equals(canceled) || data_select_chairman.get(a).get(3).equals(rejected))
//                                            {
//                                                if(data_accepted_chairman.size() > 0 || data_sent_chairman.size() > 0)
//                                                {
//                                                    %>
//                                                    <td style="vertical-align: middle; text-align: center;"><a class="btn btn-default  disabled">Re-invite</a></td>
//                                                    <%
//                                                }
//                                                else
//                                                {
//                                                    %>
//                                                    <td style="vertical-align: middle; text-align: center;"><a href="#modalReinviteChairman<%//=a %>" data-toggle="modal" class="btn btn-default">Re-invite</a></td>
//                                                    <%
//                                                }
//                                            }
//                                            else if(data_select_chairman.get(a).get(3).equals(sent) || data_select_chairman.get(a).get(3).equals(accepted))
//                                            {    
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman<%//=a %>" class="btn btn-danger">Cancel Invitation</a></td>
//                                                <%
//                                            }
//                                            
//                                            %>
//                                        </tr>-->
                                        <%
//                                    }
                                    %>
                                        <tr>
                                            <td style="vertical-align: middle; text-align: center;">1</td>
                                            <td style="vertical-align: middle">Chairman's Name 1</td>
                                            <td style="vertical-align: middle">Chairman's 1 Grade</td>
                                            <td style="vertical-align: middle">Chairman's 1 Position</td>
                                            <td style="vertical-align: middle">Chairman's 1 PTJ</td>
                                            <td style="vertical-align: middle; text-align: center;">CHAIRMAN</td>
                                            <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold">SET</td>
                                            <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman" class="btn btn-danger disabled">Cancel Invitation</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="row">
                                <h1></h1>
                            </div>        
                            <div class="row">
                                <a href="#modalInviteNewPanel" data-toggle="modal" class="btn btn-default disabled">Invite New Panels</a><br/>
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
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">Grade</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">Position</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">PTJ</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Invited As</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Invitation Status</th>
                                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
//                                    for(int a = 0; a < data_select_panel.size(); a++)
//                                    {
                                        %>
<!--                                        <tr>
                                            <td style="vertical-align: middle; text-align: center;"><%//=a+1 %></td>
                                            <td style="vertical-align: middle"><%//=data_select_panel.get(a).get(1) %></td>
                                            <td style="vertical-align: middle; text-align: center;">PANEL</td>
                                            <%
//                                            if(data_select_panel.get(a).get(3).equals(sent))
//                                            {
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold"><%//=data_select_panel.get(a).get(3) %></td>
//                                                <%
//                                            }
//                                            else if(data_select_panel.get(a).get(3).equals(accepted))
//                                            {
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold"><%//=data_select_panel.get(a).get(3) %></td>
//                                                <%
//                                            }
//                                            else if(data_select_panel.get(a).get(3).equals(rejected))
//                                            {
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center; color: red; font-weight: bold"><%//=data_select_panel.get(a).get(3) %></td>
//                                                <%
//                                            }
//                                            else if(data_select_panel.get(a).get(3).equals(canceled))
//                                            {
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center; color: #ee5f5b;; font-weight: bold"><%//=data_select_panel.get(a).get(3) %></td>
//                                                <%
//                                            }
//                                            
//                                            if(data_select_panel.get(a).get(3).equals(canceled) || data_select_panel.get(a).get(3).equals(rejected))
//                                            {    
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center;"><a href="#modalReinvitePanel<%//=a %>" data-toggle="modal" class="btn btn-default">Re-invite</a></td>
//                                                <%
//                                            }
//                                            else if(data_select_panel.get(a).get(3).equals(sent) || data_select_panel.get(a).get(3).equals(accepted))
//                                            {    
//                                                %>
//                                                <td style="vertical-align: middle; text-align: center;"><a href="#modalCancelPanel<%//=a %>" data-toggle="modal" class="btn btn-danger">Cancel Invitation</a></td>
//                                                <%
//                                            }
//                                            %>
//                                        </tr>-->
                                        <%
//                                    }
                                    %>
                                        <tr>
                                            <td style="vertical-align: middle; text-align: center;">1</td>
                                            <td style="vertical-align: middle">Panel's Name 1</td>
                                            <td style="vertical-align: middle">Panel's 1 Grade</td>
                                            <td style="vertical-align: middle">Panel's 1 Position</td>
                                            <td style="vertical-align: middle">Panel's 1 PTJ</td>
                                            <td style="vertical-align: middle; text-align: center;">PANEL</td>
                                            <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold">SET</td>
                                            <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman" class="btn btn-danger disabled">Cancel Invitation</a></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: middle; text-align: center;">2</td>
                                            <td style="vertical-align: middle">Panel's Name 2</td>
                                            <td style="vertical-align: middle">Panel's 2 Grade</td>
                                            <td style="vertical-align: middle">Panel's 2 Position</td>
                                            <td style="vertical-align: middle">Panel's 2 PTJ</td>
                                            <td style="vertical-align: middle; text-align: center;">PANEL</td>
                                            <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold">SET</td>
                                            <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman" class="btn btn-danger disabled">Cancel Invitation</a></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: middle; text-align: center;">3</td>
                                            <td style="vertical-align: middle">Panel's Name 3</td>
                                            <td style="vertical-align: middle">Panel's 3 Grade</td>
                                            <td style="vertical-align: middle">Panel's 3 Position</td>
                                            <td style="vertical-align: middle">Panel's 3 PTJ</td>
                                            <td style="vertical-align: middle; text-align: center;">PANEL</td>
                                            <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold">SET</td>
                                            <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman" class="btn btn-danger disabled">Cancel Invitation</a></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: middle; text-align: center;">4</td>
                                            <td style="vertical-align: middle">Panel's Name 4</td>
                                            <td style="vertical-align: middle">Panel's 4 Grade</td>
                                            <td style="vertical-align: middle">Panel's 4 Position</td>
                                            <td style="vertical-align: middle">Panel's 4 PTJ</td>
                                            <td style="vertical-align: middle; text-align: center;">PANEL</td>
                                            <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold">SET</td>
                                            <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman" class="btn btn-danger disabled">Cancel Invitation</a></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: middle; text-align: center;">5</td>
                                            <td style="vertical-align: middle">Panel's Name 5</td>
                                            <td style="vertical-align: middle">Panel's 5 Grade</td>
                                            <td style="vertical-align: middle">Panel's 5 Position</td>
                                            <td style="vertical-align: middle">Panel's 5 PTJ</td>
                                            <td style="vertical-align: middle; text-align: center;">PANEL</td>
                                            <td style="vertical-align: middle; text-align: center; color: orange; font-weight: bold">SET</td>
                                            <td style="vertical-align: middle; text-align: center;"><a data-toggle="modal" href="#modalCancelChairman" class="btn btn-danger disabled">Cancel Invitation</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
//        }
//        else
//        {
//        }
        %>
        </form>
    </div>
</div>

<!-- Modal Invite New Chairman-->
<div id="modalInviteNewChairman" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="process/bpsm/eInterview/e_int_new_chairman.jsp" method="post">
        <input name="pph_refid" type="hidden" value="<%//=pph_refid %>">
        <input name="ic_refid" type="hidden" value="<%//=ic_refid %>">  
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <table class="table-condensed" width="100%">
                        <tr>
                            <td style="font-weight: bold; vertical-align: middle" width="20%">Chairman</td>
                            <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                            <td style="vertical-align: middle">
                                <select name="new_chairman" class="form-control">
                                <%
//                                boolean yes_chairman = false;
//                                int count_list2 = 0;
//                                for(int a = 0; a < data_select_user.size(); a++)
//                                {
//                                    for(int b = 0; b < data_select_chairman.size(); b++)
//                                    {
//                                        if(data_select_chairman.get(b).get(0).equals(data_select_user.get(a).get(0)))
//                                        {
//                                            yes_chairman = true;
//                                        }
//                                    }
//                                    if(!yes_chairman)
//                                    {
                                        %>
<!--                                        <option value="<%//=data_select_user.get(a).get(0)%>"><%//=data_select_user.get(a).get(1)%> ( <%//=data_select_user.get(a).get(2)%> )</option>-->
                                        <%
//                                        count_list2++;
//                                    }
//                                    yes_chairman = false;
//                                }
                                %>
                                    <option value="">Name 1 (Grade1-Position1 : PTJName 1)</option>
                                    <option value="">Name 2 (Grade2-Position2 : PTJName 2)</option>
                                    <option value="">Name 3 (Grade3-Position3 : PTJName 3)</option>
                                    <option value="">Name 4 (Grade4-Position4 : PTJName 4)</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div class="modal-footer">
                <%
//                if(count_list2 > 0)
//                {
                    %>
<!--                    <button class="btn btn-default form-control" type="submit">INVITE</button>
                    <%
//                }
//                else
//                {
                    %>
                    <button class="btn btn-default form-control disabled" type="submit">INVITE</button>-->
                    <%
//                }
                %>
                <button class="btn btn-default form-control">INVITE</button>
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
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->

<!---- Modal Cancel  Chairman---->
<%
//if(data_select_chairman.size() > 0)
//{
//    for(int a = 0; a < data_select_chairman.size(); a++)
//    {
        %>
        <div id="modalCancelChairman<%//=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/bpsm/eInterview/e_int_cancel_chairman.jsp" method="post">
                <input name="pph_refid" type="hidden" value="<//%=pph_refid %>">
                <input name="ic_refid" type="hidden" value="<%//=ic_refid %>">
                <input name="u_refid" type="hidden" value="<%//=data_select_chairman.get(a).get(0) %>">
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
                
        <div id="modalReinviteChairman<%//=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/bpsm/eInterview/e_int_reinvite_chairman.jsp" method="post">
                <input name="pph_refid" type="hidden" value="<%//=pph_refid %>">
                <input name="ic_refid" type="hidden" value="<%//=ic_refid %>">
                <input name="u_refid" type="hidden" value="<%//=data_select_chairman.get(a).get(0) %>">
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
//    }
//}
%>
<!-- End Modal Cancel Chairman -->
<!---- Modal Cancel  Panel---->
<%
//if(data_select_panel.size() > 0)
//{
//    for(int a = 0; a < data_select_panel.size(); a++)
//    {
        %>
        <div id="modalCancelPanel<%//=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/bpsm/eInterview/e_int_cancel_panel.jsp" method="post">
                <input name="pph_refid" type="hidden" value="<%//=pph_refid %>">
                <input name="ic_refid" type="hidden" value="<%//=ic_refid %>">
                <input name="u_refid" type="hidden" value="<%//=data_select_panel.get(a).get(0) %>">
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
                
        <div id="modalReinvitePanel<%//=a %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/bpsm/eInterview/e_int_reinvite_panel.jsp" method="post">
                <input name="pph_refid" type="hidden" value="<%//=pph_refid %>">
                <input name="ic_refid" type="hidden" value="<%//=ic_refid %>">
                <input name="u_refid" type="hidden" value="<%//=data_select_panel.get(a).get(0) %>">
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
//    }
//}
%>
<!-- End Modal Cancel Panel -->
<!-- Modal Invite New Panel-->
<div id="modalInviteNewPanel" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="process/bpsm/eInterview/e_int_new_panel.jsp" method="post">
        <input name="pph_refid" type="hidden" value="<%//=pph_refid %>">
        <input name="ic_refid" type="hidden" value="<%//=ic_refid %>">  
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <table class="table-condensed" width="100%">
                        <tr>
                            <td style="font-weight: bold; vertical-align: middle" width="20%">Chairman</td>
                            <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                            <td style="vertical-align: middle">
                                <select name="new_panel" class="form-control">
                                <%
//                                boolean yes_panel = false;
//                                int count_list = 0;
//                                for(int a = 0; a < data_select_user.size(); a++)
//                                {
//                                    for(int b = 0; b < data_select_panel.size(); b++)
//                                    {
//                                        if(data_select_panel.get(b).get(0).equals(data_select_user.get(a).get(0)))
//                                        {
//                                            yes_panel = true;
//                                        }
//                                    }
//                                    
//                                    if(!yes_panel)
//                                    {
                                        %>
<!--                                        <option value="<%//=data_select_user.get(a).get(0)%>"><%//=data_select_user.get(a).get(1)%> ( <%//=data_select_user.get(a).get(2)%> )</option>-->
                                        <%
//                                        count_list++;
//                                    }
//                                    yes_panel = false;
//                                }
                                %>
                                    <option value="">Name 1 (Grade1-Position1 : PTJName 1)</option>
                                    <option value="">Name 2 (Grade2-Position2 : PTJName 2)</option>
                                    <option value="">Name 3 (Grade3-Position3 : PTJName 3)</option>
                                    <option value="">Name 4 (Grade4-Position4 : PTJName 4)</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div class="modal-footer">
                <%
//                if(count_list > 0)
//                {
                    %>
<!--                    <button class="btn btn-default form-control" type="submit">INVITE</button>
                    <%
//                }
//                else
//                {
                    %>
                    <button class="btn btn-default form-control disabled" type="submit">INVITE</button>-->
                    <%
//                }
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