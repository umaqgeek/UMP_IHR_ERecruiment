<%-- 
    Document   : PositionList
    Created on : Jan 22, 2016, 10:17:33 AM
    Author     : Vijay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eInterview.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.eRecruitment.eInterview.Action"%>
<%@page import="controller.eRecruitment.eInterview.Info"%>
<%
    String refID = "";
    String intDT = "";
    String intVN = "";
    String intNP = "";
    String rpaID = "";
    String rirID = "";
    
    if (request.getParameter("hdn_Action")!= null){
        if (request.getParameter("hdn_Action").equals("S")){
            ArrayList<String> data = new ArrayList<String>();
            
            data.add(request.getParameter("hdn_IC_REFID"));
            data.add(request.getParameter("txt_IC_INTERVIEW_DATETIME"));
            data.add(request.getParameter("txt_IC_VENUE"));
            
            System.out.println(new Action().setupInterview(data));
            
            ArrayList<String> rdata = new ArrayList<String>();
            
            rdata.add(request.getParameter("hdn_IR_REFID"));
            rdata.add(request.getParameter("hdn_IC_REFID"));
            rdata.add(request.getParameter("hdn_PA_REFID"));
            
            System.out.println(new Action().saveInterviewResult(rdata));
        }
        else if (request.getParameter("hdn_Action").equals("D")){
            System.out.println(new Action().deleteInterview(request.getParameter("hdn_IC_REFID")));
        }
        else if (request.getParameter("hdn_Action").equals("E")){
            objData objdata = new objData();
            
            objdata = new Info().getSetupInterview(request.getParameter("hdn_IC_REFID"));
            if (objdata.getFlag()!=1){
                refID = objdata.getTableData().get(0).get(0);
                intDT = objdata.getTableData().get(0).get(1);
                intVN = objdata.getTableData().get(0).get(2);
                intNP = objdata.getTableData().get(0).get(3);
                rpaID = objdata.getTableData().get(0).get(4);
                rirID = objdata.getTableData().get(0).get(5);
            }
        }
    }
%>    
<div id="wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12"> VACANCY POSITION LIST</div>
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
                                    <td style="width:5%">#</td>
                                    <td style="width:15%">Grade</td>
                                    <td style="width:20%">Position</td>
                                    <td style="width:15%">Department</td>
                                    <td style="width:20%">Start Date<br/>End Date</td>
                                    <td style="width:20%">Interview<br/>Details</td>
                                    <td style="width:5%">&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                    objData objdata = new objData();
                                    List lq = new List();
                                    objdata = lq.getPositions();
                                    if (objdata.getFlag()==1){
                                        System.out.println(objdata.getErrorMessage());
                                    }
                                    else{
                                        for (int row = 0; row < objdata.getTableData().size(); row++){
                                            ArrayList Row = objdata.getTableData().get(row);
                                %>
                                <tr>
                                    <td><%=row+1%></td>
                                    <td><%=Row.get(0)%></td>
                                    <td><%=Row.get(1)%></td>
                                    <td><%=Row.get(2)%></td>
                                    <td><%=Row.get(3)%><br/><%=Row.get(4)%></td>
                                    <td><%=Row.get(7)%><br/><%=Row.get(8)%></td>
                                    <td>
                                        <a href="#" OnClick="javascript:document.getElementById('hdn_IC_REFID').value='N';document.getElementById('hdn_IR_REFID').value='N';document.getElementById('hdn_PA_REFID').value='<%=Row.get(6)%>';" class="btn" data-toggle="modal" data-target="#myInt">Setup</a>
                                        <br/>
                                        <a href="#" OnClick="javascript:document.getElementById('hdn_IC_REFID').value='<%=Row.get(0)%>';document.getElementById('hdn_IR_REFID').value='<%=Row.get(10)%>';document.getElementById('hdn_PA_REFID').value='<%=Row.get(6)%>';document.getElementById('hdn_Action').value='E';document.frmQ.submit();" class="btn" data-toggle="modal" data-target="#myInt">Edit</a>/<a href="#" OnClick="javascript:document.getElementById('hdn_IC_REFID').value='<%=Row.get(0)%>';document.getElementById('hdn_PA_REFID').value='<%=Row.get(6)%>';document.getElementById('hdn_Action').value='D';document.frmQ.submit();">Del</a>
                                    </td>
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
                    <form id="frmQ" name="frmQ" method="GET" class="form-horizontal" action="#">
                        <div class="modal-dialog">
                            <!-- Modal content for Universiti-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Interview Setup </h4>
                                </div>
                                <div class="modal-body">
                                    <input type="text" id="hdn_Action" name="hdn_Action" class="form-control" value=""/>
                                    <input type="text" id="hdn_IC_REFID" name="hdn_IC_REFID" class="form-control" value="<%=refID%>"/>
                                    <input type="text" id="hdn_PA_REFID" name="hdn_PA_REFID" class="form-control" value="<%=rpaID%>"/>
                                    <input type="text" id="hdn_IR_REFID" name="hdn_IR_REFID" class="form-control" value="<%=rirID%>"/>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Date & Time</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_IC_INTERVIEW_DATETIME" name="txt_IC_INTERVIEW_DATETIME" value="<%=intDT%>"/>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Venue</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="txt_IC_VENUE" name="txt_IC_VENUE" class="form-control" value="<%=intVN%>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">No. of Panels</label>
                                        <div class="col-lg-6">
                                            <select id="lst_IC_NOPANELS" name="lst_IC_NOPANELS" class="form-control" value="">
                                                <option value="1" <%=(intNP=="1" ? "SELECTED" : "")%>>1</option>
                                                <option value="2" <%=(intNP=="2" ? "SELECTED" : "")%>>2</option>
                                                <option value="3" <%=(intNP=="3" ? "SELECTED" : "")%>>3</option>
                                                <option value="4" <%=(intNP=="4" ? "SELECTED" : "")%>>4</option>
                                                <option value="5" <%=(intNP=="5" ? "SELECTED" : "")%>>5</option>
                                                <option value="6" <%=(intNP=="6" ? "SELECTED" : "")%>>6</option>
                                                <option value="7" <%=(intNP=="7" ? "SELECTED" : "")%>>7</option>
                                                <option value="8" <%=(intNP=="8" ? "SELECTED" : "")%>>8</option>
                                                <option value="9" <%=(intNP=="9" ? "SELECTED" : "")%>>9</option>
                                                <option value="10" <%=(intNP=="10" ? "SELECTED" : "")%>>10</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" onclick="javascript:document.getElementById('hdn_Action').value='S';document.frmQ.submit();" class="btn btn-default">Save</button>
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