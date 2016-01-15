<%@page import="java.util.ArrayList"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eInterview.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.eRecruitment.eInterview.Action"%>
<%
    if (request.getParameter("hdn_IQ_REFID")!=null){
        ArrayList<String> data = new ArrayList<String>();

        data.add(request.getParameter("hdn_IQ_REFID"));
        data.add(request.getParameter("txt_IQ_DESC"));

        Action a = new Action();
        a.saveIQuestions(data);
    }
%>    
<div id="wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12"> SETUP INTERVIEW CRITERIA</div>
                </div>
                <!-- /.row -->
                <br/><br/>
                <div class="row">
                    <div class="dataTables_wrapper">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td style="width:10%">#</td>
                                    <td style="width:80%">Description</td>
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
                                    objdata = lq.getICriteria();
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
                                    <td><a href="#" OnClick="javascript:document.getElementById('hdn_IQ_REFID').value='<%=Row.get(0)%>';" class="btn" data-toggle="modal" data-target="#myInt">Edit</a></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <a href="#" OnClick="javascript:document.getElementById('hdn_IQ_REFID').value='0';" class="btn" data-toggle="modal" data-target="#myInt">Add New</a>
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
                                    <input type="hidden" id="hdn_IQ_REFID" name="hdn_IQ_REFID" class="form-control" value=""/>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Description</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_IQ_DESC" name="txt_IQ_DESC" value=""/>
                                        </div>
                                    </div>    
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-default" data-dismiss="modal">Save</button>
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