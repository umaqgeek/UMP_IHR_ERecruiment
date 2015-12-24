<%@page import="libraries.My_func"%>
<%
String pageURLTemp = "WEB-INF/jsp/index.jsp";
String pageURL = pageURLTemp;
try {
    if (request.getParameter(My_func.URL_KEY) != null) {
        pageURL = "WEB-INF/jsp/"+request.getParameter(My_func.URL_KEY);
    }
} catch (Exception e) {
    pageURL = pageURLTemp;
}
session.setAttribute(My_func.PAGE_KEY, pageURL);

response.sendRedirect("index.jsp");
%>