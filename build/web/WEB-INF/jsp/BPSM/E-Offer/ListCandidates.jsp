<jsp:include page="/WEB-INF/jsp/menu.jsp"></jsp:include>
<%@page import="libraries.eRecruitment.eOffer.*" %>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        <% System.out.println("e-Recruitment"); %><small><% System.out.println("Candidate"); %></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="../../e-recruitment-home.html">Dashboard</a>
                        </li>
                                                    <li class="active">
                            <i class="fa fa-file"></i> System
                        </li>
                        <li class="active">
                            <i class="fa fa-file"></i> e-Offer
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="well">
                    <div class="row">
                        <div class="col-sm-12"> List of Offers</div>
                    </div>
                    <!-- /.row -->
                    <br/><br/>
                    <div class="row">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th style="text-align:center;width:5%">Bil</th>
                                    <th style="text-align:center;width:65%">Tawaran</th>
                                    <th colspan="3" style="text-align:center;width:15%">Borang</th>
                                    <th style="text-align:center;width:10%">Sambutan</th>
                                    <th style="text-align:center;width:5%">Tarikh</th>
                                </tr>
                                <tr>
                                    <th style="text-align:center;width:5%">&nbsp;</th>
                                    <th style="text-align:center;width:65%">&nbsp;</th>
                                    <th style="text-align:center;width:5%">A</th>
                                    <th style="text-align:center;width:5%">B</th>
                                    <th style="text-align:center;width:5%">C</th>
                                    <th style="text-align:center;width:10%">&nbsp;</th>
                                    <th style="text-align:center;width:5%">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Data from DB. Below rows to be remarked upon DB connection.-->
                                <%
                                    session.setAttribute("CandidateID", "1");
    
                                    String CandidateID = session.getAttribute("CandidateID").toString();
                                    
                                    objData objdata = new objData();
                                    Offers offer = new Offers();
                                    
                                    objdata = offer.getCandidateOffers(CandidateID);
                                    if (objdata.getFlag()==1){
                                        System.out.println(objdata.getErrorMessage());
                                    }
                                    else{
                                        for(int row = 0; row < objdata.getTableData().size(); row++){
                                            ArrayList<String> Row = objdata.getTableData().get(row);
                                        
                                %>
                                <tr>
                                    <td><%=row+1%></td>
                                    <td><%=Row.get(0)%></td>
                                    <td><a href="#">Download</a></td>
                                    <td><a href="#">Download</a></td>
                                    <td><a href="#">Download</a></td>
                                    <td><a href="#">Terima</a>&nbsp;&nbsp;<a href="#">Tolak</a></td>
                                    <td><%=Row.get(1)%></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</div>
<!-- jQuery -->
<script src="js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
