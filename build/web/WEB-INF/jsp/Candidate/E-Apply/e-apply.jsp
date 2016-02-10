<%@page import="config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.Enumeration"%>
<%@page import="helpers.Func"%>

<link rel="stylesheet" href="<%=Config.getBase_url(request)%>assets/css/jquery-ui.css">
<script src="<%=Config.getBase_url(request)%>assets/js/jquery-ui.js"></script>

<%
    String l_refid = "";
    Enumeration sess = session.getAttributeNames();
    while (sess.hasMoreElements()) {
        String nama = (String) sess.nextElement();
        String isi = (String) session.getAttribute(nama);

        //out.print(nama + " | " + isi + "<br />");
        if (nama.equalsIgnoreCase("L_REFID")) {
            l_refid = isi;
        }
    }

    //get C_REFID from L_REFID
    String query3 = "SELECT c_refid,rl_refid "
            + "FROM login1 "
            + "WHERE l_refid =" + l_refid;

    MainClient mc3 = new MainClient(DBConn.getHost());
    String params3[] = {};
    ArrayList<ArrayList<String>> pph = mc3.getQuery(query3, params3);

    String c_refid = pph.get(0).get(0);
    String rl_refid = pph.get(0).get(1);

    String query_candidate = "SELECT * "
            + "FROM candidate "
            + "WHERE c_refid =" + c_refid;

    String query_address = "SELECT * "
            + "FROM address "
            + "WHERE c_refid =" + c_refid + " AND AT_REFID = '1453324570.621' ";

    String query_address2 = "SELECT * "
            + "FROM address "
            + "WHERE c_refid =" + c_refid + " AND AT_REFID = '1453324578.698' ";

    String query_login = "SELECT * "
            + "FROM login1 "
            + "WHERE c_refid =" + c_refid;

    String query_academic_info = "SELECT * "
            + "FROM ACADEMIC_INFO "
            + "WHERE c_refid =" + c_refid;

    String query_address_type = "SELECT * "
            + "FROM ADDRESS_TYPE ";

    MainClient mc_candidate = new MainClient(DBConn.getHost());
    String params_candidate[] = {};

    MainClient mc_address = new MainClient(DBConn.getHost());
    String params_address[] = {};

    MainClient mc_address2 = new MainClient(DBConn.getHost());
    String params_address2[] = {};

    MainClient mc_login = new MainClient(DBConn.getHost());
    String params_login[] = {};

    MainClient mc_academic_info = new MainClient(DBConn.getHost());
    String params_academic_info[] = {};

    MainClient mc_address_type = new MainClient(DBConn.getHost());
    String params_address_type[] = {};

    ArrayList<ArrayList<String>> pph_candidate = mc_candidate.getQuery(query_candidate, params_candidate);
    ArrayList<ArrayList<String>> pph_address = mc_address.getQuery(query_address, params_address);
    ArrayList<ArrayList<String>> pph_address2 = mc_address2.getQuery(query_address2, params_address2);
    ArrayList<ArrayList<String>> pph_login = mc_login.getQuery(query_login, params_login);
    ArrayList<ArrayList<String>> pph_academic_info = mc_academic_info.getQuery(query_academic_info, params_academic_info);
    ArrayList<ArrayList<String>> pph_address_type = mc_address_type.getQuery(query_address_type, params_address_type);

    /*
     out.println(query_address2);
     if (true) { return; }
     */
