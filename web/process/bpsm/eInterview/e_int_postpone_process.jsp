<%-- 
    Document   : e_int_postpone_process
    Created on : Mar 25, 2016, 3:22:55 AM
    Author     : Habib
--%>

<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String is_refid = request.getParameter("is_refid");
    String is_date = Func.getOracleDate(request.getParameter("is_date"), "yyyy-MM-dd");
    String is_starttime = request.getParameter("is_starttime");
    String is_endtime = request.getParameter("is_endtime");
    String is_venue = request.getParameter("is_venue");
    
    String sql_postpone = "UPDATE interview_setup "
                        + "SET is_date = ? , "
                        + "is_starttime = ? , "
                        + "is_endtime = ? , "
                        + "is_venue = ? "
                        + "WHERE is_refid = ? ";
    String param_postpone[] = { is_date, is_starttime, is_endtime, is_venue, is_refid };
    mc.setQuery(sql_postpone, param_postpone);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp");
%>