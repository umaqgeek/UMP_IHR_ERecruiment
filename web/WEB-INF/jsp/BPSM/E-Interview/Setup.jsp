<%@page import="java.util.ArrayList"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eInterview.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.eRecruitment.eInterview.Action"%>
<%
    if (request.getParameter("txt_I_DATETIME")!=null){
        ArrayList<String> data = new ArrayList<String>();

        data.add(request.getParameter("hdn_I_REFID"));
        data.add(request.getParameter("txt_I_DATETIME"));
        data.add(request.getParameter("txt_I_VENUE"));
        data.add(request.getParameter("hdn_PA_REFID"));
        
//        out.print(data); if (true) { return; }

        Action a = new Action();
        a.saveInterview(data);
    }
%>    
<div id="wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12"> JOBS TO SETUP INTERVIEW</div>
                </div>
                <!-- /.row -->
                <br/><br/>
                <div class="row">
                    <div class="dataTables_wrapper">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td style="width:10%">#</td>
                                    <td style="width:35%">Grade<br/>Position<br/>Department</td>
                                    <td style="width:35%">Interview Date&Time<br/>Venue<br/>Panel</td>
                                    <!--<td style="width:25%">Candidate<br/>IC No.</td>-->
                                    <td style="width:10%">Start Date</td>
                                    <td style="width:10%">End Date</td>
                                    <td style="width:10%">&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Html Test data-->
                                <!--
                                <tr>
                                    <td>1</td>
                                    <td>Grade</td>
                                    <td>Position</td>
                                    <td>HR</td>
                                    <td>10/12/2015</td>
                                    <td>25/12/2015</td>
                                    <td><a href="process.jsp?p=BPSM/E-Interview/Setup.jsp">Setup<br/>Interview</a></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Grade</td>
                                    <td>Position</td>
                                    <td>JHEPA</td>
                                    <td>10/12/2015</td>
                                    <td>25/12/2015</td>
                                    <td><a href="process.jsp?p=BPSM/E-Interview/Setup.jsp">Setup<br/>Interview</a></td>
                                </tr>
                                -->
                                <%
                                    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                    objData objdata = new objData();
                                    List lq = new List();
                                    objdata = lq.getJobListEnding();
                                    if (objdata.getFlag()==1){
                                        System.out.println(objdata.getErrorMessage());
                                    }
                                    else{
                                        for (int row = 0; row < objdata.getTableData().size(); row++){
                                            ArrayList Row = objdata.getTableData().get(row);
                                %>
                                <tr>
                                    <td><%=row+1%></td>
                                    <td><%=Row.get(0)%><br/><%=Row.get(1)%><br/><%=Row.get(2)%></td>
                                    <% if (Row.get(6)!=null){ 
                                        objData objInterview = new objData();
                                        objInterview = lq.getInterviewDetails(Row.get(6).toString());
                                        ArrayList iRow = objInterview.getTableData().get(0);
                                    %>
                                    <td><%=iRow.get(1)%><br/><%=iRow.get(2)%><br/><%=iRow.get(3)%></td>
                                    <% }else { %>
                                    <td>-N/A-</td>
                                    <% } %>
                                    <td><%=Row.get(3)%></td>
                                    <td><%=Row.get(4)%></td>
                                    <td><a href="#" OnClick="javascript:document.getElementById('hdn_I_REFID').value='<%=Row.get(6)%>';document.getElementById('hdn_PA_REFID').value='<%=Row.get(5)%>';" class="btn" data-toggle="modal" data-target="#myInt">Setup<br/>Interview</a></td>
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
                    <form id="frmQ" name="frmQ" method="POST" class="form-horizontal" action="">
                        <div class="modal-dialog">
                            <!-- Modal content for Universiti-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Interview Setup </h4>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" id="hdn_I_REFID" name="hdn_I_REFID" class="form-control" value=""/>
                                    <input type="hidden" id="hdn_PA_REFID" name="hdn_PA_REFID" class="form-control" value=""/>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Date & Time</label>
                                        <div class="col-lg-4">
                                            <input type="date" class="form-control" id="txt_I_DATETIME" name="txt_I_DATETIME" value=""/>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Venue</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="txt_I_VENUE" name="txt_I_VENUE" class="form-control" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Panel</label>
                                        <div class="col-lg-6">
                                            <select multiple="true" id="lst_IP_REFID" name="lst_IP_REFID" style="height:100px" class="form-control">
                                                <% 
                                                    objData dPanel = new objData();
                                                    dPanel = new List().getPanelList();
                                                    if (dPanel.getFlag()==1){
                                                        System.out.println(dPanel.getErrorMessage());
                                                    }
                                                    else{
                                                        for (int inc=0; inc < dPanel.getTableData().size(); inc++){
                                                            ArrayList Row = dPanel.getTableData().get(inc);
                                                %>
                                                <option value="<%=Row.get(0)%>"><%=Row.get(1)%></option>
                                                <%
                                                        }
                                                    }
                                                %>
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