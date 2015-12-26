<%@page import="libraries.My_func"%>
<%
String pageURLTemp = My_func.LOGIN_URL;
String pageURL = pageURLTemp;
try {
    if (request.getParameter(My_func.URL_KEY) != null) {
        pageURL = "WEB-INF/jsp/"+request.getParameter(My_func.URL_KEY);
    }
} catch (Exception e) {
    pageURL = pageURLTemp;
}
session.setAttribute(My_func.SESSION_KEY, pageURL);

response.sendRedirect("index.jsp");
%>