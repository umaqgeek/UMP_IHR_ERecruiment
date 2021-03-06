<!--<div class="panel-group">
    <!---Personal
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <button id="personal" type="button" class="btn btn-success" data-toggle="collapse" data-target="#collapse1">
                    <span class="glyphicon glyphicon-collapse-down"></span> Personal Information
                </button>
            </h4>
        </div>
        <div id="collapse1" class="panel-collapse collapse in">
            <div class="panel-body">
                <div class="row">

                    <div class="row">
                        <!-- left column 
                        <div class="col-md-4">
                            <div class="text-center">
                                <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
                                <h6>Upload a different photo...</h6>

                                <input type="file" class="form-control">
                            </div>
                        </div>

                        <!-- edit form column 
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

                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Address:</label>
                                    <div class="col-lg-6">
                                        <textarea name="" cols="45" rows="5"></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Postcode:</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" type="text" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-3 control-label">State:</label>
                                    <div class="col-lg-6">
                                        <select class="form-control" id="sel1">
                                            <option>Johor Darul Tazim</option>
                                            <option>Selangor Darul Ehsan</option>
                                            <option>Pahang Darul Makmur</option>
                                            <option>Kelantan Darul Naim</option>
                                            <option>Kuala Lumpur</option>
                                            <option>Kedah Darul Aman</option>
                                            <option>Melaka</option>
                                            <option>Negeri Sembilan</option>
                                            <option>Perak Darul Ridzuan</option>
                                            <option>Perlis </option>
                                            <option>Pulau Pinang</option>
                                            <option>Sabah</option>
                                            <option>Sarawak</option>
                                            <option>Terengganu Darul Iman</option>
                                        </select> 
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Town:</label>
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
                                                });											</script>
                                        </div>
                                    </div>
                                </div> 



                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Phone Number:</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" type="text" value="">
                                    </div>
                                </div>   

                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Email:</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" type="text" value="">
                                    </div>
                                </div>     


                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Gender:</label>
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
                                        <label class="col-lg-3 control-label">Religion:</label>
                                        <div class="col-lg-6">
                                            <select class="form-control" id="sel1">
                                                <option>Islam</option>
                                                <option>Kristian</option>
                                                <option>Hindu</option>
                                                <option>Buddha</option>

                                            </select> 
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Race:</label>
                                        <div class="col-lg-6">
                                            <select class="form-control" id="sel1">
                                                <option>Melayu</option>
                                                <option>Cina</option>
                                                <option>India</option>
                                                <option>Kadazandusun</option>
                                                <option>Bajau</option>
                                                <option>Murut</option>
                                                <option>Iban</option>
                                            </select>
                                        </div>
                                    </div> 


                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Age:</label>
                                        <div class="col-lg-3">
                                            <input class="form-control" type="text" value="">
                                        </div>
                                    </div>
                                    <div>



                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Nationality status:</label>
                                            <div class="form-inline">
                                                <div class="controls-row">

                                                    <label class="radio inline">
                                                        <input type="radio" value="1"/>
                                                        Yes
                                                    </label>
                                                    <label class="radio inline">
                                                        <input type="radio" value="2"/>
                                                        No
                                                    </label>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">
                                                    Marriage:</label>
                                                <div class="col-lg-6">
                                                    <select class="form-control" id="sel1">
                                                        <option>Single</option>
                                                        <option>Married</option>
                                                    </select>
                                                </div>
                                            </div>      





                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">
                                                    Vehicle license:</label>		
                                                <div class="col-md-4">
                                                    <div class="form-inline">
                                                        <div class="controls-row">

                                                            <label class="radio inline">
                                                                <input type="radio" value="1"/>
                                                                A
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="2"/>
                                                                B
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="3"/>
                                                                B1
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="4"/>
                                                                B2
                                                            </label>  

                                                            <label class="radio inline">
                                                                <input type="radio" value="5"/>
                                                                C
                                                            </label>      			<label class="radio inline">
                                                                <input type="radio" value="6"/>
                                                                D
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="7"/>
                                                                E
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="8"/>
                                                                E1
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="9"/>
                                                                E2
                                                            </label>

                                                            <label class="radio inline">
                                                                <input type="radio" value="10"/>
                                                                F
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="11"/>
                                                                G
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="12"/>
                                                                H
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="13"/>
                                                                I
                                                            </label>
                                                            <label class="radio inline">
                                                                <input type="radio" value="14"/>
                                                                P
                                                            </label>

                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="col-md-7">
                                                    <input type="button" class="btn btn-primary" value="Save Changes">
                                                    <span></span>
                                                    <input type="reset" class="btn btn-default" value="Cancel">
                                                </div>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                    
                                </div>
                        </div>



                    </div>
                </div>
            </div>
            <script>
                        $(document).ready(function(){
                $("#collapse1").on("hide.bs.collapse", function(){
                $("#personal").html('<span class="glyphicon glyphicon-collapse-down"></span>  Personal Information');
                });
                        $("#collapse1").on("show.bs.collapse", function(){
                $("#personal").html('<span class="glyphicon glyphicon-collapse-up"></span>  Personal Information');
                });
                });				</script>
        </div>
        <!---Academic
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <button id="academic" type="button" class="btn btn-success" data-toggle="collapse" data-target="#collapse2">
                        <span class="glyphicon glyphicon-collapse-down"></span> Academic Information
                    </button>
                </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse" >
                <div class="panel-body">
                    <!--indside
                    <!--PMR
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    PMR/SRP/LCE&nbsp;<a data-toggle="collapse"  href="#collapse8"> <span class="glyphicon glyphicon-collapse-down"></span></a>
                                </h4>
                            </div>
                            <div id="collapse8" class="panel-collapse collapse in">
                                <div class="panel-body">

                                    <form id="pmrForm" name="pmrForm" action="pmr.html" method="post" onsubmit="return SendSearch( & #39; pmrForm & #39; );">

                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="bground.png">

                                            <tbody><tr> 
                                                    <td>


                                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td colspan="6" class="body_fnt1"><b>
                                                                            Instructions:</b><br>

                                                                        For PMR certificate , please select grades A to E and the certificates SRP / LCE , please select grade 1 to 9															</td>
                                                                </tr>

                                                                <tr> 
                                                                    <td colspan="6"></td>
                                                                </tr>

                                                                <tr>
                                                                    <!--bye 03/01/2013
                                                                    <td class="dasds" colspan="6" align="center">&nbsp;</td>
                                                                    <!--bye 03/01/2013
                                                                </tr>

                                                                <tr>
                                                                    <td width="23%" align="right" class="body_fnt1">&nbsp;Year:&nbsp;</td>
                                                                    <td width="77" colspan="2" class="body_fnt1"><select name="pmr_tahun" id="pmr_tahun" >

                                                                            <option value="">
                                                                                Please select</option>

                                                                            <option value="2014">2014</option>

                                                                            <option value="2013">2013</option>

                                                                            <option value="2012">2012</option>

                                                                            <option value="2011">2011</option>

                                                                            <option value="2010">2010</option>

                                                                            <option value="2009">2009</option>

                                                                            <option value="2008">2008</option>

                                                                            <option value="2007">2007</option>

                                                                            <option value="2006">2006</option>

                                                                            <option value="2005">2005</option>

                                                                            <option value="2004">2004</option>

                                                                            <option value="2003">2003</option>

                                                                            <option value="2002">2002</option>

                                                                            <option value="2001">2001</option>

                                                                            <option value="2000">2000</option>

                                                                            <option value="1999">1999</option>

                                                                            <option value="1998">1998</option>

                                                                            <option value="1997">1997</option>

                                                                            <option value="1996">1996</option>

                                                                            <option value="1995">1995</option>

                                                                            <option value="1994">1994</option>

                                                                            <option value="1993">1993</option>

                                                                            <option value="1992">1992</option>

                                                                            <option value="1991">1991</option>

                                                                            <option value="1990">1990</option>

                                                                            <option value="1989">1989</option>

                                                                            <option value="1988">1988</option>

                                                                            <option value="1987">1987</option>

                                                                            <option value="1986">1986</option>

                                                                            <option value="1985">1985</option>

                                                                            <option value="1984">1984</option>

                                                                            <option value="1983">1983</option>

                                                                            <option value="1982">1982</option>

                                                                            <option value="1981">1981</option>

                                                                            <option value="1980">1980</option>

                                                                            <option value="1979">1979</option>

                                                                            <option value="1978">1978</option>

                                                                            <option value="1977">1977</option>

                                                                            <option value="1976">1976</option>

                                                                            <option value="1975">1975</option>

                                                                            <option value="1974">1974</option>

                                                                            <option value="1973">1973</option>

                                                                        </select>

                                                                    </td>
                                                                    <td align="right"></td>
                                                                    <td align="right"></td>
                                                                    <td align="left">&nbsp;</td> 
                                                                </tr>

                                                                <tr>
                                                                    <td align="right" class="body_fnt1"> Type certificate:</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun3" id="pmr_tahun3" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="PMR">PMR</option>
                                                                            <option value="SRP">SRP</option>
                                                                            <option value="LCE">LCE</option>
                                                                            <option value="Other">Other</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><div align="center">Rank:</div></td>
                                                                    <td align="left"><span class="body_fnt1">
                                                                            <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="S">S</option>
                                                                            </select>
                                                                        </span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1"><div align="right">Subject:</div></td>
                                                                    <td colspan="2" class="body_fnt1"><div align="right"></div></td>
                                                                    <td align="right"><div align="right"></div></td>
                                                                    <td align="right"><div align="center">Grade:</div></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1">BAHASA MALAYSIA</td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6" align="right" class="body_fnt1">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun6" id="pmr_tahun6" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun4" id="pmr_tahun4" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun13" id="pmr_tahun13" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun7" id="pmr_tahun7" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun15" id="pmr_tahun15" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun8" id="pmr_tahun8" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun16" id="pmr_tahun16" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun9" id="pmr_tahun9" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun17" id="pmr_tahun17" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun10" id="pmr_tahun10" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun18" id="pmr_tahun18" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun11" id="pmr_tahun11" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun19" id="pmr_tahun19" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun12" id="pmr_tahun12" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun20" id="pmr_tahun20" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun14" id="pmr_tahun14" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun21" id="pmr_tahun21" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun22" id="pmr_tahun22" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                            <td colspan="6"></td>
                                                            <tr>
                                                                <td align="right" class="body_fnt1">&nbsp;</td>
                                                                <td colspan="2" class="body_fnt1"><input type="submit" name="ADD" id="ADD" value="+ ADD"></td>
                                                                <td align="right">&nbsp;</td>
                                                                <td align="right">&nbsp;</td>
                                                                <td align="left">&nbsp;</td>
                                                            </tr>
                                                            <td colspan="6"></td>
                                                            <tr>
                                                                <td align="right" class="body_fnt1">&nbsp;</td>
                                                                <td colspan="2" class="body_fnt1"><input type="submit" name="SAVE" id="SAVE" value="SAVE">&nbsp;&nbsp;
                                                                    <input type="submit" name="CANCEL" id="CANCEL" value="CANCEL"></td>

                                                                <td align="right" class="body_fnt1">&nbsp;</td>

                                                            </tr></table><p>&nbsp;</p><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"><tr>
                                                                <td align="left">&nbsp;</td>
                                                            </tr>                                                         





                                                        </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>


                                            </tbody></table>
                                    </form>











                                </div>
                            </div>
                        </div>
                    </div>

                    <!--End
                    <!--SPM
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    SPM/MCE/SPM(V)/SPVM&nbsp;<a data-toggle="collapse"  href="#collapse9"> <span class="glyphicon glyphicon-collapse-down"></span></a>
                                </h4>
                            </div>
                            <div id="collapse9" class="panel-collapse collapse in">
                                <div class="panel-body">

                                    <form id="pmrForm" name="pmrForm" action="pmr.html" method="post" onsubmit="return SendSearch( & #39; pmrForm & #39; );">

                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="bground.png">

                                            <tbody><tr> 
                                                    <td>


                                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td colspan="6" class="body_fnt1"><b>
                                                                            Instructions:</b><br>

                                                                        For SPM</td>
                                                                </tr>

                                                                <tr> 
                                                                    <td colspan="6"></td>
                                                                </tr>

                                                                <tr>
                                                                    <!--bye 03/01/2013
                                                                    <td class="dasds" colspan="6" align="center">&nbsp;</td>
                                                                    <!--bye 03/01/2013
                                                                </tr>

                                                                <tr>
                                                                    <td width="23%" align="right" class="body_fnt1">&nbsp;Year:&nbsp;</td>
                                                                    <td width="77" colspan="2" class="body_fnt1"><select name="pmr_tahun" id="pmr_tahun" >

                                                                            <option value="">
                                                                                Please select</option>

                                                                            <option value="2014">2014</option>

                                                                            <option value="2013">2013</option>

                                                                            <option value="2012">2012</option>

                                                                            <option value="2011">2011</option>

                                                                            <option value="2010">2010</option>

                                                                            <option value="2009">2009</option>

                                                                            <option value="2008">2008</option>

                                                                            <option value="2007">2007</option>

                                                                            <option value="2006">2006</option>

                                                                            <option value="2005">2005</option>

                                                                            <option value="2004">2004</option>

                                                                            <option value="2003">2003</option>

                                                                            <option value="2002">2002</option>

                                                                            <option value="2001">2001</option>

                                                                            <option value="2000">2000</option>

                                                                            <option value="1999">1999</option>

                                                                            <option value="1998">1998</option>

                                                                            <option value="1997">1997</option>

                                                                            <option value="1996">1996</option>

                                                                            <option value="1995">1995</option>

                                                                            <option value="1994">1994</option>

                                                                            <option value="1993">1993</option>

                                                                            <option value="1992">1992</option>

                                                                            <option value="1991">1991</option>

                                                                            <option value="1990">1990</option>

                                                                            <option value="1989">1989</option>

                                                                            <option value="1988">1988</option>

                                                                            <option value="1987">1987</option>

                                                                            <option value="1986">1986</option>

                                                                            <option value="1985">1985</option>

                                                                            <option value="1984">1984</option>

                                                                            <option value="1983">1983</option>

                                                                            <option value="1982">1982</option>

                                                                            <option value="1981">1981</option>

                                                                            <option value="1980">1980</option>

                                                                            <option value="1979">1979</option>

                                                                            <option value="1978">1978</option>

                                                                            <option value="1977">1977</option>

                                                                            <option value="1976">1976</option>

                                                                            <option value="1975">1975</option>

                                                                            <option value="1974">1974</option>

                                                                            <option value="1973">1973</option>

                                                                        </select>

                                                                    </td>
                                                                    <td align="right"></td>
                                                                    <td align="right"></td>
                                                                    <td align="left">&nbsp;</td> 
                                                                </tr>

                                                                <tr>
                                                                    <td align="right" class="body_fnt1"> Type certificate:</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun3" id="pmr_tahun3" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="SPM">SPM</option>
                                                                            <option value="MCE">MCE</option>
                                                                            <option value="SPM(V)">SPM(V)</option>
                                                                            <option value="SPMV">SPMV</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><div align="center">Rank:</div></td>
                                                                    <td align="left"><span class="body_fnt1">
                                                                            <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="1">1</option>
                                                                                <option value="2">2</option>
                                                                                <option value="3">3</option>
                                                                            </select>
                                                                        </span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1"><div align="right">Subject:</div></td>
                                                                    <td colspan="2" class="body_fnt1"><div align="right"></div></td>
                                                                    <td align="right"><div align="right"></div></td>
                                                                    <td align="right"><div align="center">Grade:</div></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1">BAHASA MALAYSIA</td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6" align="right" class="body_fnt1">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun6" id="pmr_tahun6" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH">	PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH">	PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun4" id="pmr_tahun4" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun13" id="pmr_tahun13" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun7" id="pmr_tahun7" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun15" id="pmr_tahun15" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun8" id="pmr_tahun8" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun16" id="pmr_tahun16" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun9" id="pmr_tahun9" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun17" id="pmr_tahun17" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun10" id="pmr_tahun10" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun18" id="pmr_tahun18" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun11" id="pmr_tahun11" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun19" id="pmr_tahun19" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun12" id="pmr_tahun12" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun20" id="pmr_tahun20" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun14" id="pmr_tahun14" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun21" id="pmr_tahun21" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun22" id="pmr_tahun22" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                            <td colspan="6"></td>
                                                            <tr>
                                                                <td align="right" class="body_fnt1">&nbsp;</td>
                                                                <td colspan="2" class="body_fnt1"><input type="submit" name="ADD" id="ADD" value="+ ADD"></td>
                                                                <td align="right">&nbsp;</td>
                                                                <td align="right">&nbsp;</td>
                                                                <td align="left">&nbsp;</td>
                                                            </tr>
                                                            <td colspan="6"></td>
                                                            <tr>
                                                                <td align="right" class="body_fnt1">&nbsp;</td>
                                                                <td colspan="2" class="body_fnt1"><input type="submit" name="SAVE" id="SAVE" value="SAVE">&nbsp;&nbsp;
                                                                    <input type="submit" name="CANCEL" id="CANCEL" value="CANCEL"></td>

                                                                <td align="right" class="body_fnt1">&nbsp;</td>

                                                            </tr></table><p>&nbsp;</p><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"><tr>
                                                                <td align="left">&nbsp;</td>
                                                            </tr>                                                         





                                                        </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>


                                            </tbody></table>
                                    </form>



                                </div>
                            </div>
                        </div>
                    </div>

                    <!--End
                    <!--IPTA/IPTS
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" href="#collapse10">IPTA/IPTS</a>
                                </h4>
                            </div>
                            <div id="collapse10" class="panel-collapse collapse in">
                                <div class="panel-body">IPTA/IPTS</div>
                            </div>
                        </div>
                    </div>


                </div>
                <script>
                            $(document).ready(function(){
                    $("#collapse2").on("hide.bs.collapse", function(){
                    $("#academic").html('<span class="glyphicon glyphicon-collapse-down"></span>  Academic Information');
                    });
                            $("#collapse2").on("show.bs.collapse", function(){
                    $("#academic").html('<span class="glyphicon glyphicon-collapse-up"></span>  Academic Information');
                    });
                    });				</script>
            </div>
            <!---Skill
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <button id="Skill" type="button" class="btn btn-success" data-toggle="collapse" data-target="#collapse3">
                            <span class="glyphicon glyphicon-collapse-down"></span> Skill
                        </button>
                    </h4>
                </div>
                <div id="collapse3" class="panel-collapse collapse">
                    <div class="panel-body">

                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">

                            <tbody><tr>
                                    <td colspan="3">
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tbody><tr>
                                                    <td colspan="3">
                                                        <input type="hidden" name="bakatLOV" value="1/DANDANAN DAN SOLEKAN|2/FOTOGRAFI|3/LAKONAN|4/LUKISAN|5/MUZIK|6/PENERBITAN BERITA RADIO|7/PENERBITAN BERITA TV|8/PENERBITAN FILEM|9/PENERBITAN RANCANGAN RADIO|10/PENERBITAN RANCANGAN TV|11/TARIAN"> </td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" class="body_fnt1">&nbsp;Skill Type&nbsp;</td>
                                                    <td width="2%" class="body_fnt1">&nbsp;</td>
                                                    <td width="74%" class="body_fnt1">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3"></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table id="dataTambah">  

                                                            <tbody><tr>
                                                                    <td width="24%" align="left" class="body_fnt1">
                                                                        <select name="bakat" onfocus="focusColour(this);"> 

                                                                            <option value="">Sila Pilih</option>

                                                                            <option value="1">DANDANAN DAN SOLEKAN</option>

                                                                            <option value="2">FOTOGRAFI</option>

                                                                            <option value="3">LAKONAN</option>

                                                                            <option value="4" selected="">LUKISAN</option>

                                                                            <option value="5">MUZIK</option>

                                                                            <option value="6">PENERBITAN BERITA RADIO</option>

                                                                            <option value="7">PENERBITAN BERITA TV</option>

                                                                            <option value="8">PENERBITAN FILEM</option>

                                                                            <option value="9">PENERBITAN RANCANGAN RADIO</option>

                                                                            <option value="10">PENERBITAN RANCANGAN TV</option>

                                                                            <option value="11">TARIAN</option>

                                                                        </select>
                                                                        <input type="hidden" name="bakatAsal" value="4">
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td width="2%" class="body_fnt1">&nbsp;</td>
                                                                    <td width="74%" class="body_fnt1">&nbsp;</td>
                                                                </tr>

                                                                <tr>
                                                                    <td width="24%" align="left" class="body_fnt1">
                                                                        <select name="bakat" onfocus="focusColour(this);"> 

                                                                            <option value="">Sila Pilih</option>

                                                                            <option value="1">DANDANAN DAN SOLEKAN</option>

                                                                            <option value="2">FOTOGRAFI</option>

                                                                            <option value="3">LAKONAN</option>

                                                                            <option value="4">LUKISAN</option>

                                                                            <option value="5" selected="">MUZIK</option>

                                                                            <option value="6">PENERBITAN BERITA RADIO</option>

                                                                            <option value="7">PENERBITAN BERITA TV</option>

                                                                            <option value="8">PENERBITAN FILEM</option>

                                                                            <option value="9">PENERBITAN RANCANGAN RADIO</option>

                                                                            <option value="10">PENERBITAN RANCANGAN TV</option>

                                                                            <option value="11">TARIAN</option>

                                                                        </select>
                                                                        <input type="hidden" name="bakatAsal" value="5">
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td width="2%" class="body_fnt1">&nbsp;</td>
                                                                    <td width="74%" class="body_fnt1">&nbsp;</td>
                                                                </tr>



                                                                <tr>
                                                                    <td width="24%" align="left" class="body_fnt1">
                                                                        <select id="bakat" name="bakat" onchange="document.getElementById( & #39; bakatAsal2 & #39; ).value = this.value" onfocus="focusColour(this);"> 

                                                                            <option value="">Sila Pilih</option>

                                                                            <option value="1">DANDANAN DAN SOLEKAN</option>

                                                                            <option value="2">FOTOGRAFI</option>

                                                                            <option value="3">LAKONAN</option>

                                                                            <option value="4">LUKISAN</option>

                                                                            <option value="5">MUZIK</option>

                                                                            <option value="6">PENERBITAN BERITA RADIO</option>

                                                                            <option value="7">PENERBITAN BERITA TV</option>

                                                                            <option value="8">PENERBITAN FILEM</option>

                                                                            <option value="9">PENERBITAN RANCANGAN RADIO</option>

                                                                            <option value="10">PENERBITAN RANCANGAN TV</option>

                                                                            <option value="11">TARIAN</option>

                                                                        </select>
                                                                        <input type="hidden" id="bakatAsal2" name="bakatAsal">
                                                                    </td>

                                                                    <td width="2%" class="body_fnt1">&nbsp;</td>
                                                                    <td width="74%" class="body_fnt1">&nbsp;</td>

                                                                </tr>

                                                            </tbody></table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="body_fnt1"><br>&nbsp;&nbsp;
                                                        <input type="button" name="tambah" value=" + Tambah " onclick="addRowToTable()"></td>
                                                    <td colspan="2" class="body_fnt1"><br>
                                                        <input type="reset" name="batal" value="BATAL">&nbsp;&nbsp;&nbsp;
                                                        <input type="submit" name="hantar" value="SIMPAN">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">&nbsp;</td>
                                                </tr>

                                            </tbody></table>
                                    </td>
                                </tr>
                            </tbody></table>


                    </div>
                </div>
                <script>
                            $(document).ready(function(){
                    $("#collapse3").on("hide.bs.collapse", function(){
                    $("#Skill").html('<span class="glyphicon glyphicon-collapse-down"></span>  Skill');
                    });
                            $("#collapse3").on("show.bs.collapse", function(){
                    $("#Skill").html('<span class="glyphicon glyphicon-collapse-up"></span>  Skill');
                    });
                    });				</script>
            </div>
            <!---Achievement
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <button id="Achievement" type="button" class="btn btn-success" data-toggle="collapse" data-target="#collapse4">
                            <span class="glyphicon glyphicon-collapse-down"></span> Achievement
                        </button>
                    </h4>
                </div>
                <div id="collapse4" class="panel-collapse collapse">
                    <div class="panel-body">

                        <div class="row">

                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="gred">Years</label>
                                    <input type="text"  class="form-control" id="gred" placeholder="Grade" >
                                </div>
                            </div>
                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="position">Tittle</label>
                                    <input type="text" class="form-control" id="position" placeholder="position" >
                                </div>
                            </div>
                            <div class="col-sm-2"> </div>
                        </div>


                        <div class="row">

                            <div class="col-sm-12"> 
                                <label>Description</label>
                                <textarea name="editor3" id="editor3" rows="10" cols="80">
									
                                </textarea>
                                <script>
                                            // Replace the <textarea id="editor1"> with a CKEditor
                                            // instance, using default configuration.
                                            CKEDITOR.replace('editor3');								</script>
                            </div>
                        </div>
                        <br/>
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


                            <table  class="table table-bordered">
                                <thead>
                                    <tr>

                                        <th>Years</th>
                                        <th >Tittle</th>
                                        <th>Description</th>
                                        <th>Edit</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>

                                        <td>hh/mm/yyyy</td>
                                        <td>tittle</td>
                                        <td>Discription</td>
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
                </div>
                <script>
                            $(document).ready(function(){
                    $("#collapse4").on("hide.bs.collapse", function(){
                    $("#Achievement").html('<span class="glyphicon glyphicon-collapse-down"></span>  Achievement');
                    });
                            $("#collapse4").on("show.bs.collapse", function(){
                    $("#Achievement").html('<span class="glyphicon glyphicon-collapse-up"></span>  Achievement');
                    });
                    });				</script>
            </div>
            <!---Related Document
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <button id="rDocument" type="button" class="btn btn-success" data-toggle="collapse" data-target="#collapse5">
                            <span class="glyphicon glyphicon-collapse-down"></span> Related Document
                        </button>
                    </h4>
                </div>
                <div id="collapse5" class="panel-collapse collapse">
                    <div class="panel-body">
                        <form>
                            <table>
                                <tr>
                                    <td>Certificate</td><td><input type="file" name="pic" accept="image/*"></td><td> <label for="form-input-col-xs-4" class="wb-inv"> Add</label>
                                        <i class="glyphicon glyphicon-plus"></i></td>
                                </tr>
                                <tr>
                                    <td>Resume</td><td colspan=2><input type="file" name="pic" accept="image/*"></td>
                                </tr>
                                <td colspan=3><input type="submit"></td>
                            </table>
                        </form>

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


                            <table  class="table table-bordered">
                                <thead>
                                    <tr>

                                        <th>#</th>
                                        <th>File</th>
                                        <th>Date</th>

                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Resume</td>
                                        <td>1/12/2015</td>

                                        <td><a href="#"><i class="glyphicon glyphicon-remove"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Sijil Degree</td>
                                        <td>1/12/2015</td>

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
                </div>
                <script>
                            $(document).ready(function(){
                    $("#collapse5").on("hide.bs.collapse", function(){
                    $("#rDocument").html('<span class="glyphicon glyphicon-collapse-down"></span>  Related Document');
                    });
                            $("#collapse5").on("show.bs.collapse", function(){
                    $("#rDocument").html('<span class="glyphicon glyphicon-collapse-up"></span>  Related Document');
                    });
                    });				</script>
            </div>
            <!---Job Experience
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <button id="Experience" type="button" class="btn btn-success" data-toggle="collapse" data-target="#collapse6">
                            <span class="glyphicon glyphicon-collapse-down"></span> Job Experience
                        </button>
                    </h4>
                </div>
                <div id="collapse6" class="panel-collapse collapse">
                    <div class="panel-body">

                        <div class="row">

                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="gred">Start Date</label>
                                    <input type="date"  class="form-control" id="sDate"  >
                                </div>
                            </div>
                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="position">End Date</label>
                                    <input type="date" class="form-control" id="eDate" >
                                </div>
                            </div>
                            <div class="col-sm-2"> </div>
                        </div>

                        <div class="row">

                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="gred">Grade</label>
                                    <input type="text"  class="form-control" id="gred" placeholder="Grade" >
                                </div>
                            </div>
                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="position">Position</label>
                                    <input type="text" class="form-control" id="position" placeholder="position" >
                                </div>
                            </div>
                            <div class="col-sm-2"> </div>
                        </div>


                        <div class="row">

                            <div class="col-sm-12"> 
                                <label>Description</label>
                                <textarea name="editor3" id="editor3" rows="10" cols="80">
									
                                </textarea>
                                <script>
                                            // Replace the <textarea id="editor1"> with a CKEditor
                                            // instance, using default configuration.
                                            CKEDITOR.replace('editor3');								</script>
                            </div>
                        </div>
                        <br/>



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


                            <table  class="table table-bordered">
                                <thead>
                                    <tr>

                                        <th>Start Date</th>
                                        <th >End Date</th>
                                        <th>Position</th>
                                        <th>Company</th>
                                        <th>Edit</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>

                                        <td>hh/mm/yyyy</td>
                                        <td>hh/mm/yyyy</td>
                                        <td>Position</td>
                                        <td>Company Name</td>
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




                </div>
            </div>
            <script>
                        $(document).ready(function(){
                $("#collapse6").on("hide.bs.collapse", function(){
                $("#Experience").html('<span class="glyphicon glyphicon-collapse-down"></span> Job Experience');
                });
                        $("#collapse6").on("show.bs.collapse", function(){
                $("#Experience").html('<span class="glyphicon glyphicon-collapse-up"></span> Job Experience');
                });
                });				</script>
        </div>
        <!---Job Apply
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <button id="jApply" type="button" class="btn btn-success" data-toggle="collapse" data-target="#collapse7">
                        <span class="glyphicon glyphicon-collapse-down"></span> Job Apply
                    </button>
                </h4>
            </div>
            <div id="collapse7" class="panel-collapse collapse">
                <div class="panel-body">

                    <table class="table table-condensed" style="border-collapse:collapse;">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Grade</th>
                                <th>Position</th>
                                <th>Start date</th>
                                <th>Close Date</th>
                                <th>Status</th>
                                <th>Delete</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>FT41</td>
                                <td><a href="#" data-toggle="modal" data-target="#myModal">Pegawai Teknologi Maklumat</a></td>
                                <td>1/12/2015</td>
                                <td>31/12/2015</td>
                                <td></td>
                                <td><a href="#"><i class="glyphicon glyphicon-remove"></i></a></td>
                            </tr>						
                        </tbody>
                    </table>

                    <!-- Modal 
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-
                            <div class="modal-content">
                                <div class="well">


                                    <div class="modal-body">
                                        <h2>Pegawai Teknologi Maklumat</h2>
                                        <p>Start Date: 1/12/2015
                                            Close Date: 31/12/2015

                                            Syarat-Syarat:
                                            1.
                                            2.
                                            3.
                                            4.

                                            Penerangan Tugas

                                            seprti yg di maklumkan.

                                        </p>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Apply</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>

                        </div>



                    </div>
                </div>
                <script>
                            $(document).ready(function(){
                    $("#collapse7").on("hide.bs.collapse", function(){
                    $("#jApply").html('<span class="glyphicon glyphicon-collapse-down"></span> Job Apply');
                    });
                            $("#collapse7").on("show.bs.collapse", function(){
                    $("#jApply").html('<span class="glyphicon glyphicon-collapse-up"></span> Job Apply');
                    });
                    });
                </script>
            </div>

        </div>
    </div>


    <!-- /.row 

