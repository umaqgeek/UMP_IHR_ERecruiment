<%-- 
    Document   : e_pre_setup
    Created on : Feb 14, 2016, 1:25:49 PM
    Author     : Habib
--%>

<%@page import="eInterview.EInterview"%>
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
EInterview eint = new EInterview();
String ptj_is_refid = session.getAttribute("ptj_is_refid").toString();
String uni_is_refid = session.getAttribute("uni_is_refid").toString();
String dept_code = session.getAttribute("dept_code").toString();
String alert = session.getAttribute("alert").toString();

/**********************************SELECT POSITION LIST****************************/
String sql_selected_pos = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iss.is_date, iss.is_starttime, iss.is_endtime "
                        + "FROM interview_setup iss, interview_result_mark irm, department_main dm, pos_applied pa, position_ptj_hr pph "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND pph.pph_refid = pa.pph_refid "
                        + "AND pph.pph_ptj = dm.dm_dept_desc "
                        + "AND iss.is_refid = ? "
                        + "AND dm.dm_dept_code = ? "
                        + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iss.is_date, iss.is_starttime, iss.is_endtime ";
String param_selected_pos[] = { ptj_is_refid, dept_code };
ArrayList<ArrayList<String>> data_selected_pos = mc.getQuery(sql_selected_pos, param_selected_pos);
/**********************************END SELECT POSITION LIST****************************/

/**********************************SELECT APPLICATION LIST****************************/
String sql_pa_list = "SELECT pa.pa_refid "
                + "FROM interview_setup iss, interview_result_mark irm, department_main dm, pos_applied pa, position_ptj_hr pph "
                + "WHERE iss.is_refid = irm.is_refid "
                + "AND pa.pa_refid = irm.pa_refid "
                + "AND pph.pph_refid = pa.pph_refid "
                + "AND pph.pph_ptj = dm.dm_dept_desc "
                + "AND iss.is_refid = ? "
                + "AND dm.dm_dept_code = ? "
                + "GROUP BY pa.pa_refid";
String param_pa_list[] = { ptj_is_refid, dept_code };
ArrayList<ArrayList<String>> data_pa_list = mc.getQuery(sql_pa_list, param_pa_list);
/**********************************END SELECT APPLICATION LIST****************************/

/**********************************INITIALIZE INTERVIEW DETAILS****************************/
//String is_date = Func.sqlToDate2(data_selected_pos.get(0).get(4));
String is_date = Func.getDate(data_selected_pos.get(0).get(4));
String is_starttime = data_selected_pos.get(0).get(5);
String is_endtime = data_selected_pos.get(0).get(6);
//out.print(is_date);
//out.print(is_refid+" "+dept_code);
/**********************************END INITIALIZE INTERVIEW DETAILS****************************/

/**********************************SELECT STAFF LIST****************************/
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
/**********************************END SELECT STAFF LIST****************************/
%>
<input id="ptj_is_date" value="<%=is_date %>" type="hidden">
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-warning">Discard</a></div>
        </div>
        <div class="row">
            <div class="col-sm-12"><h4>E-INTERVIEW: Setup Pre-Interview</h4></div>
        </div>
        <form method="post" action="process/ptj/eInterview/e_pre_save_setup_process.jsp">
        <input type="hidden" name="uni_is_refid" value="<%=uni_is_refid %>">
        <input type="hidden" name="ptj_is_refid" value="<%=ptj_is_refid %>">
        <input type="hidden" name="dept_code" value="<%=dept_code %>">
        <input type="hidden" name="pph_refid" value="<%=data_selected_pos.get(0).get(0) %>">
        <%
            for(int a = 0; a < data_pa_list.size(); a++)
            {
                %>
                <input type="hidden" name="pa_refid" value="<%=data_pa_list.get(a).get(0) %>">
                <%
            }
        %>
<!--        <div class="row">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab">
                        <h4 class="panel-title">
                                SELECTED POSITION
                        </h4>
                    </div>
                    <div class="panel-body">              
                        <div class="row">
                            <table class="table-condensed" width="100%">
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Grade</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><%//=data_selected_pos.get(0).get(1) %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Position</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><%//=data_selected_pos.get(0).get(2) %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">PTJ</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><%//=data_selected_pos.get(0).get(3) %></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>-->
        
        <div class="row">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab">
                        <h4 class="panel-title">
                            PRE-INTERVIEW DETAIL
                        </h4>
                    </div>
                    <div class="panel-body">                                        
                        <div class="row">
                            <table class="table-condensed" width="100%">
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Grade</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><%=data_selected_pos.get(0).get(1) %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Position</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><%=data_selected_pos.get(0).get(2) %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">PTJ</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><%=data_selected_pos.get(0).get(3) %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Date</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><%=is_date %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">Start</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><%=Func.get12HourTime(is_starttime) %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle" width="20%">End</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center" width="1%">:</td>
                                    <td style="vertical-align: middle"><%=Func.get12HourTime(is_endtime) %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; vertical-align: middle">Venue</td>
                                    <td style="font-weight: bold; vertical-align: middle; text-align: center">:</td>
                                    <td style="vertical-align: middle"><input type="text" class="form-control" name="is_venue" placeholder="Example: INTERVIEW HALL" required></td>
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
        alert("Please select one chairman!");
    </script>
    <%
    session.setAttribute("alert", "0");
}

if(alert.equals("3"))
{
    %>
    <script type="text/javascript">
        alert("Please select at least one panel!");
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
                    <h4 class="modal-title" style="font-weight: bold">THIS ACTION WILL CANCEL YOUR ACCEPTANCE</h4>
                    <h6 class="modal-title" style="font-weight: bold">DISCARD THIS SETUP ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <a class="btn btn-warning form-control" href="process.jsp?p=PTJ/E-Interview/e_pre_memo_list.jsp">YES</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<script type="text/javascript">
$(document).ready(function ()
{
//    $('#chairman').DataTable(
//    {
//        paging: false
//    });
//    
//    $('#panels').DataTable(
//    {
//        paging: false
//    });
    
//    var min_date = new Date().toISOString().split('T')[0];
//    var max_date = document.getElementById("uni_is_date").value;
    //var timeNow = new Date().toISOString().split('T')[1].substring(0,5);
//    $('#date').attr('min', min_date);
//    $('#date').attr('max', max_date);
//    document.getElementById("date").value = min_date;
//    document.getElementById("start").value = "08:00";
//    document.getElementById("end").value = "08:00";
var selected = $('[name="panel_staff_id"]').val();
    
    if(selected == null)
    {
        $("#save_setup").prop('disabled', true);
    }
    else
    {
        $("#save_setup").prop('disabled', false);
    }
});

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
var demo1 = $('select[name="panel_staff_id"]').bootstrapDualListbox();
</script>