

    <div id="wrapper">

        <jsp:include page="../menu.jsp"></jsp:include>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            e-Recruitment
                            <small>Applicant</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="?m=Dashboard"> Dashboard</a>
                            </li>
                            <li >
                                <i class="fa fa-file"></i><a href="?m=Application"> e-Application</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> Personal Information
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

				<div class="row">
					
						<h1>Personal Information</h1>
						<hr>
						<div class="row">
						  <!-- left column -->
						  <div class="col-md-4">
							<div class="text-center">
							  <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
							  <h6>Upload a different photo...</h6>
							  
							  <input type="file" class="form-control">
							</div>
						  </div>
						  
						  <!-- edit form column -->
						  <div class="col-md-7 personal-info">
							<div class="alert alert-info alert-dismissable">
							  <a class="panel-close close" data-dismiss="alert">×</a> 
							  <i class="fa fa-coffee"></i>
							  This is an <strong>.alert</strong>. Use this to show important messages to the user.
							</div>
							<h3>Personal info</h3>
							
							<form class="form-horizontal" role="form">
							  <div class="form-group">
								<label class="col-lg-3 control-label">Full Name:</label>
								<div class="col-lg-6">
								  <input class="form-control" type="text" value="Jane">
								</div>
							  </div>
							  
								<div class="form-inline">
									<div class="controls-row">
											
											<label class="radio inline">
												<input type="radio" value="1"/>
												Male
											</label>
											<label class="radio inline">
												<input type="radio" value="2"/>
												Female
											 </label>
									</div>
								</div>
								<div class="form-group">
								<label class="col-lg-3 control-label">Relegion:</label>
								<div class="col-lg-6">
								  <input class="form-control" type="text" value="">
								</div>
							  </div>
							  
							  <div class="form-group">
								<label class="col-lg-3 control-label">Date Of Birth:</label>
								<div class="col-lg-6">
								 
												<div class='input-group date' id='datetimepicker1'>
													<input type='text' class="form-control" />
													<span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
									   
										<script type="text/javascript">
											$(function () {
												$('#datetimepicker1').datetimepicker();
											});
										</script>
									</div>
								</div>
							  </div>
							  
							  <div class="form-group">
								<label class="col-lg-3 control-label">Age:</label>
								<div class="col-lg-3">
								  <input class="form-control" type="text" value="">
								</div>
							  </div>
							  <div>
							  <div class="form-inline">
									<div class="controls-row">
											<label class="col-lg-3 control-label">Nationality:</label>
											<label class="radio inline">
												<input type="radio" value="1"/>
												Male
											</label>
											<label class="radio inline">
												<input type="radio" value="2"/>
												Female
											 </label>
									</div>
								</div>
							</div>
							  <div class="form-group">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-7">
								  <input type="button" class="btn btn-primary" value="Save Changes">
								  <span></span>
								  <input type="reset" class="btn btn-default" value="Cancel">
								</div>
							  </div>
							</form>
						  </div>
					  </div>
					<hr>
				</div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

