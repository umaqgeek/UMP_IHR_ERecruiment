
	
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
    }
  </style>
	


    <div id="wrapper">

        <jsp:include page="../menu.jsp"></jsp:include>

        <div id="page-wrapper">

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
                                <i class="fa fa-dashboard"></i>  <a href="e-recruitment-home.html">Dashboard</a>
                            </li>
							<li class="active">
                                <i class="fa fa-file"></i> System
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> e-Iklan
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
				<div class="well">
       
            <div class="row">
               <div class="col-sm-12"> Setup eIklan (BPSM)</div>
           </div>
           
           <div class="row">
               <div class="col-md-12"> &nbsp;</div>
           </div>
           
           <div class="row">
               <div class="col-md-1"></div>
               <div class="col-md-2">Tarikh buka :</div>
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
               
               <div class="col-md-2">Tarikh Tutup :</div>
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
                <div class="col-md-3"> Kompetensi Umum :</div>
                <div class="col-md-1"> SPM                    </div>
                <div class="col-md-1"> BM &nbsp; </div>
                <div class="col-md-2">
                    <div class="form-group">
                         <label class="sr-only" for="bm">BM</label>
                          <input type="text" class="form-control" id="bm" placeholder="bm">
                     </div>
                </div>
                <div class="col-md-1"> BI &nbsp; </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label class="sr-only" for="BI">BI</label>
                        <input type="text" class="form-control" id="BI" placeholder="BI">
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
               <div class="col-sm-3"> Syarat Lantikan:</div>
               <div class="col-sm-6"> 
                  <div class="form-group">
                    <textarea class="form-control" rows="5" id="lantikan"></textarea>
                  </div> 
               </div>
           </div>
           
           <div class="row">
               <div class="col-sm-1"></div>
               <div class="col-sm-3">Jadual Gaji:</div>
               <div class="col-sm-3">
                   <div class="form-group">
                        <label class="sr-only" for="jadualGaji">Jadul Gaji</label>
                        <input type="text" class="form-control" id="jadualGaji" placeholder="jadualGaji">
                    </div>
               </div>
           
            </div>
           
           <div class="row">
               <div class="col-sm-2"></div>
               <div class="col-sm-1"><input type="button" value="SAVE" ></div>
              
               <div class="col-sm-1"><input type="button" value="PREVIEW"></div>
               <div class="col-sm-1"><input type="button" value="REPORT"></div>
            
               <div class="col-sm-1"><input type="button" value="PUBLISH"></div>
               
            </div>
       </div>
    </div>
				</div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

