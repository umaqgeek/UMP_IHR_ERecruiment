<%@page import="java.util.ArrayList"%>
<%@page import="eRegister.StaffActivation"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    StaffActivation reg = new StaffActivation();
    
    String l_icno = request.getParameter("l_icno");
    String pa_refid = request.getParameter("pa_refid");
    String r_staffname = request.getParameter("r_staffname");
    String r_telno = request.getParameter("r_telno");
    String r_address = request.getParameter("r_address");

    String params1[] = {};
    String sql1 = "SELECT R.R_STAFFID "
            + "FROM REGISTRATION R";
    ArrayList<ArrayList<String>> data1 = mc.getQuery(sql1, params1);

    String s_newStaffId = "";
    String stmp_staffId = "";
    int i_staffIdArray[] = new int[data1.size()];
    int i_latestStaffId = 1000;
    int i_newStaffId = 0;

    if(data1.size() > 0)
    {
        for(int rows = 0; rows < data1.size(); rows++)
        {
            stmp_staffId = data1.get(rows).get(0);
            i_staffIdArray[rows] = Integer.parseInt(stmp_staffId);
        }
        i_latestStaffId = reg.findMaxStaffId(i_staffIdArray);
    }
    i_newStaffId = i_latestStaffId + 1 ;

    s_newStaffId = Integer.toString(i_newStaffId);

    String params2[] = { pa_refid, s_newStaffId, r_staffname, r_telno, r_address };
    String sql2 = "INSERT INTO REGISTRATION(PA_REFID, R_STAFFID, R_STAFFNAME, R_TELNO, R_ADDRESS) "
            + "VALUES( ? , ? , ? , ? , ?)";

    mc.setQuery(sql2, params2);
    
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Register/e-register.jsp");
%>