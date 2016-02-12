<%@page import="libraries.My_func"%>
<%
String pphs[] = request.getParameterValues("pph");
try {
    out.print(pphs.length);
} catch (Exception e) {
    response.sendRedirect("../../../index.jsp?"+My_func.ERROR_KEY+"=Please select at least one job!");
    return;
}
for (int i = 0; i < pphs.length; i++) {
    out.print(pphs[i]+"<br />");
}
if (true) { return; }
%>