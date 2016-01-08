<%@page import="controller.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.CRUD"%>
<%
    CRUD crud = new CRUD();

    ArrayList<String> columns = new ArrayList<String>();
    columns.add("im_refid");
    columns.add("im_desc");
    columns.add("im_link");
    columns.add("im_priority");

    String table = "interface_menu";

    String libraries = crud.getLibraries(request);
    String add = crud.addData(columns, table);
    String output = crud.listTable(columns, table);

    out.print(libraries);
    out.print(add);
    out.print(output);
%>