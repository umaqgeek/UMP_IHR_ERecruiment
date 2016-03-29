<%-- 
    Document   : e_int_publish_process
    Created on : Feb 6, 2016, 11:54:46 AM
    Author     : Habib
--%>

<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    
    String is_refid = request.getParameter("is_refid");
    
    String canceled = "24";
    String accepted = "22";
    String rejected = "23";
    String published = "41";
    
    String sql_publish = "UPDATE interview_setup "
                    + "SET is_status = ? "
                    + "WHERE is_refid = ? ";
    String param_publish[] = { published, is_refid };
    String res = mc.setQuery(sql_publish, param_publish);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_published_list.jsp");
%>