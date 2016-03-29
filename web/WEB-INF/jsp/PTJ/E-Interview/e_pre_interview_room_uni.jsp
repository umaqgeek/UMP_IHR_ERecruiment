<%-- 
    Document   : e_pre_interview_room_uni
    Created on : Mar 25, 2016, 11:00:18 PM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
String is_refid = session.getAttribute("is_refid").toString();
String selected_size = session.getAttribute("selected_size").toString();
String ipl_refid = session.getAttribute("ipl_refid").toString();
String pph_refid = session.getAttribute("pph_refid").toString();

int iSelected_size = Integer.parseInt(selected_size);
String[] irm_refid = new String[iSelected_size];

String sql_position_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, dm.dm_dept_desc, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, vpp.vpp_total "
                    + "FROM interview_setup iss, interview_result_mark irm, department_main dm, pos_applied pa, position_ptj_hr pph, vacancy_pos_ptj vpp, vacancy_pos vp "
                    + "WHERE iss.is_refid = irm.is_refid "
                    + "AND pph.pph_refid = vpp.pph_refid "
                    + "AND pa.pa_refid = irm.pa_refid "
                    + "AND pph.pph_refid = pa.pph_refid "
                    + "AND pph.pph_ptj = dm.dm_dept_desc "
                    + "AND iss.is_refid = ? "
                    + "AND pph.pph_refid = ? "
                    + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, dm.dm_dept_desc, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, vpp.vpp_total";
String param_position_list[] = { is_refid, pph_refid };
ArrayList<ArrayList<String>> data_position_list = mc.getQuery(sql_position_list, param_position_list);

for(int a = 0; a < irm_refid.length; a++)
{
    irm_refid[a] = session.getAttribute("selected_irm_refid"+a).toString();
//    out.print(session.getAttribute("selected_irm_refid"+a).toString());
}

//String sql_iii_refid = "SELECT irm.irm_refid "
//                    +"FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii "
//                    +"WHERE iss.is_refid = irm.is_refid "
//                    +"AND irm.irm_refid = iii.irm_refid "
//                    +"AND iss.is_refid = ? ";
//String param_iii_refid[] = { is_refid };
//ArrayList<ArrayList<String>> data_iii_refid = mc.getQuery(sql_iii_refid, param_iii_refid);

String sql_selected_criteria = "SELECT icm.icm_refid, icm.icm_criteria, icm.icm_minmark, icm.icm_maxmark "
            +"FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii, interview_iii_mark iim, interview_criteria_mark icm "
            +"WHERE iss.is_refid = irm.is_refid "
            +"AND irm.irm_refid = iii.irm_refid "
            +"AND iii.iii_refid = iim.iii_refid "
            +"AND icm.icm_refid =iim.icm_refid "
            +"AND iss.is_refid = ? "
            +"GROUP BY icm.icm_refid, icm.icm_criteria, icm.icm_minmark, icm.icm_maxmark";
String param_selected_criteria[] = { is_refid };
ArrayList<ArrayList<String>> data_selected_criteria = mc.getQuery(sql_selected_criteria, param_selected_criteria);

String sql_criteria_each_candidate = "SELECT iii.iii_refid, iim.iim_refid, icm.icm_refid, icm.icm_criteria, icm.icm_minmark, icm.icm_maxmark, iim.iim_mark "
                                + "FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii, interview_iii_mark iim, interview_criteria_mark icm, interview_panel_list ipl "
                                + "WHERE iss.is_refid = irm.is_refid "
                                + "AND irm.irm_refid = iii.irm_refid "
                                + "AND iii.iii_refid = iim.iii_refid "
                                + "AND ipl.ipl_refid = iii.ipl_refid "
                                + "AND icm.icm_refid = iim.icm_refid "
                                + "AND irm.irm_refid = ? "
                                + "AND iss.is_refid = ? "
                                + "AND ipl.ipl_refid = ? "
                                + "AND icm.icm_refid = ? ";
String[] param_criteria_each_candidate = new String[4];
ArrayList<ArrayList<String>> data_criteria_each_candidate;

String sql_candidate_list   = "SELECT pa.pa_refid, c.c_name, l.l_icno, iii.iii_refid, iii.iii_status, iii.iii_reason "
                            + "FROM interview_result_mark irm, pos_applied pa, candidate c, login1 l, interview_irm_icm iii, interview_panel_list ipl "
                            + "WHERE pa.pa_refid = irm.pa_refid "
                            + "AND irm.irm_refid = iii.irm_refid "
                            + "AND ipl.ipl_refid = iii.ipl_refid "
                            + "AND c.c_refid = pa.c_refid "
                            + "AND c.c_refid = l.c_refid "
                            + "AND irm.irm_refid = ? "
                            + "AND ipl.ipl_refid = ? ";
