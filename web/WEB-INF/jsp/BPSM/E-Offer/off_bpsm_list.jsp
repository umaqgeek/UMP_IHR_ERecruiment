<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>

<%  
    String sql = "SELECT "
            + "PPH.PPH_POSITION, F.F_INTUNI, C.C_NAME, PA.PA_STATUS "
            + "FROM LOGIN L,CANDIDATE C, POS_APPLIED PA,POSITION_PTJ_HR PPH,FILTER F "
            + "WHERE C.C_REFID=L.C_REFID "
            + "AND C.C_REFID=PA.C_REFID "
            + "AND PPH.PPH_REFID=PA.PPH_REFID "
            + "AND PA.PA_REFID=F.PA_REFID "
            + "AND F.F_STATUS='pass'";
    
    String params[] = {};

    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
%>

<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>OFFER LIST</h1></div>
        </div>
        <!-- /.row -->
        <div class="row">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="text-align:center; vertical-align: middle; width:5%">No.</th>
                        <th style="text-align:center; vertical-align: middle; width:40%">Candidate Name</th>
                        <th style="text-align:center; vertical-align: middle; width:40%">Offered Position</th>
                        <th style="text-align:center; vertical-align: middle; width:15%">Offer Status</th>
                        <th style="text-align:center; vertical-align: middle; width:10%">Offered Date</th>
                    </tr>
                </thead>
                <tbody>
                <!--Data from DB. Below rows to be remarked upon DB connection.-->
                <%
                if(data.size()>0)
                {
                    for(int row=0; row<data.size(); row++)
                    {
                        %>
                        <tr>
                        <td style="vertical-align: middle; text-align: center"><%= row+1 %></td>
                        <td style="vertical-align: middle"><%=data.get(row).get(2) %></td>
                        <td style="vertical-align: middle"><%=data.get(row).get(0) %></td>
                        <%
                        if(data.get(row).get(3).equalsIgnoreCase("Accepted"))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center;font-weight: bold; color: green">Offer <%=data.get(row).get(3) %></td>
                            <%
                        }
                        else if(data.get(row).get(3).equalsIgnoreCase("Rejected"))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center;font-weight: bold; color: red">Offer <%=data.get(row).get(3) %></td>
                            <%
                        }
                        else if(data.get(row).get(3).equalsIgnoreCase("Pending"))
                        {
                            %>
                            <td style="vertical-align: middle; text-align: center; font-weight: bold;">Offer <%=data.get(row).get(3) %></td>
                            <%
                        }
                        else 
                        %>
                        
                        <td style="vertical-align: middle; text-align: center"><%=data.get(row).get(1) %></td>
                        </tr>
                        <%
                    }
                }
                else
                {
                    %>
                    <tr>
                        <td colspan="7" style="font-weight: bold; vertical-align: middle; text-align: center; color: red">No Offer</td>
                    </tr>
                    <%
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>