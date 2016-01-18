<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="config.Config"%>
<link type="text/css" rel="stylesheet" href="<%=Config.getBase_url(request) %>assets/css1/style.css">
<link href='http://fonts.googleapis.com/css?family=Rokkitt:400,700|Lato:400,300' rel='stylesheet' type='text/css'>
<%
    String c_refid = session.getAttribute("c_refid").toString();//request.getParameter("c_refid"); //"1452347525.949"; 
    String pa_refid = session.getAttribute("pa_refid").toString();
    
    MainClient mc = new MainClient(DBConn.getHost());
    
    String sql = "SELECT C.C_NAME, C.C_ICNO, A.A_ROADNO, A.A_CITY, A.A_POSTCODE, A.A_STATE, A.A_COUNTRY, "
            + "C.C_SEX, C.C_DOB, C.C_AGE, C.C_NATIONALITY, L.L_USERNAME, PA.PA_REFID, C.C_HP, PA.PA_REFID "
            + "FROM CANDIDATE C, ADDRESS A, LOGIN1 L, POS_APPLIED PA, POSITION_PTJ_HR PPH "
            + "WHERE C.C_REFID = A.C_REFID "
            + "AND C.C_REFID = L.C_REFID "
            + "AND C.C_REFID = PA.C_REFID "
            + "AND PPH.PPH_REFID = PA.PPH_REFID "
            + "AND PA.C_REFID = ? "
            + "AND PA.PA_REFID = ? ";
    
    String params[] = { c_refid, pa_refid };
    ArrayList<ArrayList<String>> c_data = mc.getQuery(sql, params);
    String r_address = c_data.get(0).get(2)+", "+c_data.get(0).get(4)+" "+c_data.get(0).get(3)+", "+c_data.get(0).get(5)+", "+c_data.get(0).get(6);
    
    String sql2 = "SELECT R.R_STAFFID "
            + "FROM REGISTRATION R "
            + "WHERE R.PA_REFID = ? ";
    String params2[] = { pa_refid };
    ArrayList<ArrayList<String>> r_data = mc.getQuery(sql2, params2);
