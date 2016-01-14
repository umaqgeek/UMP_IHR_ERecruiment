<%@page import="libraries.My_func"%>
<%@page import="helpers.SendMail"%>
<%@page import="config.Config"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
// get variables from the form.
    String c_icno = request.getParameter("c_icno");
    String c_name = request.getParameter("c_name");
    String l_email = request.getParameter("l_email");
    String l_username = request.getParameter("l_username");
    String l_password = request.getParameter("l_password");
    String l_password2 = request.getParameter("l_password2");
    String l_safequest = request.getParameter("l_safequest");
    String l_safeans = request.getParameter("l_safeans");
    
    if (!l_password.equals(l_password2)) {
        String error = "Mismatch with confirmation password!";
        response.sendRedirect("../index.jsp?"+My_func.ERROR_KEY+"="+error);
        return;
    }

    // open connection.
    MainClient mc = new MainClient(DBConn.getHost());

    // execute query 1.
//    String data1[][] = {
//        {"c_icno", c_icno},
//        {"c_name", c_name}
//    };
    String sql1 = "INSERT INTO candidate(c_icno, c_name) VALUES(?, ?) ";
    String params1[] = {c_icno, c_name};
//    String c_refid = mc.add("candidate", data1, "c_refid");
    String c_refid = mc.setQuery(sql1, params1, "c_refid");
    
//    out.print("c_refid:"+c_refid);
//    if (true) { return; }

    // open another connection.
    MainClient mc2 = new MainClient(DBConn.getHost());

    // execute query 2. If only query 1 was succeed.
    String l_refid = "0";
    if (c_refid != "-1" && c_refid != "0") {
        // 1450630515.382 -> role reference id of candidate.
        String data2[][] = {
            {"rl_refid", "1450630515.382"},
            {"c_refid", c_refid},
            {"l_username", l_username},
            {"l_password", l_password},
            {"l_safequest", l_safequest},
            {"l_safeans", l_safeans},
            {"l_email", l_email},
            {"l_verification", "UNVERIFIED"}
        };
        String sql2 = "INSERT INTO login(";
        String q2 = "";
        for (int i = 0; i < data2.length-1; i++) {
            sql2 += data2[i][0] + ", ";
            q2 += "?, ";
        }
        if (data2.length > 0) {
            sql2 += data2[data2.length-1][0];
            q2 += "?";
        }
        sql2 += ") VALUES(" + q2 + ") ";
        String params2[] = new String[data2.length];
        for (int i = 0; i < data2.length; i++) {
            params2[i] = data2[i][1];
        }
        
//        out.print(sql2+"<br />");
//        out.print(q2+"<br />");
//        for (int i = 0; i < params2.length; i++) {
//            out.print(params2[i]+"<br />");
//        }
//        if (true) { return; }
        
//        l_refid = mc2.add("login", data2, "l_refid");
        l_refid = mc2.setQuery(sql2, params2, "l_refid");
    }

    String urlParam = "";

    // send emel if success.
    if (l_refid != "-1" && l_refid != "0") {
        String link = Config.getBase_url(request) + "process/verification.jsp?l_refid=" + l_refid;
        SendMail.send(l_email, "Click this link to verify your account: \n\r<a href=\"" + link + "\">Verify Account</a>");

        urlParam = "?" + My_func.SUCCESS_KEY + "=Your account has been registered.";

    } else {

        urlParam = "?" + My_func.ERROR_KEY + "=Your account cannot be registered!";
    }

    // redirect to login page.
    response.sendRedirect("../index.jsp" + urlParam);
%>