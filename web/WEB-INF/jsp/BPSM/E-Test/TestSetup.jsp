<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eTest.List"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eTest.Action"%>
<%
    if (request.getParameter("txt_TDB_SET_NAME")!=null){
        ArrayList<String> data = new ArrayList<String>();

        data.add(request.getParameter("hdn_TSDB_REFID"));
        data.add(request.getParameter("txt_TDB_SET_NAME"));
        data.add(request.getParameter("lst_TST_REFID"));

        Action a = new Action();
        a.saveTest(data);
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
                    <div class="col-sm-12"> Tests Setup</div>
                </div>
                <!-- /.row -->
                <br/><br/>
                <div class="row">
                    <div class="dataTables_wrapper">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td style="width:5%">#</td>
                                    <td style="width:50%">Description</td>
                                    <td style="width:25%">Type</td>
                                    <td style="width:10%" colspan="2" style="text-align: center">Action</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    objData objdata = new objData();
                                    List lq = new List();
                                    objdata = lq.getTests();
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
                                    <h4 class="modal-title">Add / Edit Test </h4>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" id="hdn_TSDB_REFID" name="hdn_TSDB_REFID" class="form-control" value=""/>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">DESCRIPTION</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_TDB_SET_NAME" name="txt_TDB_SET_NAME" class="form-control" placeholder="PERSONALITY TEST" Required />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">SET TYPE</label>
                                        <div class="col-lg-6">
                                            <select id="lst_TST_REFID" name="lst_TST_REFID" class="form-control">
                                                <% 
                                                    objData tData = new objData();
                                                    tData = new List().getTestTypes();
                                                    if (tData.getFlag()==1){
                                                        System.out.println(tData.getErrorMessage());
                                                    }
                                                    else{
                                                        for (int inc=0; inc < tData.getTableData().size(); inc++){
                                                            ArrayList Row = tData.getTableData().get(inc);
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
    </div>
</div>