<%@page import="controller.eRecruitment.eTest.List"%>
<%@page import="controller.eRecruitment.eTest.Action"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%
    if (request.getParameter("lst_TDB_REFID")!=null){
        ArrayList<String> data = new ArrayList<String>();

        data.add(request.getParameter("lst_TDB_REFID"));
        data.add(request.getParameter("lst_TSDB_REFID"));
        data.add(request.getParameter("txt_TDB_QNO"));
        data.add(request.getParameter("txt_TDB_QUEST"));

        Action a = new Action();
        a.saveQuestion(data);
    }
%>    
<div id="wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    e-Recruitment
                    <small>BPSM</small>
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="../../e-recruitment-home.html">Dashboard</a>
                    </li>
                                                <li class="active">
                        <i class="fa fa-file"></i> System
                    </li>
                    <li class="active">
                        <i class="fa fa-file"></i> e-Test
                    </li>
                    <li class="active">
                        <i class="fa fa-file"></i> e-Personality Test
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12"> e-Personality Questions Setup</div>
                </div>
                <!-- /.row -->
                <br/><br/>
                <div class="row">
                    <div class="dataTables_wrapper">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td style="width:5%">#</td>
                                    <td style="width:85%">Description</td>
                                    <td style="width:10%" colspan="2" style="text-align: center">Action</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    objData objdata = new objData();
                                    List lq = new List();
                                    objdata = lq.getQuestions();
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
                                    <td><a href="#" title="Edit"><i class="fa fa-edit"></i></a></td>
                                    <td><a href="#" title="Delete"><i class="fa fa-minus"></i></a></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                        <div class="form-actions">
                            <button type="button" class="btn" data-toggle="modal" data-target="#myQ"><i class="fa fa-pencil"></i>&nbsp;Add New</button>
                        </div>
                    </div>
                </div>
                <!-- Add/Edit DIV-->
                <div id="myQ" class="modal fade" role="dialog">
                    <form id="frmQ" name="frmQ" method="POST" class="form-horizontal" action="#">
                        <div class="modal-dialog">
                            <!-- Modal content for Universiti-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Add / Edit Personality Question</h4>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" id="lst_TDB_REFID" name="lst_TDB_REFID" class="form-control" value=""/>
                                    <input type="hidden" id="lst_TSDB_REFID" name="lst_TSDB_REFID" class="form-control" value="1"/>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">NO.</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_TDB_QNO" name="txt_TDB_QNO" class="form-control" placeholder="1" Required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">DESCRIPTION</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="txt_TDB_QUEST" name="txt_TDB_QUEST" class="form-control" placeholder="STRENGTHS" Required="true"/>
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
<!-- /.container-fluid -->
<!-- jQuery -->
<script src="js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>