String[] param_candidate_list = new String[2];
ArrayList<ArrayList<String>> data_candidate_list;

int total_criteria = 0;
%>
<form action="process/ptj/eInterview/e_pre_save_mark_process_uni.jsp" method="post">
<input name="is_refid" value="<%=is_refid %>" type="hidden" />
<input name="ipl_refid" value="<%=ipl_refid %>" type="hidden" />
<input name="pph_refid" value="<%=pph_refid %>" type="hidden" />
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row" align="center">
            <h5>MARKING FORM</h5>
            
        <hr/>
        </div>
        <div class="row" style="font-size: small">
            <div class="col-md-6">
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">GRADE</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_position_list.get(0).get(1) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">POSITION</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_position_list.get(0).get(2) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">PTJ</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_position_list.get(0).get(3) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">DATE</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=Func.getDate(data_position_list.get(0).get(4)) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">TIME</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=Func.get12HourTime(data_position_list.get(0).get(5))+" - "+Func.get12HourTime(data_position_list.get(0).get(6)) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">VENUE</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_position_list.get(0).get(7) %></div>
                </div>
            </div>
            <div class="col-md-3">
                <table style="width: 100%; font-size: small; background-color: white" class="table table-bordered">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">JOB STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Isi</td>
                        <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(0).get(8) %></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Kosong</td>
                        <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(0).get(8) %></td>
                    </tr>
                </tbody>
                </table>
            </div>
            <div class="col-md-3">
                <table style="width: 100%; font-size: small; background-color: white" class="table table-bordered">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">SCALE</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="vertical-align: middle; text-align: center; background-color: green">Excellent</td>
                        <td style="vertical-align: middle; text-align: center">9 - 10</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center; background-color: greenyellow">Good</td>
                        <td style="vertical-align: middle; text-align: center">7 - 8</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center; background-color: yellow">Satisfied</td>
                        <td style="vertical-align: middle; text-align: center">5 - 6</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center; background-color: orange">Poor</td>
                        <td style="vertical-align: middle; text-align: center">3 - 4</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center; background-color: red">Very Poor</td>
                        <td style="vertical-align: middle; text-align: center">1 - 2</td>
                    </tr>
                </tbody>
                </table>
            </div>
        </div>
        <br/>
        <div class="row">
            <table style="width: 100%; background-color: white; font-size: x-small" class="table table-bordered">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">NAME</th>
                        <%
                        for(int a = 0; a < data_selected_criteria.size(); a++)
                        {
                            %>
                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 6%"><%=data_selected_criteria.get(a).get(1) %></th>
                            <%
                        }
                        %>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">DECISION</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">REMARK</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a =0; a < irm_refid.length; a++)
                {
                    param_candidate_list[0] = irm_refid[a];
                    param_candidate_list[1] = ipl_refid;
                    data_candidate_list = mc.getQuery(sql_candidate_list, param_candidate_list);
                    %>
                    <input name="iii_refid" type="hidden" value="<%=data_candidate_list.get(0).get(3) %>" />
                     <tr>
                        <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td style="vertical-align: middle"><a><%=data_candidate_list.get(0).get(1) %></a> (<a>?</a>)</td>
                        <%
                        for(int b = 0; b < data_selected_criteria.size(); b++)
                        {
                            param_criteria_each_candidate[0] = irm_refid[a];
                            param_criteria_each_candidate[1] = is_refid;
                            param_criteria_each_candidate[2] = ipl_refid;
                            param_criteria_each_candidate[3] = data_selected_criteria.get(b).get(0);
                            data_criteria_each_candidate = mc.getQuery(sql_criteria_each_candidate, param_criteria_each_candidate);
                            total_criteria++;
//                            out.print(data_criteria_each_candidate.get(0).get(6));
                            %>
                            <input name="iim_refid_<%=data_candidate_list.get(0).get(3) %>" type="hidden" value="<%=data_criteria_each_candidate.get(0).get(1) %>" />
                            <td style="vertical-align: middle; text-align: center">
                                <select onchange="Validate()" id="<%=total_criteria %>" name="<%=data_criteria_each_candidate.get(0).get(1) %>" class="form-control">
                                    <%
                                    if(data_criteria_each_candidate.get(0).get(6) == null)
                                    {
                                        %>
                                        <option selected disabled>-</option>
                                        <%
                                        for(int c = Integer.parseInt(data_criteria_each_candidate.get(0).get(4)); c <= Integer.parseInt(data_criteria_each_candidate.get(0).get(5)); c++)
                                        {
                                            %>
                                            <option value="<%=c %>"><%=c %></option>
                                            <%
                                        }
                                    }
                                    else
                                    {
                                        %>
                                        <option disabled>-</option>
                                        <%
                                        for(int c = Integer.parseInt(data_criteria_each_candidate.get(0).get(4)); c <= Integer.parseInt(data_criteria_each_candidate.get(0).get(5)); c++)
                                        {
                                            if(data_criteria_each_candidate.get(0).get(6).equals(Integer.toString(c)))
                                            {
                                                %>
                                                <option selected value="<%=c %>"><%=c %></option>
                                                <%
                                            }
                                            else
                                            {
                                                %>
                                                <option value="<%=c %>"><%=c %></option>
                                                <%
                                            }
                                        }
                                    }
                                    %>
                                </select>
                            </td>
                            <%
                        }
                        total_criteria++;
                        %>
                        <td style="vertical-align: middle; text-align: center">
                            <select onchange="Validate()" id="<%=total_criteria %>" name="decision_<%=data_candidate_list.get(0).get(3) %>" class="form-control">
                                <%
                                if(data_candidate_list.get(0).get(4) == null)
                                {
                                    %>
                                    <option selected disabled>-</option>
                                    <option value="PASS">PASS</option>
                                    <option value="FAIL">FAIL</option>
                                    <option value="KIV">KIV</option>
                                    <%
                                }
                                else if(data_candidate_list.get(0).get(4).equalsIgnoreCase("PASS"))
                                {
                                    %>
                                    <option disabled>-</option>
                                    <option selected value="PASS">PASS</option>
                                    <option value="FAIL">FAIL</option>
                                    <option value="KIV">KIV</option>
                                    <%
                                }
                                else if(data_candidate_list.get(0).get(4).equalsIgnoreCase("FAIL"))
                                {
                                    %>
                                    <option disabled>-</option>
                                    <option value="PASS">PASS</option>
                                    <option selected value="FAIL">FAIL</option>
                                    <option value="KIV">KIV</option>
                                    <%
                                }
                                else if(data_candidate_list.get(0).get(4).equalsIgnoreCase("KIV"))
                                {
                                    %>
                                    <option disabled>-</option>
                                    <option value="PASS">PASS</option>
                                    <option value="FAIL">FAIL</option>
                                    <option selected value="KIV">KIV</option>
                                    <%
                                }
                                %>
                            </select>
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <%
                            if(data_candidate_list.get(0).get(5) != null)
                            {
                                %>
                                <textarea name="reason_<%=data_candidate_list.get(0).get(3) %>" class="form-control"><%=data_candidate_list.get(0).get(5) %></textarea>
                                <%
                            }
                            else
                            {
                                %>
                                <textarea name="reason_<%=data_candidate_list.get(0).get(3) %>" class="form-control"></textarea>
                                <%
                            }
                            %>
                        </td>
                    </tr>
                    <%
                    if(a==0)
                    {
                        if(data_candidate_list.get(0).get(4) != null)
                        {
                            %>
                            <input type="hidden" id="edit" value="yes"/>
                            <%
                        }
                        else
                        {
                            %>
                            <input type="hidden" id="edit" value="no"/>
                            <%
                        }
                    }
                }
                %>
                </tbody>
            </table>
        </div>
        <input id="total_criteria" type="hidden" value="<%=total_criteria %>" />
        <div class="row">
            <div class="col-sm-12"><button id="done_button" type="submit" class="btn btn-success form-control"><span style="color: white">Done & Save</span></button></div>
        </div>
    </div>
