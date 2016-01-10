<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>
<%@page import="config.Config"%>

<%
    String sC_refid = "";
    String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();
    String sql = "SELECT "
            + "PPH.PPH_POSITION, F.F_INTUNI, PA.PA_STATUS, PA.PA_REFID, C.C_REFID "
            + "FROM LOGIN L,CANDIDATE C, POS_APPLIED PA,POSITION_PTJ_HR PPH,FILTER F "
            + "WHERE C.C_REFID=L.C_REFID "
            + "AND C.C_REFID=PA.C_REFID "
            + "AND PPH.PPH_REFID=PA.PPH_REFID "
            + "AND PA.PA_REFID=F.PA_REFID "
            + "AND F.F_STATUS='pass' "
            + "AND L.L_REFID = ? ";
    
    String params[] = { l_refid };

    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
    
    boolean accepted = false;
    String display_btn = "";
    String display_action = "";
    String display_title = "";
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
                        <th rowspan="2" style="text-align:center; vertical-align: middle; width:5%">No.</th>
                        <th rowspan="2" style="text-align:center; vertical-align: middle; width:70%">Offered Position</th>
                        <th colspan="3" style="text-align:center;width:15%">Form</th>
                        <th rowspan="2" colspan="2" style="text-align:center; vertical-align: middle; width:10%">Action</th>
                        <th rowspan="2" style="text-align:center; vertical-align: middle; width:10%">Offered Date</th>
                    </tr>
                    <tr>
                        <th style="text-align:center;width:5%">A</th>
                        <th style="text-align:center;width:5%">B</th>
                        <th style="text-align:center;width:5%">C</th>
                    </tr>
                </thead>
                <tbody>
                <!--Data from DB. Below rows to be remarked upon DB connection.-->
                <%
                if(data.size()>0)
                {
                    for(int row=0; row<data.size(); row++)
                    {
                        if(data.get(row).get(2).equalsIgnoreCase("Accepted"))
                        {
                            display_action = "disabled";
                            display_btn = "display";
                        }
                        else if(data.get(row).get(2).equalsIgnoreCase("Rejected"))
                        {
                            display_action = "disabled";
                            display_btn = "disabled";
                        }
                        else if(data.get(row).get(2).equalsIgnoreCase("Pending"))
                        {
                            display_action = "display";
                            display_btn = "disabled";
                            display_title = "Please Accept The Offer To Enable This Link";
                        }
                        %>
                        <tr>
                        <td rowspan="2" style="vertical-align: middle; text-align: center"><%= row+1 %></td>
                        <td rowspan="2" style="vertical-align: middle"><%=data.get(row).get(0) %></td>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a target="_blank" href="<%=Config.getBase_url(request) %>assets/uploads/files/pdftest.pdf" class="btn btn-sm <%=display_btn %>">Download</a></td>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a target="_blank" href="<%=Config.getBase_url(request) %>assets/uploads/files/pdftest.pdf" class="btn btn-sm <%=display_btn %>">Download</a></td>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a target="_blank" href="<%=Config.getBase_url(request) %>assets/uploads/files/pdftest.pdf" class="btn btn-sm <%=display_btn %>">Download</a></td>
                        <%
                        if(data.get(row).get(2).equalsIgnoreCase("Pending"))
                        {
                            %>
                            <td rowspan="2" style="vertical-align: middle"><a title="Accept Offer" data-toggle="modal" href="#acceptModal" data-pa_refid="<%=data.get(row).get(3) %>" data-c_refid="<%=data.get(row).get(4) %>" class="open-acceptModal btn btn-sm <%=display_action %>">Accept</a></td>
                            <td rowspan="2" style="vertical-align: middle"><a title="Reject Offer" data-toggle="modal" href="#rejectModal" data-id="<%=data.get(row).get(3) %>" class="open-rejectModal btn btn-sm <%=display_action %>">Reject</a></td>
                            <%
                        }
                        else if(data.get(row).get(2).equalsIgnoreCase("Accepted"))
                        {
                            %>
                            <td rowspan="2" colspan="2" style="vertical-align: middle; text-align: center; color: #5b9909; font-weight: bold">Offer <%=data.get(row).get(2) %></td>
                            <%
                        }
                        else if(data.get(row).get(2).equalsIgnoreCase("Rejected"))
                        {
                            %>
                            <td rowspan="2" colspan="2" style="vertical-align: middle; text-align: center; color: #F00; font-weight: bold">Offer <%=data.get(row).get(2) %></td>
                            <%
                        }
                        %>
                        <td rowspan="2" style="vertical-align: middle; text-align: center"><%=data.get(row).get(1) %></td>
                        </tr>
                        <tr>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a href="#!" data-toggle="modal" data-target="#myModal1" class="btn btn-sm <%=display_btn %>">Upload</a></td>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a href="#!" data-toggle="modal" data-target="#myModal2" class="btn btn-sm <%=display_btn %>">Upload</a></td>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a href="#!" data-toggle="modal" data-target="#myModal3" class="btn btn-sm <%=display_btn %>">Upload</a></td>
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

<!-- Modal Dialog -->
<!-- Upload Form A -->
<div id="myModal1" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="">
                <div class="modal-header">
                    <h4 class="modal-title">Upload Form</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <legend>Form A:</legend>
                        <label for="id">Files</label>
                        <input type="file" name="form_a_file" class="form-control" data-icon="true">
                        <!--<input type="text" id="c_icno" name="c_icno" class="form-control" placeholder="Identification Number &nbsp;/&nbsp; Passport Number">-->
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Upload</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Upload Form B -->
<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="">
                <div class="modal-header">
                    <h4 class="modal-title">Upload Form</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <legend>Form B:</legend>
                        <label for="id">Files</label>
                        <input type="file" name="form_a_file" class="form-control" data-icon="true">
                        <!--<input type="text" id="c_icno" name="c_icno" class="form-control" placeholder="Identification Number &nbsp;/&nbsp; Passport Number">-->
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Upload</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Upload Form C -->
<div id="myModal3" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="">
                <div class="modal-header">
                    <h4 class="modal-title">Upload Form</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <legend>Form C:</legend>
                        <label for="id">Files</label>
                        <input type="file" name="form_a_file" class="form-control" data-icon="true">
                        <!--<input type="text" id="c_icno" name="c_icno" class="form-control" placeholder="Identification Number &nbsp;/&nbsp; Passport Number">-->
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Upload</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Accept Modal -->
<div id="acceptModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            
                <div class="modal-header">
                    <br>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <center>
                            <h4 class="modal-title">
                            <%
                                /* If Candidate Having more than one offer */
                                if(data.size() > 1)
                                {
                                    sC_refid = data.get(0).get(4);
                                    String sql2 = "SELECT * "
                                            + "FROM POS_APPLIED "
                                            + "WHERE PA_STATUS='Pending' "
                                            + "AND C_REFID = ? ";
                                    String params2[] = { sC_refid };
                                    ArrayList<ArrayList<String>> data2 = mc.getQuery(sql2, params2);
                                    /* If Candidate Having more than one PENDING offer */
                                    if(data2.size() > 1)
                                    {
                                        %>
                                        <span style="font-size: 80%; font-weight: bold">We Are Considered That You Are Rejecting Another Offer If You</span>
                                        <%
                                    }
                                }
                            %>
                            <span style="color: #5b9909; font-weight: bold"> Accept</span><span style="font-size: 80%; font-weight: bold"> This Offer. <br> Are You Sure ?</span></h4>
                            <form method="post" action="process/cand/eOffer/e_off_accept_process.jsp">
                                <input type="hidden" name="pa_refid" id="pa_refid" value="">
                                <input type="hidden" name="c_refid" id="c_refid" value="">
                                <button type="submit" name="accept_confirm" value="confirm" class="btn btn-success">Confirm</button>
                                &nbsp;
                                <button type="button" data-dismiss="modal" class="btn btn-default">Not Yet</button>
                            </form>
                        </center>
                    </fieldset>
                </div>
        </div>
    </div>
</div>

<!-- Reject Modal -->
<div id="rejectModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="process/cand/eOffer/e_off_reject_process.jsp">
                <div class="modal-header">
                    <br>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <center>
                            <h4 class="modal-title"><span style="color: red; font-weight: bold">Reject</span><span style="font-size: 80%; font-weight: bold"> This Offer. <br> Are You Sure ?</span></h4>
                            <input type="hidden" name="pa_refid" id="pa_refid" value="">
                            <button type="submit" name="reject_confirm" value="confirm" class="btn btn-danger">Confirm</button>
                            &nbsp;
                            <button type="button" data-dismiss="modal" class="btn btn-default">Not Yet</button>
                        </center>
                    </fieldset>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End for modal dialog -->



<!-- Script for pass value to modal -->
<script type="text/javascript">
$(document).on("click", ".open-acceptModal", function ()
{
    var pa_refid = $(this).data('pa_refid');
    $(".modal-body #pa_refid").val( pa_refid );
    
    var c_refid = $(this).data('c_refid');
    $(".modal-body #c_refid").val( c_refid );
});

$(document).on("click", ".open-rejectModal", function ()
{
    var pa_refid = $(this).data('id');
    $(".modal-body #pa_refid").val( pa_refid );
});
</script>


