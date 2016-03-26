<%-- 
    Document   : e_int_full_result_detail
    Created on : Mar 26, 2016, 11:09:01 PM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String is_refid = session.getAttribute("is_refid").toString();
    String pph_refid = session.getAttribute("pph_refid").toString();
    String accepted = "22";
    int total_mark;
    String pass = "PASS";
    String fail = "FAIL";
    String kiv = "KIV";
    
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
    String param_panel_list[] = { is_refid, accepted };
    ArrayList<ArrayList<String>> data_panel_list = mc.getQuery(sql_panel_list, param_panel_list);

    String sql_chairman_list = "SELECT sm.sm_staff_id, sma.sm_staff_name, dm.dm_dept_code, dm.dm_dept_desc, sm.sm_job_code "
                        + "FROM interview_setup iss, staff_main sm, department_main dm, staff_main_archive052014 sma, interview_chairman_list icl "
                        + "WHERE sm.sm_staff_id = icl.sm_staff_id "
                        + "AND dm.dm_dept_code = sm.sm_dept_code "
                        + "AND sm.sm_staff_id = sma.sm_staff_id "
                        + "AND iss.is_refid = icl.is_refid "
                        + "AND iss.is_refid = ? "
                        + "AND icl.icl_status = ? ";
    String param_chairman_list[] = { is_refid, accepted };
    ArrayList<ArrayList<String>> data_chairman_list = mc.getQuery(sql_chairman_list, param_chairman_list);
    
    String sql_cand_list    = "SELECT c.c_name, l.l_icno, irm.irm_refid, irm.irm_status, irm.irm_reason "
                            + "FROM login1 l, candidate c, pos_applied pa, position_ptj_hr pph, interview_result_mark irm, interview_setup iss "
                            + "WHERE pph.pph_refid = pa.pph_refid "
                            + "AND c.c_refid = pa.c_refid "
                            + "AND c.c_refid = l.c_refid "
                            + "AND pa.pa_refid = irm.pa_refid "
                            + "AND iss.is_refid = irm.is_refid "
                            + "AND iss.is_refid = ? "
                            + "AND pph.pph_refid = ? "
                            + "AND irm.irm_cand_status = ? ";
    String param_cand_list[] = { is_refid, pph_refid, accepted };
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
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="process.jsp?p=BPSM/E-Interview/e_int_full_result_summary.jsp&is_refid=<%=is_refid %>" class="btn btn-default">Back</a></div>
        </div>
        <br/>
        <div class="row" align="center">
            <h4>INTERVIEW RESULT DETAIL</h4>
            <hr/>
        </div>
        <br/>
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
            <div class="col-md-6">
                <div class="form-group col-md-12">
                    <div class="col-md-3" style="text-align: left; font-weight: bold">CHAIRMAN</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_chairman_list.get(0).get(1) %></div>
                </div>
                <%
                for(int a = 0; a < data_panel_list.size(); a++)
                {
                    %>
                    <div class="form-group col-md-12">
                        <div class="col-md-3" style="text-align: left; font-weight: bold">PANEL <%=a+1 %></div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_panel_list.get(a).get(1) %></div>
                    </div>
                    <%
                }
                %>
            </div>
        </div>
        <div class="row" align="center">
            <table style="width: 98%; font-size: smaller; background-color: white" class="table table-bordered">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">CANDIDATE NAME</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">IC NO.</th>
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
                        <td style="vertical-align: middle"><%=data_cand_list.get(a).get(0) %></td>
                        <td style="vertical-align: middle"><a><%=data_cand_list.get(a).get(1) %></a></td>
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
                            <%
                            if(data_cand_list.get(a).get(3).equals(pass))
                            {
                                %>
                                <span style="font-weight: bold"><a style="color: limegreen; " href="#modalChairmanRemark<%=a %>" data-toggle="modal"><%=data_cand_list.get(a).get(3) %></a></span>
                                <!-- Modal Reason -->
                                <div id="modalChairmanRemark<%=a %>" class="modal fade" role="dialog">
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
                                                            out.print(data_cand_list.get(a).get(4));
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
                            else if(data_cand_list.get(a).get(3).equals(fail))
                            {
                                %>
                                <span style="font-weight: bold"><a style="color: red; " href="#modalChairmanRemark<%=a %>" data-toggle="modal"><%=data_cand_list.get(a).get(3) %></a></span>
                                <!-- Modal Reason -->
                                <div id="modalChairmanRemark<%=a %>" class="modal fade" role="dialog">
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
                                                            out.print(data_cand_list.get(a).get(4));
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
                    </tr>
                    <%
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Go Back -->
<div id="modalDiscard" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title" style="font-weight: bold">GO BACK</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_published_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<!-- Modal Reason -->
<div id="modalReason" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4 class="modal-title" style="font-weight: bold">FAIL REASON</h4>
            </div>
            <div class="modal-body" align="center">
                <fieldset>
                    <h6 class="modal-title">This candidate shown the rude attitude</h6>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<!-- ENd Modal Reason -->
<script type="text/javascript">
$(document).ready(function()
{
    $("#interview").prop('disabled', true);
});

function checkTotalCheckedBoxes()
{
     var checkLength = 0;
     var boxes = document.getElementById("candidate_list").getElementsByTagName("input");
     for (var i = 0; i < boxes.length; i++)
     {
         boxes[i].checked ? checkLength++ : null;
     }

     if(checkLength > 0)
     {
         $("#interview").prop('disabled', false);
     }
     else if(checkLength === 0)
     {
         $("#interview").prop('disabled', true);
     }
     //alert (checkLength + " boxes are checked." );
}
</script>
