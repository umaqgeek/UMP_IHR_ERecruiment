<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    
    String search_username = "";
    String search_icno = "";
    String selected_ic = "";
    String selected_username = "";
    String display_textfield = "";
    String pa_stat_accepted = "OFFER ACCEPTED";
    
    if(request.getParameter("search_button") != null )
    {
        if(request.getParameter("select").equals("icno"))
        {
            search_icno = request.getParameter("search");
            display_textfield = search_icno;
            selected_ic = "selected";
        }else
        if(request.getParameter("select").equals("username"))
        {
            search_username = request.getParameter("search");
            display_textfield = search_username;
            selected_username = "selected";
        }
    }
    
    String sql = "SELECT C.C_NAME, C.C_ICNO, PPH.PPH_POSITION, C.C_REFID, PA.PA_REFID, L.L_USERNAME "
            + "FROM POS_APPLIED PA, CANDIDATE C, POSITION_PTJ_HR PPH, LOGIN1 L "
            + "WHERE C.C_REFID = PA.C_REFID "
            + "AND C.C_REFID = L.C_REFID "
            + "AND PPH.PPH_REFID = PA.PPH_REFID "
            + "AND PA.PA_STATUS= ? "
            + "AND ( L.L_USERNAME = ? OR L.C_ICNO = ? ) "
            + "ORDER BY C.C_NAME";
    
    String params[] = { pa_stat_accepted, search_username, search_icno };
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
    
%>
<div class="well">
    <div class="row">
        <div class="col-sm-12">Setup e-Register</div>
        <div class="row"></div>
        <br>
        <form class="navbar-form" role="search" name="search_form" method="post">
            <div style="float:left;" class="form-group">
                <input type="text" name="search" class="form-control" placeholder="" value="<%=display_textfield %>">
            </div>

            <div style="float" class="form-group">
                <select class="form-control" id="sel1" name="select">
                    <option value="icno" <%=selected_ic %>>IC</option>
                    <option value="username" <%=selected_username %>>Username</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" name="search_button" class="btn btn-primary" value="SEARCH">
            </div>
        </form>


        <table width="150%" class="table table-bordered" style="border-collapse: collapse; color: #000;">
            <thead>
                <tr>
                    <th width="1%" style="text-align: center">No</th>
                    <th width="20%" style="text-align: center">Name</th>
                    <th width="5%" style="text-align: center">IC Number</th>
                    <th width="20%" style="text-align: center">Position</th>
                    <th width="10%" style="text-align: center">Status</th>
                </tr>
            </thead>
            <tbody>
            <%
            if(data.size() > 0)
            {
                String sql2 = "SELECT R.R_STAFFID "
                    + "FROM REGISTRATION R "
                    + "WHERE R.PA_REFID = ? ";
                ArrayList<ArrayList<String>> r_data;
                for(int row = 0; row < data.size(); row++)
                {
                    %>
                    <tr>
                    <td style="text-align: center; vertical-align: middle"><%=row+1 %></td>
                    <td style="vertical-align: middle"><%=data.get(row).get(0) %></td>
                    <td style="text-align: center; vertical-align: middle"><a href="process.jsp?p=BPSM/E-Register/e-registerperonal/e-registerinformation.jsp&c_refid=<%=data.get(row).get(3) %>&pa_refid=<%=data.get(row).get(4) %>&wrong_username=&activated="><%=data.get(row).get(1) %></a></td>
                    <td style="vertical-align: middle"><%=data.get(row).get(2) %></td>
                    <%
                    String params2[] = { data.get(row).get(4) };
                    r_data = mc.getQuery(sql2, params2);
                    if(r_data.size() > 0)
                    {
                        %>
                        <td style="text-align: center; font-weight: bold; color: limegreen; vertical-align: middle">Activated</td>
                        <%
                    }
                    else
                    {
                        %>
                        <td style="text-align: center; font-weight: bold; color: red; vertical-align: middle">Not Activated</td>
                        <%
                    }
                    %>
                    </tr>
                    <%
                }          
            }
            else
            {
                if(request.getParameter("search_button") != null )
                {
                    %>
                    <tr>
                        <td colspan="5" style="color: red; font-weight: bold; text-align: center">No Record Found</td>
                    </tr>
                    <%
                }
                else
                    {
                    %>
                    <tr>
                        <td colspan="5" style="color: blue; font-weight: bold; text-align: center">Please Search</td>
                    </tr>
                    <%
                }
            }
            %>            
            </tbody>
        </table>
    </div>
</div>