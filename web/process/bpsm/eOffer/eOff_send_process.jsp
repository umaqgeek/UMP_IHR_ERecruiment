<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String pa_refid = request.getParameter("pa_refid");
    String pa_status_sent = "OFFER_SENT";
    
    String sql_pa_update = "UPDATE POS_APPLIED "
            + "SET PA_STATUS = ? "
            + "WHERE PA_REFID = ? ";
    String param_pa_update[] = { pa_status_sent, pa_refid };
    String result = mc.setQuery(sql_pa_update, param_pa_update);
    
    if(result.equals("0"))
    {
        %>
        <script type="text/javascript">
            alert("Offer Sent");
        </script>
        <%
    }
    else
    {
        %>
        <script type="text/javascript">
            alert("Sending Failed");
        </script>
        <%
    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Offer/off_bpsm_list.jsp");
%>