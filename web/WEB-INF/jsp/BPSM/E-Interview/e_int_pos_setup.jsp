<%-- 
    Document   : e_int_pos_setup
    Created on : Jan 29, 2016, 7:07:31 PM
    Author     : Habib
--%>
<%@page import="eInterview.EInterview"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
EInterview eint = new EInterview();

String alert = session.getAttribute("alert").toString();
String pass_ptj = "PASS_PTJ";

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

String status_active = "ACTIVE";
String sql_staff_list = "SELECT sma.sm_staff_name, sm.sm_staff_id, dm.dm_dept_code, dm.dm_dept_desc, sm.sm_job_code "
                        + "FROM staff_main sm, staff_main_archive052014 sma, department_main dm "
                        + "WHERE sm.sm_staff_id = sma.sm_staff_id "
                        + "AND dm.dm_dept_code = sm.sm_dept_code "
                        + "AND sm.sm_staff_status = ? "
                        + "AND sm.sm_job_code IS NOT NULL "
                        + "ORDER BY sma.sm_staff_name ASC";
String param_staff_list[] = { status_active };
ArrayList<ArrayList<String>> data_staff_list = mc.getQuery(sql_staff_list, param_staff_list);

String sql_criteria_list = "SELECT icm.icm_refid, icm.icm_criteria, icm.icm_minmark, icm.icm_maxmark "
                        + "FROM interview_criteria_mark icm "
                        + "ORDER BY icm.icm_criteria";
String param_criteria_list[] = {};
ArrayList<ArrayList<String>> data_criteria_list = mc.getQuery(sql_criteria_list, param_criteria_list);
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <div class="col-sm-12"><h4>E-INTERVIEW: Setup Interview</h4></div>
        </div>
        <form method="post" id="demoform" action="process/bpsm/eInterview/e_int_save_setup_process.jsp">
        
        <div class="row">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab">
                        <h4 class="panel-title">
                            INTERVIEW DATE
                        </h4>
                        <input type="hidden" name="is_type" value="UNIVERSITY">
                    </div>
                    <div class="panel-body">                                        
                        <div class="row">
                            <table class="table-condensed" width="100%">
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Date</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input onchange="ChangeDate()" type="date" class="form-control" name="is_date" id="date" required></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Start</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input type="time" class="form-control" name="is_starttime" id="start" required></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">End</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><input type="time" class="form-control" name="is_endtime" id="end" required></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle">Venue</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center">:</td>
                                    <td style="vertical-align: middle"><input type="text" class="form-control" name="is_venue" placeholder="Example: HR BUILDING" required></td>
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
                            INTERVIEWS COMMITTEE
                        </h4>
                    </div>

                    <div class="panel-body">   
                        <h4>Chairman :</h4>
                        <div class="row-fluid">
                            <select id="chairman" class="selectpicker form-control" name="chairman_staff_id" data-show-subtext="true" data-live-search="true">
                            <%
                            for(int a=0; a<data_staff_list.size(); a++)
                            {
                                %>
                                <option value="<%=data_staff_list.get(a).get(1) %>" data-subtext="(<%=data_staff_list.get(a).get(4)+" - "+eint.getShortedName(data_staff_list.get(a).get(3).toUpperCase()) %>)"><%=data_staff_list.get(a).get(0) %></option>
                                <%
                            }
                            %>
                            </select>
                            <hr/>
                        </div>
                        <h4>Panel :</h4>
                        <div class="row">
                            
