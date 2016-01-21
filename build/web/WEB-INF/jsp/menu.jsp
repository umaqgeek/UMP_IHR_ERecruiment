<%@page import="controller.Login"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.Controller"%>
<%@page import="controller.Session"%>
<%@page import="config.Config"%>
<%@page import="libraries.My_func"%>
<!-- Header -->
<header id="header" style="height:6.5em;padding:0px;">
  
	<nav class="main">
        <ul>
			
			<li class="search">
			  <a class="fa-bars sb-toggle-left" >Menu</a>


			 </li>
			 
			 
            <li>
			</li>
        </ul>
    </nav>
	<div  style="color:white;"class="sb-slidebar sb-left">
			<!-- Your left Slidebar content. -->
			
			
			
        <ul>
            <li>
                <a href="process.jsp?p=login.jsp">
                    <h3>Log In</h3>
                </a>
            </li>
            <li>
                <a href="process.jsp?p=registration.jsp">
                    <h3>Registration</h3>
                </a>
            </li>
        </ul>
		
		<button type="button" style="color:white;" class="sb-toggle-left">Close Menu</button>
    
	</div>
	
	
    <h1 >
        <img src="<%=Config.getBase_url(request) %>assets/img/ump-logo.png" />
        <a href="process.jsp?p=login.jsp">UMP IMS E-Recruitment</a>
    </h1>
    <!--                <nav class="links">
                        <ul>
                            <li><a href="#">Home</a></li>
                        </ul>
                    </nav>-->
	<!---<nav class="main">
        <ul>
			<li class="menu">
                <a class="fa-bars" href="#menu">Menu</a>
            </li>
			 <li class="search">
                <a class="fa-search" href="#search">Search</a>
                <form id="search" method="get" action="#">
                    <input type="text" name="query" placeholder="Search" />
                </form>
            </li>
            <li>
			</li>
        </ul>
    </nav>--->
	
	<nav class="main">
        <ul>
			 <li class="search">
                <a class="fa-search" href="#search">Search</a>
                <form id="search" method="get" action="#">
                    <input type="text" name="query" placeholder="Search" />
                </form>
            </li>
            <li>
			</li>
        </ul>
    </nav>
	
    
</header>

<!-- Right Menu -->
<section id="menu">

    <%
        String sessPage = My_func.LOGIN_URL;
        try {
            sessPage = session.getAttribute(Session.SESSION_KEY).toString();
        } catch (Exception e) {
            sessPage = "";
        }
//        if (!sessPage.equals(My_func.LOGIN_URL)) {
        String isLoggedIn = "false";
        try {
            isLoggedIn = session.getAttribute(Session.KEY_IS_LOGGED_IN).toString();
        } catch (Exception e) {
            isLoggedIn = "false";
        }
        if (isLoggedIn.equals("false")) {
    %>
    <!-- Links -->
    <section>
        <ul class="links">
            <li>
                <a href="process.jsp?p=login.jsp">
                    <h3>Log In</h3>
                </a>
            </li>
            <li>
                <a href="process.jsp?p=registration.jsp">
                    <h3>Registration</h3>
                </a>
            </li>
        </ul>
    </section>

    <!-- Actions -->
<!--    <section>
        <ul class="actions vertical">
            <li><a href="logout.jsp" class="button big fit">Log Out</a></li>
        </ul>
    </section>-->
    <% } else { 
    
            Login login = new Login();
            String role = "-";
            try {
                role = session.getAttribute(Session.KEY_ROLE_ID).toString();
            } catch (Exception e) {
            }
            ArrayList<ArrayList<String>> menus = login.menuList(role);
    %>
    
    <section>
        <ul class="links">
            <% for (int i = 0; i < menus.size(); i++) { %>
            <li>
                <a href="process.jsp?p=<%=menus.get(i).get(1) %>">
                    <h3><%=menus.get(i).get(0) %></h3>
                </a>
            </li>
            <% } %>
        </ul>
    </section>
    
    <section>
        <ul class="actions vertical">
            <li><a href="logout.jsp" class="button big fit">Log Out</a></li>
        </ul>
    </section>
    
    <% } %>

</section>