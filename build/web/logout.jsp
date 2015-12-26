<%@page import="libraries.My_func"%>
<%
session.setAttribute(My_func.SESSION_KEY, My_func.LOGIN_URL);

response.sendRedirect("index.jsp");
%>