<!--                            <table class="table-condensed" width="100%">
                                
                                <tr>
                                    <td style="font-weight: bold; vertical-align: top; padding-top: 18px" >Panels</td>
                                    <td style="font-weight: bold; vertical-align: top; padding-top: 18px" >:</td>
                                    <td>
                                        <div class="form-group" id="itemRows">
                                            <div id="selection" class="col-md-10">
                                                <p>Hi</p>
                                            </div>
                                            <div class="col-md-2"  style="text-align: center">
                                                <input name="rowExist" data-rowExist="0" id="rowExistId" class="open-rowExist" type="hidden" value="0">
                                                <button type="button" id="addButton" class="btn btn-default form-control"><i class="fa fa-plus"></i></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>-->
                            
                            <select id="panel" multiple="multiple" size="10" onchange="CheckSelectedPanel()" name="panel_staff_id">
                                <%
                                for(int a=0; a<data_staff_list.size(); a++)
                                {
                                    %>
                                    <option value="<%=data_staff_list.get(a).get(1) %>"><%=data_staff_list.get(a).get(0) %> (<%=data_staff_list.get(a).get(4)+" - "+eint.getShortedName(data_staff_list.get(a).get(3).toUpperCase()) %>)</option>
                                    <%
                                }
                                %>
                            </select>
                            <br>
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
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Total Candidate(<a title="Candidate that had passed their PTJ Filter">?</a>)</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Date</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Start</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">End</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                int num_pos = 0;
                                for(int a=0; a < selected_pos.length; a++)
                                {
                                    num_pos = a+1;
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
                                        <td style="vertical-align: middle"><input type="date" class="form-control" name="ptj_is_date_<%=selected_pos[a] %>" id="ptj_date_<%=num_pos %>" required></td>
                                        <td style="vertical-align: middle"><input type="time" class="form-control" name="ptj_is_starttime_<%=selected_pos[a] %>" id="ptj_start_<%=num_pos %>" required></td>
                                        <td style="vertical-align: middle"><input type="time" class="form-control" name="ptj_is_endtime_<%=selected_pos[a] %>" id="ptj_end_<%=num_pos %>" required></td>
                                    </tr>
                                    <%
                                }
                                %>
                                <input type="hidden" id="total_pos" value="<%=selected_pos.length %>"/>
                                </tbody>
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
                            MARKING SETUP
                        </h4>
                    </div>
                    <div class="panel-body">              
                        <div class="row">
                            <!--action="process/bpsm/eInterview/e_int_save_setup_process.jsp"-->
                            <table style="width: 100%" class="table-bordered">
                                <thead style="vertical-align: middle;">
                                    <tr style="vertical-align: middle;">
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Criteria</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Min. Mark</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Max. Score</th>
                                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Choose<input onclick="select_all()" id="all_criteria" type="checkbox"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <input id="total_criteria" type="hidden" value="<%=data_criteria_list.size() %>" />
                                <%
                                for(int a = 0; a < data_criteria_list.size(); a++)
                                {
                                    %>
                                    <tr>
                                       <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                                       <td style="vertical-align: middle"><%=data_criteria_list.get(a).get(1) %></td>
                                       <td style="vertical-align: middle; text-align: center"><%=data_criteria_list.get(a).get(2) %></td>
                                       <td style="vertical-align: middle; text-align: center"><%=data_criteria_list.get(a).get(3) %></td>
                                       <td style="vertical-align: middle; text-align: center"><input name="icm_refid" id="<%=a %>" type="checkbox" value="<%=data_criteria_list.get(a).get(0) %>" ></td>
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
        <table>
            <tr>
                <td colspan="3" style="font-weight: bold; vertical-align: middle; text-align: center">
                    <button id="save_setup" class="btn btn-success form-control"><span style="color: white">Save</span></button>
                </td>
            </tr>
        </table>
        </div>
        </form>
    </div>
</div>

<%
if(alert.equals("1"))
{
    %>
    <script type="text/javascript">
        alert("One person can sit for one chair only!");
    </script>
    <%
    session.setAttribute("alert", "0");
}

if(alert.equals("2"))
{
    %>
    <script type="text/javascript">
        alert("Please select at least one criteria for Marking Setup section");
    </script>
    <%
    session.setAttribute("alert", "0");
}
%>                                                
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
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_pos_to_setup_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<script type="text/javascript">
$(document).ready(function ()
{
//    $("#panelSize").val('1');
//    var selection = $("#selection").html();
//    //var selection = document.getElementById("selection");
//    var rowNum = document.getElementById("rowExistId").value;
//    $('#addButton').click(function addRow()
//    {
//        rowNum ++;
//        //var row = '<p id="rowNum'+rowNum+'">Item quantity: <input type="text" name="qty[]" size="4" value="'+frm.add_qty.value+'"> Item name: <input type="text" name="name[]" value="'+frm.add_name.value+'"> <input type="button" value="Remove" onclick="removeRow('+rowNum+');"></p>';
//        var row = '<div class="form-group" id="rowNum'+rowNum+'">'
//                        +'<div class="col-md-10">'
//                            +selection
//                        +'</div>'
//                        +'<div class="col-md-2"  style="text-align: center">'
//                                +'<button type="button" id="removeButton" data-rnum="'+rowNum+'" class="btn open-removeButton btn-danger form-control"><strong style="color: white"><i class="fa fa-minus"></i></strong></button>'
//                        +'</div>'
//                    +'</div>';
//        $("#panelSize").val( rowNum+1 );
//        jQuery('#itemRows').append(row);
//    });
//    
//    $(document).on("click", ".open-removeButton", function ()
//    {
//        var rnum = $(this).data('rnum');
//        $("#panelSize").val(rnum);
//        jQuery('#rowNum'+rnum).remove();
//    });

    $("#save_setup").prop('disabled', true);
    
    var today = new Date().toISOString().split('T')[0];
    var timeNow = new Date().toISOString().split('T')[1].substring(0,5);
    $('#date').attr('min', today);
    document.getElementById("date").value = today;
    document.getElementById("start").value = "08:00";
    document.getElementById("end").value = "08:00";
    
    var total_pos = document.getElementById("total_pos").value;
    total_pos = parseInt(total_pos) + 1;
    var a;
    for(a = 1; a < total_pos; a++)
    {
        var ptj_today = new Date().toISOString().split('T')[0];
//        alert("Hi "+a);
        $("#ptj_date_"+a).val(ptj_today);
        document.getElementById("ptj_start_"+a).value = "08:00";
        document.getElementById("ptj_end_"+a).value = "08:00";
        $('#ptj_date_'+a).attr('min', today);
        $('#ptj_date_'+a).attr('max', document.getElementById("date").value);
    }
    
//    document.getElementById("all_criteria").checked = true;
//    var selected = document.getElementById("all_criteria").checked;
//    var total_criteria = document.getElementById("total_criteria").value;
//    
//    if(selected)
//    {
//        for(var a = 0; a < total_criteria; a++)
//        {
//            document.getElementById(a).checked = true;
//        }
//    }
//    else if(!selected)
//    {
//        for(var a = 0; a < total_criteria; a++)
//        {
//            document.getElementById(a).checked = false;
//        }
//    }
});

function ChangeDate()
{
    var today = new Date().toISOString().split('T')[0];
    var timeNow = new Date().toISOString().split('T')[1].substring(0,5);
    var total_pos = document.getElementById("total_pos").value;
    total_pos = parseInt(total_pos) + 1;
    var a;
    for(a = 1; a < total_pos; a++)
    {
        var ptj_today = new Date().toISOString().split('T')[0];
//        alert("Hi "+a);
        $("#ptj_date_"+a).val(ptj_today);
        $('#ptj_date_'+a).attr('min', today);
        $('#ptj_date_'+a).attr('max', document.getElementById("date").value);
    }
}

function select_all()
{
    var selected = document.getElementById("all_criteria").checked;
    var total_criteria = document.getElementById("total_criteria").value;
    
    if(selected)
    {
        for(var a = 0; a < total_criteria; a++)
        {
            document.getElementById(a).checked = true;
        }
    }
    else if(!selected)
    {
        for(var a = 0; a < total_criteria; a++)
        {
            document.getElementById(a).checked = false;
        }
    }
}

function CheckSelectedPanel()
{   
    var selected = $('[name="panel_staff_id"]').val();
    
    if(selected == null)
    {
        $("#save_setup").prop('disabled', true);
    }
    else
    {
        $("#save_setup").prop('disabled', false);
    }
}
//var op = document.getElementById("foo").getElementsByTagName("option");
//for (var i = 0; i < op.length; i++) {
//  // lowercase comparison for case-insensitivity
//  if (op[i].value.toLowerCase() == "stackoverflow") {
//    op[i].disabled = true;
//  }
//}
</script>
<script>
    var demo1 = $('select[name="panel_staff_id"]').bootstrapDualListbox();
//    $("#demoform").submit(function() {
//      alert($('[name="duallistbox_demo1[]"]').val());
//      return false;
//    });
  </script>