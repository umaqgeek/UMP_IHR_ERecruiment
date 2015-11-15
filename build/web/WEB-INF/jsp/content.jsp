

<%@page import="controller.Controller"%>
<%
    String pageURL = "Login";
    String pageLink = Controller.getPages(pageURL);
try {
    pageURL = request.getParameter("m");
    pageLink = Controller.getPages(pageURL);
} catch (Exception e) {
}
%>

<div class="row" style="margin-top: 5%;">
    <div class="col-md-10 col-md-offset-1">
        
        <jsp:include page="<%=pageLink %>"></jsp:include>
        
    </div>
</div>