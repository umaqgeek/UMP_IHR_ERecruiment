
	
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
                            <small>PTJ</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="?m=Dashboard">Dashboard</a>
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
				
				<div class="row">
				<div class="well">
           <div class="row">
               <div class="col-sm-12"> Setup eIklan (PTJ)</div>
           </div>
           
           <div class="row">
               <div class="col-md-12"> &nbsp;</div>
           </div>
           
           <div class="row">
               <div class="col-sm-1"></div>
               <div class="col-sm-3"> Gred & Jawatan</div>
               <div class="col-sm-3"> 
                    <div class="form-group">
                        <label class="sr-only" for="gred">Gred</label>
                        <input type="text" class="form-control" id="gred" placeholder="Gred">
                    </div>
               </div>
               <div class="col-sm-3"> 
                    <div class="form-group">
                        <label class="sr-only" for="jawatan">Jawatan</label>
                        <input type="text" class="form-control" id="jawatan" placeholder="Jawatan">
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
                        <input type="text" class="form-control" id="gred" placeholder="">
                    </div>
               </div>
           </div>
           
           
           <div class="row">
               <div class="col-sm-1"></div>
               <div class="col-sm-3"> Kekosongan jawatan :</div>
               
               <div class="col-sm-2">Jenis</div>
               <div class="col-sm-2">Jumlah</div>
               <div class="col-sm-3">Kampus Penempatan</div>
           </div>
           
           <div class="row">
               <div class="col-sm-4"></div>
               <div class="col-sm-2">
                   <div class="form-group">
                        <label class="sr-only" for="jenis">Jenis</label>
                        <input type="text" class="form-control" id="jenis" placeholder="Jenis">
                    </div>
               </div>
               <div class="col-sm-2">
                   <div class="form-group">
                        <label class="sr-only" for="jumlah">Jumlah</label>
                        <input type="text" class="form-control" id="jumlah" placeholder="Jumlah">
                    </div>
               </div>
               <div class="col-sm-3">
                   <div class="form-group">
                        <label class="sr-only" for="kampusPenempatan">Kampus Penempatan</label>
                        <input type="text" class="form-control" id="kampusPenempataned" placeholder="Kampus Penempatan">
                    </div>
               </div>
           </div>
           
           <div class="row">
               <div class="col-sm-4"></div>
               <div class="col-sm-2">
                   <div class="form-group">
                        <label class="sr-only" for="jenis">Jenis</label>
                        <input type="text" class="form-control" id="jenis" placeholder="Jenis">
                    </div>
               </div>
               <div class="col-sm-2">
                   <div class="form-group">
                        <label class="sr-only" for="jumlah">Jumlah</label>
                        <input type="text" class="form-control" id="jumlah" placeholder="Jumlah">
                    </div>
               </div>
               <div class="col-sm-3">
                   <div class="form-group">
                        <label class="sr-only" for="kampusPenempatan">Kampus Penempatan</label>
                        <input type="text" class="form-control" id="kampusPenempataned" placeholder="Kampus Penempatan">
                    </div>
               </div>
           </div>
           
           <div class="row">
               <div class="col-sm-1"></div>
               <div class="col-sm-3">Kompetensi Khusus (PTJ):</div>
               <div class="col-sm-4">
  
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
                            <div class="tab-pane fade active in" id="set1">
                                 <div class="form-group">
                                     <label class="sr-only" for="skill">Skill</label>
                                     <input type="text" class="form-control" id="skill" placeholder="Skill">
                                </div>
                            </div>
                            <div class="tab-pane fade" id="set2">
                                <div class="form-group">
                                     <label class="sr-only" for="attitude">Attitude</label>
                                     <input type="text" class="form-control" id="attitude" placeholder="Attitude">
                                </div>
                             </div>
                            <div class="tab-pane fade" id="set3">
                                <div class="form-group">
                                     <label class="sr-only" for="knowledge">Knowledge</label>
                                     <input type="text" class="form-control" id="knowledge" placeholder="knowledge">
                                </div>
                             </div>
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
                   
              
       
               <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-3">Bidang Kepakaran (PTJ):</div>
                    <div class="col-sm-3">

                        <div class="checkbox">
                             <label><input type="checkbox" value="">Kepakaran 1</label>
                           </div>
                           <div class="checkbox">
                             <label><input type="checkbox" value="">Kepakaran 2</label>
                           </div>
                           <div class="checkbox ">
                             <label><input type="checkbox" value="" >Kepakaran 3</label>
                        </div>

                    </div>
               </div>
               
           <div class="row">
               <div class="col-sm-1"></div>
               <div class="col-sm-3"> Syarat tambahan (jika ada) (PTJ):</div>
               <div class="col-sm-6"> 
               
                  <div class="form-group">
                    <textarea class="form-control" rows="5" id="comment"></textarea>
                  </div>
                   
               </div>
           
           </div>
           
           <div class="row">
               <div class="col-sm-3"></div>
               <div class="col-sm-1"><input type="button" value="SAVE" class="btn btn-info" /></div>
               <div class="col-sm-1"><input type="button" value="SUBMIT TO HR" class="btn btn-info" 
                                            onclick="location.href='?m=EIklan2'" /></div>
            </div>
           <br/>
           <div class="row">
               
               <table class="table table-bordered">
                <thead>
                  <tr>
                      <th colspan="2">Ref ID</th>
                    <th>Service Code</th>
                    <th>Dept Code</th>
                    <th>Dept Desc</th>
                    <th></th>
                    <th></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
            </div>

               
           </div>
				</div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
