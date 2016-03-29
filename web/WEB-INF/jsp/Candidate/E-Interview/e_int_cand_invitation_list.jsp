<%-- 
    Document   : e_int_my_invitation_list
    Created on : Feb 13, 2016, 12:26:38 PM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="libraries.My_func"%>
<%@page import="controller.Session"%>
<%@page import="config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
MainClient mc = new MainClient(DBConn.getHost());

String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();

String cand_set = "2";
String cand_sent = "21";
String cand_accepted = "22";
String cand_rejected = "23";
String ptj_accepted = "11";
String is_type_ptj = "PTJ";
String is_type_uni = "UNIVERSITY";

String sql_uni_invitation_list  = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, pph.pph_refid, pph.pph_position, pa.pa_refid, irm.irm_refid, irm.irm_cand_status, iis.iis_desc "
                                + "FROM login1 l, candidate c, pos_applied pa, interview_result_mark irm, position_ptj_hr pph, interview_setup iss, interview_invite_status iis "
                                + "WHERE c.c_refid = l.c_refid "
                                + "AND c.c_refid = pa.c_refid "
                                + "AND pph.pph_refid = pa.pph_refid "
                                + "AND pa.pa_refid = irm.pa_refid "
                                + "AND iss.is_refid = irm.is_refid "
                                + "AND iis.iis_code = irm.irm_cand_status "
                                + "AND iss.is_type = ? "
                                + "AND irm.irm_ptj_status = ? "
                                + "AND irm.irm_cand_status != ? "
                                + "AND l.l_refid = ?";
String param_uni_invitation_list[] = { is_type_uni, ptj_accepted, cand_set, l_refid };
ArrayList<ArrayList<String>> data_uni_invitation_list = mc.getQuery(sql_uni_invitation_list, param_uni_invitation_list);

String sql_pre_invitation_list = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, pa.pa_refid, irm.irm_refid, irm.irm_cand_status "
                            + "FROM login1 l, candidate c, pos_applied pa, interview_result_mark irm, position_ptj_hr pph, interview_setup iss "
                            + "WHERE c.c_refid = l.c_refid "
                            + "AND c.c_refid = pa.c_refid "
                            + "AND pph.pph_refid = pa.pph_refid "
                            + "AND pa.pa_refid = irm.pa_refid "
                            + "AND iss.is_refid = irm.is_refid "
                            + "AND iss.is_type = ? "
                            + "AND pph.pph_refid = ? "
                            + "AND l.l_refid = ? ";
String[] param_pre_invitation_list = new String[3];
ArrayList<ArrayList<String>> data_pre_invitation_list = mc.getQuery(sql_pre_invitation_list, param_pre_invitation_list);
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
<!--        <div class="row">
            <ul class="nav nav-tabs">
              <li class="active"><a>INTERVIEW MEMO</a></li>
              <li><a href="#">SAVED PRE-INTERVIEW SETUP</a></li>
              <li><a href="#">MY INVITATION</a></li>
            </ul>
        </div>-->
        <div class="row">
            <table class="table-bordered" id="memoList" width="100%">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Start</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">End</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Venue</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Level</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_uni_invitation_list.size(); a++)
                {
                    param_pre_invitation_list[0] = is_type_ptj;
                    param_pre_invitation_list[1] = data_uni_invitation_list.get(a).get(6);
                    param_pre_invitation_list[2] = l_refid;
                    data_pre_invitation_list = mc.getQuery(sql_pre_invitation_list, param_pre_invitation_list);
                    %>
                    <tr>
                        <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_pre_invitation_list.get(0).get(7) %></td>
                        <td style="vertical-align: middle"><a href="process.jsp?<%=My_func.URL_KEY %>=Public/e-publish.jsp&pph_refid=<%=data_pre_invitation_list.get(0).get(6)%>&prev_url=Candidate/E-Interview/e_int_cand_invitation_list.jsp"><%=data_pre_invitation_list.get(0).get(8) %></a></td>
                        <td style="vertical-align: middle"><%=data_pre_invitation_list.get(0).get(9) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=Func.getDate(data_pre_invitation_list.get(0).get(1)) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_pre_invitation_list.get(0).get(2) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_pre_invitation_list.get(0).get(3) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_pre_invitation_list.get(0).get(4) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_pre_invitation_list.get(0).get(5) %></td>
                        
                        <%
                        if(data_uni_invitation_list.get(a).get(10).equals(cand_sent))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold; color: #0055cc">
                                <div class="btn-group">
                                    <a class="btn btn-default dropdown-toggle form-control" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Action <span class="glyphicon glyphicon-menu-down"></span>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item btn btn-primary form-control" href="#modalAcceptInterview<%=a %>" data-toggle="modal">Accept</a>
                                        <a class="dropdown-item btn btn-danger form-control" href="#modalRejectInterview<%=a %>" data-toggle="modal">Reject</a>
                                    </div>
                                </div>
                            </td>
                            <%
                        }
                        else if(data_uni_invitation_list.get(a).get(10).equals(cand_accepted))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold; color: limegreen">
                                <%=data_uni_invitation_list.get(a).get(11) %>
                            </td>
                            <%
                        }
                        else if(data_uni_invitation_list.get(a).get(10).equals(cand_rejected))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold; color: red">
                                <%=data_uni_invitation_list.get(a).get(11) %>
                            </td>
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
    </div>
</div>
                
<%
for(int a = 0; a < data_uni_invitation_list.size(); a++)
{
    param_pre_invitation_list[0] = is_type_ptj;
    param_pre_invitation_list[1] = data_uni_invitation_list.get(a).get(6);
    param_pre_invitation_list[2] = l_refid;
    data_pre_invitation_list = mc.getQuery(sql_pre_invitation_list, param_pre_invitation_list);
    %>
    <!-- Modal Accept -->
    <form method="post" action="process/candidate/eInterview/e_int_cand_accept_process.jsp">
    <input name="irm_refid" type="hidden" value="<%=data_uni_invitation_list.get(a).get(9) %>" />
    <input name="irm_refid" type="hidden" value="<%=data_pre_invitation_list.get(a).get(11) %>" />
    <div id="modalAcceptInterview<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <h4 class="modal-title" style="font-weight: bold">ACCEPT</h4>
                </div>
                <div class="modal-body" align="center">
                    <fieldset>
                        <h4>ACCEPT THIS INVITATION ?</h4>
                    </fieldset>
                </div>
                <div class="modal-footer" align="center">
                    <button class="btn btn-primary form-control" type="submit"><span style="color: white">SUBMIT</span></button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- End modal pre -->
    
    <!-- Modal Reject -->
    <form method="post" action="process/candidate/eInterview/e_int_cand_accept_process.jsp">
    <input name="irm_refid" type="hidden" value="<%=data_uni_invitation_list.get(a).get(9) %>" />
    <input name="irm_refid" type="hidden" value="<%=data_pre_invitation_list.get(a).get(11) %>" />
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
                        <textarea class="form-control" placeholder="State The Reason Of Rejection" required></textarea>
                    </fieldset>
                </div>
                <div class="modal-footer" align="center">
                    <button class="btn btn-danger form-control" type="submit"><span style="color: white">SUBMIT</span></button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- End modal pre -->
    <%
}
%>
<script type="text/javascript">
$(document).ready(function()
{
    $('#memoList').DataTable();
});
</script>
