<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="config.Config"%>

<%
    String c_refid = session.getAttribute("c").toString();

    String sql = "SELECT * "
            + "FROM candidate c, login1 l "
            + "WHERE c.c_refid = l.c_refid "
            + "AND c.c_refid = ? ";
    String param[] = {c_refid};
    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> d = mc.getQuery(sql, param);
%>

<link type="text/css" rel="stylesheet" href="<%=Config.getBase_url(request)%>assets/css1/style.css">
<link href='<%=Config.getBase_url(request)%>assets/fonts/font.css?family=Rokkitt:400,700|Lato:400,300' rel='stylesheet' type='text/css'>

<!--<div id="cv" class="instaFade">-->
    <div class="mainDetails">
        <div id="headshot" class="quickFade">
            <img src="#" alt="Profile Image" height="200px" width="200px" class="img-polaroid" />
        </div>
        <div class="clear"></div>
    </div>

<style>
    #mainArea {
        background-color: #fff;
    }
</style>

    <div id="mainArea" class="quickFade delayOne">
        <section>
            <article>
                <div class="sectionTitle">
                    <h1>Personal Information</h1>
                </div>

                <div class="sectionContent">

                    <p>Name: <%=d.get(0).get(1)%></p>
                    <p>IC : <%=d.get(0).get(28)%></p>
                    <p>Address: -</p>
                    <p>Gender : <%=d.get(0).get(5)%></p>
                    <p>Date of birth: <%=Func.getDate(d.get(0).get(2))%></p>
                    <p>Age: -</p>
                    <p>Nationality: <%=d.get(0).get(8)%></p>
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
                <h1>

                    <input type="button" class="styled-button-1" value="Close" />

                </h1>

            </div>
            <div class="clear"></div>
        </section>


    </div>
</div>
<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-3753241-1");
    pageTracker._initData();
    pageTracker._trackPageview();
</script>