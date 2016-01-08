<%@page import="java.util.Enumeration"%>
<%@page import="controller.Session"%>
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
session.setAttribute(Session.SESSION_KEY, pageURL);

Enumeration en = request.getParameterNames();
while (en.hasMoreElements()) {
    Object objOri = en.nextElement();
    String param = (String) objOri;
    String value = request.getParameter(param);
    if (!My_func.URL_KEY.toUpperCase().equals(param.toUpperCase())) {
        session.setAttribute(param, value);
    }
}
            

response.sendRedirect("index.jsp");
%>