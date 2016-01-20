<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>
<%@page import="config.Config"%>

<%
    boolean accepted = false;
    
    String display_btn = "";
    String display_action = "";
    String display_title = "";
    if(accepted)
    {
        display_action = "disabled";
        display_btn = "display";
    }
    else
    {
        display_action = "display";
        display_btn = "disabled";
        display_title = "Please Accept The Offer To Enable This Link";
    }
    
    String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();
    String sql = "SELECT "
            + "PPH.PPH_POSITION, F.F_INTUNI, PA.PA_STATUS "
            + "FROM LOGIN1 L,CANDIDATE C, POS_APPLIED PA,POSITION_PTJ_HR PPH,FILTER F "
            + "WHERE C.C_REFID=L.C_REFID "
            + "AND C.C_REFID=PA.C_REFID "
            + "AND PPH.PPH_REFID=PA.PPH_REFID "
            + "AND PA.PA_REFID=F.PA_REFID "
            + "AND F.F_STATUS='pass' "
            + "AND L.L_REFID='"+l_refid+"'";
    
    String params[] = {};

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
                        %>
                        <tr>
                        <td rowspan="2" style="vertical-align: middle; text-align: center"><%= row+1 %></td>
                        <td rowspan="2" style="vertical-align: middle"><%=data.get(row).get(0) %></td>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a target="_blank" href="<%=Config.getBase_url(request) %>assets/uploads/files/pdftest.pdf" class="btn btn-sm <%=display_btn %>">Download</a></td>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a target="_blank" href="<%=Config.getBase_url(request) %>assets/uploads/files/pdftest.pdf" class="btn btn-sm <%=display_btn %>">Download</a></td>
                        <td title="<%=display_title %>" style="vertical-align: middle; text-align: center"><a target="_blank" href="<%=Config.getBase_url(request) %>assets/uploads/files/pdftest.pdf" class="btn btn-sm <%=display_btn %>">Download</a></td>
                        <td rowspan="2" style="vertical-align: middle"><a title="Accept Offer" href="#!" data-toggle="modal" data-target="#acceptModal" class="btn btn-sm <%=display_action %>">Accept</a></td>
                        <td rowspan="2" style="vertical-align: middle"><a title="Decline Offer" href="#!" data-toggle="modal" data-target="#declineModal" class="btn btn-sm <%=display_action %>">Decline</a></td>
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

<!-- Modal -->
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

<!-- Modal -->
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

<!-- Modal -->
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

<!-- Modal -->
<div id="acceptModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="">
                <div class="modal-header">
                    <br>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <center>
                            <h4 class="modal-title"><span style="color: lime; font-weight: bold">Accept</span> This Offer. Are You Sure ?</h4>
                        <button type="submit" class="btn btn-default">Confirm</button>&nbsp;<button type="submit" class="btn btn-default">Not Yet</button>
                        </center>
                    </fieldset>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="declineModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="">
                <div class="modal-header">
                    <br>
                </div>
                <div class="modal-body">
                    <fieldset>
                        <center>
                            <h4 class="modal-title"><span style="color: red; font-weight: bold">Decline</span> This Offer. Are You Sure ?</h4>
                            <button type="submit" name="decline_confirm" value="confirm" class="btn btn-default">Confirm</button>&nbsp;<button name="notyet" value="notyet" type="submit" class="btn btn-default">Not Yet</button>
                        </center>
                    </fieldset>
                </div>
            </form>
        </div>
    </div>
</div>

