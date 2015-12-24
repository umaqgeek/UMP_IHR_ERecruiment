<jsp:include page="/WEB-INF/jsp/menu.jsp"></jsp:include>
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
                    <div class="col-sm-12"> Setup e-Personality Test</div>
                </div>
                <!-- /.row -->
                <br/><br/>
                <div class="row">
                    <form class="form-horizontal" id="frm" name="frm" action="#" method="POST" role="form">
                        <div class="form-actions">
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myA">New Answer</button>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">STRENGTHS</label>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label"><a href="#" data-toggle="modal" data-target="#myA">1.</a></label>
                            <div class="col-lg-2">
                                <label class="form-control">Adventurous</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Adaptable</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Animated</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Analytical</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label"><a href="#" data-toggle="modal" data-target="#myA">2.</a></label>
                            <div class="col-lg-2">
                                <label class="form-control">Persistent</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Playful</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Persuasive</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Peaceful</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label"><a href="#" data-toggle="modal" data-target="#myA">3.</a></label>
                            <div class="col-lg-2">
                                <label class="form-control">Submissive</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Self-sacrificing</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Sociable</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Strong-willed</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">WEAKNESSES</label>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label"><a href="#" data-toggle="modal" data-target="#myA">1.</a></label>
                            <div class="col-lg-2">
                                <label class="form-control">Blank</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Bashful</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Brassy</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Bossy</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label"><a href="#" data-toggle="modal" data-target="#myA">2.</a></label>
                            <div class="col-lg-2">
                                <label class="form-control">Undisciplined</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Unsympathetic</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Unenthusiastic</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Unforgiving</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label"><a href="#" data-toggle="modal" data-target="#myA">3.</a></label>
                            <div class="col-lg-2">
                                <label class="form-control">Reticent</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Resentful</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Resistant</label>
                            </div>
                            <div class="col-lg-2">
                                <label class="form-control">Repetitious</label>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myA">New Answer</button>
                        </div>
                    </form>
                </div>
                <!-- Add/Edit Answer DIV-->
                <div id="myA" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content for Universiti-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Add / Edit Personality Test Answer</h4>
                            </div>
                            <div class="modal-body">
                                <form id="frmQ" name="frmQ" method="POST" class="form-horizontal" action="#">
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">Category</label>
                                        <div class="col-lg-6">
                                            <select id="lst_pt_cat" name="lst_pt_cat" class="form-control">
                                                <option value="1">STRENGTHS</option>
                                                <option value="2">WEAKNESSES</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">A.</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_pt_a" name="txt_pt_a" class="form-control" placeholder="Animated" Required="true"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <select id="lst_pt_score_a" name="lst_pt_score_a" class="form-control">
                                                <option value="1">Popular Sanguine</option>
                                                <option value="2">Powerful Choleric</option>
                                                <option value="3">Perfect Melancholy</option>
                                                <option value="4">Peaceful Phlegmatic</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">B.</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_pt_b" name="txt_pt_b" class="form-control" placeholder="Adventurous" Required="true"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <select id="lst_pt_score_b" name="lst_pt_score_b" class="form-control">
                                                <option value="1">Popular Sanguine</option>
                                                <option value="2">Powerful Choleric</option>
                                                <option value="3">Perfect Melancholy</option>
                                                <option value="4">Peaceful Phlegmatic</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">C.</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_pt_c" name="txt_pt_c" class="form-control" placeholder="Analytical" Required="true"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <select id="lst_pt_score_c" name="lst_pt_score_c" class="form-control">
                                                <option value="1">Popular Sanguine</option>
                                                <option value="2">Powerful Choleric</option>
                                                <option value="3">Perfect Melancholy</option>
                                                <option value="4">Peaceful Phlegmatic</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">D.</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_pt_d" name="txt_pt_d" class="form-control" placeholder="Adaptable" Required="true"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <select id="lst_pt_score_d" name="lst_pt_score_d" class="form-control">
                                                <option value="1">Popular Sanguine</option>
                                                <option value="2">Powerful Choleric</option>
                                                <option value="3">Perfect Melancholy</option>
                                                <option value="4">Peaceful Phlegmatic</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Save</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
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

