
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>
<%  
    String filter_stat_pass = "PASS ALL";
    String pa_stat_pending = "OFFER PENDING";
    String pa_stat_accepted = "OFFER ACCEPTED";
    String pa_stat_rejected = "OFFER REJECTED";
    String pa_stat_offerSent = "OFFER SENT";
    String action_send_btn = "disabled";
    String action_setup_btn = "active";
    
    String sql = "SELECT PPH.PPH_POSITION, F.F_INTUNI, C.C_NAME, PA.PA_STATUS, PA.PA_REFID, PPH.PPH_GRADE, PPH.PPH_PTJ, "
            + "L.L_ICNO ,PA.PA_CAMPUS, PA.PA_SALARY, PA.PA_JOB_STATUS "
            + "FROM LOGIN1 L,CANDIDATE C, POS_APPLIED PA, POSITION_PTJ_HR PPH, FILTER F "
            + "WHERE C.C_REFID=L.C_REFID "
            + "AND C.C_REFID=PA.C_REFID "
            + "AND PPH.PPH_REFID=PA.PPH_REFID "
            + "AND PA.PA_REFID=F.PA_REFID "
            + "AND F.F_STATUS= ? ";
    String params[] = { filter_stat_pass };
    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
%>

<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>OFFER LIST</h1></div>
        </div>
        <!-- /.row -->
        <div class="row">
            <table class="table table-bordered" width="100%">
                <thead>
                    <tr>
                        <th style="text-align:center; vertical-align: middle; width:1%">No.</th>
                        <th style="text-align:center; vertical-align: middle; width:5%">Grade</th>
                        <th style="text-align:center; vertical-align: middle; width:25%">Position</th>
                        <th style="text-align:center; vertical-align: middle; width:5%">PTJ</th>
                        <th style="text-align:center; vertical-align: middle; width:25%">Candidate Name</th>
                        <th style="text-align:center; vertical-align: middle; width:10%">IC Number</th>
                        <th style="text-align:center; vertical-align: middle; width:10%">Offer Status</th>
                        <th style="text-align:center; vertical-align: middle; width:10%" colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                <!--Data from DB. Below rows to be remarked upon DB connection.-->
                <%
                if(data.size()>0)
                {
                    for(int row=0; row<data.size(); row++)
                    {
                        action_send_btn = "disabled";
                        action_setup_btn = "active";
                        %>
                        <tr>
                        <td style="vertical-align: middle; text-align: center"><%= row+1 %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data.get(row).get(5) %></td>
                        <td style="vertical-align: middle"><%=data.get(row).get(0) %></td>
                        <td style="vertical-align: middle"><%=data.get(row).get(6) %></td>
                        <td style="vertical-align: middle"><%=data.get(row).get(2) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data.get(row).get(7) %></td>
                        <%
                        if(data.get(row).get(3).equalsIgnoreCase(pa_stat_accepted))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center;font-weight: bold; color: green"><%=data.get(row).get(3) %></td>
                            <%
                        }
                        else if(data.get(row).get(3).equalsIgnoreCase(pa_stat_rejected))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center;font-weight: bold; color: red"><%=data.get(row).get(3) %></td>
                            <%
                        }
                        else if(data.get(row).get(3).equalsIgnoreCase(pa_stat_pending))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold;"><%=data.get(row).get(3) %></td>
                            <%
                        }
                        else if(data.get(row).get(3).equalsIgnoreCase(pa_stat_offerSent))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold; color: orange"><%=data.get(row).get(3) %></td>
                            <%
                        }
                        
                        if(!data.get(row).get(3).equalsIgnoreCase(pa_stat_pending))
                        {
                            %>
                            <td colspan="2" style="vertical-align: middle; text-align: center; font-weight: bold;"><a data-toggle="modal" href="#modalSend_<%=row %>" class="open-modalSend_<%=row %> btn btn-primary <%=action_setup_btn %>">Preview Offer</a></td>
                            <%
                        }
                        else
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold;"><a data-toggle="modal" href="#modalSetup_<%=row %>" class="open-modalSetup_<%=row %> btn btn-primary <%=action_setup_btn %>">Setup Offer</a></td>
                            <%
                            if(data.get(row).get(9) != null)
                            {
                                action_send_btn = "active";
                            }
                            else
                            {
                                action_send_btn = "disabled";
                            }
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold;"><a data-toggle="modal" href="#modalSend_<%=row %>"  class="open-modalSend_<%=row %> btn btn-primary <%=action_send_btn %>">Send Offer</a></td>
                            </tr>
                            <%
                        }
                    }
                }
                else
                {
                    %>
                    <tr>
                        <td colspan="7" style="font-weight: bold; vertical-align: middle; text-align: center; color: red">No Offer</td>
                    </tr>
                    <%
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%
String sql_ap = "SELECT AP.AP_REFID, AP.AP_DESC, AP.AP_ALLOWANCE "
                + "FROM ALLOWANCE_POS AP "
                + "WHERE AP.PA_REFID = ? ";
String[] ap_params = new String[1];
ArrayList<ArrayList<String>> ap_data;
if(data.size()>0)
{
    for(int row3 = 0; row3 < data.size() ; row3++)
    {
        ap_params[0] = data.get(row3).get(4);
        ap_data = mc.getQuery(sql_ap, ap_params);
        %>
        <div id="modalSetup_<%=row3 %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Setup Offer Detail</h4>
                        </div>
                    <form method="post" action="process/bpsm/eOffer/eOff_setup_process.jsp" class="form-horizontal">
                        <div class="modal-body">
                            <fieldset>
                                <input type="hidden" name="pa_refid" class="form-control" value="<%=data.get(row3).get(4) %>">
                                <div class="form-group">
                                    <label class="col-md-2">Grade</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(5) %> </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">Position</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(0) %> </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">PTJ</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(6) %> </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">Candidate Name</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(2) %> </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">IC Number</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(7) %> </label>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-md-2">Job Status</label><label class="col-md-1">:</label>
                                    <div class="col-md-9">
                                        <select name="pa_job_status" class="form-control">
                                            <%
                                            String lm_desc1 = "Job Status";
                                            String sql_job_status = "SELECT LD.LD_DESC "
                                                    + "FROM LOOKUP_DETAIL LD, LOOKUP_MASTER LM "
                                                    + "WHERE LM.LM_REFID = LD.LM_REFID "
                                                    + "AND LM.LM_DESC = ? ";
                                            String param_job_status[] = { lm_desc1 };
                                            ArrayList<ArrayList<String>> data_job_status = mc.getQuery(sql_job_status, param_job_status);
                                            for(int row11=0; row11<data_job_status.size(); row11++)
                                            {
                                                if(data.get(row3).get(10) != null)
                                                {
                                                    if(data.get(row3).get(10).equalsIgnoreCase(data_job_status.get(row11).get(0)))
                                                    {
                                                        %>
                                                        <option selected value="<%=data_job_status.get(row11).get(0) %>"><%=data_job_status.get(row11).get(0) %></option>
                                                        <%
                                                    }
                                                    else
                                                    {
                                                        %>
                                                        <option value="<%=data_job_status.get(row11).get(0) %>"><%=data_job_status.get(row11).get(0) %></option>
                                                        <%
                                                    }
                                                }
                                                else
                                                {
                                                    %>
                                                    <option value="<%=data_job_status.get(row11).get(0) %>"><%=data_job_status.get(row11).get(0) %></option>
                                                    <%
                                                }
                                            }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-md-2">Campus</label><label class="col-md-1">:</label>
                                    <div class="col-md-9">
                                        <select name="pa_campus" class="form-control">
                                            <%
                                            String lm_desc = "Campus";
                                            String sql_campus = "SELECT LD.LD_DESC "
                                                    + "FROM LOOKUP_DETAIL LD, LOOKUP_MASTER LM "
                                                    + "WHERE LM.LM_REFID = LD.LM_REFID "
                                                    + "AND LM.LM_DESC = ? ";
                                            String param_campus[] = { lm_desc };
                                            ArrayList<ArrayList<String>> data_campus = mc.getQuery(sql_campus, param_campus);
                                            for(int row1=0; row1<data_campus.size(); row1++)
                                            {
                                                if(data.get(row3).get(8) != null)
                                                {
                                                    if(data.get(row3).get(8).equalsIgnoreCase(data_campus.get(row1).get(0)))
                                                    {
                                                        %>
                                                        <option selected value="<%=data_campus.get(row1).get(0) %>"><%=data_campus.get(row1).get(0) %></option>
                                                        <%
                                                    }
                                                    else
                                                    {
                                                        %>
                                                        <option value="<%=data_campus.get(row1).get(0) %>"><%=data_campus.get(row1).get(0) %></option>
                                                        <%
                                                    }
                                                }
                                                else
                                                {
                                                    %>
                                                    <option value="<%=data_campus.get(row1).get(0) %>"><%=data_campus.get(row1).get(0) %></option>
                                                    <%
                                                }
                                            }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">Salary (RM)</label><label class="col-md-1">:</label>
                                    <div class="col-md-9">
                                        <%
                                        if(data.get(row3).get(9) != null)
                                        {
                                            %>
                                            <input type="text" name="pa_salary" class="form-control" value="<%=data.get(row3).get(9) %>" placeholder="Example : 1500" required>
                                            <%
                                        }
                                        else
                                        {
                                            %>
                                            <input type="text" name="pa_salary" class="form-control" placeholder="Example : 1500" required>
                                            <%
                                        }
                                        %>
                                    </div>
                                </div>
                                        <br>
                                        
                                <div class="form-group">
                                    <label class="col-md-6" style="text-align: center">Allowance Name</label><label class="col-md-6">Allowance Amount (RM)</label>
                                </div>
                                
                                <%
                                if(ap_data.size() > 0)
                                {
                                    int counter = ap_data.size() ;
                                    %>
                                    <div class="form-group" id="ap_group_<%=counter %>">
                                        <div class="col-xs-6">
                                            <input value="<%=ap_data.get(counter-1).get(1) %>" type="text" name="ap_desc_<%=counter %>" class="form-control" placeholder="Example : Travel Allowance" required>
                                        </div>
                                        <div class="col-xs-4">
                                            <input value="<%=ap_data.get(counter-1).get(2) %>" type="text" name="ap_allowance_<%=counter %>" class="form-control" placeholder="Example : 120" required>
                                        </div>
                                        <div class="col-xs-2">
                                            <button type="button" id="btn_ap_<%=counter %>" class="btn btn-default form-control addButton"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                    <input type="hidden" name="ap_size" id="ap_size" value="<%=counter %>" />
                                    <%
                                }
                                else
                                {
                                    int counter = 1 ;
                                    %>
                                    <div class="form-group" id="ap_group_<%=counter %>">
                                        <div class="col-xs-6">
                                            <input type="text" name="ap_desc_<%=counter %>" class="form-control" placeholder="Example : Travel Allowance" required>
                                        </div>
                                        <div class="col-xs-4">
                                            <input type="text" name="ap_allowance_<%=counter %>" class="form-control" placeholder="Example : 120" required>
                                        </div>
                                        <div class="col-xs-2">
                                            <button type="button" id="btn_ap_<%=counter %>" class="btn btn-default form-control addButton"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                    <input type="hidden" name="ap_size" id="ap_size" value="<%=counter %>" />
                                    <%
                                }
                                %>
                                <!--<input type="text" id="c_icno" name="c_icno" class="form-control" placeholder="Identification Number &nbsp;/&nbsp; Passport Number">-->
                            

                            </fieldset>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default">Save</button>
                        </div>
                                        </form>
                </div>
            </div>
        </div>
        <%
    }
}
%>
                
<%
String sql_ap1 = "SELECT AP.AP_REFID, AP.AP_DESC, AP.AP_ALLOWANCE "
                + "FROM ALLOWANCE_POS AP "
                + "WHERE AP.PA_REFID = ? ";
String[] ap_params1 = new String[1];
ArrayList<ArrayList<String>> ap_data1;
if(data.size()>0)
{
    for(int row3 = 0; row3 < data.size() ; row3++)
    {
        ap_params1[0] = data.get(row3).get(4);
        ap_data1 = mc.getQuery(sql_ap1, ap_params1);
        %>
        <div id="modalSend_<%=row3 %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Offer Detail</h4>
                        </div>
                    <form method="post" action="process/bpsm/eOffer/eOff_send_process.jsp" class="form-horizontal">
                        <div class="modal-body">
                            <fieldset>
                                <input type="hidden" name="pa_refid" class="form-control" value="<%=data.get(row3).get(4) %>">
                                <div class="form-group">
                                    <label class="col-md-2">Grade</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(5) %> </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">Position</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(0) %> </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">PTJ</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(6) %> </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">Candidate Name</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(2) %> </label>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-md-2">IC Number</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(7) %> </label>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-md-2">Job Status</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(10) %></label>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-md-2">Campus</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(8) %></label>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-md-2">Salary (RM)</label><label class="col-md-1">:</label>
                                    <label class="col-md-9"><%=data.get(row3).get(9) %></label>
                                </div>
                                        <br>
                                <div class="form-group">
                                    <label class="col-md-2">Allowance List</label><label class="col-md-1">:</label>
                                    <div class="col-md-9">
                                    <table class="table table-bordered" width="100%">
                                    <tr>
                                        <th style="text-align:center; vertical-align: middle; width:60%">Allowance Name</th>
                                        <th style="text-align:center; vertical-align: middle; width:40%">Allowance</th>
                                    </tr>
                                    <%
                                    for(int ap_row1 = 0; ap_row1 < ap_data1.size(); ap_row1++)
                                    {
                                        %>
                                        <tr>
                                        <td style="vertical-align: middle;"><%=ap_data1.get(ap_row1).get(1) %></td>
                                        <td style="vertical-align: middle; text-align: center"> RM <%=ap_data1.get(ap_row1).get(2) %></td>
                                        </tr>
                                        <%
                                    }
                                    %>
                                    </table>
                                    </div>
                                </div>
                                
                            </fieldset>
                        </div>
                        <%
                        if(data.get(row3).get(3).equalsIgnoreCase(pa_stat_pending))
                        {
                            %>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success form-control" style="font-weight: bold">Send Offer</button>
                            </div>
                            <%
                        }
                        %>
                    </form>
                </div>
            </div>
        </div>
        <%
    }
}
%>
                
<script type="text/javascript">
$(document).on("click", ".open-sendModal", function ()
{
    var pa_refid = $(this).data('pa_refid');
    $(".modal-body #pa_refid").val( pa_refid );
});

$(document).ready(function() {
    $(".addButton").click(function() {
        var ap_size = $("#ap_size").val();
        ap_size = parseInt(ap_size) + 1;
        $("#ap_group_"+(ap_size-1)).after("<div class=\"form-group\" id=\"ap_group_"+ap_size+"\"><div class=\"col-xs-6\">\n\
<input type=\"text\" name=\"ap_desc_"+ap_size+"\" class=\"form-control\" placeholder=\"Example : Travel Allowance\" \n\
required></div><div class=\"col-xs-4\"><input type=\"text\" name=\"ap_allowance_"+ap_size+"\" class=\"form-control\" \n\
placeholder=\"Example : 1500\" required></div><div class=\"col-xs-2\"><button type=\"button\" id=\"btn_ap_"+ap_size+"\" \n\
class=\"btn btn-default form-control\"><i class=\"fa fa-minus\"></i></button></div></div>\n\
<script>$(\"#btn_ap_"+ap_size+"\").click(function() { $(\"#ap_group_"+ap_size+"\").remove(); });</script\>");
        $("#ap_size").val(ap_size);
    });
});
</script>