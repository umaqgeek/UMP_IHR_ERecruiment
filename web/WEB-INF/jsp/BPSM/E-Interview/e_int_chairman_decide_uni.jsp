<%-- 
    Document   : e_int_chairman_decide_uni
    Created on : Mar 27, 2016, 5:08:30 AM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
String is_refid = session.getAttribute("is_refid").toString();
String icl_refid = session.getAttribute("icl_refid").toString();
String pph_refid = session.getAttribute("pph_refid").toString();

String pass = "PASS";
String fail = "FAIL";
String kiv = "KIV";
String pass_int_ptj = "PASS_INT_PTJ";

int total_mark = 0;

String sql_pph_detail = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj "
                    + "FROM position_ptj_hr pph "
                    + "WHERE pph.pph_refid = ? ";
String param_pph_detail[] = { pph_refid };
ArrayList<ArrayList<String>> data_pph_detail = mc.getQuery(sql_pph_detail, param_pph_detail);

String sql_interview_detail = "SELECT iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue "
                            + "FROM interview_setup iss "
                            + "WHERE iss.is_refid = ? ";
String param_interview_detail[] = { is_refid };
ArrayList<ArrayList<String>> data_interview_detail = mc.getQuery(sql_interview_detail, param_interview_detail);

String invite_accepted = "22";
String sql_panel_list = "SELECT sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, ipl.ipl_status, iis.iis_desc, ipl.ipl_refid, sm.sm_job_code "
                    +"FROM interview_setup iss, interview_result_mark irm, interview_panel_list ipl, interview_irm_icm iii, staff_main sm, department_main dm, interview_invite_status iis, staff_main_archive052014 sma "
                    +"WHERE iss.is_refid = irm.is_refid "
                    +"AND irm.irm_refid = iii.irm_refid "
                    +"AND ipl.ipl_refid = iii.ipl_refid "
                    +"AND sm.sm_staff_id = ipl.sm_staff_id "
                    +"AND dm.dm_dept_code = sm.sm_dept_code "
                    +"AND sm.sm_staff_id = sma.sm_staff_id "
                    +"AND iis.iis_code = ipl.ipl_status "
                    +"AND iss.is_refid = ? "
                    +"AND ipl.ipl_status = ? "
                    +"GROUP BY sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, ipl.ipl_status, iis.iis_desc, ipl.ipl_refid, sm.sm_job_code";
String param_panel_list[] = { is_refid, invite_accepted };
ArrayList<ArrayList<String>> data_panel_list = mc.getQuery(sql_panel_list, param_panel_list);

String cand_status_accepted = "22";
String sql_cand_list    = "SELECT c.c_name, l.l_icno, irm.irm_refid, irm.irm_status, irm.irm_reason "
                        + "FROM login1 l, candidate c, pos_applied pa, position_ptj_hr pph, interview_result_mark irm, interview_setup iss, filter f "
                        + "WHERE pph.pph_refid = pa.pph_refid "
                        + "AND c.c_refid = pa.c_refid "
                        + "AND c.c_refid = l.c_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND iss.is_refid = irm.is_refid "
                        + "AND pa.pa_refid = f.pa_refid "
                        + "AND iss.is_refid = ? "
                        + "AND pph.pph_refid = ? "
                        + "AND irm.irm_cand_status = ? "
                        + "AND f.f_intvptj_status = ? ";
String param_cand_list[] = { is_refid, pph_refid, invite_accepted, pass_int_ptj };
ArrayList<ArrayList<String>> data_cand_list = mc.getQuery(sql_cand_list, param_cand_list);

String sql_panel_mark   = "SELECT iii.iii_mark, iii.iii_status, iii.iii_reason "
                        + "FROM interview_irm_icm iii, interview_panel_list ipl, interview_result_mark irm "
                        + "WHERE irm.irm_refid = iii.irm_refid "
                        + "AND ipl.ipl_refid = iii.ipl_refid "
                        + "AND irm.irm_refid = ? "
                        + "AND ipl.ipl_refid = ? ";
