<%
    response.sendRedirect("MOCKUP_06122015.2257/index.html");
    %>

<jsp:include page="WEB-INF/jsp/header.jsp"></jsp:include>
    
<%
String pageURL = "WEB-INF/jsp/index.jsp";
try {
    if (request.getParameter("p") != null) {
        pageURL = "WEB-INF/jsp/"+request.getParameter("p");
    }
} catch (Exception e) {
    pageURL = "WEB-INF/jsp/index.jsp";
}
%>
<jsp:include page="<%=pageURL %>"></jsp:include>
    
    
<jsp:include page="WEB-INF/jsp/footer.jsp"></jsp:include>

