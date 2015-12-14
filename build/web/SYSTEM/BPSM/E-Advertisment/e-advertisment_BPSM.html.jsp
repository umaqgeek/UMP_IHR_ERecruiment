<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>E-Advertisement</title>

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
    
    .col-sm-12 {
    background-color: blue;
    }
    
    th {
         background-color:blue;
		 color:white;
    }
 		.hiddenRow {
		padding: 0 !important;
	}
	</style>
	
	<!--Javascript-->
	<script src="../../js/jquery.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
	
	
	

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
                <a class="navbar-brand" href="#!">BPSM</a>
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
                            <li class="active">
                                <i class="fa fa-file"></i> E-Advertisement
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
				<div class="row">
				
					<div class="well">	
					
						<table class="table table-condensed" style="border-collapse:collapse;">
							<thead>
								<tr>
									<th>#</th>
									<th>Gred</th>
									<th>Position</th>
									<th>Total</th>
									<th>Status</th>
									<th>Setup</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>FT41</td>
									<td>Pegawai Teknologi Maklumat</td>
									<td><span class="badge">3</span></td>
									<td></td>
									<td><a href="e-advertisment_BPSM_setup.html.jsp" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
								</tr>						
							</tbody>
						</table>
						
						<!-- Modal 
						<div id="myModal" class="modal fade" role="dialog">
						  <div class="modal-dialog">

							<!-- Modal content
							<div class="modal-content">
							  
							  <div class="modal-body">
								<table class="table table-condensed" style="border-collapse:collapse;">
									<thead>
										<tr>
											<th>#</th>
											<th>Gred</th>
											<th>Position</th>
											<th>Level Posts</th>
											<th>Total</th>
											<th>Setup</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>FT41</td>
											<td>Pegawai Teknologi Maklumat</td>
											<td>Permanent</td>
											<td><span class="badge">2</span></td>
											<td><a href="e-advertisment_BPSM_setup_sample1.html.jsp" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
										</tr>
										<tr>
											<td>2</td>
											<td>FT41</td>
											<td>Pegawai Teknologi Maklumat</td>
											<td>Contract</td>
											<td><span class="badge">1</span></td>
											<td><a href="e-advertisment_BPSM_setup_sample2.html.jsp" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
										</tr>							
										
									</tbody>
								</table>
							  </div>
							  <div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							  </div>
							</div>

						  </div>
						</div>-->
						
					</div>
				<!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
        </div></div>

</body>

</html>
