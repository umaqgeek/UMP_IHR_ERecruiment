
<%@page import="java.util.ArrayList"%>
<%@page import="controller.CRUD"%>
<%
  CRUD crud = new CRUD();
  
  ArrayList<String> columns = new ArrayList<String>();
  columns.add("rl_refid");
  columns.add("rl_role");
  
  String table = "role";
  
  String libraries = crud.getLibraries(request);
  String output = crud.getRender(columns, table);
  
  out.print(libraries);
  out.print(output);
%>