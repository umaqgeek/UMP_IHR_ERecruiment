<%-- 
    Document   : e_int_start
    Created on : Feb 6, 2016, 5:25:53 PM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
String ptj_is_refid = session.getAttribute("is_refid").toString();
String ipl_refid = session.getAttribute("ipl_refid").toString();

int position_counter = 1;
int candidate_counter = 1;
String null_data = "null";
boolean all_done = true;

String sql_position_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, dm.dm_dept_desc, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type  "
                    + "FROM interview_setup iss, interview_result_mark irm, department_main dm, pos_applied pa, position_ptj_hr pph "
                    + "WHERE iss.is_refid = irm.is_refid "
                    + "AND pa.pa_refid = irm.pa_refid "
                    + "AND pph.pph_refid = pa.pph_refid "
                    + "AND pph.pph_ptj = dm.dm_dept_desc "
                    + "AND iss.is_refid = ? "
                    + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, dm.dm_dept_desc, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type ";
String param_position_list[] = { ptj_is_refid };
ArrayList<ArrayList<String>> data_position_list = mc.getQuery(sql_position_list, param_position_list);

String is_type_ptj = "PTJ";
String cand_status_accepted = "22";
String sql_cand_list    = "SELECT c.c_name, l.l_icno, iii.iii_mark, iii.iii_status, iii.iii_reason, irm.irm_refid, ipl.ipl_refid "
                        + "FROM login1 l, candidate c, pos_applied pa, position_ptj_hr pph, interview_result_mark irm, interview_setup iss, interview_irm_icm iii, interview_panel_list ipl "
                        + "WHERE pph.pph_refid = pa.pph_refid "
                        + "AND irm.irm_refid = iii.irm_refid "
                        + "AND c.c_refid = pa.c_refid "
                        + "AND c.c_refid = l.c_refid "
                        + "AND ipl.ipl_refid = iii.ipl_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND iss.is_refid = irm.is_refid "
                        + "AND iss.is_refid = ? "
                        + "AND pph.pph_refid = ? "
                        + "AND ipl.ipl_refid = ? "
                        + "AND iss.is_type = ? "
                        + "AND irm.irm_cand_status = ? ";
String param_cand_list[] = { ptj_is_refid, data_position_list.get(0).get(0), ipl_refid, is_type_ptj, cand_status_accepted };
ArrayList<ArrayList<String>> data_cand_list = mc.getQuery(sql_cand_list, param_cand_list);
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <br/>
        <div class="row" style="font-size: small">
            <div class="col-md-6">
                <div class="form-group col-md-12">
                    <div class="col-md-2" style="text-align: left; font-weight: bold">INTERVIEW LEVEL</div><div class="col-md-9" style="text-align: left"><span style="font-weight: bold">:</span> <%=data_position_list.get(0).get(8) %></div>
                </div>
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
        </div>
        <br/>
        <div class="row">
            <form method="post" action="process/bpsm/eInterview/e_int_go_interview_room.jsp">
            <input name="is_refid" value="<%=ptj_is_refid %>" type="hidden" />
            <input name="ipl_refid" value="<%=ipl_refid %>" type="hidden" />
            <table style="background-color: white" class="table table-bordered" id="candidate_list" width="100%">
            <thead style="vertical-align: middle;">
                <tr style="vertical-align: middle;">
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">#</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Name</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">IC Number</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Avg Mark</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Decision</th>
                    <th style="vertical-align: middle; text-align: center"><button class="form-control btn btn-primary" name="interview" type="submit" id="interview"><span style="color: white">Start</span></button></th>
                </tr>
            </thead>
            <tbody>
            <%    
            for(int a = 0; a < data_cand_list.size(); a++)
            {
                %>
                <tr>
                    <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                    <td style="vertical-align: middle;"><%=data_cand_list.get(a).get(0) %></td>
                    <td style="vertical-align: middle; text-align: center"><a><%=data_cand_list.get(a).get(1) %></a></td>
                    <%
                    if(data_cand_list.get(a).get(2) == null )
                    {
                        %>
                        <td style="vertical-align: middle; text-align: center"> - </td>
                        <%
                    }
                    else
                    {
                        %>
                        <td style="vertical-align: middle; text-align: center"><%=data_cand_list.get(a).get(2) %></td>
                        <%
                    }

                    if(data_cand_list.get(a).get(3) == null )
                    {
                        %>
                        <td style="vertical-align: middle; text-align: center"> - </td>
                        <%
                    }
                    else
                    {
                        if(data_cand_list.get(a).get(3).equalsIgnoreCase("PASS"))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold"><a style="color: limegreen;" data-toggle="modal" href="#modalReason<%=a %>"><%=data_cand_list.get(a).get(3) %></a></td>
                            <%
                        }
                        else if(data_cand_list.get(a).get(3).equalsIgnoreCase("FAIL"))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold"><a style="color: red;" data-toggle="modal" href="#modalReason<%=a %>"><%=data_cand_list.get(a).get(3) %></a></td>
                            <%
                        }
                        else if(data_cand_list.get(a).get(3).equalsIgnoreCase("KIV"))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold"><a style="color: gray;" data-toggle="modal" href="#modalReason<%=a %>"><%=data_cand_list.get(a).get(3) %></a></td>
                            <%
                        }
                    }

                    if(data_cand_list.get(a).get(3) == null  && data_cand_list.get(a).get(2) == null )
                    {
                        all_done = false;
                        %>
                        <td style="vertical-align: middle; text-align: center"><input type="checkbox" onclick="checkTotalCheckedBoxes();" id="candidate" name="irm_refid" value="<%=data_cand_list.get(a).get(5) %>"></td>
                        <%
                    }
                    else
                    {
                        %>
                        <td style="vertical-align: middle; text-align: center">DONE <a title="Edit" href="process.jsp?p=BPSM/E-Interview/e_int_interview_room.jsp&is_refid=<%=ptj_is_refid %>&ipl_refid=<%=ipl_refid %>&selected_irm_refid0=<%=data_cand_list.get(a).get(5) %>&selected_size=1" class="glyphicon glyphicon-pencil"></a></td>
                        <%
                    }
                    %>
                </tr>
                <%
            }
            %>
            </tbody>
            </table>
            </form>
        </div>
        <div class="row">
            <form method="post" action="process/bpsm/eInterview/e_int_submit_to_chairman_process.jsp">
                <%
                if(all_done)
                {
                    %>
                    <div class="col-sm-12"><button type="submit" class="btn btn-success form-control"><span style="color: white">Submit To Chairman</span></button></div>
                    <%
                }
                else if(!all_done)
                {
                    %>
                    <div class="col-sm-12"><button type="submit" class="btn btn-success form-control disabled"><span style="color: white">Submit To Chairman</span></button></div>
                    <%
                }
                %>
            </form>
        </div>
    </div>
</div>

<!-- Modal Reason -->
<%    
for(int a = 0; a < data_cand_list.size(); a++)
{
    %>
    <div id="modalReason<%=a %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <form action="" method="post">
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <strong>REMARK</strong>
                </div>
                <div class="modal-body" align="center">
                    <fieldset>
                        <h6 class="modal-title">
                            <%
                            if(data_cand_list.get(a).get(4) != null)
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
            </form>
        </div>
    </div>
    <%
}
%>

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
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
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
