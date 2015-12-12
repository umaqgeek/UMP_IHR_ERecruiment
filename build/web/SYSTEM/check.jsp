
<%
  String userid = request.getParameter("userid");
  
  if (userid.equals("ptj")) {
      response.sendRedirect("PTJ/e-recruitment-home.html.jsp");
  } else if (userid.equals("bpsm")) {
      response.sendRedirect("BPSM/e-recruitment-home.html.jsp");
  } else if (userid.equals("cand")) {
      response.sendRedirect("Candidate/e-recruitment-home.html.jsp");
  } else {
      response.sendRedirect("index.html.jsp?invalid=1");
  }
%>