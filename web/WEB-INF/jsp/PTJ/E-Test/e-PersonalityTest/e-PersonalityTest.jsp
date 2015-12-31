<%@page import="helpers.objData" %>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        <% System.out.println("e-Recruitment"); %><small><% System.out.println("PTJ"); %></small>
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
                        <form class="form-horizontal" id="frm" name="frm" action="SPTR" method="POST" role="form">
                            <%
                                objData objdata = new objData();
                            %>
                            <div class="form-group">
                                <label class="col-lg-1 control-label">&nbsp;</label>
                                <div class="col-lg-10">
                                    <p>Directions In each of the following rows of four words across opt one word that most often applies to you. Continue through all listed lines; be sure each number is marked. If you are not sure which word “most applies,” ask a spouse or a friend, and think of what your answer would have been when you were a child.</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-3">
                                    <input type="radio" id="" name="" value="<%%>"/>
                                    <%%>
                                </div>
                                <div class="col-lg-3">
                                    <input type="radio" id="" name="" value="<%%>"/>
                                    <%%>
                                </div>
                                <div class="col-lg-3">
                                    <input type="radio" id="" name="" value="<%%>"/>
                                    <%%>
                                </div>
                                <div class="col-lg-3">
                                    <input type="radio" id="" name="" value="<%%>"/>
                                    <%%>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</div>