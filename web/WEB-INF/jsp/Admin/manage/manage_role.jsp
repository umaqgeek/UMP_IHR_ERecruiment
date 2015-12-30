<%@page import="controller.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.CRUD"%>
<%
    CRUD crud = new CRUD();

    ArrayList<String> columns = new ArrayList<String>();
    columns.add("rl_refid");
    columns.add("rl_role");

    String table = "role";

    String libraries = crud.getLibraries(request);
    String add = crud.addData(columns, table);
    String output = crud.listTable(columns, table);

    out.print(libraries);
    out.print(add);
    out.print(output);
%>