<%-- 
    Document   : e_int_pos_setup
    Created on : Jan 29, 2016, 7:07:31 PM
    Author     : Habib
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <%
            String selected_size = session.getAttribute("selected_size").toString();
            String[] selected_pos = new String[Integer.parseInt(selected_size)];
            for(int a=0;a < selected_pos.length; a++)
            {
                selected_pos[a] = session.getAttribute("selected_pos"+Integer.toString(a)).toString();
            }
            String sql_pos_list = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid "
                        + "FROM pos_applied pa, position_ptj_hr pph, candidate c, login1 l "
                        + "WHERE pa.pph_refid = pph.pph_refid "
                        + "AND pa.c_refid = c.c_refid "
                        + "AND l.c_refid = c.c_refid "
                        + "AND pph.pph_refid = ? ";
            String[] param_pos_list = new String[1];
            ArrayList<ArrayList<String>> data_pos_list;
            
            String sql_count_pass = "SELECT COUNT(PA.PA_REFID) "
                                    + "FROM POS_APPLIED PA, POSITION_PTJ_HR PPH "
                                    + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
                                    + "AND PA.PA_STATUS = ? "
                                    + "AND PA.PPH_REFID = ? ";
            String[] param_count_pass = new String[2];
            ArrayList<ArrayList<String>> data_count_pass;
            %>
            <div class="col-sm-12"><h4>E-INTERVIEW: Setup Interview</h4></div>
        </div>
        <form method="post" action="process/bpsm/eInterview/e_int_save_setup_process.jsp">
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
                             <!--action="process/bpsm/eInterview/e_int_save_setup_process.jsp"-->
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
                                String pass_ptj = "PASS_PTJ";
                                for(int a=0; a < selected_pos.length; a++)
                                {
                                    param_pos_list[0] =  selected_pos[a];
                                    data_pos_list = mc.getQuery(sql_pos_list, param_pos_list);
                                    param_count_pass[0] = pass_ptj;
                                    param_count_pass[1] = data_pos_list.get(0).get(3);
                                    data_count_pass = mc.getQuery(sql_count_pass, param_count_pass);
                                    %>
                                    <input type="hidden" name="pph_refid" value="<%=selected_pos[a] %>">
                                    <tr>
                                        <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                                        <td style="vertical-align: middle; text-align: center"><%=data_pos_list.get(0).get(0) %></td>
                                        <td style="vertical-align: middle"><%=data_pos_list.get(0).get(1) %></td>
                                        <td style="vertical-align: middle"><%=data_pos_list.get(0).get(2) %></td>
                                        <td style="vertical-align: middle; text-align: center"><%=data_count_pass.get(0).get(0) %></td>
                                    </tr>
                                    <%
                                }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
       </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <br>
                    <div class="row">
                        <table class="table-condensed" width="100%">
                            <tr>
                                <td style="font-weight: bold; vertical-align: middle" width="20%">Date</td>
                                <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                <td style="vertical-align: middle"><input type="date" class="form-control" name="ic_interview_date" required="" placeholder="30/02/2015"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab">
                        <h4 class="panel-title">
                                PRE-INTERVIEW
                        </h4>
                        <input type="hidden" name="ic_type" value="PRE-INTERVIEW">
                    </div>
                    <div class="panel-body">                                        
                        <div class="row">
                            <table class="table-condensed" width="100%">
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Start</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input type="time" class="form-control" name="ic_start_time" required="" placeholder="30/02/2015 03:00PM"></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">End</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input type="time" class="form-control" name="ic_end_time" required="" placeholder="30/02/2015 03:00PM"></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle">Venue</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center">:</td>
                                    <td style="vertical-align: middle"><input type="text" class="form-control" name="ic_venue" placeholder="Example: HR BUILDING" required></td>
                                </tr>
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
                                MAIN INTERVIEW
                        </h4>
                        <input type="hidden" name="ic_type" value="MAIN INTERVIEW">
                    </div>
                    <div class="panel-body">                                        
                        <div class="row">
                            <table class="table-condensed" width="100%">
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Start</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input type="time" class="form-control" name="ic_start_time" required="" placeholder="30/02/2015 03:00PM"></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">End</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input type="time" class="form-control" name="ic_end_time" required="" placeholder="30/02/2015 03:00PM"></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle">Venue</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center">:</td>
                                    <td style="vertical-align: middle"><input type="text" class="form-control" name="ic_venue" placeholder="Example: HR BUILDING" required></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    
        <div class="row">
        <table>
            <tr>
                <td colspan="3" style="font-weight: bold; vertical-align: middle; text-align: center">
                    <button class="btn btn-success form-control"><span style="color: white">Save</span></button>
                </td>
            </tr>
        </table>
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
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_pos_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<script type="text/javascript">
$(document).ready(function ()
{
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

<!-- <tr>
                        <td style="font-weight: bold; vertical-align: middle" >Chairman</td>
                        <td style="font-weight: bold; vertical-align: middle; text-align: center" >:</td>
                        <td style="vertical-align: middle">
                            <%
//                            String role_candidate = "CANDIDATE";
//                            String sql_select_user = "SELECT U.U_REFID, U.U_NAME, RL.RL_ROLE "
//                                                    + "FROM USERS1 U, LOGIN1 L, ROLE RL "
//                                                    + "WHERE RL.RL_REFID = L.RL_REFID "
//                                                    + "AND U.U_REFID = L.U_REFID "
//                                                    + "AND RL.RL_ROLE != ? ";
//                            String param_select_user[] = { role_candidate };
//                            ArrayList<ArrayList<String>> data_select_user = mc.getQuery(sql_select_user, param_select_user);
                            %>
                            <select name="chairman" class="form-control">
                                <option disabled selected>--PLEASE SELECT TO INVITE INTERVIEW CHAIRMAN--</option>
                                <%
//                                for(int a=0; a < data_select_user.size(); a++)
//                                {
//                                    %><
//                                    <option value="<%//=data_select_user.get(a).get(0)%>"><%//=data_select_user.get(a).get(1)%> ( <%//=data_select_user.get(a).get(2)%> )</option>
//                                    <%
//                                }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; vertical-align: top; padding-top: 18px" >Panels</td>
                        <td style="font-weight: bold; vertical-align: top; padding-top: 18px" >:</td>
                        <td style="vertical-align: middle">
                            <div class="form-group" id="itemRows">
                                <div id="selection" class="col-md-10">
                                    <select name="panels" class="form-control">
                                        <option disabled selected>--PLEASE SELECT TO INVITE INTERVIEW PANEL --</option>
                                        <% //
//                                        for(int a=0; a < data_select_user.size(); a++)
//                                        {
//                                            %>
//                                            <option value="<%//=data_select_user.get(a).get(0)%>"><%//=data_select_user.get(a).get(1)%> ( <%//=data_select_user.get(a).get(2)%> )</option>
//                                            <%
//                                        }
                                        %>
                                    </select>
                                </div>
                                <div class="col-md-2"  style="text-align: center">
                                    <input name="rowExist" data-rowExist="0" id="rowExistId" class="open-rowExist" type="hidden" value="0">
                                    <button type="button" id="addButton" class="btn btn-default form-control"><i class="fa fa-plus"></i></button>
                                </div>
                            </div>
                        </td>
                    </tr>-->