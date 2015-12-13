<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>E-Advertisement Setup</title>
	
	<!--Plugin Javascript-->
	<script src="../../ckeditor/ckeditor.js"></script>
	<script>
			$(document).ready(function() {
				$("#txtEditor").Editor();
			});
	</script>

    <!-- Bootstrap Core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<!--Internal Css-->
	<style type="text/css">
    .bs-example{
    	margin: 20px;
    }
    
    .col-sm-12 ,.col-sm-10 {
    background-color: blue;
	 color:white;
    }
    
    th {
         background-color:blue;
		 color:white;
    }
  </style>
	

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html.jsp">BPSM</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading">
                                            <strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading">
                                            <strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading">
                                            <strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="../../index.html.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="../e-recruitment-home.html.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li>
                    <!---<li>
                        <a href="charts.html.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                    </li>
                    <li>
                        <a href="tables.html.jsp"><i class="fa fa-fw fa-table"></i> Tables</a>
                    </li>
                    <li>
                        <a href="forms.html.jsp"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
                    <li>
                        <a href="bootstrap-elements.html.jsp"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                    </li>
                    <li>
                        <a href="bootstrap-grid.html.jsp"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                 <a href="e-iklan.html.jsp"><i class="fa fa-fw fa-file"></i> e-Iklan</a>
                            </li>
                        </ul>
                    </li>-->
                    <li>
                        <a href="../e-recruitment-home.html.jsp"><i class="fa fa-fw fa-file"></i> System</a>
                    </li>
                    <li class="active">
                        <a href="javascript:;"data-toggle="collapse" data-target="#demo1"><i class="fa fa-fw fa-file"></i>  E-Advertisement (BPSM) <i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="demo1" class="collapse">
							<li>
                                 <a href="e-advertisment_BPSM.html.jsp"><i class="fa fa-fw fa-file"></i> Main Setup</a>
                            </li>
                            <li>
                                 <a href="e-advertisment_BPSM_mini_setup.html.jsp"><i class="fa fa-fw fa-file"></i> Setup Gred & Name</a>
                            </li>
                        </ul>
					</li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            E-Recruitment
                            <small>BPSM</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="../e-recruitment-home.html.jsp">Dashboard</a>
                            </li>
							<li class="active">
                                <i class="fa fa-file"></i> System
                            </li>
							  <li>
                                <i class="fa fa-file"></i><a href="e-advertisment_BPSM.html.jsp">E-Advertisement</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> Setup
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

			<div class="well">
			
			
			<div class="row">
               <div class="col-sm-12">E-Advertisement Setup (PTJ) <button type="button" style="float:right;" class="btn btn-primary btn-xs" data-toggle="collapse" data-target="#demo">Expand</button></div>
			   
           </div>
				<div id="demo" class="collapse">
						<div class="row">
						
					   
					   <div class="row">
						   <div class="col-md-12"> &nbsp;</div>
					   </div>
					   
					   <div class="row">
						   <div class="col-sm-1"></div>
						   <div class="col-sm-3"> Gred & Position</div>
						   <div class="col-sm-3"> 
								<div class="form-group">
									<label class="sr-only" for="gred">Gred</label>
									<input type="text" style="background-color: #C0C0C0;" class="form-control" id="gred" placeholder="Gred" Value="FT41" disabled>
								</div>
						   </div>
						   <div class="col-sm-3"> 
								<div class="form-group">
									<label class="sr-only" for="position">Position</label>
									<input type="text" style="background-color: #C0C0C0 ; "class="form-control" id="position" placeholder="position" value="Pegawai Teknologi Maklumat" disabled>
								</div>
						   </div>
						   <div class="col-sm-2"> </div>
					   </div>
					   
					   <div class="row">
						   <div class="col-sm-1"></div>
						   <div class="col-sm-3"> PTJ:</div>
						   <div class="col-sm-6"> 
								<div class="form-group">
									<label class="sr-only" for="gred">PTJ</label>
									<input type="text" style="background-color: #C0C0C0;" class="form-control" id="gred" placeholder="" value="Nama Jabatan" disabled>
								</div>
						   </div>
					   </div>
					   
					   
					   <div class="row">
						   <div class="col-sm-1"></div>
						   <div class="col-sm-3"> Vacancy position :</div>
						   
						   <div class="col-sm-2"></div>
						   <div class="col-sm-2"></div>
						   <div class="col-sm-3"></div>
					   </div>
					   
					   <div class="row">
						   <div class="col-sm-4"></div>
						   <div class="col-sm-2">
							   <div class="form-group">
									<label for="type">Level Posts</label>
									<div class="form-group">
									  <select class="form-control" id="sel1" disabled style="background-color: #C0C0C0;">
										<option>Permanent</option>
										<option>Contract</option>
										<option>Temporary</option>
									  </select>
									 </div>
								</div>
						   </div>
						   <div class="col-sm-2">
							   <div class="form-group">
									<label for="total">Total</label>
									<div class="form-group">
									  <select class="form-control" id="sel1" disabled style="background-color: #C0C0C0;">
										<option>2</option>
										<option>1</option>
									  </select>
									 </div>
								</div>
						   </div>
						   <div class="col-sm-3">
							   <div class="form-group">
									<label  for="campusPlacement">Campus </label>
									<div class="form-group">
									  <select class="form-control" id="sel1" disabled style="background-color: #C0C0C0;">
										<option>Gambang</option>
										<option>Pekan</option>
									  </select>
									 </div>
								</div>
						   </div>

					   </div>
					   
					   
					   
					   <div class="row">
						   <div class="col-sm-1"></div>
						   <div class="col-sm-3">Special Competence (PTJ):</div>
						   <div class="col-lg-8">
			  
							   <div class="tabbable boxed parentTabs">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#set1">Skill</a>  
										</li>
										<li><a href="#set2">Attitude</a>
										</li>
										<li><a href="#set3">Knowledge</a>
										</li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade in active" id="set1">
											<textarea name="editor1" id="editor1" rows="10" cols="80" disabled style="background-color: #C0C0C0;">
												
											</textarea>
											
										</div>
										
										<div class="tab-pane fade" id="set2">
										<textarea name="editor1" id="editor2" rows="10" cols="80" disabled style="background-color: #C0C0C0;">
												
											</textarea>
											
										
										</div>
										
										<div class="tab-pane fade" id="set3">
										
										<textarea name="editor1" id="editor3" rows="10" cols="80" disabled style="background-color: #C0C0C0;">
												
											</textarea>
											
										
										</div>
									</div>
								</div>
							   
							   <script>
								   $("ul.nav-tabs a").click(function (e) {
									e.preventDefault();  
									  $(this).tab('show');
								  });
							   </script>
							   
								</div>
							</div>
							 
							
							
							
						
				   
						   <div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-3">Expert Field (PTJ):</div>
								<div class="col-sm-3">

									<div class="checkbox">
										 <label><input type="checkbox" value="" disabled style="background-color: #C0C0C0;">Skill 1</label>
									   </div>
									   <div class="checkbox">
										 <label><input type="checkbox" value="" disabled style="background-color: #C0C0C0;">Skill 2</label>
									   </div>
									   <div class="checkbox ">
										 <label><input type="checkbox" value=""  disabled style="background-color: #C0C0C0;">Skill 3</label>
									</div>

								</div>
						   </div>
						   
					   <div class="row">
						   <div class="col-sm-1"></div>
						   <div class="col-sm-4"> Additional conditions (if any) (PTJ):</div>
						   <div class="col-sm-5"></div>
					   </div>
					   
					   <div class="row">
						  <div class="col-sm-4"></div>
						  <div class="col-sm-8">
						  <textarea name="editor4" id="editor4" rows="10" cols="80" disabled style="background-color: #C0C0C0;">
												
											</textarea>
											
						  </div>
					   </div>
				</div>
				<br/>
				</div>
				
			 	
				 
       <br/>
           <div class="row">
               <div class="col-sm-12">E-Advertisement Setup (BPSM)</div>
           </div>
		   
		  
           
           <div class="row">
               <div class="col-md-12"> &nbsp;</div>
           </div>
           
           <div class="row">
               <div class="col-md-1"></div>
               <div class="col-md-2">Start Date :</div>
               <div class="col-md-3">
                   <div class="form-group">
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
               
               <div class="col-md-2">End Date :</div>
               <div class="col-md-3">
                   
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker2'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                        <script type="text/javascript">
                            $(function () {
                                $('#datetimepicker2').datetimepicker();
                            });
                        </script>
                    </div>
                </div>
                   
               </div>
           </div>
           
           <div class="row">
               <div class="col-md-1"> &nbsp;</div>
                <div class="col-md-3"> General competence :</div>
                <div class="col-md-1"> SPM                    </div>
                <div class="col-sm-1"> BM  </div>
                <div class="col-md-2">
                    <div class="form-group">
                         <label class="sr-only" for="bm">BM</label>
                          
						  <select class="form-control" id="sel1">
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
						  </select>
						 
                     </div>
                </div>
                <div class="col-sm-1"> BI </div>
                <div class="col-sm-1">
                    <div class="form-group">
                        <label class="sr-only" for="BI">BI</label>
                       
						  <select class="form-control" id="sel1">
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
						  </select>
						 
                     </div>
                </div>
           </div>
           
           <div class="row">
               <div class="col-md-4"> &nbsp;</div>
                <div class="col-md-1"> CGPA:</div>
                
                <div class="col-md-3">
                    <div class="form-group">
                          <label class="sr-only" for="cgpa">cgpa</label>
                          <input type="text" class="form-control" id="cgpa" placeholder="cgpa">
                     </div>
                </div>
               
           </div>
           
           <div class="row">
               <div class="col-md-4"> &nbsp;</div>
                <div class="col-md-1"> MUET:</div>
                
                <div class="col-md-3">
                    <div class="form-group">
                          <label class="sr-only" for="muet">MUET</label>
                          <input type="text" class="form-control" id="muet" placeholder="muet">
                     </div>
                </div>
               
           </div>
           
            <div class="row">
               <div class="col-sm-1"></div>
               <div class="col-sm-2"> Terms of Appointment:</div>
               <div class="col-sm-8"> 
                  <textarea name="editor3" id="editor3" rows="10" cols="80">
									
								</textarea>
								<script>
									// Replace the <textarea id="editor1"> with a CKEditor
									// instance, using default configuration.
									CKEDITOR.replace( 'editor3' );
								</script>
               </div>
           </div>
            <br/>
           <div class="row">
               <div class="col-sm-1"></div>
               <div class="col-sm-2">Salary Schedule:</div>
               <div class="col-sm-3">
                   <div class="form-group">
                        <input type="text" class="form-control" id="jadualGaji" placeholder="Min">
                        <input type="text" class="form-control" id="jadualGaji" placeholder="Max">
                    </div>
               </div>
           
            </div>
          
           <div class="row">
		    
               <div class="col-sm-4"></div>
               <div class="col-sm-8">
				   <div class="form-group">
					<input type="button" value="SAVE" >
					<input type="button" value="PREVIEW">
					<input type="button" value="REPORT">
					<input type="button" value="PUBLISH">
				   </div>
			   </div>
               <div class="col-sm-1"></div>

            </div>
			
			<br/>
           <div class="row">
			
			   <form class="navbar-form" role="search">
			   
			   <div style="float:left;" class="form-group">
				<select class="form-control" id="sel1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
			   
			
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<div class="form-group">
				<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
				</div>
			</form>
			
			   
               <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Gred</th>
                    <th>Postiton</th>
                    <th>Total</th>
					<th>Start Date</th>
					<th>End Date</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td><a href="#">FT41</a></td>
                    <td><a href="#">Pegawai Teknologi Maklumat</a></td>
                    <td>2</td>
					<td>1/12/2015</td>
					<td>30/12/2015</td>
                  </tr>
 
                </tbody>
              </table>
			  <nav>
				  <ul class="pagination pagination-sm pull-right">
					<li>
					  <a href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					  </a>
					</li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li>
					  <a href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					  </a>
					</li>
				  </ul>
				</nav>
            </div>
			
       </div>
    </div>
				</div>

            </div>
            <!-- /.container-fluid -->


    <!-- jQuery -->
    <script src="../../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../js/bootstrap.min.js"></script>

</body>

</html>
