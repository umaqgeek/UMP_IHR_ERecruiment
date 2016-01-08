<div class="well">



    <div class="row">
        <div class="col-sm-12">E-Advertisement Mini Setup (BPSM)</div>
    </div>



    <div class="row">
        <div class="col-md-12"> &nbsp;</div>
    </div>
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-3"> Grade & Position</div>
        <div class="col-sm-3"> 
            <div class="form-group">
                <label class="sr-only" for="gred">Grade</label>
                <input type="text"  class="form-control" id="gred" placeholder="Gred" >
            </div>
        </div>
        <div class="col-sm-3"> 
            <div class="form-group">
                <label class="sr-only" for="position">Position</label>
                <input type="text" class="form-control" id="position" placeholder="position" >
            </div>
        </div>
        <div class="col-sm-2"> </div>
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
                CKEDITOR.replace('editor3');
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
                    <th>Grade</th>
                    <th>Postiton</th>
                    <th>Edit</th>
                    <th>Delete</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td><a href="#">FT41</a></td>
                    <td><a href="#">Pegawai Teknologi Maklumat</a></td>
                    <td><a href="#"><i class="glyphicon glyphicon-edit"></a></td>
                    <td><a href="#"><i class="glyphicon glyphicon-remove"></i></a></td>
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