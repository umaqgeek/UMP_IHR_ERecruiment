<%@page import="java.util.ArrayList"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eInterview.List"%>
<%
    /*
    if (request.getParameter("txt_TDB_SET_NAME")!=null){
        ArrayList<String> data = new ArrayList<String>();

        data.add(request.getParameter("hdn_TSDB_REFID"));
        data.add(request.getParameter("txt_TDB_SET_NAME"));
        data.add(request.getParameter("lst_TST_REFID"));

        Action a = new Action();
        a.saveTest(data);
    }
    */
%>    
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"> List of Interviews of <%="DEPARTMENT"%></div>
        </div>
        <!-- /.row -->
        <br/><br/>
        <div class="row">
            <div class="dataTables_wrapper">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <td style="width:5%">#</td>
                            <td style="width:10%">DATE & TIME</td>
                            <td style="width:15%">Grade</td>
                            <td style="width:15%">Position</td>
                            <td style="width:25%">Candidate</td>
                            <td style="width:10%">Pre Interview Status</td>
                            <td style="width:10%">&nbsp;</td>
                            <td style="width:10%">&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody>
                        <!--Html Test data-->
                        <!--
                        <tr>
                            <td>1</td>
                            <td>30/12/2015 10:00AM</td>
                            <td>Grade</td>
                            <td>Position</td>
                            <td>UMAR BIN AHMAD<br/>123456-12-1234</td>
                            <td>Pass</td>
                            <td><a href="#" target="_blank">CV</a><br/><a href="#" target="_blank">e-TEST</a><br/><a href="#" target="_blank">Pre Interview</a></td>
                            <td><a href="#" data-toggle="modal" data-target="#myMarks">Marks Entry</a></td>
                        </tr>
                        -->
                        <%
                            /*
                            * List of Interviews for panel after Pre Interview pass
                            */
                            objData objdata = new objData();
                            List lq = new List();
                            objdata = lq.getInterviewListForPanel();
                            if (objdata.getFlag() == 1) {
                                System.out.println(objdata.getErrorMessage());
                            } else {
                                for (int row = 0; row < objdata.getTableData().size(); row++) {
                                    ArrayList Row = objdata.getTableData().get(row);
                        %>
                        <tr>
                            <td><%=row + 1%></td>
                            <td><%=Row.get(0)%></td>
                            <td><%=Row.get(1)%></td>
                            <td><%=Row.get(2)%></td>
                            <td><%=Row.get(3)%></td>
                            <td><%=Row.get(4)%></td>
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
        <div id="myMarks" class="modal fade" role="dialog">
            <form id="frmQ" name="frmQ" method="POST" class="form-horizontal" action="#">
                <div class="modal-dialog">
                    <!-- Modal content for Universiti-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Marks Entry </h4>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="hdn_PM_REFID" name="hdn_IM_REFID" class="form-control" value=""/>
                            <input type="hidden" id="hdn_I_REFID" name="hdn_I_REFID" class="form-control" value=""/>
                            <input type="hidden" id="hdn_C_REFID" name="hdn_C_REFID" class="form-control" value=""/>
                            <input type="hidden" id="hdn_U_REFID" name="hdn_U_REFID" class="form-control" value=""/>
                            <%
                                objData objMarks = new objData();
                                objMarks = lq.getICriteria();
                                for (int mark = 0; mark < objMarks.getTableData().size(); mark++) {
                            %>
                            <div class="form-group">
                                <input type="hidden" id="hdn_IQ_REFID[]" name="hdn_IQ_REFID[]" class="form-control" value=""/>
                                <label class="col-lg-3 control-label"><%=objMarks.getTableData().get(mark).get(0)%></label>
                                <div class="col-lg-4">
                                    <select id ="lst_IM_MARKS[]" name="lst_IM_MARKS[]">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                    </select>
                                </div>
                            </div>
                            <% } %>
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