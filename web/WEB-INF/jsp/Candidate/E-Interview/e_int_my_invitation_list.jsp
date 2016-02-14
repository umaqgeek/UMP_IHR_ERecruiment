<%-- 
    Document   : e_int_my_invitation_list
    Created on : Feb 13, 2016, 12:26:38 PM
    Author     : Habib
--%>

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
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
              <li class="active"><a>INTERVIEW MEMO</a></li>
              <li><a href="#">SAVED PRE-INTERVIEW SETUP</a></li>
              <li><a href="#">MY INVITATION</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-sm-12"><h4>INTERVIEW MEMO LIST</h4></div>
            <table class="table-bordered" id="memoList" width="100%">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th colspan="4" style="vertical-align: middle; text-align: center; font-weight: bold">INTERVIEW (UNIVERSITY LEVEL)</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Grade</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                    </tr>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Start</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">End</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Venue</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle; text-align: center">15/02/2016</td>
                        <td style="vertical-align: middle; text-align: center">2:00PM</td>
                        <td style="vertical-align: middle; text-align: center">5:00PM</td>
                        <td style="vertical-align: middle; text-align: center">HR BUILDING</td>
                        <td style="vertical-align: middle; text-align: center">Grade-1</td>
                        <td style="vertical-align: middle; text-align: center">Position 1</td>
                        <td style="vertical-align: middle; text-align: center">PTJ 1</td>
                        <td style="vertical-align: middle; text-align: center; font-weight: bold; color: #0055cc">
                            <div class="btn-group">
                                <a class="btn btn-default dropdown-toggle form-control" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Action <span class="glyphicon glyphicon-menu-down"></span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item btn btn-primary form-control" href="#">Accept</a>
                                    <a class="dropdown-item btn btn-danger form-control" href="#modalRejectInterview" data-toggle="modal">Reject</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Pre Interview Detail -->
<div id="modalRejectInterview" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4 class="modal-title" style="font-weight: bold">REJECT</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <h6>STATE THE REASON</h6>
                    <textarea class="form-control" placeholder="State Rejection Reason"></textarea>
                </fieldset>
            </div>
            <div class="modal-footer" align="center">
                <a class="btn btn-danger form-control">SUBMIT</a>
            </div>
        </div>
    </div>
</div>
<!-- End modal pre -->
<script type="text/javascript">
$(document).ready(function()
{
    $('#memoList').DataTable();
});
</script>
