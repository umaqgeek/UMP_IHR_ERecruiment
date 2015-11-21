

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
    <div class="col-md-12 col-md-offset-0">
        
        <jsp:include page="<%=pageLink %>"></jsp:include>
        
    </div>
</div>