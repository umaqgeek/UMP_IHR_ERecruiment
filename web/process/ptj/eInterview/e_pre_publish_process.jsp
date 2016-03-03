<%-- 
    Document   : e_pre_publish_process
    Created on : Feb 28, 2016, 2:27:31 PM
    Author     : Habib
--%>

<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String sent = "21";
    String canceled = "24";
    String accepted = "22";
    String rejected = "23";
    String published = "41";
    String is_refid = request.getParameter("is_refid");
    
    String sql_pre_publish = "UPDATE interview_setup "
                            + "SET is_status = ? "
                            + "WHERE is_refid = ? ";
    String param_pre_publish[] = { published, is_refid };
    String res = mc.setQuery(sql_pre_publish, param_pre_publish);
//    out.print(res);
//    if(true)
//    {
//        return;
//    }
    response.sendRedirect("../../../process.jsp?p=PTJ/E-Interview/e_pre_published_list.jsp");
%>
