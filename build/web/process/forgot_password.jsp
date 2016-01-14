<%@page import="libraries.My_func"%>
<%@page import="helpers.SendMail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String l_email = request.getParameter("l_email");
String l_safequest = request.getParameter("l_safequest");
String l_safeans = request.getParameter("l_safeans");

String sql1 = "SELECT * "
        + "FROM login l "
        + "WHERE l.l_email = ? ";
String params1[] = { l_email };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d1 = mc1.getQuery(sql1, params1);

String sql11 = "SELECT * "
        + "FROM login l "
        + "WHERE l.l_safequest = ? "
        + "AND l.l_email = ? ";
String param11[] = { l_safequest, l_email };
MainClient mc11 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d11 = mc11.getQuery(sql11, param11);

String sql12 = "SELECT * "
        + "FROM login l "
        + "WHERE l.l_safeans = ? "
        + "AND l.l_email = ? ";
String param12[] = { l_safeans, l_email };
MainClient mc12 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d12 = mc12.getQuery(sql12, param12);

String error = "";

if (d1.size() > 0) { 
    // correct email
    if (d11.size() > 0) {
        // correct email and question
        if (d12.size() > 0) {
            // correct email, question, and answer
            
            String user_id = d1.get(0).get(4);
            String password = d1.get(0).get(5);
            String msg = "Your detail as below:-\n\rUser ID: " + user_id
                    + "\n\rPassword: " + password;

            SendMail.send(l_email, msg);
            
            error = "?" + My_func.SUCCESS_KEY + "=Password has been sent to your e-mail.";
                
        } else {
            // wrong answer
            error = "?" + My_func.ERROR_KEY + "=Wrong answer!";
        }
    } else {
        // wrong question
        error = "?" + My_func.ERROR_KEY + "=Wrong question!";
    }
} else {
    // wrong email
    error = "?" + My_func.ERROR_KEY + "=Invalid e-mail address!";
}

response.sendRedirect("../index.jsp" + error);
%>