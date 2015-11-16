
<%@page import="controller.Controller"%>
<div class="row">
    <% for (int i = 0; i < Controller.dashboardLinks.length; i++) { %>
    <div class="col-md-3" style="height: 100; cursor: pointer;" onclick="location.href='?m=<%=Controller.dashboardLinks[i][1] %>';">
        <center>
            <span class="glyphicon glyphicon-list"> <%=Controller.dashboardLinks[i][0] %></span>
        </center>
    </div>
    <% } %>
</div>
