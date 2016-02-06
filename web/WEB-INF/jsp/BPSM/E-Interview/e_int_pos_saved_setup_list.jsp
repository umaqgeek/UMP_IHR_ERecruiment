<%-- 
    Document   : e_int_pos_saved_setup_list
    Created on : Feb 4, 2016, 3:32:45 PM
    Author     : Habib
--%>

<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_list.jsp">PUBLISHED INTERVIEW</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_to_setup_list.jsp">POSITION TO SETUP</a></li>
              <li class="active"><a>SAVED SETUP POSITION</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">MY INVITATION</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_criteria_bank.jsp">CRITERIA BANK</a></li>
            </ul>
        </div>
        
        <div class="row">
            <div class="col-sm-12"><h4>SAVED INTERVIEW LIST</h4></div>
            <%
            MainClient mc = new MainClient(DBConn.getHost());
            String pre_interview = "UNIVERSITY";
            String sql_select_int = "SELECT PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, PPH.PPH_PTJ, PPH.PPH_REFID, "
                    + "IC.IC_STARTTIME, IC.IC_ENDTIME, IC.IC_VENUE, IC.IC_TYPE "
                    + "FROM INTERVIEW_CHAIRMAN IC, INTERVIEW_RESULT IR, POS_APPLIED PA, POSITION_PTJ_HR PPH "
                    + "WHERE IC.IC_REFID = IR.IC_REFID "
                    + "AND PA.PA_REFID = IR.PA_REFID "
                    + "AND PPH.PPH_REFID = PA.PPH_REFID "
                    + "AND IC.IC_TYPE = ? "
                    + "GROUP BY PPH.PPH_GRADE, PPH.PPH_POSITION, IC.IC_REFID, IC.IC_INTERVIEW_DATETIME, PPH.PPH_PTJ, PPH.PPH_REFID, "
                    + "IC.IC_STARTTIME, IC.IC_ENDTIME, IC.IC_VENUE, IC.IC_TYPE";
            String param_select_int[] = { pre_interview };
            ArrayList<ArrayList<String>> data_select_int = mc.getQuery(sql_select_int, param_select_int);
            %>
            <table id="intList" class="table-bordered" width="100%">
                <thead>
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="5%">Grade</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">Position</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="10%">PTJ</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Start</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">End</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Venue</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Interview Stage</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Interviews Committee</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold" width="1%">Detail</th>
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
                            <td style="vertical-align: middle"><%=data_select_int.get(row).get(0) %></td>
                            <td style="vertical-align: middle"><%=data_select_int.get(row).get(1) %></td>
                            <td style="vertical-align: middle"><%=data_select_int.get(row).get(4) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_select_int.get(row).get(3) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_select_int.get(row).get(6) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_select_int.get(row).get(7) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_select_int.get(row).get(8) %></td>
                            <td style="vertical-align: middle; text-align: center"><%=data_select_int.get(row).get(9) %></td>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-default form-control" href="process.jsp?p=BPSM/E-Interview/e_int_committee_setup.jsp&pph_refid=<%=data_select_int.get(row).get(5) %>&ic_refid=<%=data_select_int.get(row).get(2) %>&alert=0">Invite</a></td>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-warning form-control" href="#modalDetail<%=row %>" data-toggle="modal">Detail</a></td>
                            <td style="vertical-align: middle; text-align: center"><a class="btn btn-success form-control disabled" href="#modalDetail<%=row %>" data-toggle="modal">Publish</a></td>
                        </tr>
                        <%
                    }
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
                
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
<script type="text/javascript">
$(document).ready(function()
{
    $('#intList').DataTable();
});
</script>