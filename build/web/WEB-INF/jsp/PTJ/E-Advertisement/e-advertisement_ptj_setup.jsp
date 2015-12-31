<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"> Setup E-Advertisement (PTJ)</div>
        </div>

        <div class="row">
            <div class="col-md-12"> &nbsp;</div>
        </div>

        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-3"> Grade & Position </div>
            <div class="col-sm-3"> 
                <div class="form-group">
                    <label class="sr-only" for="gred">Grade</label>
                    <input type="text" style="background-color: #C0C0C0 ; " class="form-control" id="gred" placeholder="Grade" Value="FT41" disabled>
                </div>
            </div>
            <div class="col-sm-3"> 
                <div class="form-group">
                    <label class="sr-only" for="position">Position </label>
                    <input type="text" style="background-color: #C0C0C0 ; "class="form-control" id="position" placeholder="Position" value="Pegawai Teknologi Maklumat" disabled>
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
            <div class="col-sm-3"> Vacancy Position  :</div>

            <div class="col-sm-2"></div>
            <div class="col-sm-2"></div>
            <div class="col-sm-3"></div>
        </div>

        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-2">
                <div class="form-group">
                    <label for="type">Job Status</label>
                    <div class="form-group">
                        <select class="form-control" id="sel1">
                            <option>Permanent</option>
                            <option>Contract</option>
                            <option>Fellowship</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-sm-2">
                <div class="form-group">
                    <label for="total">Total</label>
                    <div class="form-group">
                        <select class="form-control" id="sel1">
                            <option>1</option>
                            <option>2</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label  for="campusPlacement">Campus </label>
                    <div class="form-group">
                        <select class="form-control" id="sel1">
                            <option>Gambang</option>
                            <option>Pekan</option>
                            <option>Pekan & Gambang</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-sm-1">
                <div class="form-group">
                    <label  for="campusPlacement">Add </label>
                    <div class="form-group">
                        <a href="#"><i class="glyphicon glyphicon-plus"></i></a>
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
                            <textarea name="editor1" id="editor1" rows="10" cols="80">
									
                            </textarea>
                            <script>
                                // Replace the <textarea id="editor1"> with a CKEditor
                                // instance, using default configuration.
                                CKEDITOR.replace('editor1');
                            </script>

                        </div>

                        <div class="tab-pane fade" id="set2">
                            <textarea name="editor1" id="editor2" rows="10" cols="80">
									
                            </textarea>
                            <script>
                                // Replace the <textarea id="editor1"> with a CKEditor
                                // instance, using default configuration.
                                CKEDITOR.replace('editor2');
                            </script>

                        </div>

                        <div class="tab-pane fade" id="set3">

                            <textarea name="editor1" id="editor3" rows="10" cols="80">
									
                            </textarea>
                            <script>
                                // Replace the <textarea id="editor1"> with a CKEditor
                                // instance, using default configuration.
                                CKEDITOR.replace('editor3');
                            </script>

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
            <div class="col-sm-3"> Area of Expertise  (PTJ):</div>
            <div class="col-sm-3">

                <div class="checkbox">
                    <label><input type="checkbox" value="">Skill 1</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value="">Skill 2</label>
                </div>
                <div class="checkbox ">
                    <label><input type="checkbox" value="" >Skill 3</label>
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
                <textarea name="editor4" id="editor4" rows="10" cols="80">
									
                </textarea>
                <script>
                    // Replace the <textarea id="editor1"> with a CKEditor
                    // instance, using default configuration.
                    CKEDITOR.replace('editor4');
                </script>
            </div>
        </div>
        <br/>

        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-1"><input type="button" value="SAVE" ></div>
            <div class="col-sm-1"><input type="button" value="SUBMIT TO HR" ></div>
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
                        <th>Grade</th>
                        <th>Position</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td><a href="#">FT41</a></td>
                        <td><a href="#">Pegawai Teknologi Maklumat</a></td>
                        <td>2</td>
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