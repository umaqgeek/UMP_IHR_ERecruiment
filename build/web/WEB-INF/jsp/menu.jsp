<%@page import="libraries.My_func"%>
<!-- Header -->
            <header id="header">
                <h1><a href="#">UMP IMS E-Recruitment</a></h1>
<!--                <nav class="links">
                    <ul>
                        <li><a href="#">Home</a></li>
                    </ul>
                </nav>-->
                <nav class="main">
                    <ul>
                        <li class="search">
                            <a class="fa-search" href="#search">Search</a>
                            <form id="search" method="get" action="#">
                                <input type="text" name="query" placeholder="Search" />
                            </form>
                        </li>
                        <li class="menu">
                            <a class="fa-bars" href="#menu">Menu</a>
                        </li>
                    </ul>
                </nav>
            </header>

            <!-- Right Menu -->
            <section id="menu">

                <% 
                String sessPage = My_func.LOGIN_URL;
                try {
                    sessPage = session.getAttribute(My_func.SESSION_KEY).toString();
                } catch (Exception e) {
                    sessPage = "";
                }
                if (!sessPage.equals(My_func.LOGIN_URL)) { 
                %>
                <!-- Links -->
                <section>
                    <ul class="links">
                        <li>
                            <a href="#">
                                <h3>Link 1</h3>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <h3>Link 2</h3>
                            </a>
                        </li>
                    </ul>
                </section>

                <!-- Actions -->
                <section>
                    <ul class="actions vertical">
                        <li><a href="logout.jsp" class="button big fit">Log Out</a></li>
                    </ul>
                </section>
                <% } %>

            </section>