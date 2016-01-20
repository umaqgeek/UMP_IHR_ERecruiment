
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
    String action_btn = "active";
    
    String sql = "SELECT PPH.PPH_POSITION, F.F_INTUNI, C.C_NAME, PA.PA_STATUS, PA.PA_REFID "
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
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="text-align:center; vertical-align: middle; width:5%">No.</th>
                        <th style="text-align:center; vertical-align: middle; width:40%">Candidate Name</th>
                        <th style="text-align:center; vertical-align: middle; width:40%">Offered Position</th>
                        <th style="text-align:center; vertical-align: middle; width:15%">Offer Status</th>
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
                        %>
                        <tr>
                        <td style="vertical-align: middle; text-align: center"><%= row+1 %></td>
                        <td style="vertical-align: middle"><%=data.get(row).get(2) %></td>
                        <td style="vertical-align: middle"><%=data.get(row).get(0) %></td>
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
                            <td style="vertical-align: middle; text-align: center; font-weight: bold;"><a data-toggle="modal" href="#setupModal" data-pa_refid="<%//refid value %>" class="open-setupModal btn btn-primary <%=action_btn %>">Setup Offer</a></td>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold;"><a data-toggle="modal" href="#sendModal" data-pa_refid="<%//refid value %>" class="open-sendModal btn btn-primary disabled">Send Offer</a></td>
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
                
<div id="setupModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="">
                <input type="hidden" name="pa_refid" id="pa_refid" value="">
                <div class="modal-header">
                    <h4 class="modal-title">Setup Offer</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <legend></legend>
                        <label for="pa_grade">Grade</label>
                        <input type="text" name="pa_grade" class="form-control" value="Grade" readonly>
                        <label for="position">Position</label>
                        <input type="text" name="pa_position" class="form-control" value="Position" readonly>
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
                
<script type="text/javascript">
$(document).on("click", ".open-sendModal", function ()
{
    var pa_refid = $(this).data('pa_refid');
    $(".modal-body #pa_refid").val( pa_refid );
});
</script>