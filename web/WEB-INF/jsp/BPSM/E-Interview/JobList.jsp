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
                        <i class="fa fa-file"></i> e-Interview
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12"> List of Jobs Ended</div>
                </div>
                <!-- /.row -->
                <br/><br/>
                <div class="row">
                    <div class="dataTables_wrapper">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td style="width:5%">#</td>
                                    <td style="width:20%">Grade</td>
                                    <td style="width:20%">Position</td>
                                    <td style="width:25%">Department</td>
                                    <td style="width:10%">Start Date</td>
                                    <td style="width:10%">End Date</td>
                                    <td style="width:10%">&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Html Test data-->
                                <tr>
                                    <td>1</td>
                                    <td>Grade</td>
                                    <td>Position</td>
                                    <td>HR</td>
                                    <td>10/12/2015</td>
                                    <td>25/12/2015</td>
                                    <td><a href="index.jsp?p=BPSM/E-Interview/Setup.jsp">Setup<br/>Interview</a></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Grade</td>
                                    <td>Position</td>
                                    <td>JHEPA</td>
                                    <td>10/12/2015</td>
                                    <td>25/12/2015</td>
                                    <td><a href="index.jsp?p=BPSM/E-Interview/Setup.jsp">Setup<br/>Interview</a></td>
                                </tr>
                                <!--
                                <%
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
            </div>
        </div>
    </div>
</div>