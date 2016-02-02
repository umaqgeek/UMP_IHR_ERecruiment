
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
  
    String sql = "SELECT c.c_name "
            + "FROM candidate c ";
    String param[] = {};
    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, param);
    
    String sql2 = "UPDATE candidate "
            + "SET c_name = ? "
            + "WHERE c_refid = ? ";
    String param2[] = {"umaq", "123213"};
    MainClient mc2 = new MainClient(DBConn.getHost());
    String isUpdate = mc2.setQuery(sql2, param2);
    
    out.print(isUpdate);
    
%>


<button onclick="location.href='process.jsp?p=PTJ/E-Filter/e-filter_ptj.jsp';">Go</button>