String[] param_panel_mark = new String[2];
ArrayList<ArrayList<String>> data_panel_mark = mc.getQuery(sql_panel_mark, param_panel_mark);
%>
<form action="process/bpsm/eInterview/e_int_save_chairman_decision_process_uni.jsp" method="post">
<input name="is_refid" type="hidden" value="<%=is_refid %>" />
<input name="icl_refid" type="hidden" value="<%=icl_refid %>" />
<input name="pph_refid" type="hidden" value="<%=pph_refid %>" />
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row" align="center">
            <h5>CHAIRMAN</h5>
            
        <hr/>
        </div>
        <div class="row" style="font-size: small">
            <div class="col-md-6">
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">GRADE</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_pph_detail.get(0).get(1) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">POSITION</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_pph_detail.get(0).get(2) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">PTJ</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_pph_detail.get(0).get(3) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">DATE</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=Func.getDate(data_interview_detail.get(0).get(0)) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">TIME</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=Func.get12HourTime(data_interview_detail.get(0).get(1))+" - "+Func.get12HourTime(data_interview_detail.get(0).get(2)) %></div>
                </div>
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">VENUE</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_interview_detail.get(0).get(3) %></div>
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
                        <td style="vertical-align: middle; text-align: center">1</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">Kosong</td>
                        <td style="vertical-align: middle; text-align: center">1</td>
                    </tr>
                </tbody>
                </table>
            </div>
        </div>
        <div class="row" align="center">
            <table style="width: 98%; font-size: smaller; background-color: white" class="table table-bordered">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">NAME</th>
                        <%
                        for(int a = 0; a < data_panel_list.size(); a++)
                        {
                            %>
                            <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 8%">PANEL <%=a+1 %></th>
                            <%
                        }
                        %>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">TOTAL MARK</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 10%">RESULT</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 20%">REMARK</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_cand_list.size(); a++)
                {
                    total_mark = 0;
                    %>
                    <input name="irm_refid" value="<%=data_cand_list.get(a).get(2) %>" type="hidden" />
                    <tr>
                        <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td style="vertical-align: middle"><a><%=data_cand_list.get(a).get(0) %></a></td>
                        <%
                        for(int b = 0; b < data_panel_list.size(); b++)
                        {
                            param_panel_mark[0] = data_cand_list.get(a).get(2);
                            param_panel_mark[1] = data_panel_list.get(b).get(6);
                            data_panel_mark = mc.getQuery(sql_panel_mark, param_panel_mark);
                            
                            total_mark = total_mark+Integer.parseInt(data_panel_mark.get(0).get(0));
                            
                            %>
                            <td style="vertical-align: middle; text-align: center"><%=data_panel_mark.get(0).get(0) %><br>
                            <%
                            if(data_panel_mark.get(0).get(1).equals(pass))
                            {
                                %>
                                <span style="font-weight: bold"><a style="color: limegreen; " href="#modalRemark<%=a+"_"+b %>" data-toggle="modal"><%=data_panel_mark.get(0).get(1) %></a></span>
                                <!-- Modal Reason -->
                                <div id="modalRemark<%=a+"_"+b %>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header" align="center">
                                                <h4 class="modal-title" style="font-weight: bold">REMARK</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <fieldset>
                                                    <h6 class="modal-title">
                                                        <%
                                                        if(data_panel_mark.get(0).get(2) != null)
                                                        {
                                                            out.print(data_panel_mark.get(0).get(2));
                                                        }
                                                        else
                                                        {
                                                            out.print("-");
                                                        }
                                                        %>
                                                    </h6>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ENd Modal Reason -->
                                <%
                            }
                            else if(data_panel_mark.get(0).get(1).equals(fail))
                            {
                                %>
                                <span style="font-weight: bold"><a style="color: red" href="#modalRemark<%=a+"_"+b %>" data-toggle="modal"><%=data_panel_mark.get(0).get(1) %></a></span>
                                <!-- Modal Reason -->
                                <div id="modalRemark<%=a+"_"+b %>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header" align="center">
                                                <h4 class="modal-title" style="font-weight: bold">REMARK</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <fieldset>
                                                    <h6 class="modal-title">
                                                        <%
                                                        if(data_panel_mark.get(0).get(2) != null)
                                                        {
                                                            out.print(data_panel_mark.get(0).get(2));
                                                        }
                                                        else
                                                        {
                                                            out.print("-");
                                                        }
                                                        %>
                                                    </h6>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ENd Modal Reason -->
                                <%
                            }
                            else if(data_panel_mark.get(0).get(1).equals(kiv))
                            {
                                %>
                                <span style="font-weight: bold"><a style="color: orange; " href="#modalRemark<%=a+"_"+b %>" data-toggle="modal"><%=data_panel_mark.get(0).get(1) %></a></span>
                                <!-- Modal Reason -->
                                <div id="modalRemark<%=a+"_"+b %>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header" align="center">
                                                <h4 class="modal-title" style="font-weight: bold">REMARK</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <fieldset>
                                                    <h6 class="modal-title">
                                                        <%
                                                        if(data_panel_mark.get(0).get(2) != null)
                                                        {
                                                            out.print(data_panel_mark.get(0).get(2));
                                                        }
                                                        else
                                                        {
                                                            out.print("-");
                                                        }
                                                        %>
                                                    </h6>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ENd Modal Reason -->
                                <%
                            }
                            %>
                            </td>
                            <%
                        }
                        %>
                        
                        
                        <td style="vertical-align: middle; text-align: center"><%=total_mark %></td>
                        <td style="vertical-align: middle; text-align: center">
                            <select onchange="Validate()" id="<%=a+1 %>" name="result_<%=data_cand_list.get(a).get(2) %>" class="form-control">
                            <%
                            if(data_cand_list.get(a).get(3) == null)
                            {
                                %>
                                <option selected disabled>-Choose-</option>
                                <option value="PASS">PASS</option>
                                <option value="FAIL">FAIL</option>
                                <%
                            }
                            else if(data_cand_list.get(a).get(3) != null)
                            {
                                if(data_cand_list.get(a).get(3).equals(pass))
                                {
                                    %>
                                    <option disabled>-Choose-</option>
                                    <option value="PASS" selected>PASS</option>
                                    <option value="FAIL">FAIL</option>
                                    <%
                                }
                                else if(data_cand_list.get(a).get(3).equals(fail))
                                {
                                    %>
                                    <option disabled>-Choose-</option>
                                    <option value="PASS" >PASS</option>
                                    <option value="FAIL" selected>FAIL</option>
                                    <%
                                }
                            }
                            %>
                            </select>
                                
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <%
                            if(data_cand_list.get(a).get(4) == null)
                            {
                                %>
                                <textarea name="remark_<%=data_cand_list.get(a).get(2) %>" class="form-control"></textarea>
                                <%
                            }
                            else if(data_cand_list.get(a).get(4) != null)
                            {
                                %>
                                <textarea name="remark_<%=data_cand_list.get(a).get(2) %>" class="form-control"><%=data_cand_list.get(a).get(4) %></textarea>
                                <%
                            }%>
                        </td>
                    </tr>
                    <%
                }
                %>
                </tbody>
            </table>
        </div>
        <div class="row">
            <input id="total_candidate" value="<%=data_cand_list.size() %>" type="hidden" />
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
                    <h4 class="modal-title" style="font-weight: bold">DISCARD THIS DECISION</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_chairman_start_uni.jsp&is_refid=<%=is_refid %>&icl_refid=<%=icl_refid %>">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->

<script type="text/javascript">
    $(document).ready(function()
    {
        $("#done_button").prop('disabled', true);
    });
    
    function Validate()
    {
        var yes = false;
        var total_c = document.getElementById("total_candidate").value;
        var total_criteria = parseInt(total_c)+1;
        var a;
//        alert(total_criteria);
        for(a = 1; a < total_criteria; a++)
        {
            var e = document.getElementById(a);
            var value_selected = e.options[e.selectedIndex].value;
            
            if(value_selected === "-Choose-")
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