</div>
</form>

<!-- Modal Go Back -->
<div id="modalDiscard" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title" style="font-weight: bold">DISCARD THIS INTERVIEW</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <a class="btn btn-warning form-control" href="process.jsp?p=PTJ/E-Interview/e_pre_panel_start_uni.jsp&is_refid=<%=is_refid %>&ipl_refid=<%=ipl_refid %>&pph_refid=<%=pph_refid %>">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<script type="text/javascript">
    $(document).ready(function()
    {
        var edit = document.getElementById("edit").value;
        if(edit == "yes")
        {
            $("#done_button").prop('disabled', false);
        }
        else if(edit == "no")
        {
            $("#done_button").prop('disabled', true);
        }
    });
    
    function Validate()
    {
        var yes = false;
        var total_c = document.getElementById("total_criteria").value;
        var total_criteria = parseInt(total_c) + 1;
        var a;
//        alert(total_criteria);
        for(a = 1; a < total_criteria; a++)
        {
            var e = document.getElementById(a);
            var value_selected = e.options[e.selectedIndex].value;
            
            if(value_selected === "-")
            {
//                alert(value_selected);
                a = total_criteria;
                $("#done_button").prop('disabled', true);
//                yes = true;
            }
            else
            {
                $("#done_button").prop('disabled', false);
            }
        }
        
//        if(!yes)
//        {
//            
//        }
    }
</script>
