<%-- 
    Document   : e_int_pos_list
    Created on : Jan 28, 2016, 4:38:16 PM
    Author     : Habib
--%>
<%@page import="controller.Session"%>
<%@page import="config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
              <li class="active"><a>PUBLISHED INTERVIEW</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_to_setup_list.jsp">POSITION READY TO SETUP</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">SAVED SETUP INTERVIEW</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">MY INVITATION</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_criteria_bank.jsp">CRITERIA BANK</a></li>
            </ul>
        </div>
        
        <div class="row">
            <div class="col-sm-12"><h4>PUBLISHED INTERVIEW LIST</h4></div>
            <table class="table-bordered" id="publishedList" width="100%">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th colspan="5" style="vertical-align: middle; text-align: center; font-weight: bold">PRE-INTERVIEW</th>
                        <th colspan="3" style="vertical-align: middle; text-align: center; font-weight: bold">INTERVIEW</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                    </tr>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Details</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Status</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Start</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">End</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle; text-align: center">Grade-1</td>
                        <td style="vertical-align: middle; text-align: center">Position 1</td>
                        <td style="vertical-align: middle; text-align: center">PTJ 1</td>
                        <td style="vertical-align: middle; text-align: center"><a href="#modalPreInterviewDetail" data-toggle="modal" class="btn btn-warning">Details</a></td>
                        <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_pre_interview_result.jsp" style="color: limegreen; font-weight: bold">RESULT</a></td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">15/02/2016</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">2:00PM</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">5:00PM</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center; font-weight: bold; color: #0055cc">LIVE</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Grade-2</td>
                        <td style="vertical-align: middle; text-align: center">Position 2</td>
                        <td style="vertical-align: middle; text-align: center">PTJ 2</td>
                        <td style="vertical-align: middle; text-align: center"><a href="#modalPreInterviewDetail" data-toggle="modal" class="btn btn-warning">Details</a></td>
                        <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_pre_interview_result.jsp" style="color: limegreen; font-weight: bold">RESULT</a></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Grade-3</td>
                        <td style="vertical-align: middle; text-align: center">Position 3</td>
                        <td style="vertical-align: middle; text-align: center">PTJ 3</td>
                        <td style="vertical-align: middle; text-align: center"><a href="#modalPreInterviewDetail" data-toggle="modal" class="btn btn-warning">Details</a></td>
                        <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_pre_interview_result.jsp" style="color: limegreen; font-weight: bold">RESULT</a></td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">2</td>
                        <td style="vertical-align: middle; text-align: center">Grade-1</td>
                        <td style="vertical-align: middle; text-align: center">Position 1</td>
                        <td style="vertical-align: middle; text-align: center">PTJ 1</td>
                        <td style="vertical-align: middle; text-align: center"><a href="#modalPreInterviewDetail" data-toggle="modal" class="btn btn-warning">Details</a></td>
                        <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_pre_interview_result.jsp" style="color: limegreen; font-weight: bold">RESULT</a></td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">15/02/2016</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">2:00PM</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center">5:00PM</td>
                        <td rowspan="3" style="vertical-align: middle; text-align: center"><a href="modalViewResultU" data-toggle="modal" style="color: limegreen; font-weight: bold">RESULT</a></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Grade-2</td>
                        <td style="vertical-align: middle; text-align: center">Position 2</td>
                        <td style="vertical-align: middle; text-align: center">PTJ 2</td>
                        <td style="vertical-align: middle; text-align: center"><a href="#modalPreInterviewDetail" data-toggle="modal" class="btn btn-warning">Details</a></td>
                        <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_pre_interview_result.jsp" style="color: limegreen; font-weight: bold">RESULT</a></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Grade-3</td>
                        <td style="vertical-align: middle; text-align: center">Position 3</td>
                        <td style="vertical-align: middle; text-align: center">PTJ 3</td>
                        <td style="vertical-align: middle; text-align: center"><a href="#modalPreInterviewDetail" data-toggle="modal" class="btn btn-warning">Details</a></td>
                        <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_pre_interview_result.jsp" style="color: limegreen; font-weight: bold">RESULT</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Pre Interview Detail -->
<div id="modalPreInterviewDetail" class="modal fade" role="dialog">
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
                                <td style="vertical-align: middle">Grade 1</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Position</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">Position 1</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">PTJ</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">PTJ 1</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Date</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">20/02/2016</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Start</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">8:00 PM</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">End</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">11:00 PM</td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Venue</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle">PTJ 1 BUILDING</td>
                             </tr>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<!-- End modal pre -->
<script type="text/javascript">
$(document).ready(function()
{
    $('#publishedList').DataTable();
});
</script>