%>
<button class="btn btn-default" onclick="location.href = 'process.jsp?p=BPSM/E-Register/e-register.jsp'">Back</button>
<div id="cv" class="instaFade">
    
    <div class="mainDetails">
        <div id="headshot" class="quickFade">
            <!--<img src="headshot.jpg" alt="Alan Smith" />-->
        </div>
        <div class="clear"></div>
    </div>

    <div id="mainArea" class="quickFade delayFive">
        <section>
            <article>
                <div class="sectionTitle">
                    <h1>Pesonal Information</h1>
                </div>

                <div class="sectionContent">
                    <table class="table table-condensed">
                    <%
                    if(r_data.size() > 0)
                    {
                        %>
                        <tr><td>Staff ID</td><td>:</td><td style="color: limegreen; font-weight: bold"><%=r_data.get(0).get(0) %></td></tr>
                        <%
                    }
                    %>
                    <tr><td>Name</td><td>:</td><td><%=c_data.get(0).get(0) %></td></tr>
                    <tr><td>IC</td><td>:</td><td><%=c_data.get(0).get(1) %></td></tr>
                    <tr><td>Address</td><td>:</td><td><%=c_data.get(0).get(2)+",<br>"+c_data.get(0).get(4)+" "+c_data.get(0).get(3)+",<br>"+c_data.get(0).get(5)+",<br>"+c_data.get(0).get(6) %></td></tr>
                    <tr><td>Gender</td><td>:</td><td><%=c_data.get(0).get(7)%></td></tr>
                    <tr><td>Date of birth</td><td>:</td><td><%=c_data.get(0).get(8)%></td></tr>
                    <tr><td>Age</td><td>:</td><td><%=c_data.get(0).get(9)%></td></tr>
                    <tr><td>Nationality</td><td>:</td><td><%=c_data.get(0).get(10)%></td></tr>
                    </table>
                    <p>&nbsp; </p>
                </div>
            </article>
            <div class="clear"></div>
        </section>

        <section>
            <div class="sectionTitle">
                <h1>Academic Information</h1>
            </div>

            <div class="sectionContent">
                <article>
                    <h2>PMR/SRP/LCE/Setaraf</h2>
                    <p class="subDetails">April 2011 - Present</p>
                    <p>&nbsp;</p>
                </article>

                <article>
                    <h2>STPM/STAM/Setaraf</h2>
                    <p class="subDetails">Janruary 2007 - March 2011</p>
                    <p>&nbsp;</p>
                </article>

                <article>
                    <h2>Pengajian Tinggi</h2>
                    <p class="subDetails">October 2004 - December 2006</p>
                    <p>&nbsp;</p>
                </article>
            </div>
            <div class="clear"></div>
        </section>
        <section>
            <div class="sectionTitle">
                <h1>Skills</h1>
            </div>

            <div class="sectionContent">
                <ul class="keySkills">
                    <li>LUKISAN</li>
                    <li>MUSIC</li>
                </ul>
            </div>
            <div class="clear"></div>
        </section>


        <section>
            <div class="sectionTitle">
                <h1>Achivement</h1>
            </div>

            <div class="sectionContent">
                <article>
                    <h2>DEAN LIST </h2>
                    <p class="subDetails">October 2004 - December 2006	</p>
                    <pre data-placeholder="Translation" id="tw-target-text" data-fulltext="" dir="ltr"><span lang="en">Excellent student</span></pre>
                    <p class="subDetails">&nbsp;</p>
                    <p>&nbsp;</p>
                </article>

                <article>
                    <h2><span lang="en">Futsal champion</span></h2>
                    <p class="subDetails">October 2004 - December 2006</p>
                    <p><span lang="en">Futsal champion in university rankings</span></p>
                </article>
            </div>
            <div class="clear"></div>
        </section>

        <section>
            <div class="sectionTitle">
                <h1>Job application</h1>
            </div>

            <div class="sectionContent">
                <article>
                    <h2>&nbsp;</h2>
                    <p>&nbsp;</p>
                </article>

                <article>
                    <h2>&nbsp;</h2>
                </article>
            </div>
            <div class="clear"></div>
        </section>


        <section>
            <div class="sectionTitle">
                <h1>Working Experince</h1>
            </div>

            <div class="sectionContent">
                <article>
                    <h2><strong>Narsco Information Sdn bhd</strong></h2>
                    <p class="subDetails">October 2004 - December 2006				  </p>
                    <ul>
                        <li>Create a banner using Adobe Photoshop</li>
                        <li>Install rack server</li>
                        <li>Repair computer</li>
                        <li>Installations windows 7 and window server 2008</li>
                        <li>Remote Desktop Connection </li>
                        <li>Configuration printer and tally</li>
                    </ul>
                    <p class="subDetails">&nbsp;</p>
                    <p>&nbsp;</p>
                </article>

                <article>
                    <h2>Puncak Niaga Sdn bhd</h2>
                    <p class="subDetails">October 2004 - December 2006</p>
                    <ul>
                        <li>IT Security, Software Testing and Project Management</li>
                        <li>Web Application Development                                                                </li>
                    </ul>
                    <p class="subDetails">&nbsp;</p>
                </article>
            </div>
            <div class="clear"></div>
        </section>


        <section>
            <div class="sectionTitle">
                <!--<h1>
                    <input type="submit" class="btn btn-primary" value="Generate CV &amp; Download" />&nbsp;
                    <input type="submit" class="btn btn-primary" value="Activate" />&nbsp;
                    <input type="submit" class="btn btn-primary" value="Register" onclick="location.href = 'process.jsp?p=BPSM/E-Register/e-registersetup.jsp'" />
                </h1>--><%
                if(r_data.size() > 0)
                {
                    %>
                    <center><h1 style="color: limegreen">Activated</h1></center>
                    <%
                }
                else
                {
                    %>
                    <form method="post" action="process/bpsm/eReg/e_reg_activate_process.jsp">
                    <input type="hidden" value="<%=c_refid %>" name="c_refid" />
                    <input type="hidden" value="<%=pa_refid %>" name="pa_refid" />
                    <input type="hidden" value="<%=c_data.get(0).get(11) %>" name="l_username" />
                    <input type="hidden" value="<%=c_data.get(0).get(12) %>" name="pa_refid" />
                    <input type="hidden" value="<%=c_data.get(0).get(0) %>" name="r_staffname" />
                    <input type="hidden" value="<%=c_data.get(0).get(13) %>" name="r_telno" />
                    <input type="hidden" value="<%=r_address %>" name="r_address" />
                    <table class="table table-condensed" width="100%">
                    <tr>
                        <td width="90%"><input class="col-lg-10" type="text" name="username" placeholder="Username" required /></td>
                    <td width="10%"><input type="submit" class="btn btn-primary" value="Activate" /></td>
                    </tr>
                    </table>
                    </form>
                    <%
                }
                %>
                
            </div>
            <div class="clear"></div>
        </section>


    </div>
</div>
<%
    if(session.getAttribute("wrong_username").equals("error"))
    {
        %>
        <script type="text/javascript">
            alert("Wrong Username");
        </script>
        <%
        session.setAttribute("wrong_username", "");
    }
    
    if(session.getAttribute("activated").equals("activated"))
    {
        %>
        <script type="text/javascript">
            alert("Staff Activated");
        </script>
        <%
        session.setAttribute("activated", "");
    }
%>
<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-3753241-1");
    pageTracker._initData();
    pageTracker._trackPageview();
</script>