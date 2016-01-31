<%-- 
    Document   : e_int_pos_list
    Created on : Jan 28, 2016, 4:38:16 PM
    Author     : Habib
--%>
<%@page import="config.Config"%>
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
            <div class="col-sm-12"><h4>POSITION TO BE SETUP LIST</h4></div>
            <!-- Tab List Position -->
            <%
            String pass_ptj = "PASS_PTJ";
            String sql_pos_list = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid "
                        + "FROM pos_applied pa, position_ptj_hr pph, candidate c, login1 l "
                        + "WHERE pa.pph_refid = pph.pph_refid "
                        + "AND pa.c_refid = c.c_refid "
                        + "AND l.c_refid = c.c_refid "
                        + "AND pa.pa_status = ? "
                        + "GROUP BY pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid ";
            String param_pos_list[] = { pass_ptj };
            ArrayList<ArrayList<String>> data_pos_list = mc.getQuery(sql_pos_list, param_pos_list);

            String sql_count_pass = "SELECT COUNT(PA.PA_REFID) "
                                + "FROM POS_APPLIED PA, POSITION_PTJ_HR PPH "
                                + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
                                + "AND PA.PA_STATUS = ? "
                                + "AND PA.PPH_REFID = ? ";
            String[] param_count_pass = new String[2];
            ArrayList<ArrayList<String>> data_count_pass;
            %>
            <form method="post" action="process/bpsm/eInterview/e_int_go_setup_page.jsp">
                <table class="table-bordered" id="pos_list" width="100%">
                    <thead style="vertical-align: middle;">
                        <tr style="vertical-align: middle;">
                            <th style="vertical-align: middle; text-align: center; font-weight: bold">#</th>
                            <th style="vertical-align: middle; text-align: center; font-weight: bold">Grade</th>
                            <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                            <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                            <th style="vertical-align: middle; text-align: center; font-weight: bold">Total Interviewee</th>
                            <th style="vertical-align: middle; text-align: center; font-weight: bold"><button class="form-control btn btn-primary" name="setup" type="submit" id="setup"><strong style="color: white">Setup</strong></button></th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    if(data_pos_list.size() > 0)
                    {
                        String sql_check_pph = "SELECT IR.IR_REFID "
                                + "FROM POSITION_PTJ_HR PPH, POS_APPLIED PA, INTERVIEW_RESULT IR "
                                + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
                                + "AND PA.PA_REFID = IR.PA_REFID "
                                + "AND PPH.PPH_REFID = ? ";
                        String[] param_check_pph = new String[1];
                        ArrayList<ArrayList<String>> data_check_pph;
                        int num = 1;
                        for(int row = 0; row < data_pos_list.size(); row++)
                        {
                            param_check_pph[0] = data_pos_list.get(row).get(3);
                            data_check_pph = mc.getQuery(sql_check_pph, param_check_pph);
                            if(data_check_pph.size() == 0)
                            {
                                param_count_pass[0] = pass_ptj;
                                param_count_pass[1] = data_pos_list.get(row).get(3);
                                data_count_pass = mc.getQuery(sql_count_pass, param_count_pass);
                                if(Integer.parseInt(data_count_pass.get(0).get(0)) > 0)
                                {
                                    %>
                                    <tr>
                                        <td style="vertical-align: middle; text-align: center"><%=num %></td>
                                        <td style="vertical-align: middle; text-align: center"><%=data_pos_list.get(row).get(0) %></td>
                                        <td style="vertical-align: middle"><%=data_pos_list.get(row).get(1) %></td>
                                        <td style="vertical-align: middle"><%=data_pos_list.get(row).get(2) %></td>
                                        <td style="vertical-align: middle; text-align: center"><%=data_count_pass.get(0).get(0) %></td>
                                        <td style="vertical-align: middle; text-align: center"><input type="checkbox" onclick="checkTotalCheckedBoxes()" id="selected_pos" name="selected_pos" value="<%=data_pos_list.get(row).get(3) %>"></td>
                                    </tr>
                                    <%
                                    num++;
                                }
                            }
                        }
                    }
                    %>
                    </tbody>
                </table>
            </form>
        </div>
                <!-- End Position List -->
                <!-- Tab List Interview -->
        <div class="row">
            <div class="col-sm-12"><h4>SAVED INTERVIEW LIST</h4></div>
            <%
            String pre_interview = "PRE-INTERVIEW";
            String sql_select_int = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, PPH.PPH_PTJ, PPH.PPH_REFID "
                    + "FROM INTERVIEW_CHAIRMAN IC, INTERVIEW_RESULT IR, POS_APPLIED PA, POSITION_PTJ_HR PPH "
                    + "WHERE IC.IC_REFID = IR.IC_REFID "
                    + "AND PA.PA_REFID = IR.PA_REFID "
                    + "AND PPH.PPH_REFID = PA.PPH_REFID "
                    + "AND IC.IC_TYPE = ? "
                    + "GROUP BY PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, PPH.PPH_PTJ, PPH.PPH_REFID";
            String param_select_int[] = { pre_interview };
            ArrayList<ArrayList<String>> data_select_int = mc.getQuery(sql_select_int, param_select_int);
            %>
            <table id="intList" class="table-bordered" width="100%">
                <thead>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">Interview</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Interviews Committee</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">More Detail</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Publish</th>
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
                    int a, b, total;
                    for(int row=0; row < data_select_int.size(); row++)
                    {
                        param_count_pa[0] = data_select_int.get(row).get(2);
                        data_count_pa = mc.getQuery(sql_count_pa, param_count_pa);
                        %>
                        <tr>
                            <td style="vertical-align: middle; text-align: center"><%=row+1 %></td>
                            <td style="vertical-align: middle; text-align: center">INTERVIEW <%=row+1 %></td>
                            <td style="vertical-align: middle"><%=data_select_int.get(row).get(0) %></td>
                            <td style="vertical-align: middle"><%=data_select_int.get(row).get(1) %></td>
                            <td style="vertical-align: middle"><%=data_select_int.get(row).get(4) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_select_int.get(row).get(3) %></td>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-default form-control" href="process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid=<%=data_select_int.get(row).get(5) %>&alert=0">Set</a></td>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-warning form-control" href="#modalDetail<%=row %>" data-toggle="modal">More Detail</a></td>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-success form-control disabled" href="#modalDetail<%=row %>" data-toggle="modal">Publish</a></td>
                        </tr>
                        <%
                    }
                }
                %>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-sm-12"><h1>INVITATION LIST</h1></div>
            <table id="invite_list" class="table-bordered" width="100%">
                <thead>
                <tr style="vertical-align: middle;">
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Grade</th>
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Position</th>
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="20%">PTJ</th>
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Date</th>
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Start</th>
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">End</th>
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Venue</th>
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Invited As</th>
                    <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Action</th>
                </tr>
                </thead>
                <tbody>
                    <%
                    %>
                    <tr>
                        <td colspan="2" style="vertical-align: middle; text-align: center">1</td>
                        <td colspan="2" style="vertical-align: middle; text-align: center">DS45-A</td>
                        <td colspan="2" style="vertical-align: middle">PENSYARAH UNIVERSITI</td>
                        <td colspan="2" style="vertical-align: middle">FAKULTI SISTEM KOMPUTER & KEJURUTERAAN PERISIAN</td>
                        <td colspan="2" style="vertical-align: middle">30/01/2016</td>
                        <td colspan="2" style="vertical-align: middle; text-align: center">8:00AM</td>
                        <td colspan="2" style="vertical-align: middle; text-align: center">12:00PM</td>
                        <td colspan="2" style="vertical-align: middle; text-align: center">HR BUILDING</td>
                        <td colspan="2" style="vertical-align: middle; text-align: center">CHAIRMAN</td>
                        <td style="vertical-align: middle; text-align: center"><a class="btn btn-success form-control" href="#">Accept</a></td>
                        <td style="vertical-align: middle; text-align: center"><a class="btn btn-warning form-control" href="#">Reject</a></td>
                    </tr>
                    <%
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Start Modal -->
<!-- Modal Detail -->
<%
if(data_select_int.size() > 0)
{
    String sql_count_pa = "SELECT COUNT(IR.IR_REFID) "
                            + "FROM INTERVIEW_RESULT IR "
                            + "WHERE IR.IC_REFID = ? ";
    String[] param_count_pa = new String[1];
    ArrayList<ArrayList<String>> data_count_pa;
    int a, b, total;
    for(int row=0; row < data_select_int.size(); row++)
    {
        param_count_pa[0] = data_select_int.get(row).get(2);
        data_count_pa = mc.getQuery(sql_count_pa, param_count_pa);
        %>
        <div id="modalDetail<%=row %>" class="modal fade" role="dialog">
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
                        </fieldset>
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
<!-- End Modal -->

<script type="text/javascript">
$(document).ready(function()
{
    
    $("#setup").prop('disabled', true);
    $('#pos_list').DataTable();
    $('#intList').DataTable();
    $('#invite_list').DataTable();
    //$('#setup').attr('disabled','disabled');
});

function checkTotalCheckedBoxes()
{
     var checkLength = 0;
     var boxes = document.getElementById("pos_list").getElementsByTagName("input");
     for (var i = 0; i < boxes.length; i++)
     {
         boxes[i].checked ? checkLength++ : null;
     }

     if(checkLength > 0)
     {
         $("#setup").prop('disabled', false);
     }
     else if(checkLength == 0)
     {
         $("#setup").prop('disabled', true);
     }

     //alert (checkLength + " boxes are checked." );
}
</script>