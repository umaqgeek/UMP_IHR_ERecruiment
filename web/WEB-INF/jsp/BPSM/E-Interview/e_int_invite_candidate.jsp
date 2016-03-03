<%-- 
    Document   : e_int_invite_candidate
    Created on : Feb 5, 2016, 11:05:48 AM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayDeque"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
//boolean informed_exist;
//
String is_type = "UNIVERSITY";
String filter_pass_ptj  = "PASS_PTJ";
String rejected = "12";
String accepted = "11";
String informed = "1";
String cand_set = "2";
String cand_sent = "21";
String cand_accepted = "22";
String cand_rejected = "23";
//String sql_saved_list = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type "
//                    + "FROM interview_setup iss "
//                    + "WHERE iss.is_type = ? ";
//String param_saved_list[] = { is_type };
//ArrayList<ArrayList<String>> data_saved_list = mc.getQuery(sql_saved_list, param_saved_list);
//out.print(data_saved_list);
String is_refid = session.getAttribute("is_refid").toString();
String sql_interview_pos_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status, irm.irm_reason "
                            +"FROM interview_setup iss, interview_result_mark irm, pos_applied pa, position_ptj_hr pph, interview_invite_status iis "
                            +"WHERE iss.is_refid = irm.is_refid "
                            +"AND pa.pa_refid = irm.pa_refid "
                            +"AND pph.pph_refid = pa.pph_refid "
                            +"AND iis.iis_code = irm.irm_ptj_status "
                            +"AND iss.is_refid = ? "
                            +"AND irm.irm_ptj_status = ? "
                            +"GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status, irm.irm_reason";
String[] param_interview_pos_list = { is_refid, accepted };
ArrayList<ArrayList<String>> data_interview_pos_list = mc.getQuery(sql_interview_pos_list, param_interview_pos_list);

String sql_candidate_list = "SELECT c.c_name, l.l_icno, irm.irm_refid, irm.irm_cand_status, iis.iis_desc, iss.is_refid, pa.pa_refid "
                        + "FROM candidate c, login1 l, pos_applied pa, position_ptj_hr pph, filter f, interview_result_mark irm, interview_setup iss, interview_invite_status iis "
                        + "WHERE c.c_refid = pa.c_refid "
                        + "AND pph.pph_refid = pa.pph_refid "
                        + "AND pa.pa_refid = f.pa_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND iss.is_refid = irm.is_refid "
                        + "AND c.c_refid = l.c_refid "
                        + "AND iis.iis_code = irm.irm_cand_status "
                        + "AND iss.is_type = ? "
                        + "AND irm.irm_ptj_status = ? "
                        + "AND f.f_ptj_status = ? "
                        + "AND pph.pph_refid = ? "
                        + "ORDER BY c.c_name";
