<%@page import="controller.Session"%>
<%@page import="libraries.My_func"%>
<%
session.setAttribute(My_func.SESSION_KEY, My_func.LOGIN_URL);
session.setAttribute(Session.KEY_IS_LOGGED_IN, "false");
session.setAttribute(Session.KEY_ROLE_ID, "");
session.setAttribute(Session.KEY_USER_ID, "");

response.sendRedirect("index.jsp");
%>