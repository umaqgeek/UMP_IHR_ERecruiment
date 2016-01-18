
<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>
<%  
    String filter_stat_pass = "pass";
    String sql = "SELECT PPH.PPH_POSITION, F.F_INTUNI, C.C_NAME, PA.PA_STATUS "
            + "FROM LOGIN1 L,CANDIDATE C, POS_APPLIED PA, POSITION_PTJ_HR PPH, "
            + "FILTER F, VACANCY_POS_PTJ VPP "
            + "WHERE C.C_REFID=L.C_REFID "
            + "AND C.C_REFID=PA.C_REFID "
            + "AND PPH.PPH_REFID=VPP.PPH_REFID "
            + "AND pph.pph_REFID=PA.pph_REFID "
            + "AND PA.PA_REFID=F.PA_REFID "
            + "AND F.F_STATUS= ? ";
    String params[] = { filter_stat_pass };
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