<%@page import="controller.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.CRUD"%>
<%
    CRUD crud = new CRUD();

    ArrayList<String> columns = new ArrayList<String>();
    columns.add("ae_refid");
    columns.add("ae_desc");

    String table = "area_expertise";

    String libraries = crud.getLibraries(request);
    String add = crud.addData(columns, table);
    String output = crud.listTable(columns, table);

    out.print(libraries);
    out.print(add);
    out.print(output);
%>