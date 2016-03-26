<%-- 
    Document   : e_int_panel_start_uni_pos_list
    Created on : Mar 27, 2016, 2:03:31 AM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
String is_refid = session.getAttribute("is_refid").toString();
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
                    + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, dm.dm_dept_desc, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type";
String param_position_list[] = { is_refid };
ArrayList<ArrayList<String>> data_position_list = mc.getQuery(sql_position_list, param_position_list);

String pass_int_ptj = "PASS_INT_PTJ";
String is_type_uni = "UNIVERSITY";
String cand_status_accepted = "22";
String sql_cand_list    = "SELECT c.c_name, l.l_icno, iii.iii_mark, iii.iii_status, iii.iii_reason, irm.irm_refid, ipl.ipl_refid "
                        + "FROM login1 l, candidate c, pos_applied pa, position_ptj_hr pph, interview_result_mark irm, interview_setup iss, interview_irm_icm iii, interview_panel_list ipl, filter f "
                        + "WHERE pph.pph_refid = pa.pph_refid "
                        + "AND pa.pa_refid = f.pa_refid "
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
                        + "AND irm.irm_cand_status = ? "
                        + "AND f.f_intvptj_status = ? ";
String[] param_cand_list = new String[6];
param_cand_list[0] = is_refid;
param_cand_list[2] = ipl_refid;
param_cand_list[3] = is_type_uni;
param_cand_list[4] = cand_status_accepted;
param_cand_list[5] = pass_int_ptj;
ArrayList<ArrayList<String>> data_cand_list;
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
            <table style="background-color: white; font-size: small" class="table table-bordered" id="candidate_list" width="100%">
            <thead style="vertical-align: middle;">
                <tr style="vertical-align: middle;">
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 5%">Grade</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Status</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Total Candidate</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                </tr>
            </thead>
            <tbody>
            <%    
            for(int a = 0; a < data_position_list.size(); a++)
            {
                boolean completed = false;
                String status = "";
                String color = "";
                param_cand_list[1] = data_position_list.get(a).get(0);
                data_cand_list = mc.getQuery(sql_cand_list, param_cand_list);
                
                if(data_cand_list.get(0).get(2) != null && data_cand_list.get(0).get(3) != null)
                {
                    completed = true;
                    status = "DONE";
                    color = "color: limegreen";
                }
                else
                {
                    status = "IN PROGRESS";
                }
                %>
                <tr>
                    <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                    <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(a).get(1) %></td>
                    <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(a).get(2) %></td>
                    <td style="vertical-align: middle; text-align: center"><%=data_position_list.get(a).get(3) %></td>
                    <td style="vertical-align: middle; text-align: center; font-weight: bold; <%=color %>"><%=status %></td>
                    <td style="vertical-align: middle; text-align: center"><%=data_cand_list.size() %></td>
                    <td style="vertical-align: middle; text-align: center">
                        <a class="btn btn-primary form-control" href="process.jsp?p=BPSM/E-Interview/e_int_panel_start_uni.jsp&is_refid=<%=is_refid %>&ipl_refid=<%=ipl_refid %>&pph_refid=<%=data_position_list.get(a).get(0) %>">Start</a>
                    </td>
                </tr>
                <%
            }
            %>
            </tbody>
            </table>
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