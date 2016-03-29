<%@page import="libraries.My_func"%>
<%
String pphs[] = request.getParameterValues("pph");
try {
    out.print(pphs.length);
} catch (Exception e) {
    response.sendRedirect("../../../index.jsp?"+My_func.ERROR_KEY+"=Please select at least one job!");
    return;
}

String str_pph = "";

for (int i = 0; i < pphs.length; i++) {
    out.print(pphs[i]+"<br />");
    
    str_pph += pphs[i]+"|";
}

session.setAttribute("pphsx", str_pph);

response.sendRedirect("../../../process.jsp?"+My_func.URL_KEY+"=Candidate/E-Apply/e-apply-confirmation.jsp");
%>