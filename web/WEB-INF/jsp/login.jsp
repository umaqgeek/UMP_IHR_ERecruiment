<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="config.Config"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    MainClient mc_insert = new MainClient(DBConn.getHost());
    MainClient mc_update = new MainClient(DBConn.getHost());
    
    String  insertsql = "INSERT INTO pos_applied (pa_status, c_refid, pph_refid, pa_dateapplied) "
    + "VALUES( ? , ? , ? , ? )";
    
    String  insertsql2 = "INSERT INTO filter (pa_refid, f_system, f_ptj, f_bpsm, f_intvptj, f_intuni, f_status) "
    + "VALUES( ? , ? , ? , ? , ? , ? , ?)";
    
    String  insertsql3 = "INSERT INTO filter (pa_refid, f_system, f_ptj, f_bpsm, f_intvptj, f_intuni, f_status) "
    + "VALUES( ? , ? , ? , ? , ? , ? , ?)";
    
    String updatesql = "UPDATE filter "
            + "SET f_status = ? "
            + "WHERE f_refid = ? ";
    
    String updatesql2 = "UPDATE pos_applied "
            + "SET pa_status = ? "
            + "WHERE pa_refid = ? ";
    
    String f_statpass = "PASS ALL";
    String statpending = "OFFER PENDING";
    String c_refid = "1453286017.945";
    String pph_refid = "1452820534.809";
    String pa_refid = "1453286372.597";
    String f_refid = "1453286918.456";
    
    String pa_dateapplied = Func.getOracleDate(Func.getTodayDate3(), "yyyy-MM-dd"); //dd-MM-yyyy
    String datetoday = Func.getOracleDate(Func.getTodayDate3(), "yyyy-MM-dd");
    
    String insertparam[] = { statpending, c_refid, pph_refid, pa_dateapplied };
    String insertparam2[] = { pa_refid, datetoday, datetoday, datetoday, datetoday, datetoday, f_statpass };
    
    String updateparam[] = { f_statpass, f_refid };
    String updateparam2[] = { statpending, pa_refid };
    
    //String mcs = mc_insert.setQuery(insertsql, insertparam);
    //String mcs = mc_insert.setQuery(insertsql2, insertparam2);
    
    //String mcs = mc_update.setQuery(updatesql2, updateparam2);
    //String mcs = mc_update.setQuery(updatesql, updateparam);
    
    //out.print(mcs);
    
    String params[] ={ };
    String sql ="SELECT l.l_refid, l.l_username "
                    + "FROM login1 l";
    
    String sql1 ="SELECT c.c_refid, c.c_name, c.c_dob, c.c_age, c.c_birthstate "
                    + "FROM candidate c";
    
    String sql2 ="SELECT pph.pph_refid, pph.pph_position "
            + "FROM position_ptj_hr pph "
            + "WHERE pph.pph_status = ? ";
    
    String sql3 ="SELECT pa.pa_refid, pa.pa_status "
            + "FROM pos_applied pa";
    
    String sql4 ="SELECT f.f_refid, f.f_status "
            + "FROM filter f ";
    
    ArrayList<ArrayList<String>> data = mc.getQuery(sql1, params); 
    out.print(data);
    
    if(data.size() >0)
    {
        %>
        <%//="refid - name - dob - age - birthstate" %> <br>
        <%
        for(int a=0; a < data.size(); a++)
        {
            %>
            <%//=data.get(a).get(0)+" - "+data.get(a).get(1)+" - "+data.get(a).get(2)+" - "+data.get(a).get(3)+" - "+data.get(a).get(4) %>
            <% //data.get(a).get(0)+" - "+data.get(a).get(1) %>
            <%//=data.get(a).get(0)+" - "+data.get(a).get(1) %>
            <%//=data.get(a).get(0) %><br>
            <%
        }
    }
%>
<div style=" width:85%" class="container" >

<div>
    <form  class="form-signin" action="process/login_process.jsp" method="post">
        <h2 class="form-signin-heading">e-Recruitment</h2>
        <label for="id" class="sr-only">IC / Passport No.</label>
        <input  type="text" id="userid" name='userid' class="form-control" placeholder="IC / Passport No." >
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="pwd" name='pwd' class="form-control" placeholder="Password">
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <a style="float:justify;" href="#!" data-toggle="modal" data-target="#myModal">New Registration</a>&nbsp;&nbsp;
        <a style="float:right;" href="#!" data-toggle="modal" data-target="#myModal2">Forgot Password?</a>
    </form>

</div>

</div> <!-- /container -->


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->

        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="process/registration.jsp">
                <div class="modal-header">
                    <h4 class="modal-title">New Registration</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <legend>Personal Information:</legend>
                        <label for="id">My IC No. / Passport No.</label>
                        <input type="text" id="c_icno" name="l_icno" class="form-control" placeholder="Example: 891031065223">
                        <label for="name">Name</label>
                        <input type="text" id="c_name" name="c_name" class="form-control" placeholder="Full name as in IC / Passport No." >
                        <label for="phoneEmail">E-Mail Address</label>
                        <input type="text" id="l_email" name="l_email" class="form-control" placeholder="E-Mail Address. Example: umar_mukhtar@gmail.com" >
<!--                        <label for="inputUsername" >Username</label>
                        <input type="text" id="l_username" name="l_username" class="form-control" placeholder="Username" >-->
                        <label for="inputPassword">Password</label>
                        <input type="password" id="l_password" name="l_password" class="form-control" placeholder="Password">
                        <label for="inputPassword2">Password Confirmation</label>
                        <input type="password" id="l_password2" name="l_password2" class="form-control" placeholder="Password Confirmation">
                    </fieldset>
                    <fieldset>
                        <legend>Security Question:</legend>
                        <div class="form-group">
                            <select class="form-control" id="l_safequest" name="l_safequest">
                                <option>What is your mother name?</option>
                                <option>What is your first cat name?</option>
                                <option>Where is your first school?</option>
                                <option>What color is your first bike?</option>
                            </select>
                        </div>
                        <label for="answer">Answer</label>
                        <input type="text" id="l_safeans" name="l_safeans" class="form-control" placeholder="Answer" >
                    </fieldset>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Register</button>
                </div>

            </form>
        </div>

    </div>
</div>

<!-- Modal -->
<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->

        <div class="modal-content">
            <!--<form method="post" action="Register">-->
            <form method="post" action="process/forgot_password.jsp">
                <div class="modal-header">
                    <h4 class="modal-title">Forgot Password</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <legend>Your E-Mail Address:</legend>
                        <label for="id">E-Mail</label>
                        <input type="text" id="l_email" name="l_email" class="form-control" placeholder="E-Mail address. Example: umaqgeek@gmail.com">
                    </fieldset>
                    <fieldset>
                        <legend>Security Question:</legend>
                        <div class="form-group">
                            <select class="form-control" id="l_safequest" name="l_safequest">
                                <option>What is your mother name?</option>
                                <option>What is your first cat name?</option>
                                <option>Where is your first school?</option>
                                <option>What color is your first bike?</option>
                            </select>
                        </div>
                        <label for="answer">Answer</label>
                        <input type="text" id="l_safeans" name="l_safeans" class="form-control" placeholder="Answer" >
                    </fieldset>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>

            </form>
        </div>

    </div>
</div>