<%@page import="controller.Session"%>
<%@page import="libraries.My_func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
    // declaration
    String userid = request.getParameter("userid");
    String pwd = request.getParameter("pwd");

    // sql query and connection to db
    String sql = "SELECT rl.rl_role, l.l_refid "
            + "FROM role rl, login1 l "
            + "WHERE rl.rl_refid = l.rl_refid "
            + "AND l.l_icno = ? "
            + "AND l.l_password = ? "
            + "AND l.l_verification = 'VERIFIED' ";
    String params[] = {userid, pwd};
    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
    
    // sql query and connection to db CHECK THE STAFF
    String sql_staff = "SELECT dm.dm_level, sm.sm_staff_id "
            + "FROM department_main dm, staff_main sm "
            + "WHERE dm.dm_dept_code = sm.sm_dept_code "
            + "AND UPPER(sm.sm_apps_username) = UPPER(?) "
            + "AND sm.sm_apps_passwd = ? ";
    String params_staff[] = {userid, pwd};
    MainClient mc_staff = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data_staff = mc_staff.getQuery(sql_staff, params_staff);
    
//    out.print(data.size()); if(true) {return; }

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
    } else if (data_staff.size() > 0) {
        String dm_level = data_staff.get(0).get(0);
        String sm_staff_id = data_staff.get(0).get(1);
        
        if (dm_level.toUpperCase().equals("2".toUpperCase()) 
                || dm_level.toUpperCase().equals("3".toUpperCase()) 
                || dm_level.toUpperCase().equals("4".toUpperCase()) 
                || dm_level.toUpperCase().equals("5".toUpperCase())) {
            dm_level = "PTJ";
        } else if (dm_level.toUpperCase().equals("1".toUpperCase())) {
            dm_level = "BPSM";
        }
        
        session.setAttribute(Session.KEY_IS_LOGGED_IN, "true");
        session.setAttribute(Session.KEY_USER_ID, sm_staff_id);
        session.setAttribute(Session.KEY_ROLE_ID, dm_level);
        
        if (dm_level.toUpperCase().equals("Administrator".toUpperCase())) {
            response.sendRedirect("../process.jsp?p=Admin/dashboard.jsp");
        } else if (dm_level.toUpperCase().equals("ptj".toUpperCase())) {
            response.sendRedirect("../process.jsp?p=PTJ/e-recruitment-home.jsp");
        } else if (dm_level.toUpperCase().equals("bpsm".toUpperCase())) {
            response.sendRedirect("../process.jsp?p=BPSM/e-recruitment-home.jsp");
        } else if (dm_level.toUpperCase().equals("candidate".toUpperCase())) {
            response.sendRedirect("../process.jsp?p=Candidate/e-recruitment-home.jsp");
        } else {
            response.sendRedirect("../index.jsp?" + My_func.ERROR_KEY + "=Invalid Role!");
        }
    } else {
        response.sendRedirect("../index.jsp?" + My_func.ERROR_KEY + "=Invalid Identification No. / Password!");
    }  
%>