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
            <div class="col-sm-12"> List of Interview Invitations</div>
        </div>
        <!-- /.row -->
        <br/><br/>
        <div class="row">
            <div class="dataTables_wrapper">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <td style="width:5%">#</td>
                            <td style="width:15%">Grade<br/>Position<br/>Department</td>
                            <td style="width:10%">DATE & TIME</td>
                            <td style="width:15%">VENUE</td>
                            <td style="width:15%">PANEL</td>
                            <td style="width:15%">CANDIDATE</td>
                            <td style="width:10%">Status</td>
                            <td style="width:10%">&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody>
                        <!--Html Test data-->
                        <tr>
                            <td>1</td>
                            <td>Grade<br/>Position<br/>HR</td>
                            <td>02/01/2016 10:15AM</td>
                            <td>MESYURAT HR</td>
                            <td>HARYANI, LILA</td>
                            <td>UMAR BIN AHMAD<br/>123456-12-1234</td>
                            <td>Accepted</td>
                            <td><a href="#" data-toggle="modal" data-target="#myPreInt">Setup<br/>Pre-Interview</a></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Grade<br/>Position<br/>HR</td>
                            <td>02/01/2016 11:15AM</td>
                            <td>MESYURAT HR</td>
                            <td>HARYANI, SAKINA</td>
                            <td>NABILLA BINTI MUHAMMAD<br/>654321-12-1234</td>
                            <td>Rejected<br/>I will be outstation.</td>
                            <td>&nbsp;</td>
                        </tr>
                        <!--
                        <%
                            objData objdata = new objData();
                            List lq = new List();
                            objdata = lq.getJobListEnding();
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
                        -->
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Add/Edit DIV-->
        <div id="myPreInt" class="modal fade" role="dialog">
            <form id="frmQ" name="frmQ" method="POST" class="form-horizontal" action="#">
                <div class="modal-dialog">
                    <!-- Modal content for Universiti-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Pre Interview Setup </h4>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="hdn_I_REFID" name="hdn_I_REFID" class="form-control" value=""/>
                            <input type="hidden" id="hdn_PA_REFID" name="hdn_PA_REFID" class="form-control" value=""/>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">DATE & TIME</label>
                                <div class="col-lg-4">
                                    <input type="text" id="txt_I_DATETIME" name="txt_I_DATETIME" value=""/>
                                </div>
                            </div>    
                            <div class="form-group">
                                <label class="col-lg-3 control-label">VENUE</label>
                                <div class="col-lg-6">
                                    <select id="lst_VEN_REFID" name="lst_VEN_REFID" class="form-control">
                                        <%
                                            objData dVenue = new objData();
                                            dVenue = new List().getVenueList();
                                            if (dVenue.getFlag() == 1) {
                                                System.out.println(dVenue.getErrorMessage());
                                            } else {
                                                for (int inc = 0; inc < dVenue.getTableData().size(); inc++) {
                                                    ArrayList Row = dVenue.getTableData().get(inc);
                                        %>
                                        <option value="<%=Row.get(0)%>"><%=Row.get(1)%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">PANEL</label>
                                <div class="col-lg-6">
                                    <select id="lst_PAN_REFID" name="lst_PAN_REFID" class="form-control">
                                        <%
                                            objData dPanel = new objData();
                                            dPanel = new List().getPanelList();
                                            if (dPanel.getFlag() == 1) {
                                                System.out.println(dPanel.getErrorMessage());
                                            } else {
                                                for (int inc = 0; inc < dPanel.getTableData().size(); inc++) {
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