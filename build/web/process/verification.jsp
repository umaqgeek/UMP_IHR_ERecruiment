<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="libraries.My_func"%>
<%
    String urlParam = "";
    String l_refid = "0";
    try {
        l_refid = request.getParameter("l_refid");
    } catch (Exception e) {
        urlParam = "?" + My_func.ERROR_KEY + "=Invalid Key!";
        response.sendRedirect("index.jsp" + urlParam);
    }
    
//    out.print(l_refid);
//    if (true) { return; }

    String sql1 = "UPDATE login1 "
            + "SET l_verification = ? "
            + "WHERE l_refid = ? ";
    String params1[] = {"VERIFIED", l_refid};
    MainClient mc1 = new MainClient(DBConn.getHost());
    String status = mc1.setQuery(sql1, params1);
//    String data1[][] = {
//        {"l_verification", "VERIFIED"}
//    };
//    String update1[][] = {
//        {"l_refid", l_refid}
//    };
//    String status = mc.update("login1", data1, update1);

    System.out.println("status:" + status);
    System.out.println("asdasd:" + status.equals("0"));
    if (status.equals("0")) {
        urlParam = "?" + My_func.SUCCESS_KEY + "=Your account has been verified.";
    } else {
        urlParam = "?" + My_func.ERROR_KEY + "=Your account cannot be verified!";
    }
    response.sendRedirect("../index.jsp" + urlParam);  
%>