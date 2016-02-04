<%-- 
    Document   : e_int_criteria_bank
    Created on : Feb 4, 2016, 4:58:28 PM
    Author     : Habib
--%>

<%@page import="controller.Session"%>
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
            <ul class="nav nav-tabs">
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_list.jsp">PUBLISHED INTERVIEW</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_to_setup_list.jsp">POSITION TO SETUP</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">SAVED SETUP POSITION</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">MY INVITATION</a></li>
              <li class="active"><a>CRITERIA BANK</a></li>
            </ul>
        </div>
        <div class="row">
            
        </div>
        <div class="row">
            <table class="table-bordered" id="publishedList" width="100%">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Interview Session</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Date</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Start</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">End</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Action</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function()
{
    $('#criteriaList').DataTable();
});
</script>