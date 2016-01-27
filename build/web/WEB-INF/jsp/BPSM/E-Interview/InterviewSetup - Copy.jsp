<%@page import="java.util.ArrayList"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eInterview.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.eRecruitment.eInterview.Action"%>
<%
    if (request.getParameter("txt_IC_INTERVIEW_DATETIME")!=null){
        ArrayList<String> data = new ArrayList<String>();

        data.add(request.getParameter("hdn_IC_REFID"));
        data.add(request.getParameter("txt_IC_INTERVIEW_DATETIME"));
        data.add(request.getParameter("txt_IC_VENUE"));

        Action a = new Action();
        System.out.println(a.setupInterview(data));
    }
%>    
<div id="wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12"> LIST OF INTERVIEWS</div>
                </div>
                <!-- /.row -->
                <br/>
                <a class="btn" href="#" OnClick="javascript:document.getElementById('hdn_IC_REFID').value='N';" data-toggle="modal" data-target="#myInt">Add New</a>
                <br/>
                <div class="row">
                    <div class="dataTables_wrapper">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td style="width:10%">#</td>
                                    <td style="width:20%">Interview<br/>Date & Time</td>
                                    <td style="width:40%">Venue</td>
                                    <td style="width:30%">Status<br/>Date & Time</td>
                                    <td style="width:10%">&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                    objData objdata = new objData();
                                    List lq = new List();
                                    objdata = lq.getInterviews();
                                    if (objdata.getFlag()==1){
                                        System.out.println(objdata.getErrorMessage());
                                    }
                                    else{
                                        for (int row = 0; row < objdata.getTableData().size(); row++){
                                            ArrayList Row = objdata.getTableData().get(row);
                                %>
                                <tr>
                                    <td><%=row+1%></td>
                                    <td><%=Row.get(1)%></td>
                                    <td><%=Row.get(2)%></td>
                                    <% if (Row.get(3)==null) { %>
                                    <td>-N/A-</td>
                                    <% }else {%>
                                    <td><%=Row.get(3)%></td>
                                    <% } %>
                                    <td><a href="#" OnClick="javascript:document.getElementById('hdn_IC_REFID').value='<%=Row.get(0)%>';" class="btn" data-toggle="modal" data-target="#myInt">Edit</a></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Add/Edit DIV-->
                <div id="myInt" class="modal fade" role="dialog">
                    <form id="frmQ" name="frmQ" method="POST" class="form-horizontal" action="#">
                        <div class="modal-dialog">
                            <!-- Modal content for Universiti-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Interview Setup </h4>
                                </div>
                                <div class="modal-body">
                                    <input type="text" id="hdn_IC_REFID" name="hdn_IC_REFID" class="form-control" value=""/>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Date & Time</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_IC_INTERVIEW_DATETIME" name="txt_IC_INTERVIEW_DATETIME" value=""/>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Venue</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="txt_IC_VENUE" name="txt_IC_VENUE" class="form-control" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Panels</label>
                                        <div class="col-lg-2">
                                            <select multiple="true" id="lst_IP_FROM" name="lst_IP_FROM" class="form-control col-lg-2">
                                            </select>
                                        </div>
                                        <div class="col-lg-2">
                                            <select multiple="true" id="lst_IP_LIST" name="lst_IP_LIST" class="form-control col-lg-4">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-default">Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!--DIV-->
            </div>
        </div>
    </div>
</div>