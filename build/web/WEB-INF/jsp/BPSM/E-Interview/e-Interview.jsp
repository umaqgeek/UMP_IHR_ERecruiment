<%@ import=eRecruitment.eInterview%>
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
                <div class="col-sm-12"> e-Personality Test</div>
            </div>
            <!-- /.row -->
            <br/><br/>
            <div class="row">
                <form class="form-horizontal" id="frm" name="frm" action="#" method="POST" role="form">
                    <table>
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Grade</th>
                                <th>Department</th>
                                <th>Ad Starts On</th>
                                <th>Ad Ends On</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                for (int inc = 0; inc < cnt; inc++){ 
                            %>
                            <tr>
                                <td><%%></td>
                                <td><%%></td>
                                <td><%%></td>
                                <td><%%></td>
                                <td><%%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </form>
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
