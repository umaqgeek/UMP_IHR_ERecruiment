<%@page import="eOffer.E_Offer_Function"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>
<%@page import="config.Config"%>

<%
    E_Offer_Function eliminate = new E_Offer_Function();
    String stat_accepted = "OFFER_ACCEPTED";
    String stat_rejected = "OFFER_REJECTED";
    String stat_pending= "OFFER_PENDING";
    String stat_sent= "OFFER_SENT";
    String stat_accepted_another = "ANOTHER_OFFER_ACCEPTED";
    String stat_activated = "ACTIVATED";
    String filter_stat_pass = "PASS_ALL";
    
    String sC_refid = "";
    String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();
    String sql = "SELECT "
            + "PPH.PPH_POSITION, F.F_INTUNI, PA.PA_STATUS, PA.PA_REFID, C.C_REFID, PPH.PPH_GRADE, FS.FS_DESC, PPH.PPH_PTJ, PA.PA_JOB_STATUS "
            + "FROM LOGIN1 L,CANDIDATE C, POS_APPLIED PA, POSITION_PTJ_HR PPH, FILTER F, FILTER_STATUS FS "
            + "WHERE C.C_REFID=L.C_REFID "
            + "AND C.C_REFID=PA.C_REFID "
            + "AND PPH.PPH_REFID=PA.PPH_REFID "
            + "AND PA.PA_REFID=F.PA_REFID "
            + "AND PA.PA_STATUS = FS.FS_CODE "
            + "AND F.FS_CODE = ? "
            + "AND L.L_REFID = ? "
            + "AND PA.PA_STATUS != ? "
            + "AND PA.PA_STATUS != ? ";
    
    String params[] = { filter_stat_pass, l_refid, stat_pending, stat_accepted_another };

    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
    
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
                        <th style="text-align:center; vertical-align: middle; width:1%">#</th>
                        <th style="text-align:center; vertical-align: middle; width:10%">Grade</th>
                        <th style="text-align:center; vertical-align: middle; width:40%">Offered Position</th>
                        <th style="text-align:center; vertical-align: middle; width:15%">PTJ</th>
                        <th style="text-align:center; vertical-align: middle; width:5%">Form</th>
                        <th style="text-align:center; vertical-align: middle; width:5%">Offer Letter</th>
                        <th colspan="2" style="text-align:center; vertical-align: middle; width:20%">Action</th>
                    </tr>
                    <!--
                    <tr>
                        <th style="text-align:center;width:5%">A</th>
                        <th style="text-align:center;width:5%">B</th>
                        <th style="text-align:center;width:5%">C</th>
                    </tr>-->
                </thead>
                <tbody>
                <!--Data from DB. Below rows to be remarked upon DB connection.-->
                <%
                if(data.size()>0)
                {
                    
                    for(int row=0; row<data.size(); row++)
                    {
                        
                        if(data.get(row).get(2).equalsIgnoreCase(stat_accepted))
                        {
                            display_action = "disabled";
                            display_btn = "display";
                        }
                        else if(data.get(row).get(2).equalsIgnoreCase(stat_rejected))
                        {
                            display_action = "disabled";
                            display_btn = "disabled";
                        }
                        else if(data.get(row).get(2).equalsIgnoreCase(stat_sent))
                        {
                            display_action = "display";
                            display_btn = "disabled";
                            display_title = "Please Accept The Offer To Enable This Link";
                        }
                        
                        String download_link = "";
                        String job_contract = "CONTRACT";
                        String job_permanent = "PERMANENT";
                        if(data.get(row).get(8).equals(job_contract))
                        {
                            download_link = "assets/eOffer/register_duty_form/BORANG_LAPOR_DIRI_STAF_KONTRAK.ZIP";
                        }
                        else if(data.get(row).get(8).equals(job_permanent))
                        {
                            download_link = "assets/eOffer/register_duty_form/BORANG_LAPOR_DIRI_STAF_TETAP.ZIP";
                        }
                        %>
                        <tr>
                        <td style="vertical-align: middle; text-align: center"><%= row+1 %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data.get(row).get(5) %></td>
                        <td style="vertical-align: middle"><%=data.get(row).get(0) %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data.get(row).get(7) %></td>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a target="_blank" href="<%=Config.getBase_url(request)+download_link %>" class="btn btn-success form-control <%=display_btn %>">Download <span class="glyphicon glyphicon-download"></span></a></td>
                        <!--<td title="<%//=display_title %>" style="vertical-align: middle; text-align: center"><a target="_blank" href="<%//=Config.getBase_url(request) %>assets/uploads/files/pdftest.pdf" class="btn btn-sm <%//=display_btn %>">Download</a></td>
                        <td title="<%//=display_title %>" style="vertical-align: middle; text-align: center"><a target="_blank" href="<%//=Config.getBase_url(request) %>assets/uploads/files/pdftest.pdf" class="btn btn-sm <%//=display_btn %>">Download</a></td>-->
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalOffer_<%=row %>" class="form-control open-modalOffer_<%=row %> btn btn-primary">Preview Offer</a></td>
                        <%
                        if(data.get(row).get(2).equalsIgnoreCase(stat_sent))
                        {
                            %>
                            <td style="vertical-align: middle"><a title="Accept Offer" data-toggle="modal" href="#acceptModal" data-pa_refid="<%=data.get(row).get(3) %>" data-c_refid="<%=data.get(row).get(4) %>" class="form-control open-acceptModal btn btn-success <%=display_action %>">Accept</a></td>
                            <td style="vertical-align: middle"><a title="Reject Offer" data-toggle="modal" href="#rejectModal" data-pa_refid="<%=data.get(row).get(3) %>" class="form-control open-rejectModal btn btn-danger <%=display_action %>">Reject</a></td>
                            <%
                        }
                        else if(data.get(row).get(2).equalsIgnoreCase(stat_accepted))
                        {
                            %>
                            <td colspan="2" style="vertical-align: middle; text-align: center; color: #5b9909; font-weight: bold" title="<%=data.get(row).get(6) %>"><%=eliminate.eliminateUnderscore(data.get(row).get(2)) %></td>
                            <%
                        }
                        else if(data.get(row).get(2).equalsIgnoreCase(stat_rejected))
                        {
                            %>
                            <td colspan="2" style="vertical-align: middle; text-align: center; color: #F00; font-weight: bold" title="<%=data.get(row).get(6) %>"><%=eliminate.eliminateUnderscore(data.get(row).get(2)) %></td>
                            <%
                        }
                        else if(data.get(row).get(2).equalsIgnoreCase(stat_activated))
                        {
                            %>
                            <td colspan="2" style="vertical-align: middle; text-align: center; color: palevioletred; font-weight: bold" title="<%=data.get(row).get(6) %>"><%=eliminate.eliminateUnderscore(data.get(row).get(2)) %></td>
                            <%
                        }
                        %>
                        </tr>
                        <!--
                        <tr>
                        <td title="<%//=display_title %>" style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#myModal1" data-pa_refid="<%//=data.get(row).get(3) %>" class="open-myModal1 btn btn-sm <%//=display_btn %>">Upload</a></td>
                        <td title="<%//=display_title %>" style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#myModal2" data-pa_refid="<%//=data.get(row).get(3) %>" class="open-myModal2 btn btn-sm <%//=display_btn %>">Upload</a></td>
                        <td title="<%//=display_title %>" style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#myModal3" data-pa_refid="<%//=data.get(row).get(3) %>" class="open-myModal3 btn btn-sm <%//=display_btn %>">Upload</a></td>
                        </tr>-->
                        <%
                    }
                }
                else
                {
                    %>
                    <tr>
                        <td colspan="8" style="font-weight: bold; vertical-align: middle; text-align: center; color: red">No Offer</td>
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
            <form method="post" action="UploadOfferDocServlet" enctype="multipart/form-data">
                <div class="modal-header">
                    <h4 class="modal-title">Upload Form</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <legend>Form A:</legend>
                        <label for="id">Files</label>
                        <input type="hidden" name="pa_refid" id="pa_refid" value="">
                        <input type="file" name="offer_doc" class="form-control" data-icon="true" required>
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
            <form method="post" action="UploadOfferDocServlet" enctype="multipart/form-data">
                <div class="modal-header">
                    <h4 class="modal-title">Upload Form</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <legend>Form B:</legend>
                        <label for="id">Files</label>
                        <input type="hidden" name="pa_refid" id="pa_refid" value="">
                        <input type="file" name="offer_doc" class="form-control" data-icon="true" required>
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
            <form method="post" action="UploadOfferDocServlet" enctype="multipart/form-data">
                <div class="modal-header">
                    <h4 class="modal-title">Upload Form</h4>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <legend>Form C:</legend>
                        <label for="id">Files</label>
                        <input type="hidden" name="pa_refid" id="pa_refid" value="">
                        <input type="file" name="offer_doc" class="form-control" data-icon="true" required>
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
                                            + "WHERE PA_STATUS = ? "
                                            + "AND C_REFID = ? ";
                                    String params2[] = { stat_sent, sC_refid };
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
    var pa_refid = $(this).data('pa_refid');
    $(".modal-body #pa_refid").val( pa_refid );
});

$(document).on("click", ".open-myModal1", function ()
{
    var pa_refid = $(this).data('pa_refid');
    $(".modal-body #pa_refid").val( pa_refid );
});

$(document).on("click", ".open-myModal2", function ()
{
    var pa_refid = $(this).data('pa_refid');
    $(".modal-body #pa_refid").val( pa_refid );
});

$(document).on("click", ".open-myModal3", function ()
{
    var pa_refid = $(this).data('pa_refid');
    $(".modal-body #pa_refid").val( pa_refid );
});
</script>


