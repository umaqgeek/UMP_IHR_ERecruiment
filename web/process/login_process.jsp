<%@page import="controller.Session"%>
<%@page import="libraries.My_func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    // declaration
    String userid = request.getParameter("userid");
    String pwd = request.getParameter("pwd");

    // sql query
    String sql = "SELECT rl.rl_role, l.l_refid "
            + "FROM role rl, login l "
            + "WHERE rl.rl_refid = l.rl_refid "
            + "AND l.l_username = ? "
            + "AND l.l_password = ? "
            + "AND l.l_verification = 'VERIFIED' ";
    String params[] = {userid, pwd};

    // connection to db
    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
    out.print(data.size());
    //if(true) {return; }

    if (data.size() > 0) {
        String role = data.get(0).get(0);
        String l_refid = data.get(0).get(1);
        
        session.setAttribute(Session.KEY_IS_LOGGED_IN, "true");
        session.setAttribute(Session.KEY_USER_ID, l_refid);
        session.setAttribute(Session.KEY_ROLE_ID, role);
        
        if (role.toUpperCase().equals("Administrator".toUpperCase())) {
            response.sendRedirect("../process.jsp?p=Admin/dashboard.jsp");
        } else if (role.toUpperCase().equals("ptj".toUpperCase())) {
            response.sendRedirect("../process.jsp?p=PTJ/e-recruitment-home.jsp");
        } else if (role.toUpperCase().equals("bpsm".toUpperCase())) {
            response.sendRedirect("../process.jsp?p=BPSM/e-recruitment-home.jsp");
        } else if (role.toUpperCase().equals("candidate".toUpperCase())) {
            response.sendRedirect("../process.jsp?p=Candidate/e-recruitment-home.jsp");
        } else {
            response.sendRedirect("../index.jsp?" + My_func.ERROR_KEY + "=Invalid Role!");
        }
    } else {
        response.sendRedirect("../index.jsp?" + My_func.ERROR_KEY + "=Invalid Identification No. / Password!");
    }  
%>