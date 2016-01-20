
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
            + "L.L_ICNO ,PA.PA_CAMPUS, PA.PA_SALARY "
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
                            <td style="vertical-align: middle; text-align: center; font-weight: bold;"><a data-toggle="modal" href="#modalSetup_<%=row %>" class="open-modalSetup_<%=row %> btn btn-primary <%=action_setup_btn %>">Setup Offer</a></td>
                            <%
                            if(data.get(row).get(9) != null)
                            {
                                action_send_btn = "active";
                            }
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold;"><a data-toggle="modal" href="#modalSend_<%=row %>"  class="open-modalSend_<%=row %> btn btn-primary <%=action_send_btn %>">Send Offer</a></td>
                            <%
                        }
                        else if(data.get(row).get(3).equalsIgnoreCase(pa_stat_offerSent))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold;"><%=data.get(row).get(3) %></td>
                            <%
                        }
                        %>
                        </tr>
                        <%
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
                                    for(int ap_row=0; ap_row<ap_data.size(); ap_row++)
                                    {
                                        %>
                                        <div class="form-group">
                                            <div class="col-xs-6">
                                                <input value="<%=ap_data.get(ap_row).get(1) %>" type="text" name="ap_desc[]" class="form-control" placeholder="Example :" required>
                                            </div>
                                            <div class="col-xs-4">
                                                <input value="<%=ap_data.get(ap_row).get(2) %>" type="text" name="ap_allowance[]" class="form-control" placeholder="Example :" required>
                                            </div>
                                            <div class="col-xs-2">
                                                <button type="button" class="btn btn-default form-control addButton"><i class="fa fa-plus"></i></button>
                                            </div>
                                        </div>
                                        <%
                                    }
                                }
                                else
                                {
                                    int counter = 0 ;
                                    while(counter < 5)
                                    {
                                    %>
                                    <div class="form-group">
                                        <div class="col-xs-6">
                                            <input type="text" name="ap_desc[]" class="form-control" placeholder="Example : Travel Allowance" required>
                                        </div>
                                        <div class="col-xs-4">
                                            <input type="text" name="ap_allowance[]" class="form-control" placeholder="Example : 1500" required>
                                        </div>
                                        <div class="col-xs-2">
                                            <button type="button" class="btn btn-default form-control addButton"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                    <%
                                        counter++;
                                    }
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
                

                
<script type="text/javascript">
$(document).on("click", ".open-sendModal", function ()
{
    var pa_refid = $(this).data('pa_refid');
    $(".modal-body #pa_refid").val( pa_refid );
});
</script>