String[] param_candidate_list = new String[4];
param_candidate_list[0] = is_type;
param_candidate_list[1] = accepted;
param_candidate_list[2] = filter_pass_ptj;
ArrayList<ArrayList<String>> data_candidate_list;
//String is_type_ptj = "PTJ";
//String sql_preinterview_detail  = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type "
//                                + "FROM interview_setup iss, interview_result_mark irm, position_ptj_hr pph, pos_applied pa "
//                                + "WHERE pph.pph_refid = pa.pph_refid "
//                                + "AND pa.pa_refid = irm.pa_refid "
//                                + "AND iss.is_refid = irm.is_refid "
//                                + "AND iss.is_type = ? "
//                                + "AND pph.pph_refid = ? "
//                                + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type";
//String[] param_preinterview_detail = new String[2];
//ArrayList<ArrayList<String>> data_preinterview_detail;
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <div class="col-sm-12"><h4>INVITE CANDIDATE</h4></div>
        </div>
        <form method="post" action="process/bpsm/eInterview/e_int_invite_candidate_process.jsp">
        <div class="row">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab">
                        <h4 class="panel-title">
                            SHORTLISTED CANDIDATE TO PRE-INTERVIEW
                        </h4>
                    </div>
                    <div class="panel-body">              
                        <div class="row">
                            <table class="table-bordered" style="width: 100%; font-size: smaller">
                                <thead style="vertical-align: middle;">
                                <tr style="vertical-align: middle;">
                                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="7%">Grade</th>
                                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">Position</th>
                                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">PTJ</th>
                                    <th colspan="3" style="vertical-align: middle; text-align: center; font-weight: bold">Candidate</th>
                                </tr>
                                <tr style="vertical-align: middle;">
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">Name</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">IC Number</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                for(int a = 0; a < data_interview_pos_list.size(); a++)
                                {
                                    param_candidate_list[3] = data_interview_pos_list.get(a).get(0);
                                    data_candidate_list = mc.getQuery(sql_candidate_list, param_candidate_list);
                                    %>
                                    <tr>
                                        <td rowspan="<%=data_candidate_list.size() %>" style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                                        <td rowspan="<%=data_candidate_list.size() %>" style="vertical-align: middle; text-align: center"><%=data_interview_pos_list.get(a).get(1) %></td>
                                        <td rowspan="<%=data_candidate_list.size() %>" style="vertical-align: middle"><%=data_interview_pos_list.get(a).get(2) %></td>
                                        <td rowspan="<%=data_candidate_list.size() %>" style="vertical-align: middle"><%=data_interview_pos_list.get(a).get(3) %></td>
                                        <td style="vertical-align: middle;"><%=data_candidate_list.get(0).get(0) %></td>
                                        <td style="vertical-align: middle; text-align: center"><a><%=data_candidate_list.get(0).get(1) %></a></td>
                                        <%
                                        if(data_candidate_list.get(0).get(3).equals(cand_accepted))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center"><a style="color: limegreen; font-weight: bold"><%=data_candidate_list.get(0).get(4) %></a></td>
                                            <%
                                        }
                                        else if(data_candidate_list.get(0).get(3).equals(cand_rejected))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalReason" style="color: red; font-weight: bold"><%=data_candidate_list.get(0).get(4) %></a></td>
                                            <%
                                        }
                                        else if(data_candidate_list.get(0).get(3).equals(cand_sent))
                                        {
                                            %>
                                            <td style="vertical-align: middle; color: orange; font-weight: bold; text-align: center"><%=data_candidate_list.get(0).get(4) %></td>
                                            <%
                                        }
                                        else if(data_candidate_list.get(0).get(3).equals(cand_set))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold"><%=data_candidate_list.get(0).get(4) %></td>
                                            <%
                                        }
                                        %>
                                    </tr>
                                    <%
                                    for(int b = 1; b < data_candidate_list.size(); b++)
                                    {
                                        %>
                                        <td style="vertical-align: middle;"><%=data_candidate_list.get(b).get(0) %></td>
                                        <td style="vertical-align: middle; text-align: center"><a><%=data_candidate_list.get(b).get(1) %></a></td>
                                        <%
                                        if(data_candidate_list.get(b).get(3).equals(cand_accepted))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center"><a style="color: limegreen; font-weight: bold"><%=data_candidate_list.get(b).get(4) %></a></td>
                                            <%
                                        }
                                        else if(data_candidate_list.get(b).get(3).equals(cand_rejected))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalReason" style="color: red; font-weight: bold"><%=data_candidate_list.get(b).get(4) %></a></td>
                                            <%
                                        }
                                        else if(data_candidate_list.get(b).get(3).equals(cand_sent))
                                        {
                                            %>
                                            <td style="vertical-align: middle; color: orange; font-weight: bold; text-align: center"><%=data_candidate_list.get(b).get(4) %></td>
                                            <%
                                        }
                                        else if(data_candidate_list.get(b).get(3).equals(cand_set))
                                        {
                                            %>
                                            <td style="vertical-align: middle; text-align: center; font-weight: bold"><%=data_candidate_list.get(b).get(4) %></td>
                                            <%
                                        }
                                    }
                                }
                                %>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <button type="submit" class="btn btn-warning form-control disabled"><span style="color: white">Invite Candidate</span></button><br/>
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
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<!-- Modal Reason -->
<div id="modalReason" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4 class="modal-title">REJECT REASON</h4>
            </div>
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title">Not available on that date</h4>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<!-- End modal reason -->
