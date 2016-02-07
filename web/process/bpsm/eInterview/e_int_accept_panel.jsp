<%-- 
    Document   : e_int_accept_panel
    Created on : Feb 4, 2016, 1:29:49 AM
    Author     : Habib
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
//    MainClient mc = new MainClient(DBConn.getHost());
//    String data_null = "null";
//    String u_refid = request.getParameter("u_refid");
//    String ic_refid = request.getParameter("ic_refid");
//    String accepted = "ACCEPTED";
//    
//    String sql_ial_refid = "SELECT IC.IC_REFID, IAL.U_REFID, IAL.IAL_REFID "
//                    +"FROM INTERVIEW_CHAIRMAN IC, LOGIN1 L, USERS1 U, INTERVIEW_PANELS IP, INTERVIEW_RESULT IR, INTERVIEW_ASSIGN_LIST IAL "
//                    +"WHERE U.U_REFID = IAL.U_REFID "
//                    +"AND IP.IP_REFID = IAL.IP_REFID "
//                    +"AND IR.IR_REFID = IP.IR_REFID "
//                    +"AND IC.IC_REFID = IR.IC_REFID "
//                    +"AND IAL.IP_REFID != ? "
//                    +"AND IAL.U_REFID = ? "
//                    +"AND IC.IC_REFID = ? "
//                    +"GROUP BY IC.IC_REFID, IAL.U_REFID,  IAL.IAL_REFID";
//    String param_ial_refid[] = { data_null, u_refid, ic_refid };
//    ArrayList<ArrayList<String>> data_ial_refid = mc.getQuery(sql_ial_refid, param_ial_refid);
//    
//    String sql_accept = "UPDATE INTERVIEW_ASSIGN_LIST "
//                    + "SET IAL_STATUS = ? "
//                    + "WHERE IAL_REFID = ? ";
//    String[] param_accept = new String[2];
//    
//    for(int a = 0; a < data_ial_refid.size(); a++)
//    {
//        param_accept[0] = accepted;
//        param_accept[1] = data_ial_refid.get(a).get(2);
//        mc.setQuery(sql_accept, param_accept);
//    }
    response.sendRedirect("../../../process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp");
%>
