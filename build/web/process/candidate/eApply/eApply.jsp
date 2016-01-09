<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.Enumeration"%>
<%
Enumeration en = request.getParameterNames();
while (en.hasMoreElements()) {
    Object objOri = en.nextElement();
    String param = (String) objOri;
    String value = request.getParameter(param);
    
    out.print(param+" | "+value+"<br />");
}

String params_req[][] = {
    {"g_grade", request.getParameter("g_grade")},
    {"g_spm_bm", request.getParameter("g_spm_bm")},
    {"g_spm_bi", request.getParameter("g_spm_bi")},
    {"g_cgpa", request.getParameter("g_cgpa")},
    {"g_muet", request.getParameter("g_muet")}
};



response.sendRedirect("../../../process.jsp?p=BPSM/E-Setup/e-setup.jsp");
%>