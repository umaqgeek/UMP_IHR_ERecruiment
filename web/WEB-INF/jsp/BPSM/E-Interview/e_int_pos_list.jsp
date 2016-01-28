<%-- 
    Document   : e_int_pos_list
    Created on : Jan 28, 2016, 4:38:16 PM
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
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
              <li class="active"><a data-toggle="tab" href="#tabPosList">LIST OF POSITION</a></li>
              <li><a data-toggle="tab" href="#tabIntList">LIST OF INTERVIEW</a></li>
            </ul>
        </div>
        <div class="row">
            <!-- Tab List Position -->
            <div class="tab-content">
                <div id="tabPosList" class="tab-pane fade in active">
                <%
                String sql_pos_list = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid "
                            + "FROM pos_applied pa, position_ptj_hr pph, candidate c, login1 l "
                            + "WHERE pa.pph_refid = pph.pph_refid "
                            + "AND pa.c_refid = c.c_refid "
                            + "AND l.c_refid = c.c_refid "
                            + "GROUP BY pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid ";
                String param_pos_list[] = { };
                ArrayList<ArrayList<String>> data_pos_list = mc.getQuery(sql_pos_list, param_pos_list);
                %>
                <table id="posList" class="table-bordered" width="100%">
                    <thead>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                    if(data_pos_list.size() > 0)
                    {
                        for(int row = 0; row < data_pos_list.size(); row++)
                        {
                            %>
                            <tr>
                                <td style="vertical-align: middle; text-align: center"><%=row+1 %></td>
                                <td style="vertical-align: middle; text-align: center"><%=data_pos_list.get(row).get(0) %></td>
                                <td style="vertical-align: middle"><%=data_pos_list.get(row).get(1) %></td>
                                <td style="vertical-align: middle"><%=data_pos_list.get(row).get(2) %></td>
                                <td style="vertical-align: middle; text-align: center"><a class="btn btn-primary form-control" href="#modalSetup<%=row %>" data-toggle="modal">Setup</a></td>
                            </tr>
                            <%
                        }
                    }
                    else
                    {
                        %>
                        <tr>
                            <td colspan="5" style="font-weight: bold; vertical-align: middle; text-align: center; color: red">No Record</td>
                        </tr>
                        <%
                    }
                    %>
                    </tbody>
                </table>
                </div>
                <!-- End Position List -->
                <!-- Tab List Interview -->
                <div id="tabIntList" class="tab-pane fade">
                <%
                String sql_select_int = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, IC.IC_VENUE "
                        + "FROM INTERVIEW_CHAIRMAN IC, INTERVIEW_RESULT IR, POS_APPLIED PA, POSITION_PTJ_HR PPH, INTERVIEW_PANELS IP "
                        + "WHERE IC.IC_REFID = IR.IC_REFID "
                        + "AND IR.IR_REFID =  IP.IR_REFID "
                        + "AND PA.PA_REFID = IR.PA_REFID "
                        + "AND PPH.PPH_REFID = PA.PPH_REFID "
                        + "GROUP BY PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, IC.IC_VENUE";
                String param_select_int[] = {};
                ArrayList<ArrayList<String>> data_select_int = mc.getQuery(sql_select_int, param_select_int);
                %>
                <table id="intList" class="table-bordered" width="100%">
                    <thead>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">Interview</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Venue</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Total Of Interviewee</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Total Of Panel</th>
                        <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Set</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                    
                    if(data_select_int.size() > 0)
                    {
                        String sql_count_pa = "SELECT COUNT(IR.IR_REFID) "
                                                + "FROM INTERVIEW_RESULT IR "
                                                + "WHERE IR.IC_REFID = ? ";
                        String[] param_count_pa = new String[1];
                        ArrayList<ArrayList<String>> data_count_pa;
                        String sql_count_panels = "SELECT COUNT(IP.IP_REFID) "
                                + "FROM INTERVIEW_PANELS IP, INTERVIEW_RESULT IR, INTERVIEW_CHAIRMAN IC "
                                + "WHERE IR.IR_REFID = IP.IR_REFID "
                                + "AND IC.IC_REFID = IR.IC_REFID "
                                + "AND IC.IC_REFID = ? ";
                        String[] param_count_panels = new String[1];
                        ArrayList<ArrayList<String>> data_count_panels;
                        int a, b, total;
                        for(int row=0; row < data_select_int.size(); row++)
                        {
                            param_count_pa[0] = data_select_int.get(row).get(2);
                            data_count_pa = mc.getQuery(sql_count_pa, param_count_pa);
                            
                            param_count_panels[0] = data_select_int.get(row).get(2);
                            data_count_panels = mc.getQuery(sql_count_panels, param_count_panels);
                            %>
                            <tr>
                                <td style="vertical-align: middle; text-align: center"><%=row+1 %></td>
                                <td style="vertical-align: middle; text-align: center">INTERVIEW <%=row+1 %></td>
                                <td style="vertical-align: middle"><%=data_select_int.get(row).get(0) %></td>
                                <td style="vertical-align: middle"><%=data_select_int.get(row).get(1) %></td>
                                <td style="vertical-align: middle; text-align: center"><%=data_select_int.get(row).get(3) %></td>
                                <td style="vertical-align: middle; text-align: center"><%=data_select_int.get(row).get(4) %></td>
                                <td style="vertical-align: middle; text-align: center"><%=data_count_pa.get(0).get(0) %></td>
                                <td style="vertical-align: middle; text-align: center"><%=Integer.parseInt(data_count_panels.get(0).get(0))/Integer.parseInt(data_count_pa.get(0).get(0)) %></td>
                                <td style="vertical-align: middle; text-align: center" width="5%"><a class="btn btn-warning form-control" href="#modalSetChairman<%=row %>" data-toggle="modal">Chairman</a></td>
                                <td style="vertical-align: middle; text-align: center" width="8%"><a class="btn btn-default form-control" href="#modalSetPanel<%=row %>" data-toggle="modal" >Panel</a></td>
                            </tr>
                            <%
                        }
                    }
                    else
                    {
                        %>
                        <tr>
                            <td colspan="6" style="font-weight: bold; vertical-align: middle; text-align: center; color: red">No Record</td>
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


<!-- Start Modal -->
<!-- Modal Setup from pos list -->
<%
if(data_pos_list.size() > 0)
{
    for(int row = 0; row < data_pos_list.size(); row++)
    {
        %>
        <div id="modalSetup<%=row %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="process/bpsm/eInterview/e_int_save_setup_process.jsp" method="post">
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <h4 class="modal-title">Setup Interview</h4>
                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <input type="hidden" name="pph_refid" value="<%=data_pos_list.get(row).get(3) %>">
                            <div class="form-group">
                                <label class="col-md-2">Position</label><label class="col-md-1">:</label>
                                <label class="col-md-9"><%=data_pos_list.get(row).get(1) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2">Date Time</label><label class="col-md-1">:</label>
                                <div class="date col-md-9">
                                    <input type="date" name="ic_interview_datetime" value="" class="form-control" required=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2">Venue</label><label class="col-md-1">:</label>
                                <div class="col-md-9">
                                    <input type="text" name="ic_venue" value="" class="form-control" placeholder="Example: Interview Room" required=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2">Total Of Panels</label><label class="col-md-1">:</label>
                                <div class="col-md-9">
                                    <select name="total_panels" class="form-control">
                                    <%
                                    for(int count = 1; count<=10; count++)
                                    {
                                        %>
                                        <option value="<%=count %>"><%=count %></option>
                                        <%
                                    }
                                    %>
                                    </select>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success form-control" style="font-weight: bold">Save</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <%
    }
}
%>
<!-- END Setup from pos list -->
<!-- Modal Set chairman -->
<%
if(data_select_int.size() > 0)
{
    String sql_count_pa = "SELECT COUNT(IR.IR_REFID) "
                            + "FROM INTERVIEW_RESULT IR "
                            + "WHERE IR.IC_REFID = ? ";
    String[] param_count_pa = new String[1];
    ArrayList<ArrayList<String>> data_count_pa;
    String sql_count_panels = "SELECT COUNT(IP.IP_REFID) "
            + "FROM INTERVIEW_PANELS IP, INTERVIEW_RESULT IR, INTERVIEW_CHAIRMAN IC "
            + "WHERE IR.IR_REFID = IP.IR_REFID "
            + "AND IC.IC_REFID = IR.IC_REFID "
            + "AND IC.IC_REFID = ? ";
    String[] param_count_panels = new String[1];
    ArrayList<ArrayList<String>> data_count_panels;
    int a, b, total;
    for(int row=0; row < data_select_int.size(); row++)
    {
        param_count_pa[0] = data_select_int.get(row).get(2);
        data_count_pa = mc.getQuery(sql_count_pa, param_count_pa);

        param_count_panels[0] = data_select_int.get(row).get(2);
        data_count_panels = mc.getQuery(sql_count_panels, param_count_panels);
        %>
        <div id="modalSetChairman<%=row %>" class="modal fade" role="dialog">
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
                                <label class="col-md-8">INTERVIEW <%=row+1 %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Grade</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_select_int.get(row).get(0) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Position</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_select_int.get(row).get(1) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Date</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_select_int.get(row).get(3) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Venue</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_select_int.get(row).get(4) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Total Interviewee</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_count_pa.get(0).get(0) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Total Of Panel</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=Integer.parseInt(data_count_panels.get(0).get(0))/Integer.parseInt(data_count_pa.get(0).get(0)) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">List Of User</label><label class="col-md-9">:</label>
                            </div>
                            <div id="dual-list-box" class="form-group">
                                <div class="col-md-12">
                                    <%
                                    String role_candidate = "CANDIDATE";
                                    String sql_select_user = "SELECT U.U_REFID, U.U_NAME "
                                                            + "FROM USERS1 U, LOGIN1 L, ROLE RL "
                                                            + "WHERE RL.RL_REFID = L.RL_REFID "
                                                            + "AND U.U_REFID = L.U_REFID "
                                                            + "AND RL.RL_ROLE != ? ";
                                    String param_select_user[] = { role_candidate };
                                    ArrayList<ArrayList<String>> data_select_user = mc.getQuery(sql_select_user, param_select_user);
                                    
                                    if(data_select_user.size() > 0)
                                    {
                                        %>
                                        <table class="table-bordered" width="100%">
                                            <tr>
                                                <th style="text-align: center">Name</th>
                                                <th style="text-align: center" width="1%">Choose</th>
                                            </tr>
                                            <tbody>
                                        <%
                                        for(int row_users = 0; row_users<data_select_user.size(); row_users++)
                                        {
                                            %>
                                            <tr>
                                                <td><%=data_select_user.get(row_users).get(1) %></td><td style="text-align: center"><input type="checkbox" name="panels[]" value="<%=data_select_user.get(row_users).get(0) %>"></td>
                                            </tr>
                                            <%
                                        }
                                        %>
                                            </tbody>
                                        </table>
                                        <%
                                    }
                                    %>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success form-control" style="font-weight: bold">Save</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <%
    }
}
        %>
<!-- End modal set chairman -->
<!-- Modal Set Panel -->
<%
if(data_select_int.size() > 0)
{
    String sql_count_pa = "SELECT COUNT(IR.IR_REFID) "
                            + "FROM INTERVIEW_RESULT IR "
                            + "WHERE IR.IC_REFID = ? ";
    String[] param_count_pa = new String[1];
    ArrayList<ArrayList<String>> data_count_pa;
    String sql_count_panels = "SELECT COUNT(IP.IP_REFID) "
            + "FROM INTERVIEW_PANELS IP, INTERVIEW_RESULT IR, INTERVIEW_CHAIRMAN IC "
            + "WHERE IR.IR_REFID = IP.IR_REFID "
            + "AND IC.IC_REFID = IR.IC_REFID "
            + "AND IC.IC_REFID = ? ";
    String[] param_count_panels = new String[1];
    ArrayList<ArrayList<String>> data_count_panels;
    int a, b, total;
    for(int row=0; row < data_select_int.size(); row++)
    {
        param_count_pa[0] = data_select_int.get(row).get(2);
        data_count_pa = mc.getQuery(sql_count_pa, param_count_pa);

        param_count_panels[0] = data_select_int.get(row).get(2);
        data_count_panels = mc.getQuery(sql_count_panels, param_count_panels);
        %>
        <div id="modalSetPanel<%=row %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form action="" method="post">
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <h4 class="modal-title">Set Interview Panel</h4>
                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-md-3">Interview</label><label class="col-md-1">:</label>
                                <label class="col-md-8">INTERVIEW <%=row+1 %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Grade</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_select_int.get(row).get(0) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Position</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_select_int.get(row).get(1) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Date</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_select_int.get(row).get(3) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Venue</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_select_int.get(row).get(4) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Total Interviewee</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=data_count_pa.get(0).get(0) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">Total Of Panel</label><label class="col-md-1">:</label>
                                <label class="col-md-8"><%=Integer.parseInt(data_count_panels.get(0).get(0))/Integer.parseInt(data_count_pa.get(0).get(0)) %></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3">List Of User</label><label class="col-md-9">:</label>
                            </div>
                            <div id="dual-list-box" class="form-group">
                                <div class="col-md-12">
                                    <%
                                    String role_candidate = "CANDIDATE";
                                    String sql_select_user = "SELECT U.U_REFID, U.U_NAME "
                                                            + "FROM USERS1 U, LOGIN1 L, ROLE RL "
                                                            + "WHERE RL.RL_REFID = L.RL_REFID "
                                                            + "AND U.U_REFID = L.U_REFID "
                                                            + "AND RL.RL_ROLE != ? ";
                                    String param_select_user[] = { role_candidate };
                                    ArrayList<ArrayList<String>> data_select_user = mc.getQuery(sql_select_user, param_select_user);
                                    
                                    if(data_select_user.size() > 0)
                                    {
                                        %>
                                        <table class="table-bordered" width="100%">
                                            <tr>
                                                <th style="text-align: center">Name</th>
                                                <th style="text-align: center" width="1%">Choose</th>
                                            </tr>
                                            <tbody>
                                        <%
                                        for(int row_users = 0; row_users<data_select_user.size(); row_users++)
                                        {
                                            %>
                                            <tr>
                                                <td><%=data_select_user.get(row_users).get(1) %></td><td style="text-align: center"><input type="checkbox" name="panels[]" value="<%=data_select_user.get(row_users).get(0) %>"></td>
                                            </tr>
                                            <%
                                        }
                                        %>
                                            </tbody>
                                        </table>
                                        <%
                                    }
                                    %>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success form-control" style="font-weight: bold">Save</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <%
    }
}
%>
<!-- End modal set panel-->
<!-- End Modal -->

<script type="text/javascript">
$(document).ready(function()
{
    $('#posList').DataTable();
    $('#intList').DataTable();
});
</script>
<script type="text/javascript">
    $('select').DualListBox();
</script>