%>
<div class="row">
    <div class="col-lg-12">
        <!--        <div class="alert alert-info alert-dismissable">
                    <a class="panel-close close" data-dismiss="alert">×</a>
                    <i class="fa fa-coffee"></i>
                    This is an <strong>.alert</strong>. Use this to show important messages to the user.
                </div>-->
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Personal Information
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-lg-4 col-lg-offset-4">
                                <div class="text-center">
                                    <form action="process/upload_file.jsp" method="post"
                                          enctype="multipart/form-data">
                                        <%                                            String pph18 = "";
                                            try {
                                                pph18 = pph_candidate.get(0).get(18);
                                            } catch (Exception e) {
                                                pph18 = "";
                                            }

                                            if (pph18 != null && pph18 != "" && !pph18.equals("")) {
                                        %>
                                        <img src="<%=Config.getBase_url(request)%>assets/uploads/images/<%=pph18%>" class="avatar img-circle" alt="avatar">
                                        <h6>Upload a different photo...</h6>

                                        <input type="file" name="c_name" value="<%=pph18%>" class="form-control">
                                        <%
                                        } else {
                                        %>
                                        <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
                                        <h6>Upload a different photo...</h6>

                                        <input type="file" name="c_name" class="form-control">
                                        <%
                                            }
                                        %>

                                        <input type="submit" value="upload" />
                                    </form>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <form method="post" action="process/candidate/eApply/eApply.jsp" class="form-horizontal" name="form_personal" role="form">

                                    
                                    <%
                                        String pphlog10 = "";
                                        try {
                                            pphlog10 = pph_login.get(0).get(10);
                                        } catch (Exception e) {
                                            pphlog10 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">IC No</label>
                                        <div class="col-lg-6">
                                            <input class="form-control" name="L_ICNO" type="text" value="<%=(pphlog10 != null && pphlog10 != "" && !pphlog10.equals("")) ? pphlog10 : ""%>">
                                        </div>
                                    </div>


                                    <%
                                        String pph1 = "";
                                        try {
                                            pph1 = pph_candidate.get(0).get(1);
                                        } catch (Exception e) {
                                            pph1 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Full Name:</label>
                                        <div class="col-lg-6">
                                            <input class="form-control" name="C_Name" type="text" value="<%=(pph1 != null && pph1 != "" && !pph1.equals("")) ? pph1 : ""%>">
                                        </div>
                                    </div>

                                    <%
                                        String ppha2 = "";
                                        try {
                                            ppha2 = pph_address.get(0).get(2);
                                        } catch (Exception e) {
                                            ppha2 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Home Address:</label>
                                        <div class="col-lg-6">
                                            <textarea name="A_RoadNo" cols="45" rows="5"><%=ppha2%></textarea>
                                        </div>
                                    </div>

                                    <%
                                        String query_master = "SELECT LOOKUP_DETAIL.LD_DESC "
                                                + "FROM LOOKUP_DETAIL JOIN "
                                                + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                                + "WHERE LOOKUP_DETAIL.LM_REFID = '1452775307.151' ";

                                        MainClient mc_master = new MainClient(DBConn.getHost());
                                        String params_master[] = {};
                                        ArrayList<ArrayList<String>> pph_master = mc_master.getQuery(query_master, params_master);

                                        String ppha5 = "";
                                        try {
                                            ppha5 = pph_address.get(0).get(5);
                                        } catch (Exception e) {
                                            ppha5 = "";
                                        }

                                    %>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Home State:</label>
                                        <div class="col-lg-6">
                                            <select class="form-control" name="A_STATE" id="sel1">
                                                <%   for (int i = 0; i < pph_master.size(); i++) {
                                                        if (ppha5 != null && ppha5 != "" && !ppha5.equals("")) {
                                                            if (ppha5.toString().equalsIgnoreCase(pph_master.get(i).get(0).toString())) {
                                                %>
                                                <option value="<%=pph_master.get(i).get(0).toString() %>" selected><%=pph_master.get(i).get(0).toString() %></option>
                                                <%
                                                } else {
                                                %>
                                                <option value="<%=pph_master.get(i).get(0).toString() %>"><%=pph_master.get(i).get(0).toString() %></option>
                                                <%
                                                    }
                                                } else {

                                                    if (i == 0) {
                                                %>
                                                <option value="">Please Select</option>
                                                <%
                                                    }

                                                %>
                                                <option value="<%=pph_master.get(i).get(0).toString() %>"><%=pph_master.get(i).get(0).toString() %></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <%
                                        String ppha3 = "";
                                        try {
                                            ppha3 = pph_address.get(0).get(3);
                                        } catch (Exception e) {
                                            ppha3 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Home Town:</label>
                                        <div class="col-lg-6">
                                            <input class="form-control" name="A_City" type="text" value="<%=ppha3%>">
                                        </div>
                                    </div>
                                    <input type="hidden" name="AT_REFID" value="<%=pph_address_type.get(0).get(0)%>"  />
                                    
                                    <%
                                        String ppha4 = "";
                                        try {
                                            ppha4 = pph_address.get(0).get(4);
                                        } catch (Exception e) {
                                            ppha4 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Home Postcode:</label>
                                        <div class="col-lg-6">
                                            <input class="form-control" name="A_Postcode" type="text" value="<%=ppha4%>">
                                        </div>
                                    </div>
                                        
                                        <%
                                        String pph3 = "";
                                        try {
                                            pph3 = pph_candidate.get(0).get(3);
                                        } catch (Exception e) {
                                            pph3 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Age:</label>
                                        <div class="col-lg-3">
                                            <input class="form-control" name="C_Age" id="age" type="text" value="<%=pph3%>">
                                        </div>
                                    </div>
                                    <script>
                                                $(document).ready(function() {
                                        var date = $('#datepicker').val().split('-');
                                                var year = date[2];
                                                var now = new Date().getFullYear();
                                                var age = now - year;
                                                $('#age').val(age);
                                                $("#datepicker").keyup(function() {

                                        var date = $('#datepicker').val().split('-');
                                                var year = date[2];
                                                var now = new Date().getFullYear();
                                                var age = now - year;
                                                var age = now - year;
                                                $('#age').val(age);
                                        });
                                        });</script>
                                        
                                    <%
                                        String pph2 = "";
                                        try {
                                            pph2 = pph_candidate.get(0).get(2);
                                        } catch (Exception e) {
                                            pph2 = "31-August-1980";
                                        }


                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Date Of Birth:</label>
                                        <%
                                        String dobfromic="";
                                        dobfromic=helpers.Func.getDobFromIc(pphlog10.toString());
                                       //out.println(dobfromic);
                                       //out.println(pph2);
                                        %>
                                        <div class="col-lg-6">
                                            <div class='input-group date'>
                                                <input type='text' name="C_DOB" id="datepicker" value="<%=dobfromic%>" class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>

                                                <script type="text/javascript">
                                                            $(function() {
                                                            var existing_date = "<%=dobfromic%>";
                                                                    $("#datepicker").datepicker({
                                                            changeMonth: true,
                                                                    changeYear: true,
                                                                    onSelect: function(dateText, inst)
                                                                    {
                                                                    $(document).ready(function() {
                                                                    var date = $('#datepicker').val().split('-');
                                                                            var year = date[2];
                                                                            var now = new Date().getFullYear();
                                                                            var age = now - year;
                                                                            $('#age').val(age);
                                                                            $("#datepicker").keyup(function() {

                                                                    var date = $('#datepicker').val().split('-');
                                                                            var year = date[2];
                                                                            var now = new Date().getFullYear();
                                                                            var age = now - year;
                                                                            var age = now - year;
                                                                            $('#age').val(age);
                                                                    });
                                                                    });
                                                                    }
                                                            });
                                                                    $("#datepicker").datepicker("option", "dateFormat", "d-M-yy");
                                                                    $("#datepicker").datepicker('setDate', existing_date);
                                                            });</script>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        String pph11 = "";
                                        try {
                                            pph11 = pph_candidate.get(0).get(11);
                                        } catch (Exception e) {
                                            pph11 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Phone Number:</label>
                                        <div class="col-lg-6">
                                            <input class="form-control" name="C_HP" type="text" value="<%=pph11%>">
                                        </div>
                                    </div>

                                    <%
                                        String pphl8 = "";
                                        try {
                                            pphl8 = pph_login.get(0).get(8);
                                        } catch (Exception e) {
                                            pphl8 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Email:</label>
                                        <div class="col-lg-6">
                                            <input class="form-control" name="L_Email" type="text" value="<%=pphl8%>">
                                        </div>
                                    </div>
                                    <%
                                        String query_gender = "SELECT LOOKUP_DETAIL.LD_DESC "
                                                + "FROM LOOKUP_DETAIL JOIN "
                                                + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                                + "WHERE LOOKUP_DETAIL.LM_REFID = '1451506908.362'";

                                        MainClient mc_gender = new MainClient(DBConn.getHost());
                                        String params_gender[] = {};
                                        ArrayList<ArrayList<String>> pph_gender = mc_gender.getQuery(query_gender, params_gender);

                                    %>

                                    <%                                    String pph6 = "";
                                        try {
                                            pph6 = pph_candidate.get(0).get(6);
                                        } catch (Exception e) {
                                            pph6 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Gender:</label>
                                        <div class="col-lg-6">
                                            <div class="form-inline">
                                                <div class="controls-row">
                                                    <%     for (int i = 0; i < pph_gender.size(); i++) {
                                                            if (pph6 != null && pph6 != "" && !pph6.equals("")) {
                                                                if (pph6.equalsIgnoreCase(pph_gender.get(i).get(0).toString())) {
                                                    %>
                                                    <label class="radio inline">
                                                        <input type="radio" checked="checked" name="C_Sex" value="<%=pph_gender.get(i).get(0).toString() %>"/>
                                                        <%=pph_gender.get(i).get(0).toString() %>
                                                    </label>
                                                    <%
                                                    } else {
                                                    %>
                                                    <label class="radio inline">
                                                        <input type="radio" name="C_Sex" value="<%=pph_gender.get(i).get(0).toString() %>" />
                                                        <%=pph_gender.get(i).get(0).toString() %>
                                                    </label>
                                                    <%
                                                        }
                                                    } else {
                                                    %>
                                                    <label class="radio inline">
                                                        <input type="radio" name="C_Sex" value="<%=pph_gender.get(i).get(0).toString() %>" />
                                                        <%=pph_gender.get(i).get(0).toString() %>
                                                    </label>
                                                    <%
                                                            }
                                                        }
                                                    %>

                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- end gender-->
                                    <%
                                        String query_race = "SELECT LOOKUP_DETAIL.LD_DESC "
                                                + "FROM LOOKUP_DETAIL JOIN "
                                                + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                                + "WHERE LOOKUP_DETAIL.LM_REFID = '1451506916.065' ";

                                        MainClient mc_race = new MainClient(DBConn.getHost());
                                        String params_race[] = {};
                                        ArrayList<ArrayList<String>> pph_race = mc_race.getQuery(query_race, params_race);

                                    %>
                                    <%                                      String pph8 = "";
                                        try {
                                            pph8 = pph_candidate.get(0).get(8);
                                        } catch (Exception e) {
                                            pph8 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Race:</label>
                                        <div class="col-lg-6">
                                            <select name="C_Race" class="form-control" id="sel1">
                                                <%   for (int i = 0; i < pph_race.size(); i++) {
                                                        if (pph8 != null && pph8 != "" && !pph8.equals("")) {
                                                            if (pph8.equalsIgnoreCase(pph_race.get(i).get(0).toString())) {
                                                %>
                                                <option selected value="<%=pph_race.get(i).get(0).toString() %>"><%=pph_race.get(i).get(0).toString() %></option>
                                                <%
                                                } else {
                                                %>
                                                <option value="<%=pph_race.get(i).get(0).toString() %>"><%=pph_race.get(i).get(0).toString() %></option>
                                                <%
                                                    }
                                                } else {

                                                    if (i == 0) {
                                                %>
                                                <option selected value="">Please Select</option>
                                                <%
                                                    }

                                                %>
                                                <option value="<%=pph_race.get(i).get(0).toString() %>"><%=pph_race.get(i).get(0).toString() %></option>
                                                <%
                                                        }
                                                    }
                                                %>

                                            </select>
                                        </div>
                                    </div>
                                    <%
                                        String pph7 = "";
                                        try {
                                            pph7 = pph_candidate.get(0).get(7);
                                        } catch (Exception e) {
                                            pph7 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Religion:</label>
                                        <div class="col-lg-6">
                                            <%
                                                String query_religion = "SELECT LOOKUP_DETAIL.LD_DESC "
                                                        + "FROM LOOKUP_DETAIL JOIN "
                                                        + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                                        + "WHERE LOOKUP_DETAIL.LM_REFID = '1452457867.568' ";

                                                MainClient mc_religon = new MainClient(DBConn.getHost());
                                                String params_religion[] = {};
                                                ArrayList<ArrayList<String>> pph_religion = mc_religon.getQuery(query_religion, params_religion);

                                            %>
                                            <select name="C_Religion" class="form-control" id="sel1">
                                                <%     for (int i = 0; i < pph_religion.size(); i++) {
                                                        if (pph7 != null && pph7 != "" && !pph7.equals("")) {
                                                            if (pph7.equalsIgnoreCase(pph_religion.get(i).get(0).toString())) {
                                                %>
                                                <option selected value="<%=pph_religion.get(i).get(0).toString() %>"><%=pph_religion.get(i).get(0).toString() %></option>
                                                <%
                                                } else {
                                                %>
                                                <option value="<%=pph_religion.get(i).get(0).toString() %>"><%=pph_religion.get(i).get(0).toString() %></option>
                                                <%
                                                    }
                                                } else {

                                                    if (i == 0) {
                                                %>
                                                <option selected value="">Please Select</option>
                                                <%
                                                    }

                                                %>
                                                <option value="<%=pph_religion.get(i).get(0).toString() %>"><%=pph_religion.get(i).get(0).toString() %></option>
                                                <%
                                                        }

                                                    }
                                                %>
                                            </select> 
                                        </div>
                                    </div>
                                    
                            </div>
                            <div class="col-lg-6">
                                <%
                                    String pphc13 = "";
                                    try {
                                        pphc13 = pph_candidate.get(0).get(13);
                                    } catch (Exception e) {
                                        pphc13 = "";
                                    }
                                %>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Height:</label>
                                    <div class="col-lg-6">
                                        <input class="form-control height" name="C_HEIGHT" type="text" value="<%=pphc13%>">
                                    </div>
                                </div>
                                <br/><br/>
                                <%
                                    String pphc14 = "";
                                    try {
                                        pphc14 = pph_candidate.get(0).get(14);
                                    } catch (Exception e) {
                                        pphc14 = "";
                                    }
                                %>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Weight :</label>
                                    <div class="col-lg-6">
                                        <input class="form-control weight" name="C_WEIGHT" type="text" value="<%=pphc14%>">
                                    </div>
                                </div>
                                <br/><br/>
                                <%
                                    String pphc15 = "";
                                    try {
                                        pphc15 = pph_candidate.get(0).get(15);
                                    } catch (Exception e) {
                                        pphc15 = "";
                                    }
                                %>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">BMI :</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" id="bmi" name="C_BMI" type="text" value="<%=pphc15%>">
                                    </div>
                                </div>
                                <script>
                                            $(document).ready(function() {

                                    var weight = parseInt($('.weight').val(), 10);
                                            var height = parseInt($('.height').val(), 10);
                                            var bmi = weight / (height / 100 * height / 100);
                                            $('#bmi').val(bmi.toFixed(2));
                                            $(".weight, .height").keyup(function() {

                                    var weight = parseInt($('.weight').val(), 10);
                                            var height = parseInt($('.height').val(), 10);
                                            var bmi = weight / (height / 100 * height / 100);
                                            $('#bmi').val(bmi.toFixed(2));
                                    });
                                    });</script>
                                <br/><br/>
                                <%
                                    String pphaa2 = "";
                                    try {
                                        pphaa2 = pph_address2.get(0).get(2);
                                    } catch (Exception e) {
                                        pphaa2 = "";
                                    }
                                %>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Postage Address:</label>
                                    <div class="col-lg-6">
                                        <textarea name="A_RoadNo_2" cols="45" rows="5"><%=pphaa2%></textarea>
                                    </div>
                                </div>

                                
                                <%

                                    String pphaa5 = "";
                                    try {
                                        pphaa5 = pph_address2.get(0).get(5);
                                    } catch (Exception e) {
                                        pphaa5 = "";
                                    }

                                %>
                                <br/><br/><br/><br/><br/><br/><br/>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Postage State:</label>
                                    <div class="col-lg-6">
                                        <select class="form-control" name="A_STATE_2" id="sel1">
                                            <%   for (int i = 0; i < pph_master.size(); i++) {
                                                    if (pphaa5 != null && pphaa5 != "" && !pphaa5.equals("")) {
                                                        if (pphaa5.toString().equalsIgnoreCase(pph_master.get(i).get(0).toString())) {
                                            %>
                                            <option value="<%=pph_master.get(i).get(0).toString() %>" selected><%=pph_master.get(i).get(0).toString() %></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%=pph_master.get(i).get(0).toString() %>"><%=pph_master.get(i).get(0).toString() %></option>
                                            <%
                                                }
                                            } else {

                                                if (i == 0) {
                                            %>
                                            <option value="">Please Select</option>
                                            <%
                                                }

                                            %>
                                            <option value="<%=pph_master.get(i).get(0).toString() %>"><%=pph_master.get(i).get(0).toString() %></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <%
                                    String pphaa3 = "";
                                    try {
                                        pphaa3 = pph_address2.get(0).get(3);
                                    } catch (Exception e) {
                                        pphaa3 = "";
                                    }
                                %>
                                <br/><br/><br/>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Postage Town:</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" name="A_City_2" type="text" value="<%=pphaa3%>">
                                    </div>
                                </div>
                                <input type="hidden" name="AT_REFID_2" value="<%=pph_address_type.get(1).get(0)%>"  />
                                
                                <%
                                    String pphaa4 = "";
                                    try {
                                        pphaa4 = pph_address2.get(0).get(4);
                                    } catch (Exception e) {
                                        pphaa4 = "";
                                    }
                                %>
                                <br/><br/>

                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Postage Postcode:</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" name="A_Postcode_2" type="text" value="<%=pphaa4%>">
                                    </div>
                                </div>
                                <br/><br/>
                                <%
                                    String query_nationality = "SELECT LOOKUP_DETAIL.LD_DESC "
                                            + "FROM LOOKUP_DETAIL JOIN "
                                            + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                            + "WHERE LOOKUP_DETAIL.LM_REFID = '1452458057.875' ";

                                    MainClient mc_nationality = new MainClient(DBConn.getHost());
                                    String params_nationality[] = {};
                                    ArrayList<ArrayList<String>> pph_nationality = mc_nationality.getQuery(query_nationality, params_nationality);

                                    String pph9 = "";
                                    try {
                                        pph9 = pph_candidate.get(0).get(9);
                                    } catch (Exception e) {
                                        pph9 = "";
                                    }
                                %>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Nationality status:</label>
                                    <div class="form-inline">
                                        <div class="controls-row">
                                            <%   for (int i = 0; i < pph_nationality.size(); i++) {
                                                    if (pph9 != null && pph9 != "" && !pph9.equals("")) {
                                                        if (pph9.equalsIgnoreCase(pph_nationality.get(i).get(0).toString())) {
                                            %>
                                            <label class="radio inline">
                                                <input name="C_Nationality" checked="checked" type="radio" value="<%=pph_nationality.get(i).get(0).toString() %>"/>
                                                <%=pph_nationality.get(i).get(0).toString() %>
                                            </label>

                                            <%
                                            } else {
                                            %>
                                            <label class="radio inline">
                                                <input name="C_Nationality" type="radio" value="<%=pph_nationality.get(i).get(0).toString() %>"/>
                                                <%=pph_nationality.get(i).get(0).toString() %>
                                            </label>
                                            <%
                                                }
                                            } else {
                                            %>
                                            <label class="radio inline">
                                                <input name="C_Nationality" type="radio" value="<%=pph_nationality.get(i).get(0).toString() %>"/>
                                                <%=pph_nationality.get(i).get(0).toString() %>
                                            </label>
                                            <%
                                                    }
                                                }
                                            %>

                                        </div>
                                    </div>
                                </div>
                                <br/><br/>
                                <%
                                    String query_marriage = "SELECT LOOKUP_DETAIL.LD_DESC "
                                            + "FROM LOOKUP_DETAIL JOIN "
                                            + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                            + "WHERE LOOKUP_DETAIL.LM_REFID = '1452458118.171' ";

                                    MainClient mc_marriage = new MainClient(DBConn.getHost());
                                    String params_marriage[] = {};
                                    ArrayList<ArrayList<String>> pph_marriage = mc_marriage.getQuery(query_marriage, params_marriage);

                                    String pph12 = "";
                                    try {
                                        pph12 = pph_candidate.get(0).get(12);
                                    } catch (Exception e) {
                                        pph12 = "";
                                    }

                                %>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">
                                        Marriage:</label>
                                    <div class="col-lg-6">
                                        <select name="C_Maritalstat" class="form-control" id="sel1">
                                            <%   for (int i = 0; i < pph_marriage.size(); i++) {
                                                    if (pph12 != null && pph12 != "" && !pph12.equals("")) {
                                                        if (pph12.equalsIgnoreCase(pph_marriage.get(i).get(0).toString())) {
                                            %>
                                            <option selected value="<%=pph_marriage.get(i).get(0).toString() %>"><%=pph_marriage.get(i).get(0).toString() %></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%=pph_marriage.get(i).get(0).toString() %>"><%=pph_marriage.get(i).get(0).toString() %></option>
                                            <%
                                                }
                                            } else {

                                                if (i == 0) {
                                            %>
                                            <option value="" selected>Please Select</option>
                                            <%
                                                }

                                            %>
                                            <option value="<%=pph_marriage.get(i).get(0).toString() %>"><%=pph_marriage.get(i).get(0).toString() %></option>
                                            <%
                                                    }
                                                }
                                            %>

                                        </select>
                                    </div>
                                </div>
                                <br/><br/>
                                <%
                                    String query_vehicle = "SELECT LOOKUP_DETAIL.LD_DESC "
                                            + "FROM LOOKUP_DETAIL JOIN "
                                            + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                            + "WHERE LOOKUP_DETAIL.LM_REFID = '1452458173.385' ";

                                    String query_cvehicle = "SELECT * "
                                            + "FROM DRIVER_LICENSE "
                                            + "WHERE C_REFID = ?";
                                  
                                    MainClient mc_vehicle = new MainClient(DBConn.getHost());
                                    String params_vehicle[] = {};
                                    String params_cvehicle[] = {c_refid.toString()};
                                    ArrayList<ArrayList<String>> pph_vehicle = mc_vehicle.getQuery(query_vehicle, params_vehicle);
                                    ArrayList<ArrayList<String>> pph_cvehicle = mc_vehicle.getQuery(query_cvehicle, params_cvehicle);
 
                                    String pphcv = "";
                                    try {
                                        pphcv = pph_cvehicle.get(0).get(1);
                                    } catch (Exception e) {
                                        pphcv = "";
                                    }

                                    String pph13 = "";
                                    try {
                                        pph13 = pph_vehicle.get(0).get(0);
                                    } catch (Exception e) {
                                        pph13 = "";
                                    }

                                    String license_list = "";
                                    
                                    //provide dropdown list
                                    if (!pph_vehicle.isEmpty()) {
                                        
                                        license_list = "<select id='dl_code' class='vehicle' name='dl_code'>";
                                        for (int i = 0; i < pph_vehicle.size(); i++) {
                                            String x = pph_vehicle.get(i).get(0);

                                            license_list += "<option value='" + x + "'>" + x + "</option>";
                                        }
                                        license_list += "</select>";
                                    }
                                            
                                %>
                                <div class="form-group">
                                    <label class="col-lg-5 control-label">
                                        Vehicle license:</label>
                                    <div class="col-md-5">
                                        <div class="form-inline">
                                            <div class="controls-row">
                                                <table id="tbl_license" class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>License</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            int license_counter=1;
                                                           
                                                            if (pphcv != null && pphcv != "" && !pphcv.equals("")) {
                                                                for (int x = 0; x < pph_cvehicle.size(); x++) {
                                                        %>
                                                        <tr>
                                                            <td>
                                                                <select id="dl_code_<%=license_counter %>" name="dl_code_<%=license_counter %>" class="form-control vehicle_license" >
                                                                    <%  
                                                                        for (int i = 0; i < pph_vehicle.size(); i++) {
                                                                            if (pphcv != null && pphcv != "" && !pphcv.equals("")) {
                                                                                if (pphcv.equalsIgnoreCase(pph_vehicle.get(i).get(0).toString())) {
                                                                    %>
                                                                    <option selected value="<%=pph_vehicle.get(i).get(0).toString() %>"><%=pph_vehicle.get(i).get(0).toString() %></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%=pph_vehicle.get(i).get(0).toString() %>"><%=pph_vehicle.get(i).get(0).toString() %></option>
                                                                    <%
                                                                        }
                                                                    } else {
                                                                        if (i == 0) {
                                                                    %>
                                                                    <option value="" selected>Please Select</option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                    <option value="<%=pph_vehicle.get(i).get(0).toString() %>"><%=pph_vehicle.get(i).get(0).toString() %></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </td>
                                                            <td>x</td>
                                                        </tr>
                                                        <%
                                                                        license_counter++;
                                                            }
                                                      
                                                        } else {
                                                        }
                                                            String how_many_selects="<scipt>$('select.vehicle_license').length;</script>";
                                                            //int haha=(int) how_many_selects;
                                                        %>
                                                    </tbody>
                                                </table>
                                                <script>
                                                       
                                                    var how_many_selects = $('select.vehicle_license').length;
                                                            var tbody2 = $('#tbl_license').children('tbody');
                                                            var table2 = tbody2.length ? tbody2 : $('#tbl_license');
                                                            var row2 = '<tr>' +
                                                            '<td>{{grade}}</td>' +
                                                            '<td>{{action}}</td>' +
                                                            '</tr>';
                                                            $(document).ready(function() {
                                                    $('#add_license').click(function(){
                                                        
                                                         $.ajax({
                                                               url: 'process/ajaxVehicle.jsp',
                                                               type: 'POST',
                                                               data: {
                                                                   how_many_selects: how_many_selects
                               
                                                               },
                                                               success: function(data) {
                                                                  // alert('Update Success' + data);
                                                               },
                                                               failure: function(data) {
                                                                   //alert('Update Failed');
                                                               }
                                                           });
                                                
                                                
                                                        //Add row
                                                        table2.append(row2.compose({
                                                        'grade': "<%=license_list%>",
                                                                'action': "X"
                                                        }));
                                                    });

                                                    });                                               
                                                                                                         
                                                </script>

                                                <div class="row">
                                                    <div class="col-lg-5">
                                                        <button type="button" id="add_license" class="btn btn-primary">Add</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <%
                                    String pph15 = "";
                                    try {
                                        pph15 = pph_candidate.get(0).get(15);
                                    } catch (Exception e) {
                                        pph15 = "";
                                    }
                                %>
                                <div class="form-group">
                                    <label class="col-lg-8 control-label">
                                        Existing Government Servant ? :</label>
                                    <div class="col-md-4">
                                        <div class="form-inline">
                                            <div class="controls-row">
                                                <label class="radio inline">
                                                    <input name="C_ServOfficer" type="radio" value="YES" />
                                                    YES
                                                </label>
                                                <label class="radio inline">
                                                    <input name="C_ServOfficer" type="radio" value="NO" checked />
                                                    NO
                                                </label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/><br/>
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="submit" name="form_personal" class="btn btn-primary" value="Save Changes">
                                <span></span>
                                <input type="reset" class="btn btn-default" value="Cancel">
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Academic Information
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <div class="panel-group" id="accordionAcademic" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="academicheadingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordionAcademic" href="#academicCollapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            PMR/SRP/LCE
                                        </a>
                                    </h4>
                                </div>
                                <div id="academicCollapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="academicheadingOne">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <form id="pmrForm" name="pmrForm" action="pmr.html" method="post">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="alert alert-warning" role="alert">
                                                                <p><b>Instruction : </b> For PMR certificate , please select grades A to E and the certificates SRP / LCE , please select grade 1 to 9</p>

                                                            </div>   

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                             <div class="col-lg-2">
                                                            <label>Year : </label>

                                                        </div>

                                                        <div class="col-lg-3">
                                                            
                                                            <select name="pmr_tahun" id="pmr_tahun" >
                                                                

                                                            </select>
                                                            <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('#pmr_tahun').append($('<option/>').val(yr).text(yr));
                                                                    };</script>
                                                        </div>
                                                        </div>

                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Certificate Type : </label>
                                                            </div>
                                                            <%
                                                                String query_type_academic_info = "SELECT * "
                                                                        + "FROM TYPE_ACADEMIC_INFO ";

                                                                MainClient mc_type_academic_info = new MainClient(DBConn.getHost());
                                                                String params_type_academic_info[] = {};
                                                                ArrayList<ArrayList<String>> pph_type_academic_info = mc_type_academic_info.getQuery(query_type_academic_info, params_type_academic_info);

                                                                String pph_aci6 = "";
                                                                try {
                                                                    pph_aci6 = pph_academic_info.get(0).get(6);
                                                                } catch (Exception e) {
                                                                    pph_aci6 = "";
                                                                }
                                                            %>
                                                            <div class="col-lg-6">
                                                                <select name="tai_refid" id="tai_refid" >
                                                                    <%
                                                                        for (int i = 0; i < pph_type_academic_info.size(); i++) {
                                                                            if (pph_aci6 != null && pph_aci6 != "" && !pph_aci6.equals("")) {
                                                                                if (pph_aci6.equalsIgnoreCase(pph_type_academic_info.get(i).get(0).toString())) {
                                                                    %>
                                                                    <option selected value="<%=pph_type_academic_info.get(i).get(0).toString() %>"><%=pph_type_academic_info.get(i).get(1).toString() %></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%=pph_type_academic_info.get(i).get(0).toString() %>"><%=pph_type_academic_info.get(i).get(1).toString() %></option>
                                                                    <%
                                                                        }
                                                                    } else {

                                                                        if (i == 0) {
                                                                    %>
                                                                    <option value="" selected>Please Select</option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                    <option value="<%=pph_type_academic_info.get(i).get(0).toString() %>"><%=pph_type_academic_info.get(i).get(1).toString() %></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Rank : </label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                    <option value=""> Please select </option>
                                                                    <option value="A">A</option>
                                                                    <option value="B">B</option>
                                                                    <option value="C">C</option>
                                                                    <option value="S">S</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <table id="academic_pmr" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Subject</th>
                                                                        <th>Grade</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                                            </select> 
                                                                        </td>
                                                                        <td>
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>

                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <%
                                                                String test = helpers.Func.generateSubjectSelect();
                                                                String grade = helpers.Func.generateGradeSelect();
                                                            %>
                                                            <script>
                                                                        //Compose template string
                                                                        String.prototype.compose = (function (){
                                                                        var re = /\{{(.+?)\}}/g;
                                                                                return function (o){
                                                                                return this.replace(re, function (_, k){
                                                                                return typeof o[k] != 'undefined' ? o[k] : '';
                                                                                });
                                                                                }
                                                                        }());
                                                                        var tbody_pmr = $('#academic_pmr').children('tbody');
                                                                        var table_pmr = tbody_pmr.length ? tbody_pmr : $('#academic_pmr');
                                                                        var row_pmr = '<tr>' +
                                                                        '<td>{{subject}}</td>' +
                                                                        '<td>{{grade}}</td>' +
                                                                        '</tr>';
                                                                        $(document).ready(function() {
                                                                $('#add_pmr').click(function(){
                                                                //Add row
                                                                table_pmr.append(row_pmr.compose({
                                                                'subject': "<%=test%>",
                                                                        'grade': "<%=grade%>"
                                                                }));
                                                                });
                                                                });</script>

                                                            <div class="row">
                                                                <div class="col-lg-5">
                                                                    <button type="button" id="add_pmr" class="btn btn-primary">Add</button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="academicheadingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionAcademic" href="#academicCollapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            SPM/MCE/SPM(V)/SPVM
                                        </a>
                                    </h4>
                                </div>
                                <div id="academicCollapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="academicheadingTwo">
                                    <div class="panel-body">
                                        <ul id="psmTabs" class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#first_exam" id="first_exam-tab" role="tab" data-toggle="tab" aria-controls="first_exam" aria-expanded="true">First Exam</a>
                                            </li>
                                            <li role="presentation"><a href="#second_exam" role="tab" id="second_exam-tab" data-toggle="tab" aria-controls="second_exam">Second Exam</a>
                                            </li>
                                           
                                        </ul>

                                        <div id="psmTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="first_exam" aria-labelledby="first_exam-tab">
                                                <div class="row">
                                            <div class="col-lg-12">
                                                <form id="psmForm_1" name="psmForm_1" action="pmr.html" method="post">
                                                
                                                    <div class="row">
                                                      <div class="col-lg-12">
                                                            <div class="col-lg-2">
                                                            <label>Year : </label>

                                                        </div>

                                                        <div class="col-lg-3">
                                                            <select name="psm_tahun" id="psm_tahun" >
                                                                <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('#psm_tahun').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>

                                                            </select>
                                                        </div>

                                                      </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Certificate Type : </label>
                                                            </div>
                                                            <%
                                                                String query_type_academic_info2 = "SELECT * "
                                                                        + "FROM TYPE_ACADEMIC_INFO ";

                                                                MainClient mc_type_academic_info2 = new MainClient(DBConn.getHost());
                                                                String params_type_academic_info2[] = {};
                                                                ArrayList<ArrayList<String>> pph_type_academic_info2 = mc_type_academic_info2.getQuery(query_type_academic_info, params_type_academic_info);

                                                                String pph_aci6_2 = "";
                                                                try {
                                                                    pph_aci6_2 = pph_academic_info.get(0).get(6);
                                                                } catch (Exception e) {
                                                                    pph_aci6_2 = "";
                                                                }
                                                            %>
                                                            <div class="col-lg-6">
                                                                <select name="tai_refid" id="tai_refid" >
                                                                    <%
                                                                        for (int i = 0; i < pph_type_academic_info2.size(); i++) {
                                                                            if (pph_aci6_2 != null && pph_aci6_2 != "" && !pph_aci6_2.equals("")) {
                                                                                if (pph_aci6_2.equalsIgnoreCase(pph_type_academic_info2.get(i).get(0).toString())) {
                                                                    %>
                                                                    <option selected value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                        }
                                                                    } else {

                                                                        if (i == 0) {
                                                                    %>
                                                                    <option value="" selected>Please Select</option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info.get(i).get(1).toString());%></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Rank : </label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                    <option value=""> Please select </option>
                                                                    <option value="A">A</option>
                                                                    <option value="B">B</option>
                                                                    <option value="C">C</option>
                                                                    <option value="S">S</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="col-lg-6"><p>Oral Test of Bahasa Melayu / Bahasa Malaysia</p></div>
                                                                            
                                                                            <div class="col-lg-3 col-lg-offset-2">
                                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                    <option value=""> Please select </option>
                                                                                    <option value="A">A</option>
                                                                                    <option value="B">B</option>
                                                                                    <option value="C">C</option>
                                                                                    <option value="S">S</option>
                                                                                </select>
                                                                            </div>
                                                                      
                                                      
                                                                    </div>

                                                                </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <table id="academic_psm" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Subject</th>
                                                                        <th>Grade</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                                            </select> 
                                                                        </td>
                                                                        <td>
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>

                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <%
                                                                String test2 = helpers.Func.generateSubjectSelect();
                                                                String grade2 = helpers.Func.generateGradeSelect();
                                                            %>
                                                            <script>
                                                                        //Compose template string
                                                                        String.prototype.compose = (function (){
                                                                        var re = /\{{(.+?)\}}/g;
                                                                                return function (o){
                                                                                return this.replace(re, function (_, k){
                                                                                return typeof o[k] != 'undefined' ? o[k] : '';
                                                                                });
                                                                                }
                                                                        }());
                                                                        var tbody_psm = $('#academic_psm').children('tbody');
                                                                        var table_psm = tbody_psm.length ? tbody_psm : $('#academic_psm');
                                                                        var row_psm = '<tr>' +
                                                                        '<td>{{subject}}</td>' +
                                                                        '<td>{{grade}}</td>' +
                                                                        '</tr>';
                                                                        $(document).ready(function() {
                                                                $('#add_psm').click(function(){
                                                                //Add row
                                                                table_psm.append(row_psm.compose({
                                                                'subject': "<%=test2%>",
                                                                        'grade': "<%=grade2%>"
                                                                }));
                                                                });
                                                                });                                                            </script>

                                                            <div class="row">
                                                                <div class="col-lg-5">
                                                                    <button type="button" id="add_psm" class="btn btn-primary">Add</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="second_exam" aria-labelledby="second_exam-tab">
                                             <div class="row">
                                            <div class="col-lg-12">
                                                <form id="psmForm_2" name="psmForm_2" action="pmr.html" method="post">
                                                
                                                    <div class="row">
                                                      <div class="col-lg-12">
                                                            <div class="col-lg-2">
                                                            <label>Year : </label>

                                                        </div>

                                                        <div class="col-lg-3">
                                                            <select name="psm_tahun_2" id="psm_tahun_2" >
                                                                <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('#psm_tahun_2').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>

                                                            </select>
                                                        </div>

                                                      </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Certificate Type : </label>
                                                            </div>
                                                            <%
                                                                String query_type_academic_info2_2 = "SELECT * "
                                                                        + "FROM TYPE_ACADEMIC_INFO ";

                                                                MainClient mc_type_academic_info2_2 = new MainClient(DBConn.getHost());
                                                                String params_type_academic_info2_2[] = {};
                                                                ArrayList<ArrayList<String>> pph_type_academic_info2_2 = mc_type_academic_info2_2.getQuery(query_type_academic_info2_2, params_type_academic_info2_2);

                                                                String pph_aci6_2_2 = "";
                                                                try {
                                                                    pph_aci6_2_2 = pph_academic_info.get(0).get(6);
                                                                } catch (Exception e) {
                                                                    pph_aci6_2_2 = "";
                                                                }
                                                            %>
                                                            <div class="col-lg-6">
                                                                <select name="tai_refid" id="tai_refid" >
                                                                    <%
                                                                        for (int i = 0; i < pph_type_academic_info2.size(); i++) {
                                                                            if (pph_aci6_2 != null && pph_aci6_2 != "" && !pph_aci6_2.equals("")) {
                                                                                if (pph_aci6_2.equalsIgnoreCase(pph_type_academic_info2.get(i).get(0).toString())) {
                                                                    %>
                                                                    <option selected value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                        }
                                                                    } else {

                                                                        if (i == 0) {
                                                                    %>
                                                                    <option value="" selected>Please Select</option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info.get(i).get(1).toString());%></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Rank : </label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                    <option value=""> Please select </option>
                                                                    <option value="A">A</option>
                                                                    <option value="B">B</option>
                                                                    <option value="C">C</option>
                                                                    <option value="S">S</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="col-lg-6"><p>Oral Test of Bahasa Melayu / Bahasa Malaysia</p></div>
                                                                            
                                                                            <div class="col-lg-3 col-lg-offset-2">
                                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                    <option value=""> Please select </option>
                                                                                    <option value="A">A</option>
                                                                                    <option value="B">B</option>
                                                                                    <option value="C">C</option>
                                                                                    <option value="S">S</option>
                                                                                </select>
                                                                            </div>
                                                                      
                                                      
                                                                    </div>

                                                                </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <table id="academic_psm_2" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Subject</th>
                                                                        <th>Grade</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                                            </select> 
                                                                        </td>
                                                                        <td>
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>

                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <%
                                                                String test3 = helpers.Func.generateSubjectSelect();
                                                                String grade3 = helpers.Func.generateGradeSelect();
                                                            %>
                                                            <script>
                                                                        //Compose template string
                                                                        String.prototype.compose = (function (){
                                                                        var re = /\{{(.+?)\}}/g;
                                                                                return function (o){
                                                                                return this.replace(re, function (_, k){
                                                                                return typeof o[k] != 'undefined' ? o[k] : '';
                                                                                });
                                                                                }
                                                                        }());
                                                                        var tbody_psm_2 = $('#academic_psm_2').children('tbody');
                                                                        var table_psm_2 = tbody_psm_2.length ? tbody_psm_2 : $('#academic_psm_2');
                                                                        var row_psm_2 = '<tr>' +
                                                                        '<td>{{subject}}</td>' +
                                                                        '<td>{{grade}}</td>' +
                                                                        '</tr>';
                                                                        $(document).ready(function() {
                                                                $('#add_psm_2').click(function(){
                                                                //Add row
                                                                table_psm_2.append(row_psm_2.compose({
                                                                'subject': "<%=test3%>",
                                                                        'grade': "<%=grade3%>"
                                                                }));
                                                                });
                                                                });                                                            </script>

                                                            <div class="row">
                                                                <div class="col-lg-5">
                                                                    <button type="button" id="add_psm_2" class="btn btn-primary">Add</button>
                                                                </div>
                                                            </div>
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
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="academicheadingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionAcademic" href="#academicCollapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            Additional Exams
                                        </a>
                                    </h4>
                                </div>
                                <div id="academicCollapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="academicheadingThree">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="alert alert-warning" role="alert">
                                                    <p><b>Instruction : </b> Malay language exam , math , english for paper July / SAP / SPM / STPM / University or Equivalent.</p>

                                                </div>   

                                            </div>
                                        </div>
                                          <div class="row">
                                            <div class="col-lg-12">
                                                <div class="col-lg-1">
                                                    <label>Year : </label>

                                                </div>
                                                <div class="col-lg-3">
                                                    <select name="addexam_tahun" id="addexam_tahun" >
                                                        <script>
                                                                    var i, yr, now = new Date();
                                                                    for (i = 0; i < 30; i++) {
                                                            yr = now.getFullYear() - i; // or whatever
                                                                    $('#addexam_tahun').append($('<option/>').val(yr).text(yr));
                                                            };                                                                </script>

                                                    </select>
                                                </div>
                                                <div class="col-lg-1">
                                                    <label>Subject:</label>

                                                </div>
                                                    <div class="col-lg-2">
                                                        <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                        </select> 
                                                    </div>
                                                
                                                <div class="col-lg-1 col-lg-offset-1">
                                                    <label>Grade :</label>
                                                </div>
                                                <div class="col-lg-2 col-lg-offset-1">
                                                    <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                </div>
                                            
                                            </div>
                                        </div>
                                        
                                         <div class="row">
                                             <div class="col-lg-12">
                                                 <!-- table of additional exam -->
                                                 <table id="academic_additional_exam" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Type</th>
                                                                        <th>Oral Test</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                                            </select> 
                                                                        </td>
                                                                        <td>
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>

                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <%
                                                                String test4 = helpers.Func.generateSubjectSelect();
                                                                String grade4 = helpers.Func.generateGradeSelect();
                                                            %>
                                                            <script>
                                                                        //Compose template string
                                                                        String.prototype.compose = (function (){
                                                                        var re = /\{{(.+?)\}}/g;
                                                                                return function (o){
                                                                                return this.replace(re, function (_, k){
                                                                                return typeof o[k] != 'undefined' ? o[k] : '';
                                                                                });
                                                                                }
                                                                        }());
                                                                        var tbody_add_exam = $('#academic_additional_exam').children('tbody');
                                                                        var table_add_exam = tbody_add_exam.length ? tbody_add_exam : $('#academic_additional_exam');
                                                                        var row_add_exam = '<tr>' +
                                                                        '<td>{{subject}}</td>' +
                                                                        '<td>{{grade}}</td>' +
                                                                        '</tr>';
                                                                        $(document).ready(function() {
                                                                $('#add_additional_exam').click(function(){
                                                                //Add row
                                                                table_add_exam.append(row_add_exam.compose({
                                                                'subject': "<%=test3%>",
                                                                        'grade': "<%=grade4%>"
                                                                }));
                                                                });
                                                                });                                                            </script>
                                             </div>
                                         </div>
                                         <div class="row">
                                                                <div class="col-lg-5">
                                                                    <button type="button" id="add_additional_exam" class="btn btn-primary">Add</button>
                                                                </div>
                                                            </div>
                                    </div>
                                </div>
                            </div>
                              <!--muet-->
                              <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="academicheadingFour">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionAcademic" href="#academicCollapseFour" aria-expanded="false" aria-controls="collapseFour">
                                            MUET
                                        </a>
                                    </h4>
                                </div>
                                <div id="academicCollapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="academicheadingFour">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="alert alert-warning" role="alert">
                                                    <p><b>Instruction : </b> Malay language exam , math , english for paper July / SAP / SPM / STPM / University or Equivalent.</p>

                                                </div>   

                                            </div>
                                        </div>
                                          <div class="row">
                                            <div class="col-lg-12">
                                                <div class="col-lg-1">
                                                    <label>Year : </label>

                                                </div>
                                                <div class="col-lg-3">
                                                    <select name="addexam_tahun" id="addexam_tahun" >
                                                        <script>
                                                                    var i, yr, now = new Date();
                                                                    for (i = 0; i < 30; i++) {
                                                            yr = now.getFullYear() - i; // or whatever
                                                                    $('#addexam_tahun').append($('<option/>').val(yr).text(yr));
                                                            };                                                                </script>

                                                    </select>
                                                </div>
                                                <div class="col-lg-1">
                                                    <label>Subject:</label>

                                                </div>
                                                    <div class="col-lg-2">
                                                        <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                        </select> 
                                                    </div>
                                                
                                                <div class="col-lg-1 col-lg-offset-1">
                                                    <label>Grade :</label>
                                                </div>
                                                <div class="col-lg-2 col-lg-offset-1">
                                                    <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>
                                                </div>
                                            
                                            </div>
                                        </div>
                                        
                                         
                                    </div>
                                </div>
                            </div>
                                 <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="academicheadingFive">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionAcademic" href="#academicCollapseFive" aria-expanded="false" aria-controls="collapseFive">
                                            STPM / STP / HSC
                                        </a>
                                    </h4>
                                </div>
                                <div id="academicCollapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="academicheadingFive">
                                    <div class="panel-body">
                                        <ul id="stpmTabs" class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#stpm_first_exam" id="stpm_first_exam-tab" role="tab" data-toggle="tab" aria-controls="stpm_first_exam" aria-expanded="true">First Exam</a>
                                            </li>
                                            <li role="presentation"><a href="#stpm_second_exam" role="tab" id="stpm_second_exam-tab" data-toggle="tab" aria-controls="stpm_second_exam">Second Exam</a>
                                            </li>
                                           
                                        </ul>

                                        <div id="stpmTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="stpm_first_exam" aria-labelledby="stpm_first_exam-tab">
                                                <div class="row">
                                            <div class="col-lg-12">
                                                <form id="psmForm_1" name="psmForm_1" action="pmr.html" method="post">
                                                
                                                    <div class="row">
                                                      <div class="col-lg-12">
                                                            <div class="col-lg-2">
                                                            <label>Year : </label>

                                                        </div>

                                                        <div class="col-lg-3">
                                                            <select class="year" name="psm_tahun" id="psm_tahun" >
                                                                <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('.year').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>

                                                            </select>
                                                        </div>

                                                      </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Certificate Type : </label>
                                                            </div>
                                                            <%
                                                                String query_type_academic_info2_stpm = "SELECT * "
                                                                        + "FROM TYPE_ACADEMIC_INFO ";

                                                                MainClient mc_type_academic_info2_stpm = new MainClient(DBConn.getHost());
                                                                String params_type_academic_info2_stpm[] = {};
                                                                ArrayList<ArrayList<String>> pph_type_academic_info2_stpm = mc_type_academic_info2_stpm.getQuery(query_type_academic_info2_stpm, params_type_academic_info2_stpm);

                                                                String pph_aci6_2_stpm = "";
                                                                try {
                                                                    pph_aci6_2_stpm = pph_academic_info.get(0).get(6);
                                                                } catch (Exception e) {
                                                                    pph_aci6_2 = "";
                                                                }
                                                            %>
                                                            <div class="col-lg-6">
                                                                <select name="tai_refid" id="tai_refid" >
                                                                    <%
                                                                        for (int i = 0; i < pph_type_academic_info2.size(); i++) {
                                                                            if (pph_aci6_2 != null && pph_aci6_2 != "" && !pph_aci6_2.equals("")) {
                                                                                if (pph_aci6_2.equalsIgnoreCase(pph_type_academic_info2.get(i).get(0).toString())) {
                                                                    %>
                                                                    <option selected value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                        }
                                                                    } else {

                                                                        if (i == 0) {
                                                                    %>
                                                                    <option value="" selected>Please Select</option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info.get(i).get(1).toString());%></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Rank : </label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                    <option value=""> Please select </option>
                                                                    <option value="A">A</option>
                                                                    <option value="B">B</option>
                                                                    <option value="C">C</option>
                                                                    <option value="S">S</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="col-lg-6"><p>Oral Test of Bahasa Melayu / Bahasa Malaysia</p></div>
                                                                            
                                                                            <div class="col-lg-3 col-lg-offset-2">
                                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                    <option value=""> Please select </option>
                                                                                    <option value="A">A</option>
                                                                                    <option value="B">B</option>
                                                                                    <option value="C">C</option>
                                                                                    <option value="S">S</option>
                                                                                </select>
                                                                            </div>
                                                                      
                                                      
                                                                    </div>

                                                                </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <table id="academic_stpm" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Subject</th>
                                                                        <th>Grade</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                                            </select> 
                                                                        </td>
                                                                        <td>
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>

                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <%
                                                                String test_stpm = helpers.Func.generateSubjectSelect();
                                                                String grade_stpm = helpers.Func.generateGradeSelect();
                                                            %>
                                                            <script>
                                                                        //Compose template string
                                                                        String.prototype.compose = (function (){
                                                                        var re = /\{{(.+?)\}}/g;
                                                                                return function (o){
                                                                                return this.replace(re, function (_, k){
                                                                                return typeof o[k] != 'undefined' ? o[k] : '';
                                                                                });
                                                                                }
                                                                        }());
                                                                        var tbody_stpm = $('#academic_stpm').children('tbody');
                                                                        var table_stpm = tbody_stpm.length ? tbody_stpm : $('#academic_stpm');
                                                                        var row_stpm = '<tr>' +
                                                                        '<td>{{subject}}</td>' +
                                                                        '<td>{{grade}}</td>' +
                                                                        '</tr>';
                                                                        $(document).ready(function() {
                                                                $('#add_stpm').click(function(){
                                                                //Add row
                                                                table_stpm.append(row_stpm.compose({
                                                                'subject': "<%=test2%>",
                                                                        'grade': "<%=grade_stpm%>"
                                                                }));
                                                                });
                                                                });                                                            </script>

                                                            <div class="row">
                                                                <div class="col-lg-5">
                                                                    <button type="button" id="add_stpm" class="btn btn-primary">Add</button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="stpm_second_exam" aria-labelledby="stpm_second_exam-tab">
                                             <div class="row">
                                            <div class="col-lg-12">
                                                <form id="psmForm_2" name="psmForm_2" action="pmr.html" method="post">
                                                
                                                    <div class="row">
                                                      <div class="col-lg-12">
                                                            <div class="col-lg-2">
                                                            <label>Year : </label>

                                                        </div>

                                                        <div class="col-lg-3">
                                                            <select class="year" name="psm_tahun_2" id="psm_tahun_2" >
                                                                <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('.year').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>

                                                            </select>
                                                        </div>

                                                      </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Certificate Type : </label>
                                                            </div>
                                                            <%
                                                                String query_type_academic_info2_2_stpm_2 = "SELECT * "
                                                                        + "FROM TYPE_ACADEMIC_INFO ";

                                                                MainClient mc_type_academic_info2_2_stpm_2 = new MainClient(DBConn.getHost());
                                                                String params_type_academic_info2_2_stpm_2[] = {};
                                                                ArrayList<ArrayList<String>> pph_type_academic_info2_2_stpm_2 = mc_type_academic_info2_2.getQuery(query_type_academic_info2_2_stpm_2, params_type_academic_info2_2_stpm_2);

                                                                String pph_aci6_2_2_stpm_2 = "";
                                                                try {
                                                                    pph_aci6_2_2_stpm_2 = pph_academic_info.get(0).get(6);
                                                                } catch (Exception e) {
                                                                    pph_aci6_2_2_stpm_2 = "";
                                                                }
                                                            %>
                                                            <div class="col-lg-6">
                                                                <select name="tai_refid" id="tai_refid" >
                                                                    <%
                                                                        for (int i = 0; i < pph_type_academic_info2.size(); i++) {
                                                                            if (pph_aci6_2 != null && pph_aci6_2 != "" && !pph_aci6_2.equals("")) {
                                                                                if (pph_aci6_2.equalsIgnoreCase(pph_type_academic_info2.get(i).get(0).toString())) {
                                                                    %>
                                                                    <option selected value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                        }
                                                                    } else {

                                                                        if (i == 0) {
                                                                    %>
                                                                    <option value="" selected>Please Select</option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info.get(i).get(1).toString());%></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Rank : </label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                    <option value=""> Please select </option>
                                                                    <option value="A">A</option>
                                                                    <option value="B">B</option>
                                                                    <option value="C">C</option>
                                                                    <option value="S">S</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="col-lg-6"><p>Oral Test of Bahasa Melayu / Bahasa Malaysia</p></div>
                                                                            
                                                                            <div class="col-lg-3 col-lg-offset-2">
                                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                    <option value=""> Please select </option>
                                                                                    <option value="A">A</option>
                                                                                    <option value="B">B</option>
                                                                                    <option value="C">C</option>
                                                                                    <option value="S">S</option>
                                                                                </select>
                                                                            </div>
                                                                      
                                                      
                                                                    </div>

                                                                </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <table id="academic_stpm_2" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Subject</th>
                                                                        <th>Grade</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                                            </select> 
                                                                        </td>
                                                                        <td>
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>

                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <%
                                                                String test_stpm_2 = helpers.Func.generateSubjectSelect();
                                                                String grade_stpm_2 = helpers.Func.generateGradeSelect();
                                                            %>
                                                            <script>
                                                                        //Compose template string
                                                                        String.prototype.compose = (function (){
                                                                        var re = /\{{(.+?)\}}/g;
                                                                                return function (o){
                                                                                return this.replace(re, function (_, k){
                                                                                return typeof o[k] != 'undefined' ? o[k] : '';
                                                                                });
                                                                                }
                                                                        }());
                                                                        var tbody_stpm_2 = $('#academic_stpm_2').children('tbody');
                                                                        var table_stpm_2 = tbody_stpm_2.length ? tbody_stpm_2 : $('#academic_stpm_2');
                                                                        var row_stpm_2 = '<tr>' +
                                                                        '<td>{{subject}}</td>' +
                                                                        '<td>{{grade}}</td>' +
                                                                        '</tr>';
                                                                        $(document).ready(function() {
                                                                $('#add_stpm_2').click(function(){
                                                                //Add row
                                                                table_stpm_2.append(row_stpm_2.compose({
                                                                'subject': "<%=test3%>",
                                                                        'grade': "<%=grade_stpm_2%>"
                                                                }));
                                                                });
                                                                });                                                            </script>

                                                            <div class="row">
                                                                <div class="col-lg-5">
                                                                    <button type="button" id="add_stpm_2" class="btn btn-primary">Add</button>
                                                                </div>
                                                            </div>
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
                                                                <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="academicheadingSix">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionAcademic" href="#academicCollapseSix" aria-expanded="false" aria-controls="collapseSix">
                                            STAM
                                        </a>
                                    </h4>
                                </div>
                                <div id="academicCollapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="academicheadingSix">
                                    <div class="panel-body">
                                        <ul id="stamTabs" class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#stam_first_exam" id="stam_first_exam-tab" role="tab" data-toggle="tab" aria-controls="stam_first_exam" aria-expanded="true">First Exam</a>
                                            </li>
                                            <li role="presentation"><a href="#stam_second_exam" role="tab" id="stam_second_exam-tab" data-toggle="tab" aria-controls="stam_second_exam">Second Exam</a>
                                            </li>
                                           
                                        </ul>

                                        <div id="stamTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="stam_first_exam" aria-labelledby="stam_first_exam-tab">
                                                <div class="row">
                                            <div class="col-lg-12">
                                                <form id="psmForm_1" name="psmForm_1" action="pmr.html" method="post">
                                                
                                                    <div class="row">
                                                      <div class="col-lg-12">
                                                            <div class="col-lg-2">
                                                            <label>Year : </label>

                                                        </div>

                                                        <div class="col-lg-3">
                                                            <select class="year" name="psm_tahun" id="psm_tahun" >
                                                                <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('.year').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>

                                                            </select>
                                                        </div>

                                                      </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Certificate Type : </label>
                                                            </div>
                                                            <%
                                                                String query_type_academic_info_stam = "SELECT * "
                                                                        + "FROM TYPE_ACADEMIC_INFO ";

                                                                MainClient mc_type_academic_info_stam = new MainClient(DBConn.getHost());
                                                                String params_type_academic_stam[] = {};
                                                                ArrayList<ArrayList<String>> pph_type_academic_info_stam = mc_type_academic_info2_stpm.getQuery(query_type_academic_info_stam, params_type_academic_stam);

                                                                String pph_aci6_2_stam = "";
                                                                try {
                                                                    pph_aci6_2_stpm = pph_academic_info.get(0).get(6);
                                                                } catch (Exception e) {
                                                                    pph_aci6_2 = "";
                                                                }
                                                            %>
                                                            <div class="col-lg-6">
                                                                <select name="tai_refid" id="tai_refid" >
                                                                    <%
                                                                        for (int i = 0; i < pph_type_academic_info2.size(); i++) {
                                                                            if (pph_aci6_2 != null && pph_aci6_2 != "" && !pph_aci6_2.equals("")) {
                                                                                if (pph_aci6_2.equalsIgnoreCase(pph_type_academic_info2.get(i).get(0).toString())) {
                                                                    %>
                                                                    <option selected value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                        }
                                                                    } else {

                                                                        if (i == 0) {
                                                                    %>
                                                                    <option value="" selected>Please Select</option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info.get(i).get(1).toString());%></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Rank : </label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                    <option value=""> Please select </option>
                                                                    <option value="A">A</option>
                                                                    <option value="B">B</option>
                                                                    <option value="C">C</option>
                                                                    <option value="S">S</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="col-lg-6"><p>Oral Test of Bahasa Melayu / Bahasa Malaysia</p></div>
                                                                            
                                                                            <div class="col-lg-3 col-lg-offset-2">
                                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                    <option value=""> Please select </option>
                                                                                    <option value="A">A</option>
                                                                                    <option value="B">B</option>
                                                                                    <option value="C">C</option>
                                                                                    <option value="S">S</option>
                                                                                </select>
                                                                            </div>
                                                                      
                                                      
                                                                    </div>

                                                                </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <table id="academic_stam" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Subject</th>
                                                                        <th>Grade</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                                            </select> 
                                                                        </td>
                                                                        <td>
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>

                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <%
                                                                String test_stam = helpers.Func.generateSubjectSelect();
                                                                String grade_stam = helpers.Func.generateGradeSelect();
                                                            %>
                                                            <script>
                                                                        //Compose template string
                                                                        String.prototype.compose = (function (){
                                                                        var re = /\{{(.+?)\}}/g;
                                                                                return function (o){
                                                                                return this.replace(re, function (_, k){
                                                                                return typeof o[k] != 'undefined' ? o[k] : '';
                                                                                });
                                                                                }
                                                                        }());
                                                                        var tbody_stam = $('#academic_stam').children('tbody');
                                                                        var table_stam = tbody_stam.length ? tbody_stam : $('#academic_stam');
                                                                        var row_stam = '<tr>' +
                                                                        '<td>{{subject}}</td>' +
                                                                        '<td>{{grade}}</td>' +
                                                                        '</tr>';
                                                                        $(document).ready(function() {
                                                                $('#add_stam').click(function(){
                                                                //Add row
                                                                table_stam.append(row_stam.compose({
                                                                'subject': "<%=test2%>",
                                                                        'grade': "<%=grade_stam%>"
                                                                }));
                                                                });
                                                                });                                                            </script>

                                                            <div class="row">
                                                                <div class="col-lg-5">
                                                                    <button type="button" id="add_stam" class="btn btn-primary">Add</button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="stam_second_exam" aria-labelledby="stam_second_exam-tab">
                                             <div class="row">
                                            <div class="col-lg-12">
                                                <form id="psmForm_2" name="psmForm_2" action="pmr.html" method="post">
                                                
                                                    <div class="row">
                                                      <div class="col-lg-12">
                                                            <div class="col-lg-2">
                                                            <label>Year : </label>

                                                        </div>

                                                        <div class="col-lg-3">
                                                            <select class="year" name="psm_tahun_2" id="psm_tahun_2" >
                                                                <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('.year').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>

                                                            </select>
                                                        </div>

                                                      </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Certificate Type : </label>
                                                            </div>
                                                            <%
                                                                String query_type_academic_info_stam_2 = "SELECT * "
                                                                        + "FROM TYPE_ACADEMIC_INFO ";

                                                                MainClient mc_type_academic_info2_2_stam_2 = new MainClient(DBConn.getHost());
                                                                String params_type_academic_info2_2_stam_2[] = {};
                                                                ArrayList<ArrayList<String>> pph_type_academic_info2_2_stam_2 = mc_type_academic_info2_2.getQuery(query_type_academic_info_stam_2, params_type_academic_info2_2_stpm_2);

                                                                String pph_aci6_2_2_sam_2 = "";
                                                                try {
                                                                    pph_aci6_2_2_stpm_2 = pph_academic_info.get(0).get(6);
                                                                } catch (Exception e) {
                                                                    pph_aci6_2_2_stpm_2 = "";
                                                                }
                                                            %>
                                                            <div class="col-lg-6">
                                                                <select name="tai_refid" id="tai_refid" >
                                                                    <%
                                                                        for (int i = 0; i < pph_type_academic_info2.size(); i++) {
                                                                            if (pph_aci6_2 != null && pph_aci6_2 != "" && !pph_aci6_2.equals("")) {
                                                                                if (pph_aci6_2.equalsIgnoreCase(pph_type_academic_info2.get(i).get(0).toString())) {
                                                                    %>
                                                                    <option selected value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info2.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info2.get(i).get(1).toString());%></option>
                                                                    <%
                                                                        }
                                                                    } else {

                                                                        if (i == 0) {
                                                                    %>
                                                                    <option value="" selected>Please Select</option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info.get(i).get(1).toString());%></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="col-lg-4">
                                                                <label>Rank : </label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                    <option value=""> Please select </option>
                                                                    <option value="A">A</option>
                                                                    <option value="B">B</option>
                                                                    <option value="C">C</option>
                                                                    <option value="S">S</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="col-lg-6"><p>Oral Test of Bahasa Melayu / Bahasa Malaysia</p></div>
                                                                            
                                                                            <div class="col-lg-3 col-lg-offset-2">
                                                                                <select name="pmr_tahun2" id="pmr_tahun2" >
                                                                                    <option value=""> Please select </option>
                                                                                    <option value="A">A</option>
                                                                                    <option value="B">B</option>
                                                                                    <option value="C">C</option>
                                                                                    <option value="S">S</option>
                                                                                </select>
                                                                            </div>
                                                                      
                                                      
                                                                    </div>

                                                                </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <table id="academic_stam_2" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Subject</th>
                                                                        <th>Grade</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <select name="pmr_tahun6" id="pmr_tahun6" >
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
                                                                            </select> 
                                                                        </td>
                                                                        <td>
                                                                            <select name="pmr_tahun5" id="pmr_tahun5" >
                                                                                <option value=""> Please select </option>
                                                                                <option value="A">A</option>
                                                                                <option value="B">B</option>
                                                                                <option value="C">C</option>
                                                                                <option value="D">D</option>
                                                                                <option value="E">E</option>
                                                                            </select>

                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <%
                                                                String test_stam_2 = helpers.Func.generateSubjectSelect();
                                                                String grade_stam_2 = helpers.Func.generateGradeSelect();
                                                            %>
                                                            <script>
                                                                        //Compose template string
                                                                        String.prototype.compose = (function (){
                                                                        var re = /\{{(.+?)\}}/g;
                                                                                return function (o){
                                                                                return this.replace(re, function (_, k){
                                                                                return typeof o[k] != 'undefined' ? o[k] : '';
                                                                                });
                                                                                }
                                                                        }());
                                                                        var tbody_stam_2 = $('#academic_stam_2').children('tbody');
                                                                        var table_stam_2 = tbody_stpm_2.length ? tbody_stam_2 : $('#academic_stam_2');
                                                                        var row_stam_2 = '<tr>' +
                                                                        '<td>{{subject}}</td>' +
                                                                        '<td>{{grade}}</td>' +
                                                                        '</tr>';
                                                                        $(document).ready(function() {
                                                                $('#add_stam_2').click(function(){
                                                                //Add row
                                                                table_stam_2.append(row_stam_2.compose({
                                                                'subject': "<%=test3%>",
                                                                        'grade': "<%=grade_stam_2%>"
                                                                }));
                                                                });
                                                                });                                                            </script>

                                                            <div class="row">
                                                                <div class="col-lg-5">
                                                                    <button type="button" id="add_stam_2" class="btn btn-primary">Add</button>
                                                                </div>
                                                            </div>
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
                                <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="academicheadingSeven">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionAcademic" href="#academicCollapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                            Higher Degree
                                        </a>
                                    </h4>
                                </div>
                                <div id="academicCollapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="academicheadingSeven">
                                    <div class="panel-body">
                                         <div class="row">
                                            <div class="col-lg-12">
                                                <div class="alert alert-warning" role="alert">
                                                    <p><b>Final Year Student : </b>Students who are studying in their final semester only.</p>

                                                </div>   

                                            </div>
                                        </div>
                                        <ul id="highTabs" class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#high_first_exam" id="high_first_exam-tab" role="tab" data-toggle="tab" aria-controls="high_first_exam" aria-expanded="true">First Exam</a>
                                            </li>
                                            <li role="presentation"><a href="#high_second_exam" role="tab" id="high_second_exam-tab" data-toggle="tab" aria-controls="high_second_exam">Second Exam</a>
                                            </li>
                                           <li role="presentation"><a href="#high_add" role="tab" id="high_add" data-toggle="tab" aria-controls="high_add">+</a>
                                            </li>
                                        </ul>
                                       
                                        <div id="highTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="high_first_exam" aria-labelledby="high_first_exam-tab">
                                                <!-- first exam -->
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                                <label>Graduated Year :</label>
                                                                 <select class="year" name="high_tahun" id="high_tahun" > 
                                                                  <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('.year').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>
                                                                 </select>
                                                                

                                                            </div>
                                                             <hr/>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6"><label>Graduation Level :</label></div>
                                                            <div class="col-lg-6"><select><option>Diploma With CGPA 3.25 - 3.49</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>CPGA :</label></div>
                                                            <div class="col-lg-6"><input type="text" value="3.43" /></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Issuing Institution :</label></div>
                                                            <div class="col-lg-6"><select><option>Politeknik Sultan Haji Ahmad Shah, Kuantan</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Overseas Franchise Institution :</label></div>
                                                            <div class="col-lg-6">

                                                                <label class="radio inline">
                                                                    
                                                                    <input type="radio" name="franchise" value="Yes" />
                                                                    Yes
                                                                </label>
                                                                <label class="radio inline">
                                                                    
                                                                    <input type="radio" name="franchise" value="No" />
                                                                    No
                                                                </label>
                                                            </div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Subject :</label></div>
                                                            <div class="col-lg-6"><select><option>Engineering</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Specialization :</label></div>
                                                            <div class="col-lg-6"><select><option>Civil Engineering</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Scholarship :</label></div>
                                                            <div class="col-lg-6"><select><option>JPA Scholarships Recipient</option></select></div>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <input type="submit" name="high_first_exam" class="btn btn-primary" value="Save Changes">
                                                        <span></span>
                                                        <input type="reset" class="btn btn-default" value="Cancel">
                                                    </div>

                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="high_second_exam" aria-labelledby="high_second_exam-tab">
                                             <!-- second exam -->
                                              <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                                <label>Graduated Year :</label>
                                                                 <select class="year" name="high_tahun" id="high_tahun" > 
                                                                  <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('.year').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>
                                                                 </select>
                                                                

                                                            </div>
                                                             <hr/>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6"><label>Graduation Level :</label></div>
                                                            <div class="col-lg-6"><select><option>Diploma With CGPA 3.25 - 3.49</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>CPGA :</label></div>
                                                            <div class="col-lg-6"><input type="text" value="3.43" /></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Issuing Institution :</label></div>
                                                            <div class="col-lg-6"><select><option>Politeknik Sultan Haji Ahmad Shah, Kuantan</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Overseas Franchise Institution :</label></div>
                                                            <div class="col-lg-6">

                                                                <label class="radio inline">
                                                                    
                                                                    <input type="radio" name="franchise" value="Yes" />
                                                                    Yes
                                                                </label>
                                                                <label class="radio inline">
                                                                    
                                                                    <input type="radio" name="franchise" value="No" />
                                                                    No
                                                                </label>
                                                            </div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Subject :</label></div>
                                                            <div class="col-lg-6"><select><option>Engineering</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Specialization :</label></div>
                                                            <div class="col-lg-6"><select><option>Civil Engineering</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Scholarship :</label></div>
                                                            <div class="col-lg-6"><select><option>JPA Scholarships Recipient</option></select></div>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                              <div class="row">
                                                    <div class="col-lg-12">
                                                        <input type="submit" name="high_second_exam" class="btn btn-primary" value="Save Changes">
                                                        <span></span>
                                                        <input type="reset" class="btn btn-default" value="Cancel">
                                                    </div>

                                                </div>
                                            </div>
                                           
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>   
                                                                <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="academicheadingEight">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionAcademic" href="#academicCollapseEight" aria-expanded="false" aria-controls="collapseEight">
                                            Professional Degree
                                        </a>
                                    </h4>
                                </div>
                                <div id="academicCollapseEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="academicheadingEight">
                                    <div class="panel-body">
                                         <div class="row">
                                            <div class="col-lg-12">
                                                <div class="alert alert-warning" role="alert">
                                                    <p><b>Final Year Student : </b>Students who are studying in their final semester only.</p>

                                                </div>   

                                            </div>
                                        </div>
                                        <ul id="profTabs" class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#prof_first_result" id="prof_first_result-tab" role="tab" data-toggle="tab" aria-controls="prof_first_result" aria-expanded="true">First Result</a>
                                            </li>
                                            <li role="presentation"><a href="#prof_second_result" role="tab" id="prof_second_result-tab" data-toggle="tab" aria-controls="prof_second_result">Second Result</a>
                                            </li>
                                           <li role="presentation"><a href="#prof_add" role="tab" id="prof_add" data-toggle="tab" aria-controls="prof_add">+</a>
                                            </li>
                                        </ul>
                                       
                                        <div id="profTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="prof_first_result" aria-labelledby="prof_first_result-tab">
                                                <!-- first exam -->
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                                <label>Graduated Year :</label>
                                                                 <select class="year" name="high_tahun" id="high_tahun" > 
                                                                  <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('.year').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>
                                                                 </select>
                                                                

                                                            </div>
                                                             <hr/>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6"><label>Graduation Level :</label></div>
                                                            <div class="col-lg-6"><select><option>Diploma With CGPA 3.25 - 3.49</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>CPGA :</label></div>
                                                            <div class="col-lg-6"><input type="text" value="3.43" /></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Issuing Institution :</label></div>
                                                            <div class="col-lg-6"><select><option>University Of Wisconsin, OSHKOSH, USA</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Overseas Franchise Institution :</label></div>
                                                            <div class="col-lg-6">

                                                                <label class="radio inline">
                                                                    
                                                                    <input type="radio" name="franchise" value="Yes" />
                                                                    Yes
                                                                </label>
                                                                <label class="radio inline">
                                                                    
                                                                    <input type="radio" name="franchise" value="No" />
                                                                    No
                                                                </label>
                                                            </div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Subject :</label></div>
                                                            <div class="col-lg-6"><select><option>Architecture</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Specialization :</label></div>
                                                            <div class="col-lg-6"><select><option>Design</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Scholarship :</label></div>
                                                            <div class="col-lg-6"><select><option>KPTM Scholarships Recipient</option></select></div>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <input type="submit" name="high_first_exam" class="btn btn-primary" value="Save Changes">
                                                        <span></span>
                                                        <input type="reset" class="btn btn-default" value="Cancel">
                                                    </div>

                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="prof_second_result" aria-labelledby="prof_second_result-tab">
                                             <!-- second exam -->
                                              <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                                <label>Graduated Year :</label>
                                                                 <select class="year" name="high_tahun" id="high_tahun" > 
                                                                  <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('.year').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>
                                                                 </select>
                                                                

                                                            </div>
                                                             <hr/>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6"><label>Graduation Level :</label></div>
                                                            <div class="col-lg-6"><select><option>Diploma With CGPA 3.25 - 3.49</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>CPGA :</label></div>
                                                            <div class="col-lg-6"><input type="text" value="3.43" /></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Issuing Institution :</label></div>
                                                            <div class="col-lg-6"><select><option>University Of Wisconsin, OSHKOSH, USA</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Overseas Franchise Institution :</label></div>
                                                            <div class="col-lg-6">

                                                                <label class="radio inline">
                                                                    
                                                                    <input type="radio" name="franchise" value="Yes" />
                                                                    Yes
                                                                </label>
                                                                <label class="radio inline">
                                                                    
                                                                    <input type="radio" name="franchise" value="No" />
                                                                    No
                                                                </label>
                                                            </div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Subject :</label></div>
                                                            <div class="col-lg-6"><select><option>Architecture</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Specialization :</label></div>
                                                            <div class="col-lg-6"><select><option>Design</option></select></div>
                                                        </div>
                                                         <div class="row">
                                                            <div class="col-lg-6"><label>Scholarship :</label></div>
                                                            <div class="col-lg-6"><select><option>KPTM Scholarships Recipient</option></select></div>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                              <div class="row">
                                                    <div class="col-lg-12">
                                                        <input type="submit" name="high_second_exam" class="btn btn-primary" value="Save Changes">
                                                        <span></span>
                                                        <input type="reset" class="btn btn-default" value="Cancel">
                                                    </div>

                                                </div>
                                            </div>
                                           
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>      
                        </div>
                    </div>
                </div>
            </div>
                                                                <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFour">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            Co-Curriculum
                        </a>
                    </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <label>Professional Certificate</label>
                                            </div>
                                             <div class="col-lg-4">
                                                <label>Certificate Date</label>
                                            </div>
                                            <div class="col-lg-2">
                                                <label>Expertise No</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <select class="form-control" name="" id="sel1">
                                                    <option>Institution of Surveyors Malysia</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                               <input type="date" class="form-control" id="codatepicker" >
                                            </div>
                                            <script type="text/javascript">
                                                          
                                                                    $(document).ready(function() {
                                                                           $("#codatepicker").datepicker("option", "dateFormat", "d-M-yy");
                                                                    $("#codatepicker").datepicker('setDate', new Date());
                                                                    });
                                                                    
                                                               </script>
                                            <div class="col-lg-2">
                                                <input type="text" />
                                            </div>
                                        </div>
                        <div class="row">
                                            <div class="col-lg-6">
                                                <select class="form-control" name="" id="sel1">
                                                    <option>Institution of Surveyors Malysia</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                               <input type="date" class="form-control" id="codatepicker" >
                                            </div>
                                            <script type="text/javascript">
                                                          
                                                                    $(document).ready(function() {
                                                                           $("#codatepicker").datepicker("option", "dateFormat", "d-M-yy");
                                                                    $("#codatepicker").datepicker('setDate', new Date());
                                                                    });
                                                                    
                                                               </script>
                                            <div class="col-lg-2">
                                                <input type="text" />
                                            </div>
                                        </div>
                        <div class="row">
                                            <div class="col-lg-6">
                                                <select class="form-control" name="" id="sel1">
                                                    <option>Institution of Surveyors Malysia</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                               <input type="date" class="form-control" id="codatepicker" >
                                            </div>
                                            <script type="text/javascript">
                                                          
                                                                    $(document).ready(function() {
                                                                           $("#codatepicker").datepicker("option", "dateFormat", "d-M-yy");
                                                                    $("#codatepicker").datepicker('setDate', new Date());
                                                                    });
                                                                    
                                                               </script>
                                            <div class="col-lg-2">
                                                <input type="text" />
                                            </div>
                                        </div>
                        <div class="row">
                                            <div class="col-lg-6">
                                                <select class="form-control" name="" id="sel1">
                                                    <option>Institution of Surveyors Malysia</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                               <input type="date" class="form-control" id="codatepicker" >
                                            </div>
                                            <script type="text/javascript">
                                                          
                                                                    $(document).ready(function() {
                                                                           $("#codatepicker").datepicker("option", "dateFormat", "d-M-yy");
                                                                    $("#codatepicker").datepicker('setDate', new Date());
                                                                    });
                                                                    
                                                               </script>
                                            <div class="col-lg-2">
                                                <input type="text" />
                                            </div>
                                        </div>
                        <div class="row">
                                            <div class="col-lg-6">
                                                <select class="form-control" name="" id="sel1">
                                                    <option>Institution of Surveyors Malysia</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                               <input type="date" class="form-control" id="codatepicker" >
                                            </div>
                                            <script type="text/javascript">
                                                          
                                                                    $(document).ready(function() {
                                                                           $("#codatepicker").datepicker("option", "dateFormat", "d-M-yy");
                                                                    $("#codatepicker").datepicker('setDate', new Date());
                                                                    });
                                                                    
                                                               </script>
                                            <div class="col-lg-2">
                                                <input type="text" />
                                            </div>
                                        </div>
                        <div class="row">
                                            <div class="col-lg-6">
                                                <select class="form-control" name="" id="sel1">
                                                    <option>Institution of Surveyors Malysia</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                               <input type="date" class="form-control" id="codatepicker" >
                                            </div>
                                            <script type="text/javascript">
                                                          
                                                                    $(document).ready(function() {
                                                                           $("#codatepicker").datepicker("option", "dateFormat", "d-M-yy");
                                                                    $("#codatepicker").datepicker('setDate', new Date());
                                                                    });
                                                                    
                                                               </script>
                                            <div class="col-lg-2">
                                                <input type="text" />
                                            </div>
                                        </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <input type="submit" name="high_first_exam" class="btn btn-primary" value="Save Changes">
                                                        <span></span>
                                                        <input type="reset" class="btn btn-default" value="Cancel">
                                                    </div>

                                                </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Skill
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
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
                                                    <td colspan="3"><hr></td>
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
            </div>
                
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFour">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            Achievement
                        </a>
                    </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                    <div class="panel-body">
                        <form action="process/candidate/eApply/eApply.jsp">
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
                                                CKEDITOR.replace('editor3');</script>
                                </div>
                            </div>
                            <br/>
                            <div class="row">

                                <div class="col-sm-4"></div>
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <input type="submit" name="form_achievement"  value="SAVE" >
                                    </div>
                                </div>
                        </form>
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
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFive">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseThree">
                        Related Document
                    </a>
                </h4>
            </div>
            <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
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
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingSix">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseThree">
                        Job Experience
                    </a>
                </h4>
            </div>
            <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
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
                            <textarea name="editor31" id="editor31" rows="10" cols="80">

                            </textarea>
                            <script>
                                        // Replace the <textarea id="editor1"> with a CKEditor
                                        // instance, using default configuration.
                                        CKEDITOR.replace('editor31');</script>
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
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingSeven">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseThree">
                        Job Apply
                    </a>
                </h4>
            </div>
            <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
                <div class="panel-body">

                    <button type="button" onclick="location.href = 'process.jsp?p=Candidate/E-Apply/e-apply-add.jsp';">Apply Job</button>
                    <br /><br />
                    <jsp:include page="e-apply_job.jsp"></jsp:include>

                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>