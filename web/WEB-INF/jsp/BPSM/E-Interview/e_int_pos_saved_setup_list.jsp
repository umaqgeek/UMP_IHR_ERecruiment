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
String is_type = "UNIVERSITY";
String sql_saved_list = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type "
                    + "FROM interview_setup iss";
String param_saved_list[] = {};
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
                        <th colspan="3" style="vertical-align: middle; text-align: center; font-weight: bold">Action</th>
                    </tr>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Venue</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Details</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="5%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Approval Status</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Interviews Setup</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Invite Candidate</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Publish</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_saved_list.size(); a++)
                {
                    param_interview_pos_list[0] = data_saved_list.get(a).get(0);
                    data_interview_pos_list = mc.getQuery(sql_interview_pos_list, param_interview_pos_list);
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
                            <td style="vertical-align: middle"><a style="color: limegreen; font-weight: bold"><%=data_interview_pos_list.get(0).get(4) %></a></td>
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
                            <a class="btn btn-default form-control" href="process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&is_refid=<%=data_saved_list.get(a).get(0) %>">General</a>
                            <a class="btn btn-default form-control" href="process.jsp?p=BPSM/E-Interview/e_int_question_setup.jsp&is_refid=<%=data_saved_list.get(a).get(0) %>">Question</a>
                        </td>
<!--                        <td rowspan="3" style="vertical-align: middle; text-align: center"><a class="btn btn-warning form-control" href="#modalDetail" data-toggle="modal">Detail</a></td>-->
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center"><a class="btn btn-warning form-control disabled" href="#modalInviteCandidate" data-toggle="modal">Invite</a></td>
                        <td rowspan="<%=data_interview_pos_list.size() %>" style="vertical-align: middle; text-align: center"><a class="btn btn-primary form-control disabled" href="#modalPublish" data-toggle="modal">Publish</a></td>
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
                                <td style="vertical-align: middle"><a style="color: limegreen; font-weight: bold"><%=data_interview_pos_list.get(b).get(4) %></a></td>
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
                
<!--        <div class="row">
            <div class="col-sm-12"><h4>SAVED INTERVIEW LIST</h4></div>
            <%
//            MainClient mc = new MainClient(DBConn.getHost());
//            String pre_interview = "UNIVERSITY";
//            String sql_select_int = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, PPH.PPH_PTJ, PPH.PPH_REFID, "
//                    + "IC.IC_STARTTIME, IC.IC_ENDTIME, IC.IC_VENUE, IC.IC_TYPE "
//                    + "FROM INTERVIEW_CHAIRMAN IC, INTERVIEW_RESULT IR, POS_APPLIED PA, POSITION_PTJ_HR PPH "
//                    + "WHERE IC.IC_REFID = IR.IC_REFID "
//                    + "AND PA.PA_REFID = IR.PA_REFID "
//                    + "AND PPH.PPH_REFID = PA.PPH_REFID "
//                    + "AND IC.IC_TYPE = ? "
//                    + "GROUP BY PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, PPH.PPH_PTJ, PPH.PPH_REFID, "
//                    + "IC.IC_STARTTIME, IC.IC_ENDTIME, IC.IC_VENUE, IC.IC_TYPE";
//            String param_select_int[] = { pre_interview };
//            ArrayList<ArrayList<String>> data_select_int = mc.getQuery(sql_select_int, param_select_int);
            %>
            <table id="intList" class="table-bordered" width="100%">
                <thead>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="5%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Start</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">End</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Venue</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Interview Stage</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Interviews Committee</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Detail</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Publish</th>
                    </tr>
                </thead>
                <tbody>
                <%

//                if(data_select_int.size() > 0)
//                {
//                    String sql_count_pa = "SELECT COUNT(IR.IR_REFID) "
//                                            + "FROM INTERVIEW_RESULT IR "
//                                            + "WHERE IR.IC_REFID = ? ";
//                    String[] param_count_pa = new String[1];
//                    ArrayList<ArrayList<String>> data_count_pa;
//                    int a, b, total;
//                    for(int row=0; row < data_select_int.size(); row++)
//                    {
//                        param_count_pa[0] = data_select_int.get(row).get(2);
//                        data_count_pa = mc.getQuery(sql_count_pa, param_count_pa);
                        %>
                        <tr>
                            <td style="vertical-align: middle; text-align: center"><%//=row+1 %></td>
                            <td style="vertical-align: middle"><%//=data_select_int.get(row).get(0) %></td>
                            <td style="vertical-align: middle"><%//=data_select_int.get(row).get(1) %></td>
                            <td style="vertical-align: middle"><%//=data_select_int.get(row).get(4) %></td>
                            <td style="vertical-align: middle; text-align: center"><%//=data_select_int.get(row).get(3) %></td>
                            <td style="vertical-align: middle; text-align: center"><%//=data_select_int.get(row).get(6) %></td>
                            <td style="vertical-align: middle; text-align: center"><%//=data_select_int.get(row).get(7) %></td>
                            <td style="vertical-align: middle; text-align: center"><%//=data_select_int.get(row).get(8) %></td>
                            <td style="vertical-align: middle; text-align: center"><%//=data_select_int.get(row).get(9) %></td>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-default form-control" href="process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid=<%//=data_select_int.get(row).get(5) %>&ic_refid=<%//=data_select_int.get(row).get(2) %>&alert=0">Invite</a></td>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-warning form-control" href="#modalDetail<%//=row %>" data-toggle="modal">Detail</a></td>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-success form-control disabled" href="#modalDetail<%//=row %>" data-toggle="modal">Publish</a></td>
                        </tr>
                        <%
//                    }
//                }
                %>
                </tbody>
            </table>
        </div>-->
    </div>
</div>
                
                <!-- Modal Detail -->
<%
//if(data_select_int.size() > 0)
//{
//    String sql_count_pa = "SELECT COUNT(IR.IR_REFID) "
//                            + "FROM INTERVIEW_RESULT IR "
//                            + "WHERE IR.IC_REFID = ? ";
//    String[] param_count_pa = new String[1];
//    ArrayList<ArrayList<String>> data_count_pa;
//    int a, b, total;
//    for(int row=0; row < data_select_int.size(); row++)
//    {
//        param_count_pa[0] = data_select_int.get(row).get(2);
//        data_count_pa = mc.getQuery(sql_count_pa, param_count_pa);
        %>
        <div id="modalDetail" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="" method="post">
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <h4 class="modal-title">Set Interview Chairman</h4>
                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-md-3">Interview</label><label class="col-md-1">:</label>
                                <label class="col-md-8">sfsdf</label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Grade</label><label class="col-md-1">:</label>
                                <label class="col-md-8">sdfsdf</label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Position</label><label class="col-md-1">:</label>
                                <label class="col-md-8">sdfsd</label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Date</label><label class="col-md-1">:</label>
                                <label class="col-md-8">sdfsdf
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Venue</label><label class="col-md-1">:</label>
                                <label class="col-md-8">sdfdsf</label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Total Interviewee</label><label class="col-md-1">:</label>
                                <label class="col-md-8">dsfsdfdsfsdf</label>
                            </div>
                        </fieldset>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <%
//    }
//}
%>

<%
//if(data_select_int.size() > 0)
//{
//    String sql_count_pa = "SELECT COUNT(IR.IR_REFID) "
//                            + "FROM INTERVIEW_RESULT IR "
//                            + "WHERE IR.IC_REFID = ? ";
//    String[] param_count_pa = new String[1];
//    ArrayList<ArrayList<String>> data_count_pa;
//    int a, b, total;
//    for(int row=0; row < data_select_int.size(); row++)
//    {
//        param_count_pa[0] = data_select_int.get(row).get(2);
//        data_count_pa = mc.getQuery(sql_count_pa, param_count_pa);
        %>
<!--        <div id="modalDetail<%//=row %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                 Modal content
                <form action="" method="post">
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <h4 class="modal-title">Set Interview Chairman</h4>
                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-md-3">Interview</label><label class="col-md-1">:</label>
                                <label class="col-md-8">INTERVIEW <%//=row+1 %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Grade</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%//=data_select_int.get(row).get(0) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Position</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%//=data_select_int.get(row).get(1) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Date</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%//=data_select_int.get(row).get(3) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Venue</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%//=data_select_int.get(row).get(4) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Total Interviewee</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%//=data_count_pa.get(0).get(0) %></label>
                            </div>
                        </fieldset>
                    </div>
                </div>
                </form>
            </div>
        </div>-->
        <%
//    }
//}
%>
<!-- End modal set chairman -->
<!-- Modal Reason -->
<%

for(int a = 0; a < data_saved_list.size(); a++)
{
    param_interview_pos_list[0] = data_saved_list.get(a).get(0);
    data_interview_pos_list = mc.getQuery(sql_interview_pos_list, param_interview_pos_list);
    for(int b = 0; b < data_interview_pos_list.size(); b++)
    {
        %>
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
        <%
    }
}
%>
<!-- End modal reason -->
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