</div>--->

		<div class="accordion">
		<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-1">Personal Information</a>
				<div id="accordion-1" class="accordion-section-content">
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

										<div class="form-group">
											<label class="col-lg-3 control-label">Address:</label>
											<div class="col-lg-6">
												<textarea name="" cols="45" rows="5"></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-3 control-label">Postcode:</label>
											<div class="col-lg-6">
												<input class="form-control" type="text" value="">
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-3 control-label">State:</label>
											<div class="col-lg-6">
												<select class="form-control" id="sel1">
													<option>Johor Darul Tazim</option>
													<option>Selangor Darul Ehsan</option>
													<option>Pahang Darul Makmur</option>
													<option>Kelantan Darul Naim</option>
													<option>Kuala Lumpur</option>
													<option>Kedah Darul Aman</option>
													<option>Melaka</option>
													<option>Negeri Sembilan</option>
													<option>Perak Darul Ridzuan</option>
													<option>Perlis </option>
													<option>Pulau Pinang</option>
													<option>Sabah</option>
													<option>Sarawak</option>
													<option>Terengganu Darul Iman</option>
												</select> 
											</div>
										</div>


										<div class="form-group">
											<label class="col-lg-3 control-label">Town:</label>
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
														});											</script>
												</div>
											</div>
										</div> 



										<div class="form-group">
											<label class="col-lg-3 control-label">Phone Number:</label>
											<div class="col-lg-6">
												<input class="form-control" type="text" value="">
											</div>
										</div>   

										<div class="form-group">
											<label class="col-lg-3 control-label">Email:</label>
											<div class="col-lg-6">
												<input class="form-control" type="text" value="">
											</div>
										</div>     


										<div class="form-group">
											<label class="col-lg-3 control-label">Gender:</label>
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
												<label class="col-lg-3 control-label">Religion:</label>
												<div class="col-lg-6">
													<select class="form-control" id="sel1">
														<option>Islam</option>
														<option>Kristian</option>
														<option>Hindu</option>
														<option>Buddha</option>

													</select> 
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label">Race:</label>
												<div class="col-lg-6">
													<select class="form-control" id="sel1">
														<option>Melayu</option>
														<option>Cina</option>
														<option>India</option>
														<option>Kadazandusun</option>
														<option>Bajau</option>
														<option>Murut</option>
														<option>Iban</option>
													</select>
												</div>
											</div> 


											<div class="form-group">
												<label class="col-lg-3 control-label">Age:</label>
												<div class="col-lg-3">
													<input class="form-control" type="text" value="">
												</div>
											</div>
											<div>



												<div class="form-group">
													<label class="col-lg-3 control-label">Nationality status:</label>
													<div class="form-inline">
														<div class="controls-row">

															<label class="radio inline">
																<input type="radio" value="1"/>
																Yes
															</label>
															<label class="radio inline">
																<input type="radio" value="2"/>
																No
															</label>
														</div>
													</div>


													<div class="form-group">
														<label class="col-lg-3 control-label">
															Marriage:</label>
														<div class="col-lg-6">
															<select class="form-control" id="sel1">
																<option>Single</option>
																<option>Married</option>
															</select>
														</div>
													</div>      





													<div class="form-group">
														<label class="col-lg-3 control-label">
															Vehicle license:</label>		
														<div class="col-md-4">
															<div class="form-inline">
																<div class="controls-row">

																	<label class="radio inline">
																		<input type="radio" value="1"/>
																		A
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="2"/>
																		B
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="3"/>
																		B1
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="4"/>
																		B2
																	</label>  

																	<label class="radio inline">
																		<input type="radio" value="5"/>
																		C
																	</label>      			<label class="radio inline">
																		<input type="radio" value="6"/>
																		D
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="7"/>
																		E
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="8"/>
																		E1
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="9"/>
																		E2
																	</label>

																	<label class="radio inline">
																		<input type="radio" value="10"/>
																		F
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="11"/>
																		G
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="12"/>
																		H
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="13"/>
																		I
																	</label>
																	<label class="radio inline">
																		<input type="radio" value="14"/>
																		P
																	</label>

																</div>
															</div>
														</div>



														<div class="col-md-7">
															<input type="button" class="btn btn-primary" value="Save Changes">
															<span></span>
															<input type="reset" class="btn btn-default" value="Cancel">
														</div>
													</div>
													</form>
												</div>
											</div>
											
										</div>
								</div>



							</div>
					
				</div><!--end .accordion-section-content-->
		</div><!--end .accordion-section-->

		
			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-2">Academic Information</a>
				<div id="accordion-2" class="accordion-section-content">
					<!----Inside-->
					
					
						<!---Section1--->
						<div class="accordion-section">
							<a class="accordion-section-title" href="#accordion-2a">PMR/SRP/LCE</a>
							<div id="accordion-2a" class="accordion-section-content2">
								<!----Inside-->
								
								<form id="pmrForm" name="pmrForm" action="pmr.html" method="post" onsubmit="return SendSearch( & #39; pmrForm & #39; );">

                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="bground.png">

                                            <tbody><tr> 
                                                    <td>


                                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td colspan="6" class="body_fnt1"><b>
                                                                            Instructions:</b><br>

                                                                        For PMR certificate , please select grades A to E and the certificates SRP / LCE , please select grade 1 to 9															</td>
                                                                </tr>

                                                                

                                                                <tr>
                                                                    <!--bye 03/01/2013-->
                                                                    <td class="dasds" colspan="6" align="center">&nbsp;</td>
                                                                    <!--bye 03/01/2013-->
                                                                </tr>

                                                                <tr>
                                                                    <td width="23%" align="right" class="body_fnt1">&nbsp;Year:&nbsp;</td>
                                                                    <td width="77" colspan="2" class="body_fnt1"><select name="pmr_tahun" id="pmr_tahun" >

                                                                            <option value="">
                                                                                Please select</option>

                                                                            <option value="2014">2014</option>

                                                                            <option value="2013">2013</option>

                                                                            <option value="2012">2012</option>

                                                                            <option value="2011">2011</option>

                                                                            <option value="2010">2010</option>

                                                                            <option value="2009">2009</option>

                                                                            <option value="2008">2008</option>

                                                                            <option value="2007">2007</option>

                                                                            <option value="2006">2006</option>

                                                                            <option value="2005">2005</option>

                                                                            <option value="2004">2004</option>

                                                                            <option value="2003">2003</option>

                                                                            <option value="2002">2002</option>

                                                                            <option value="2001">2001</option>

                                                                            <option value="2000">2000</option>

                                                                            <option value="1999">1999</option>

                                                                            <option value="1998">1998</option>

                                                                            <option value="1997">1997</option>

                                                                            <option value="1996">1996</option>

                                                                            <option value="1995">1995</option>

                                                                            <option value="1994">1994</option>

                                                                            <option value="1993">1993</option>

                                                                            <option value="1992">1992</option>

                                                                            <option value="1991">1991</option>

                                                                            <option value="1990">1990</option>

                                                                            <option value="1989">1989</option>

                                                                            <option value="1988">1988</option>

                                                                            <option value="1987">1987</option>

                                                                            <option value="1986">1986</option>

                                                                            <option value="1985">1985</option>

                                                                            <option value="1984">1984</option>

                                                                            <option value="1983">1983</option>

                                                                            <option value="1982">1982</option>

                                                                            <option value="1981">1981</option>

                                                                            <option value="1980">1980</option>

                                                                            <option value="1979">1979</option>

                                                                            <option value="1978">1978</option>

                                                                            <option value="1977">1977</option>

                                                                            <option value="1976">1976</option>

                                                                            <option value="1975">1975</option>

                                                                            <option value="1974">1974</option>

                                                                            <option value="1973">1973</option>

                                                                        </select>

                                                                    </td>
                                                                    <td align="right"></td>
                                                                    <td align="right"></td>
                                                                    <td align="left">&nbsp;</td> 
                                                                </tr>

                                                                <tr>
                                                                    <td align="right" class="body_fnt1"> Type certificate:</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun3" id="pmr_tahun3" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="PMR">PMR</option>
                                                                            <option value="SRP">SRP</option>
                                                                            <option value="LCE">LCE</option>
                                                                            <option value="Other">Other</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><div align="center">Rank:</div></td>
                                                                    <td align="left"><span class="body_fnt1">
                                                                            <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="S">S</option>
                                                                            </select>
                                                                        </span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6"><hr></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1"><div align="right">Subject:</div></td>
                                                                    <td colspan="2" class="body_fnt1"><div align="right"></div></td>
                                                                    <td align="right"><div align="right"></div></td>
                                                                    <td align="right"><div align="center">Grade:</div></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1">BAHASA MALAYSIA</td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun6" id="pmr_tahun6" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun4" id="pmr_tahun4" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun13" id="pmr_tahun13" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun7" id="pmr_tahun7" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun15" id="pmr_tahun15" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun8" id="pmr_tahun8" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun16" id="pmr_tahun16" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun9" id="pmr_tahun9" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun17" id="pmr_tahun17" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun10" id="pmr_tahun10" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun18" id="pmr_tahun18" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun11" id="pmr_tahun11" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun19" id="pmr_tahun19" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun12" id="pmr_tahun12" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun20" id="pmr_tahun20" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun14" id="pmr_tahun14" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun21" id="pmr_tahun21" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Pendidikan Moral">Pendidikan Moral</option>
                                                                            <option value="Pendidikan Sivik dan Kewarganegaraan">Pendidikan Sivik dan Kewarganegaraan</option>
                                                                            <option value="Geografi">Geografi</option>
                                                                            <option value="Pendidikan Jasmani">Pendidikan Jasmani</option>
                                                                            <option value="Kemahiran Hidup">Kemahiran Hidup</option>
                                                                            <option value="Pendidikan Seni Visual">Pendidikan Seni Visual</option>
                                                                            <option value="Pendidikan Muzik">Pendidikan Muzik</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun22" id="pmr_tahun22" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>                        
                                                            <tr>
                                                                <td align="right" class="body_fnt1">&nbsp;</td>
                                                                <td colspan="2" class="body_fnt1"><input type="submit" name="ADD" id="ADD" value="+ ADD"></td>
                                                                <td align="right">&nbsp;</td>
                                                                <td align="right">&nbsp;</td>
                                                                <td align="left">&nbsp;</td>
                                                            </tr>
                                                          
                                                            <tr>
                                                                <td align="right" class="body_fnt1">&nbsp;</td>
                                                                <td colspan="2" class="body_fnt1"><input type="submit" name="SAVE" id="SAVE" value="SAVE">&nbsp;&nbsp;
                                                                    <input type="submit" name="CANCEL" id="CANCEL" value="CANCEL"></td>

                                                                <td align="right" class="body_fnt1">&nbsp;</td>

                                                            </tr></table><p>&nbsp;</p><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"><tr>
                                                                <td align="left">&nbsp;</td>
                                                            </tr>                                                         





                                                        </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>


                                            </tbody></table>
                                </form>
								
								
								<!---end inside---->
							</div><!--end .accordion-section-content-->
						</div><!--end .accordion-section-->
						<!---End Section1--->
						
						<!---Section2--->
						<div class="accordion-section">
							<a class="accordion-section-title" href="#accordion-2b">SPM/MCE/SPM(V)/SPVM</a>
							<div id="accordion-2b" class="accordion-section-content2">
								<!----Inside-->
								
								<form id="pmrForm" name="pmrForm" action="pmr.html" method="post" onsubmit="return SendSearch( & #39; pmrForm & #39; );">

                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="bground.png">

                                            <tbody><tr> 
                                                    <td>


                                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td colspan="6" class="body_fnt1"><b>
                                                                            Instructions:</b><br>

                                                                        For SPM</td>
                                                                </tr>

                                                                

                                                                <tr>
                                                                    <!--bye 03/01/2013-->
                                                                    <td class="dasds" colspan="6" align="center">&nbsp;</td>
                                                                    <!--bye 03/01/2013-->
                                                                </tr>

                                                                <tr>
                                                                    <td width="23%" align="right" class="body_fnt1">&nbsp;Year:&nbsp;</td>
                                                                    <td width="77" colspan="2" class="body_fnt1"><select name="pmr_tahun" id="pmr_tahun" >

                                                                            <option value="">
                                                                                Please select</option>

                                                                            <option value="2014">2014</option>

                                                                            <option value="2013">2013</option>

                                                                            <option value="2012">2012</option>

                                                                            <option value="2011">2011</option>

                                                                            <option value="2010">2010</option>

                                                                            <option value="2009">2009</option>

                                                                            <option value="2008">2008</option>

                                                                            <option value="2007">2007</option>

                                                                            <option value="2006">2006</option>

                                                                            <option value="2005">2005</option>

                                                                            <option value="2004">2004</option>

                                                                            <option value="2003">2003</option>

                                                                            <option value="2002">2002</option>

                                                                            <option value="2001">2001</option>

                                                                            <option value="2000">2000</option>

                                                                            <option value="1999">1999</option>

                                                                            <option value="1998">1998</option>

                                                                            <option value="1997">1997</option>

                                                                            <option value="1996">1996</option>

                                                                            <option value="1995">1995</option>

                                                                            <option value="1994">1994</option>

                                                                            <option value="1993">1993</option>

                                                                            <option value="1992">1992</option>

                                                                            <option value="1991">1991</option>

                                                                            <option value="1990">1990</option>

                                                                            <option value="1989">1989</option>

                                                                            <option value="1988">1988</option>

                                                                            <option value="1987">1987</option>

                                                                            <option value="1986">1986</option>

                                                                            <option value="1985">1985</option>

                                                                            <option value="1984">1984</option>

                                                                            <option value="1983">1983</option>

                                                                            <option value="1982">1982</option>

                                                                            <option value="1981">1981</option>

                                                                            <option value="1980">1980</option>

                                                                            <option value="1979">1979</option>

                                                                            <option value="1978">1978</option>

                                                                            <option value="1977">1977</option>

                                                                            <option value="1976">1976</option>

                                                                            <option value="1975">1975</option>

                                                                            <option value="1974">1974</option>

                                                                            <option value="1973">1973</option>

                                                                        </select>

                                                                    </td>
                                                                    <td align="right"></td>
                                                                    <td align="right"></td>
                                                                    <td align="left">&nbsp;</td> 
                                                                </tr>

                                                                <tr>
                                                                    <td align="right" class="body_fnt1"> Type certificate:</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun3" id="pmr_tahun3" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="SPM">SPM</option>
                                                                            <option value="MCE">MCE</option>
                                                                            <option value="SPM(V)">SPM(V)</option>
                                                                            <option value="SPMV">SPMV</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><div align="center">Rank:</div></td>
                                                                    <td align="left"><span class="body_fnt1">
                                                                            <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="1">1</option>
                                                                                <option value="2">2</option>
                                                                                <option value="3">3</option>
                                                                            </select>
                                                                        </span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1"><div align="right">Subject:</div></td>
                                                                    <td colspan="2" class="body_fnt1"><div align="right"></div></td>
                                                                    <td align="right"><div align="right"></div></td>
                                                                    <td align="right"><div align="center">Grade:</div></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1">BAHASA MALAYSIA</td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun6" id="pmr_tahun6" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH">	PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH">	PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun4" id="pmr_tahun4" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun13" id="pmr_tahun13" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun7" id="pmr_tahun7" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun15" id="pmr_tahun15" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun8" id="pmr_tahun8" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun16" id="pmr_tahun16" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun9" id="pmr_tahun9" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun17" id="pmr_tahun17" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun10" id="pmr_tahun10" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun18" id="pmr_tahun18" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun11" id="pmr_tahun11" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun19" id="pmr_tahun19" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun12" id="pmr_tahun12" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun20" id="pmr_tahun20" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun14" id="pmr_tahun14" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><select name="pmr_tahun21" id="pmr_tahun21" >
                                                                            <option value=""> Please select </option>
                                                                            <option value="Bahasa Melayu">Bahasa Melayu</option>
                                                                            <option value="English">English</option>
                                                                            <option value="Mathematics">Mathematics</option>
                                                                            <option value="Science">Science</option>
                                                                            <option value="Sejarah">Sejarah</option>
                                                                            <option value="Pendidikan Islam">Pendidikan Islam</option>
                                                                            <option value="Bahasa Arab">Bahasa Arab</option>
                                                                            <option value="Bahasa Cina">Bahasa Cina</option>
                                                                            <option value="Bahasa Cina">Bahasa Tamil</option>
                                                                            <option value="LITERATURE IN ENGLISH">LITERATURE IN ENGLISH</option>
                                                                            <option value="KESUSASTERAAN MELAYU">KESUSASTERAAN MELAYU</option>
                                                                            <option value="GEOGRAFI">GEOGRAFI</option>
                                                                            <option value="ADDITIONAL MATHEMATICS">ADDITIONAL MATHEMATICS</option>
                                                                            <option value="PERDAGANGAN">PERDAGANGAN</option>
                                                                            <option value="PRINSIP PERAKAUNAN">PRINSIP PERAKAUNAN</option>
                                                                            <option value="EKONOMI ASAS">EKONOMI ASAS</option>
                                                                            <option value="PHYSICS">PHYSICS</option>
                                                                            <option value="CHEMISTRY">CHEMISTRY</option>
                                                                            <option value="BIOLOGY">BIOLOGY</option>
                                                                            <option value="ADDITIONAL SCIENCE">ADDITIONAL SCIENCE</option>
                                                                            <option value="TASAWWUR ISLAM">TASAWWUR ISLAM</option>
                                                                            <option value="PENDIDIKAN AL-QURAN & AS-SUNNAH"> PENDIDIKAN AL-QURAN & AS-SUNNAH</option>
                                                                            <option value="	PENDIDIKAN SYARIAH ISLAMIAH"> PENDIDIKAN SYARIAH ISLAMIAH</option>
                                                                            <option value="ENGLISH FOR SCIENCE AND TECHNOLOGY">ENGLISH FOR SCIENCE AND TECHNOLOGY</option>
                                                                            <option value="KESUSASTERAAN CINA">KESUSASTERAAN CINA</option>
                                                                            <option value="KESUSASTERAAN TAMIL">KESUSASTERAAN TAMIL</option>
                                                                            <option value="BAHASA PERANCIS">BAHASA PERANCIS</option>
                                                                            <option value="BAHASA PUNJABI">BAHASA PUNJABI</option>
                                                                            <option value="BAHASA IBAN">BAHASA IBAN</option>
                                                                            <option value="BAHASA KADAZANDUSUN">BAHASA KADAZANDUSUN</option>
                                                                        </select></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right"><span class="body_fnt1">
                                                                            <select name="pmr_tahun22" id="pmr_tahun22" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A+">A+</option>
                                                                                <option value="A">A</option>
                                                                                <option value="A-">A-</option>
                                                                                <option value="B+">B+</option>
                                                                                <option value="B">B</option>
                                                                                <option value="B-">B-</option>
                                                                                <option value="C+">C+</option>
                                                                                <option value="C">C</option>
                                                                                <option value="C-">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                                <option value="G">G</option>
                                                                            </select>
                                                                        </span></td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                          
                                                            <tr>
                                                                <td align="right" class="body_fnt1">&nbsp;</td>
                                                                <td colspan="2" class="body_fnt1"><input type="submit" name="ADD" id="ADD" value="+ ADD"></td>
                                                                <td align="right">&nbsp;</td>
                                                                <td align="right">&nbsp;</td>
                                                                <td align="left">&nbsp;</td>
                                                            </tr>
                                                         
                                                            <tr>
                                                                <td align="right" class="body_fnt1">&nbsp;</td>
                                                                <td colspan="2" class="body_fnt1"><input type="submit" name="SAVE" id="SAVE" value="SAVE">&nbsp;&nbsp;
                                                                    <input type="submit" name="CANCEL" id="CANCEL" value="CANCEL"></td>

                                                                <td align="right" class="body_fnt1">&nbsp;</td>

                                                            </tr></table><p>&nbsp;</p><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"><tr>
                                                                <td align="left">&nbsp;</td>
                                                            </tr>                                                         





                                                        </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>


                                            </tbody></table>
                                    </form>
								
								
								<!---end inside---->
							</div><!--end .accordion-section-content-->
						</div><!--end .accordion-section-->
						<!---End Section2--->
						
						<!---Section3--->
						<div class="accordion-section">
							<a class="accordion-section-title" href="#accordion-2c">IPTA/IPTS</a>
							<div id="accordion-2c" class="accordion-section-content2">
								<!----Inside-->
								
								
								empty
								
								<!---end inside---->
							</div><!--end .accordion-section-content-->
						</div><!--end .accordion-section-->
						<!---End Section3--->
					
					
					<!---end inside---->
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->

			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-3">Skill</a>
				<div id="accordion-3" class="accordion-section-content">
					
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">

                            <tbody>
								<tr>
                                    <td colspan="3">
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tbody>
												<tr>
                                                    <td colspan="3">
                                                        <input type="hidden" name="bakatLOV" value="1/DANDANAN DAN SOLEKAN|2/FOTOGRAFI|3/LAKONAN|4/LUKISAN|5/MUZIK|6/PENERBITAN BERITA RADIO|7/PENERBITAN BERITA TV|8/PENERBITAN FILEM|9/PENERBITAN RANCANGAN RADIO|10/PENERBITAN RANCANGAN TV|11/TARIAN"> </td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" class="body_fnt1">&nbsp;Skill Type&nbsp;</td>
                                                    <td width="2%" class="body_fnt1">&nbsp;</td>
                                                    <td width="74%" class="body_fnt1">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3"></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table id="dataTambah">  

                                                            <tbody>
																<tr>
                                                                    <td width="24%" align="left" class="body_fnt1">
                                                                        <select name="bakat" onfocus="focusColour(this);"> 

                                                                            <option value="">Sila Pilih</option>

                                                                            <option value="1">DANDANAN DAN SOLEKAN</option>

                                                                            <option value="2">FOTOGRAFI</option>

                                                                            <option value="3">LAKONAN</option>

                                                                            <option value="4" selected="">LUKISAN</option>

                                                                            <option value="5">MUZIK</option>

                                                                            <option value="6">PENERBITAN BERITA RADIO</option>

                                                                            <option value="7">PENERBITAN BERITA TV</option>

                                                                            <option value="8">PENERBITAN FILEM</option>

                                                                            <option value="9">PENERBITAN RANCANGAN RADIO</option>

                                                                            <option value="10">PENERBITAN RANCANGAN TV</option>

                                                                            <option value="11">TARIAN</option>

                                                                        </select>
                                                                        <input type="hidden" name="bakatAsal" value="4">
                                                                    </td>
                                                                    <td></td>
                                                                    <td width="2%" class="body_fnt1">&nbsp;</td>
                                                                    <td width="74%" class="body_fnt1">&nbsp;</td>
                                                                </tr>

                                                                <tr>
                                                                    <td width="24%" align="left" class="body_fnt1">
                                                                        <select name="bakat" onfocus="focusColour(this);"> 

                                                                            <option value="">Sila Pilih</option>

                                                                            <option value="1">DANDANAN DAN SOLEKAN</option>

                                                                            <option value="2">FOTOGRAFI</option>

                                                                            <option value="3">LAKONAN</option>

                                                                            <option value="4">LUKISAN</option>

                                                                            <option value="5" selected="">MUZIK</option>

                                                                            <option value="6">PENERBITAN BERITA RADIO</option>

                                                                            <option value="7">PENERBITAN BERITA TV</option>

                                                                            <option value="8">PENERBITAN FILEM</option>

                                                                            <option value="9">PENERBITAN RANCANGAN RADIO</option>

                                                                            <option value="10">PENERBITAN RANCANGAN TV</option>

                                                                            <option value="11">TARIAN</option>

                                                                        </select>
                                                                        <input type="hidden" name="bakatAsal" value="5">
                                                                    </td>
                                                                    <td></td>
                                                                    <td width="2%" class="body_fnt1">&nbsp;</td>
                                                                    <td width="74%" class="body_fnt1">&nbsp;</td>
                                                                </tr>



                                                                <tr>
                                                                    <td width="24%" align="left" class="body_fnt1">
                                                                        <select id="bakat" name="bakat" onchange="document.getElementById( & #39; bakatAsal2 & #39; ).value = this.value" onfocus="focusColour(this);"> 

                                                                            <option value="">Sila Pilih</option>

                                                                            <option value="1">DANDANAN DAN SOLEKAN</option>

                                                                            <option value="2">FOTOGRAFI</option>

                                                                            <option value="3">LAKONAN</option>

                                                                            <option value="4">LUKISAN</option>

                                                                            <option value="5">MUZIK</option>

                                                                            <option value="6">PENERBITAN BERITA RADIO</option>

                                                                            <option value="7">PENERBITAN BERITA TV</option>

                                                                            <option value="8">PENERBITAN FILEM</option>

                                                                            <option value="9">PENERBITAN RANCANGAN RADIO</option>

                                                                            <option value="10">PENERBITAN RANCANGAN TV</option>

                                                                            <option value="11">TARIAN</option>

                                                                        </select>
                                                                        <input type="hidden" id="bakatAsal2" name="bakatAsal">
                                                                    </td>

                                                                    <td width="2%" class="body_fnt1">&nbsp;</td>
                                                                    <td width="74%" class="body_fnt1">&nbsp;</td>

                                                                </tr>

                                                            </tbody>
														</table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="body_fnt1"><br>&nbsp;&nbsp;
                                                        <input type="button" name="tambah" value=" + Tambah " onclick="addRowToTable()"></td>
                                                    <td colspan="2" class="body_fnt1"><br>
                                                        <input type="reset" name="batal" value="BATAL">&nbsp;&nbsp;&nbsp;
                                                        <input type="submit" name="hantar" value="SIMPAN">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">&nbsp;</td>
                                                </tr>

                                            </tbody>
										</table>
                                    </td>
                                </tr>
                            </tbody>
					</table>
					
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->

			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-4">Achievement</a>
				<div id="accordion-4" class="accordion-section-content">
					
					
						<div class="row">
                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="gred">Years</label>
                                    <input type="text"  class="form-control" id="gred" placeholder="Grade" >
                                </div>
                            </div>
                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="position">Tittle</label>
                                    <input type="text" class="form-control" id="position" placeholder="position" >
                                </div>
                            </div>
                            <div class="col-sm-2"> </div>
                        </div>
						
						<br/>
						
                        <div class="row">

                            <div class="col-sm-12"> 
                                <label>Description</label>
                                <textarea name="editor3" id="editor3" rows="10" cols="80">
									
                                </textarea>
                                <script>
                                            // Replace the <textarea id="editor1"> with a CKEditor
                                            // instance, using default configuration.
                                            CKEDITOR.replace('editor3');								</script>
                            </div>
                        </div>
                       
					   <br/>
						
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


                            <table  class="table table-bordered">
                                <thead>
                                    <tr>

                                        <th>Years</th>
                                        <th >Tittle</th>
                                        <th>Description</th>
                                        <th>Edit</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>

                                        <td>hh/mm/yyyy</td>
                                        <td>tittle</td>
                                        <td>Discription</td>
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
					


                    
				
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->
			
			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-5a"> Related Document</a>
				<div id="accordion-5a" class="accordion-section-content">
					 
					<form>
                            <table>
                                <tr>
                                    <td>Certificate</td><td><input type="file" name="pic" accept="image/*"></td><td> <label for="form-input-col-xs-4" class="wb-inv"> Add</label>
                                        <i class="glyphicon glyphicon-plus"></i></td>
                                </tr>
                                <tr>
                                    <td>Resume</td><td colspan=2><input type="file" name="pic" accept="image/*"></td>
                                </tr>
                                <tr>
								<td colspan=3><input type="submit"></td>
								</tr>
                            </table>
                    </form>

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


                            <table  class="table table-bordered">
                                <thead>
                                    <tr>

                                        <th>#</th>
                                        <th>File</th>
                                        <th>Date</th>

                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Resume</td>
                                        <td>1/12/2015</td>

                                        <td><a href="#"><i class="glyphicon glyphicon-remove"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Sijil Degree</td>
                                        <td>1/12/2015</td>

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
					 
					 
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->
			
			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-6a"> Job Experience</a>
				<div id="accordion-6a" class="accordion-section-content">
					 
					 <div class="row">
					  <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="gred">Start Date</label>
                                    <input type="date"  class="form-control" id="sDate"  >
                                </div>
                      </div>
                      <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="position">End Date</label>
                                    <input type="date" class="form-control" id="eDate" >
                                </div>
                            </div>
                      <div class="col-sm-2"> </div>
                        </div>

                        <div class="row">

                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="gred">Grade</label>
                                    <input type="text"  class="form-control" id="gred" placeholder="Grade" >
                                </div>
                            </div>
                            <div class="col-sm-3"> 
                                <div class="form-group">
                                    <label  for="position">Position</label>
                                    <input type="text" class="form-control" id="position" placeholder="position" >
                                </div>
                            </div>
                            <div class="col-sm-2"> </div>
                        </div>


                        <div class="row">

                            <div class="col-sm-12"> 
                                <label>Description</label>
                                <textarea name="editor3" id="editor3" rows="10" cols="80">
									
                                </textarea>
                                <script>
                                            // Replace the <textarea id="editor1"> with a CKEditor
                                            // instance, using default configuration.
                                            CKEDITOR.replace('editor3');								</script>
                            </div>
                        </div>
                        <br/>



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


                            <table  class="table table-bordered">
                                <thead>
                                    <tr>

                                        <th>Start Date</th>
                                        <th >End Date</th>
                                        <th>Position</th>
                                        <th>Company</th>
                                        <th>Edit</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>

                                        <td>hh/mm/yyyy</td>
                                        <td>hh/mm/yyyy</td>
                                        <td>Position</td>
                                        <td>Company Name</td>
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
					 
					 
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->
			
			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-7a"> Job Apply</a>
				<div id="accordion-7a" class="accordion-section-content">
					 
					 
					  <table class="table table-condensed" style="border-collapse:collapse;">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Grade</th>
                                <th>Position</th>
                                <th>Start date</th>
                                <th>Close Date</th>
                                <th>Status</th>
                                <th>Delete</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>FT41</td>
                                <td><a href="#" data-toggle="modal" data-target="#myModal">Pegawai Teknologi Maklumat</a></td>
                                <td>1/12/2015</td>
                                <td>31/12/2015</td>
                                <td></td>
                                <td><a href="#"><i class="glyphicon glyphicon-remove"></i></a></td>
                            </tr>						
                        </tbody>
                    </table>

                    <!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content--->
                            <div class="modal-content">
                                <div class="well">


                                    <div class="modal-body">
                                        <h2>Pegawai Teknologi Maklumat</h2>
                                        <p>Start Date: 1/12/2015
                                            Close Date: 31/12/2015

                                            Syarat-Syarat:
                                            1.
                                            2.
                                            3.
                                            4.

                                            Penerangan Tugas

                                            seprti yg di maklumkan.

                                        </p>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Apply</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>

                        </div>



                    </div>
					 
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->
			
					
			
		</div><!--end .accordion-->