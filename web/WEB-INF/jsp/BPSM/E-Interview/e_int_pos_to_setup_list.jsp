<%-- 
    Document   : e_int_pos_to_setup_list
    Created on : Feb 4, 2016, 3:15:29 PM
    Author     : Habib
--%>

<%
MainClient mc = new MainClient(DBConn.getHost());

String rejected = "REJECTED";
String sql_interview_saved_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iss.is_status "
                            +"FROM interview_setup iss, interview_result_mark irm, pos_applied pa, position_ptj_hr pph "
                            +"WHERE iss.is_refid = irm.is_refid "
                            +"AND pa.pa_refid = irm.pa_refid "
                            +"AND pph.pph_refid = pa.pph_refid "
                            +"AND pph.pph_refid = ? "
                            +"GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iss.is_status";
String[] param_interview_saved_list = new String[1];
ArrayList<ArrayList<String>> data_interview_saved_list;

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
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_published_list.jsp">PUBLISHED INTERVIEW</a></li>
              <li class="active"><a>POSITION READY TO SETUP</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">SAVED SETUP INTERVIEW</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">MY INVITATION</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_criteria_bank.jsp">CRITERIA BANK</a></li>
            </ul>
        </div>
        
        <div class="row">
            <div class="col-sm-12"><h4>POSITION TO BE SETUP LIST</h4></div>
            <!-- Tab List Position -->
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
                        int num = 1;
                        for(int row = 0; row < data_pos_list.size(); row++)
                        {
                            param_count_pass[0] = pass_ptj;
                            param_count_pass[1] = data_pos_list.get(row).get(3);
                            data_count_pass = mc.getQuery(sql_count_pass, param_count_pass);
                            
                            param_interview_saved_list[0] = data_pos_list.get(row).get(3);
                            data_interview_saved_list = mc.getQuery(sql_interview_saved_list, param_interview_saved_list);
                            
                            if(data_interview_saved_list.size() > 0)
                            {
                                if(data_interview_saved_list.get(0).get(4).equals(rejected))
                                {
                                    %>
                                    <tr>
                                        <td style="vertical-align: middle; text-align: center"><%=num %></td>
                                        <td style="vertical-align: middle; text-align: center"><%=data_pos_list.get(row).get(0) %></td>
                                        <td style="vertical-align: middle"><%=data_pos_list.get(row).get(1) %></td>
                                        <td style="vertical-align: middle"><%=data_pos_list.get(row).get(2) %></td>
                                        <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_ptj_pass_list.jsp&pph_refid=<%=data_pos_list.get(row).get(3) %>"><%=data_count_pass.get(0).get(0) %></a></td>
                                        <td style="vertical-align: middle; text-align: center"><input type="checkbox" onclick="checkTotalCheckedBoxes();" id="selected_pos" name="selected_pos" value="<%=data_pos_list.get(row).get(3) %>"></td>
                                    </tr>
                                    <% 
                                    num++;
                                }
                            }
                            else
                            {
                                 %>
                                <tr>
                                    <td style="vertical-align: middle; text-align: center"><%=num %></td>
                                    <td style="vertical-align: middle; text-align: center"><%=data_pos_list.get(row).get(0) %></td>
                                    <td style="vertical-align: middle"><%=data_pos_list.get(row).get(1) %></td>
                                    <td style="vertical-align: middle"><%=data_pos_list.get(row).get(2) %></td>
                                    <td style="vertical-align: middle; text-align: center"><a href="process.jsp?p=BPSM/E-Interview/e_int_ptj_pass_list.jsp&pph_refid=<%=data_pos_list.get(row).get(3) %>"><%=data_count_pass.get(0).get(0) %></a></td>
                                    <td style="vertical-align: middle; text-align: center"><input type="checkbox" onclick="checkTotalCheckedBoxes();" id="selected_pos" name="selected_pos" value="<%=data_pos_list.get(row).get(3) %>"></td>
                                </tr>
                                <% 
                                num++;
                            }
                        }
                    }
                    %>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function()
{
    $("#setup").prop('disabled', true);
    $('#pos_list').DataTable();
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
     else if(checkLength === 0)
     {
         $("#setup").prop('disabled', true);
     }
     //alert (checkLength + " boxes are checked." );
}
</script>