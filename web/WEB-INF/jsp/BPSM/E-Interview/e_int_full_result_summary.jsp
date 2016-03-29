<%-- 
    Document   : e_int_pre_interview_result
    Created on : Feb 7, 2016, 11:14:53 AM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String is_refid = session.getAttribute("is_refid").toString();
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
                    + "GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, dm.dm_dept_desc, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, vpp.vpp_total";
    String param_position_list[] = { is_refid };
    ArrayList<ArrayList<String>> data_position_list = mc.getQuery(sql_position_list, param_position_list);
    
    String sql_total_pass = "SELECT irm.irm_refid "
                        + "FROM interview_setup iss, interview_result_mark irm, pos_applied pa, position_ptj_hr pph "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND pph.pph_refid = pa.pph_refid "
                        + "AND iss.is_refid = ? "
                        + "AND irm.irm_status = ? "
                        + "AND pph.pph_refid = ? ";
    String[] param_total_pass = new String[3];
    ArrayList<ArrayList<String>> data_total_pass;
    
    String sql_total_fail = "SELECT irm.irm_refid "
                        + "FROM interview_setup iss, interview_result_mark irm, pos_applied pa, position_ptj_hr pph "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND pph.pph_refid = pa.pph_refid "
                        + "AND iss.is_refid = ? "
                        + "AND irm.irm_status = ? "
                        + "AND pph.pph_refid = ? ";
    String[] param_total_fail = new String[3];
    ArrayList<ArrayList<String>> data_total_fail;
    
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="process.jsp?p=BPSM/E-Interview/e_int_published_list.jsp" class="btn btn-default">Back</a></div>
        </div>
        <br/>
        <div class="row" align="center">
            <h4>INTERVIEW RESULT SUMMARY</h4>
            <hr/>
        </div>
        <br/>
        <div class="row" style="font-size: small">
            <div class="col-md-6">
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
        <div class="row" align="center">
            <table style="width: 98%; background-color: white" class="table table-bordered">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">Grade</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                        <th colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">Result</th>
                        <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Detail</th>
                    </tr>
                     <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 5%">Pass</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 5%">Fail</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for(int a = 0; a < data_position_list.size(); a++)
                {
                    param_total_pass[0] = is_refid;
                    param_total_pass[1] = pass;
                    param_total_pass[2] = data_position_list.get(a).get(0);
                    data_total_pass = mc.getQuery(sql_total_pass, param_total_pass);
                    
                    param_total_fail[0] = is_refid;
                    param_total_fail[1] = fail;
                    param_total_fail[2] = data_position_list.get(a).get(0);
                    data_total_fail = mc.getQuery(sql_total_fail, param_total_fail);
                    %>
                    <tr>
                        <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                        <td style="vertical-align: middle"><%=data_position_list.get(a).get(1) %></td>
                        <td style="vertical-align: middle"><%=data_position_list.get(a).get(2) %></td>
                        <td style="vertical-align: middle"><%=data_position_list.get(a).get(3) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_total_pass.size() %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data_total_fail.size() %></td>
                        <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_full_result_detail.jsp&is_refid=<%=is_refid %>&pph_refid=<%=data_position_list.get(a).get(0) %>" class="btn btn-default form-control">Detail</a></td>
                    </tr>
                    <%
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>