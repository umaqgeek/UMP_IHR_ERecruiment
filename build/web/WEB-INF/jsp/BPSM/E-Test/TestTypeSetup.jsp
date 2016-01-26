<jsp:include page="/WEB-INF/jsp/menu.jsp"></jsp:include>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eTest.List"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eTest.Action"%>
<%
    if (request.getParameter("txt_TST_TYPE")!=null){
        ArrayList<String> data = new ArrayList<String>();

        data.add(request.getParameter("hdn_TST_REFID"));
        data.add(request.getParameter("txt_TST_TYPE"));

        Action a = new Action();
        a.saveTestType(data);
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
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12"> Test Type Setup</div>
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
                                    objdata = lq.getTestTypes();
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
                                    <td><a href="#" title="Edit" data-toggle="modal" data-target="#myQ" OnClick="javascript:"><i class="fa fa-edit"></i></a></td>
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
                                    <h4 class="modal-title">Add / Edit Test Type</h4>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" id="hdn_TST_REFID" name="hdn_TST_REFID" class="form-control" value=""/>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">DESCRIPTION</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_TST_TYPE" name="txt_TST_TYPE" class="form-control" placeholder="TEST TYPE" Required="true"/>
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