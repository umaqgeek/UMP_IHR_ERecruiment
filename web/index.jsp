<%@page import="controller.Controller"%>
<%@page import="libraries.My_func"%>
<%@page import="config.Config"%>
<%
//response.sendRedirect("MOCKUP_06122015.2257/index.html");
%>

<% Controller.setIP("60.54.84.186"); %>

<jsp:include page="WEB-INF/jsp/header.jsp"></jsp:include>
<jsp:include page="WEB-INF/jsp/menu.jsp"></jsp:include>
    
<%
String pageURLTemp = My_func.LOGIN_URL;
String pageURL = pageURLTemp;
try {
    if (session.getAttribute(My_func.SESSION_KEY) != null) {
        pageURL = session.getAttribute(My_func.SESSION_KEY).toString();
    }
} catch (Exception e) {
    pageURL = pageURLTemp;
}
%>

<!-- Main -->
<div id="main">

    <!-- Post -->
    <article id="article" class="post">

        <jsp:include page="<%=pageURL %>"></jsp:include>

    </article>

</div>
    
<jsp:include page="WEB-INF/jsp/footer.jsp"></jsp:include>

