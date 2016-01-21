<%@page import="config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.Enumeration"%>

<link rel="stylesheet" href="<%=Config.getBase_url(request) %>assets/css/jquery-ui.css">
<script src="<%=Config.getBase_url(request) %>assets/js/jquery-ui.js"></script>

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
            + "WHERE c_refid =" + c_refid + " AND AT_REFID = 1453324570.621";

    String query_address2 = "SELECT * "
            + "FROM address "
            + "WHERE c_refid =" + c_refid + " AND AT_REFID = 1453324578.698";

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
                                        String pphl = "";
                                        try {
                                            pphl = pph_login.get(0).get(5);
                                        } catch (Exception e) {
                                            pphl = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Password:</label>
                                        <div class="col-lg-6">
                                            <input class="form-control" name="L_Password" type="text" value="<%=(pphl != null && pphl != "" && !pphl.equals("")) ? pphl : ""%>">
                                        </div>
                                    </div>
                                    <%
                                        String pphl6 = "";
                                        try {
                                            pphl6 = pph_login.get(0).get(6);
                                        } catch (Exception e) {
                                            pphl6 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Safe Question</label>
                                        <div class="col-lg-6">
                                            <input class="form-control" name="L_SAFEQUEST" type="text" value="<%=(pphl6 != null && pphl6 != "" && !pphl6.equals("")) ? pphl6 : ""%>">
                                        </div>
                                    </div>

                                    <%
                                        String pphl7 = "";
                                        try {
                                            pphl7 = pph_login.get(0).get(7);
                                        } catch (Exception e) {
                                            pphl7 = "";
                                        }
                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Safe Answer</label>
                                        <div class="col-lg-6">
                                            <input class="form-control" name="L_SAFEANS" type="text" value="<%=(pphl7 != null && pphl7 != "" && !pphl7.equals("")) ? pphl7 : ""%>">
                                        </div>
                                    </div>


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
                                        String query_master = "SELECT LOOKUP_DETAIL.LD_DESC "
                                                + "FROM LOOKUP_DETAIL JOIN "
                                                + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                                + "WHERE LOOKUP_DETAIL.LM_REFID = 1452775307.151";

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
                                                <option value="<%out.print(pph_master.get(i).get(0).toString());%>" selected><%out.print(pph_master.get(i).get(0).toString());%></option>
                                                <%
                                                } else {
                                                %>
                                                <option value="<%out.print(pph_master.get(i).get(0).toString());%>"><%out.print(pph_master.get(i).get(0).toString());%></option>
                                                <%
                                                    }
                                                } else {

                                                    if (i == 0) {
                                                %>
                                                <option value="">Please Select</option>
                                                <%
                                                    }

                                                %>
                                                <option value="<%out.print(pph_master.get(i).get(0).toString());%>"><%out.print(pph_master.get(i).get(0).toString());%></option>
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
                                        String pph2 = "";
                                        try {
                                            pph2 = pph_candidate.get(0).get(2);
                                        } catch (Exception e) {
                                            pph2 = "31-August-1980";
                                        }


                                    %>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Date Of Birth:</label>
                                        <div class="col-lg-6">
                                            <div class='input-group date'>
                                                <input type='text' name="C_DOB" id="datepicker" value="<%=pph2%>" class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>

                                                <script type="text/javascript">
                                                            $(function() {
                                                            var existing_date = "<%=pph2%>";
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
                                                                    $("#datepicker").datepicker('setDate', new Date());
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
                                                + "WHERE LOOKUP_DETAIL.LM_REFID = 1451506908.362";

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
                                                        <input type="radio" checked="checked" name="C_Sex" value="<%out.print(pph_gender.get(i).get(0).toString());%>"/>
                                                        <%out.print(pph_gender.get(i).get(0).toString()); %>
                                                    </label>
                                                    <%
                                                    } else {
                                                    %>
                                                    <label class="radio inline">
                                                        <input type="radio" name="C_Sex" value="<%out.print(pph_gender.get(i).get(0).toString());%>" />
                                                        <%out.print(pph_gender.get(i).get(0).toString()); %>
                                                    </label>
                                                    <%
                                                        }
                                                    } else {
                                                    %>
                                                    <label class="radio inline">
                                                        <input type="radio" name="C_Sex" value="<%out.print(pph_gender.get(i).get(0).toString());%>" />
                                                        <%out.print(pph_gender.get(i).get(0).toString()); %>
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
                                                        + "WHERE LOOKUP_DETAIL.LM_REFID = 1452457867.568";

                                                MainClient mc_religon = new MainClient(DBConn.getHost());
                                                String params_religion[] = {};
                                                ArrayList<ArrayList<String>> pph_religion = mc_religon.getQuery(query_religion, params_religion);

                                            %>
                                            <select name="C_Religion" class="form-control" id="sel1">
                                                <%     for (int i = 0; i < pph_religion.size(); i++) {
                                                        if (pph7 != null && pph7 != "" && !pph7.equals("")) {
                                                            if (pph7.equalsIgnoreCase(pph_religion.get(i).get(0).toString())) {
                                                %>
                                                <option selected value="<%out.print(pph_religion.get(i).get(0).toString());%>"><%out.print(pph_religion.get(i).get(0).toString());%></option>
                                                <%
                                                } else {
                                                %>
                                                <option value="<%out.print(pph_religion.get(i).get(0).toString());%>"><%out.print(pph_religion.get(i).get(0).toString());%></option>
                                                <%
                                                    }
                                                } else {

                                                    if (i == 0) {
                                                %>
                                                <option selected value="">Please Select</option>
                                                <%
                                                    }

                                                %>
                                                <option value="<%out.print(pph_religion.get(i).get(0).toString());%>"><%out.print(pph_religion.get(i).get(0).toString());%></option>
                                                <%
                                                        }

                                                    }
                                                %>
                                            </select> 
                                        </div>
                                    </div>
                                    <%
                                        String query_race = "SELECT LOOKUP_DETAIL.LD_DESC "
                                                + "FROM LOOKUP_DETAIL JOIN "
                                                + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                                + "WHERE LOOKUP_DETAIL.LM_REFID = 1451506916.065";

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
                                                <option selected value="<%out.print(pph_race.get(i).get(0).toString());%>"><%out.print(pph_race.get(i).get(0).toString());%></option>
                                                <%
                                                } else {
                                                %>
                                                <option value="<%out.print(pph_race.get(i).get(0).toString());%>"><%out.print(pph_race.get(i).get(0).toString());%></option>
                                                <%
                                                    }
                                                } else {

                                                    if (i == 0) {
                                                %>
                                                <option selected value="">Please Select</option>
                                                <%
                                                    }

                                                %>
                                                <option value="<%out.print(pph_race.get(i).get(0).toString());%>"><%out.print(pph_race.get(i).get(0).toString());%></option>
                                                <%
                                                        }
                                                    }
                                                %>

                                            </select>
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
                                        });                                    </script>

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
                                    });                                </script>
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
                                    String pphaa4 = "";
                                    try {
                                        pphaa4 = pph_address2.get(0).get(4);
                                    } catch (Exception e) {
                                        pphaa4 = "";
                                    }
                                %>
                                <br/><br/><br/><br/><br/><br/><br/><br/>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Postage Postcode:</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" name="A_Postcode_2" type="text" value="<%=pphaa4%>">
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
                                <br/><br/><br/>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Postage State:</label>
                                    <div class="col-lg-6">
                                        <select class="form-control" name="A_STATE_2" id="sel1">
                                            <%   for (int i = 0; i < pph_master.size(); i++) {
                                                    if (pphaa5 != null && pphaa5 != "" && !pphaa5.equals("")) {
                                                        if (pphaa5.toString().equalsIgnoreCase(pph_master.get(i).get(0).toString())) {
                                            %>
                                            <option value="<%out.print(pph_master.get(i).get(0).toString());%>" selected><%out.print(pph_master.get(i).get(0).toString());%></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%out.print(pph_master.get(i).get(0).toString());%>"><%out.print(pph_master.get(i).get(0).toString());%></option>
                                            <%
                                                }
                                            } else {

                                                if (i == 0) {
                                            %>
                                            <option value="">Please Select</option>
                                            <%
                                                }

                                            %>
                                            <option value="<%out.print(pph_master.get(i).get(0).toString());%>"><%out.print(pph_master.get(i).get(0).toString());%></option>
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
                                <br/><br/>
                                <%
                                    String query_nationality = "SELECT LOOKUP_DETAIL.LD_DESC "
                                            + "FROM LOOKUP_DETAIL JOIN "
                                            + "LOOKUP_MASTER ON LOOKUP_DETAIL.LM_REFID = LOOKUP_MASTER.LM_REFID "
                                            + "WHERE LOOKUP_DETAIL.LM_REFID = 1452458057.875";

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
                                                <input name="C_Nationality" checked="checked" type="radio" value="<%out.print(pph_nationality.get(i).get(0).toString());%>"/>
                                                <%out.print(pph_nationality.get(i).get(0).toString());%>
                                            </label>

                                            <%
                                            } else {
                                            %>
                                            <label class="radio inline">
                                                <input name="C_Nationality" type="radio" value="<%out.print(pph_nationality.get(i).get(0).toString()); %>"/>
                                                <%out.print(pph_nationality.get(i).get(0).toString());%>
                                            </label>
                                            <%
                                                }
                                            } else {
                                            %>
                                            <label class="radio inline">
                                                <input name="C_Nationality" type="radio" value="<%out.print(pph_nationality.get(i).get(0).toString()); %>"/>
                                                <%out.print(pph_nationality.get(i).get(0).toString());%>
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
                                            + "WHERE LOOKUP_DETAIL.LM_REFID = 1452458118.171";

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
                                            <option selected value="<%out.print(pph_marriage.get(i).get(0).toString());%>"><%out.print(pph_marriage.get(i).get(0).toString());%></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%out.print(pph_marriage.get(i).get(0).toString());%>"><%out.print(pph_marriage.get(i).get(0).toString());%></option>
                                            <%
                                                }
                                            } else {

                                                if (i == 0) {
                                            %>
                                            <option value="" selected>Please Select</option>
                                            <%
                                                }

                                            %>
                                            <option value="<%out.print(pph_marriage.get(i).get(0).toString());%>"><%out.print(pph_marriage.get(i).get(0).toString());%></option>
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
                                            + "WHERE LOOKUP_DETAIL.LM_REFID = 1452458173.385";

                                    String query_cvehicle = "SELECT * "
                                            + "FROM DRIVER_LICENSE "
                                            + "WHERE C_REFID = " + c_refid;

                                    MainClient mc_vehicle = new MainClient(DBConn.getHost());
                                    String params_vehicle[] = {};
                                    String params_cvehicle[] = {};
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
                                        license_list = "<select>";
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
                                                            if (pphcv != null && pphcv != "" && !pphcv.equals("")) {
                                                        for (int x = 0; x < pph_cvehicle.size(); x++) {
                                                        %>
                                                        <tr>
                                                            <td>
                                                                <select class="form-control" >
                                                                    <%   for (int i = 0; i < pph_vehicle.size(); i++) {
                                                                            if (pphcv != null && pphcv != "" && !pphcv.equals("")) {
                                                                                if (pphcv.equalsIgnoreCase(pph_vehicle.get(i).get(0).toString())) {
                                                                    %>
                                                                    <option selected value="<%out.print(pph_vehicle.get(i).get(0).toString());%>"><%out.print(pph_vehicle.get(i).get(0).toString());%></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%out.print(pph_vehicle.get(i).get(0).toString());%>"><%out.print(pph_vehicle.get(i).get(0).toString());%></option>
                                                                    <%
                                                                        }
                                                                    } else {
                                                                        if (i == 0) {
                                                                    %>
                                                                    <option value="" selected>Please Select</option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                    <option value="<%out.print(pph_vehicle.get(i).get(0).toString());%>"><%out.print(pph_vehicle.get(i).get(0).toString());%></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </td>
                                                            <td>x</td>
                                                        </tr>
                                                        <%
                                                            }
                                                      
                                                        } else {
                                                        }
                                                    %>
                                                    </tbody>
                                                </table>
                                                <script>
                                                            var tbody2 = $('#tbl_license').children('tbody');
                                                            var table2 = tbody2.length ? tbody2 : $('#tbl_license');
                                                            var row2 = '<tr>' +
                                                            '<td>{{grade}}</td>' +
                                                            '<td>{{action}}</td>' +
                                                            '</tr>';
                                                            $(document).ready(function() {
                                                    $('#add_license').click(function(){
                                                    //Add row
                                                    table2.append(row2.compose({
                                                    'grade': "<%=license_list%>",
                                                            'action': "X"
                                                    }));
                                                    });
                                                    });                                                </script>

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
                                        Are you serving at services of civil / military / local goverment / statutory / police ? :</label>
                                    <div class="col-md-4">
                                        <div class="form-inline">
                                            <div class="controls-row">
                                                <label class="radio inline">
                                                    <input name="C_ServOfficer" type="radio" value="YES"/>
                                                    YES
                                                </label>
                                                <label class="radio inline">
                                                    <input name="C_ServOfficer" type="radio" value="NO"/>
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
                                                        <div class="col-lg-2">
                                                            <label>Year : </label>

                                                        </div>

                                                        <div class="col-lg-3">
                                                            <select name="pmr_tahun" id="pmr_tahun" >
                                                                <script>
                                                                            var i, yr, now = new Date();
                                                                            for (i = 0; i < 30; i++) {
                                                                    yr = now.getFullYear() - i; // or whatever
                                                                            $('#pmr_tahun').append($('<option/>').val(yr).text(yr));
                                                                    };                                                                </script>

                                                            </select>
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
                                                                    <option selected value="<%out.print(pph_type_academic_info.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info.get(i).get(1).toString());%></option>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <option value="<%out.print(pph_type_academic_info.get(i).get(0).toString());%>"><%out.print(pph_type_academic_info.get(i).get(1).toString());%></option>
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
                                                                String test = "<select><option>tes</option></select>";
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
                                                                        var tbody = $('#academic_pmr').children('tbody');
                                                                        var table = tbody.length ? tbody : $('#academic_pmr');
                                                                        var row = '<tr>' +
                                                                        '<td>{{subject}}</td>' +
                                                                        '<td>{{grade}}</td>' +
                                                                        '</tr>';
                                                                        $(document).ready(function() {
                                                                $('#add_pmr').click(function(){
                                                                //Add row
                                                                table.append(row.compose({
                                                                'subject': "<%=test%>",
                                                                        'grade': "<%=test%>"
                                                                }));
                                                                });
                                                                });                                                            </script>

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
                                                                        <td colspan="6"><hr></td>
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
                                                                        <td colspan="6"><hr></td>
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
                                                                <td colspan="6"><hr></td>
                                                                <tr>
                                                                    <td align="right" class="body_fnt1">&nbsp;</td>
                                                                    <td colspan="2" class="body_fnt1"><input type="submit" name="ADD" id="ADD" value="+ ADD"></td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="right">&nbsp;</td>
                                                                    <td align="left">&nbsp;</td>
                                                                </tr>
                                                                <td colspan="6"><hr></td>
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
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="academicheadingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionAcademic" href="#academicCollapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            IPTA/IPTS
                                        </a>
                                    </h4>
                                </div>
                                <div id="academicCollapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="academicheadingThree">
                                    <div class="panel-body">
                                        IPTA/IPTS
                                    </div>
                                </div>
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
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
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

                        <button type="button" onclick="location.href='process.jsp?p=Candidate/E-Apply/e-apply-add.jsp';">Apply Job</button>
                        <br /><br />
                        <jsp:include page="e-apply_job.jsp"></jsp:include>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</div>