<%@page import="libraries.My_func"%>
<%@page import="helpers.SendMail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String l_email = request.getParameter("l_email");

String sql1 = "SELECT * "
        + "FROM login l "
        + "WHERE l.l_email = ? ";
String params1[] = {l_email};

MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d1 = mc1.getQuery(sql1, params1);

String error = "";
if (d1.size() > 0) {
    
    String user_id = d1.get(0).get(4);
    String password = d1.get(0).get(5);
    String msg = "Your detail as below:-\n\rUser ID: " + user_id + 
            "\n\rPassword: " + password;
    
    SendMail.send(l_email, msg);
    
    error = "?"+My_func.SUCCESS_KEY+"=Password has been sent to your e-mail.";
} else {
    error = "?"+My_func.ERROR_KEY+"=Invalid e-mail address!";
}

response.sendRedirect("../index.jsp" + error);
%>