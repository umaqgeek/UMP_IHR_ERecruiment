<%@page import="helpers.Func"%>
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
    String pa_stat_accepted = "OFFER_ACCEPTED";
    String pa_stat_activated = "ACTIVATED";
    String postage_address_type = "POSTAGE ADDRESS";
    if(request.getParameter("search_button") != null )
    {
        search_icno = request.getParameter("search");
        display_textfield = search_icno;
    }
    /*Selected Column     Index
     * C.C_NAME             0 
     * L.L_ICNO             1 
     * PPH.PPH_POSITION     2 
     * C.C_REFID            3 
     * PA.PA_REFID          4 
     * L.L_USERNAME         5
     * C.C_HP               6
     * A.A_ROADNO           7
     * A.A_CITY             8
     * A.A_POSTCODE         9
     * A.A_STATE            10
     * A.A_COUNTRY          11
     * PPH.PPH_GRADE        12
     * PPH.PPH_PTJ          13
     * PA.PA_SALARY         14
     * PA.PA_JOB_STATUS     15
     * PA.PA_CAMPUS         16
     * C.C_DOB              17
     * C.C_AGE              18
     * C.C_BIRTHSTATE       19
     * C.C_SEX              20
     * C.C_RELEGION         21
     * C.C_RACE             22
     * C.C_NATIONALITY      23
     * C.C_HOMETEL          24
     * C.C_MARITALSTAT      25
     * C.C_LICENCE          26
     * C.C_HEIGHT           27
     * C.C_WEIGHT           28
     * C.C_BMI              29
     * C.C_IMAGE            30
     * PA.PA_PERIOD_CONTRACT31
     */
    String sql = "SELECT C.C_NAME, L.L_ICNO, PPH.PPH_POSITION, C.C_REFID, PA.PA_REFID, L.L_USERNAME, C.C_HP, "
            + "A.A_ROADNO, A.A_CITY, A.A_POSTCODE, A.A_STATE, A.A_COUNTRY, PPH.PPH_GRADE, PPH.PPH_PTJ, PA.PA_SALARY, PA.PA_JOB_STATUS, "
            + "PA.PA_CAMPUS, C.C_DOB, C.C_AGE, C.C_BIRTHSTATE, C.C_SEX, C.C_RELIGION, C.C_RACE, C.C_NATIONALITY, C.C_HOMETEL, "
            + "C.C_MARITALSTAT, C.C_LICENSE, C.C_HEIGHT, C.C_WEIGHT, C.C_BMI, C.C_IMAGE, PA.PA_PERIOD_CONTRACT "
            + "FROM POS_APPLIED PA, CANDIDATE C, POSITION_PTJ_HR PPH, LOGIN1 L, ADDRESS A, ADDRESS_TYPE AT "
            + "WHERE C.C_REFID = PA.C_REFID "
            + "AND C.C_REFID = L.C_REFID "
            + "AND PPH.PPH_REFID = PA.PPH_REFID "
            + "AND C.C_REFID = A.C_REFID "
            + "AND AT.AT_REFID = A.AT_REFID "
            + "AND AT.AT_DESC = ? "
            + "AND ( PA.PA_STATUS = ? OR PA.PA_STATUS = ? ) "
            + "AND L.L_ICNO = ? "
            + "ORDER BY C.C_NAME";
    
    String params[] = { postage_address_type, pa_stat_accepted, pa_stat_activated, search_icno };
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
    
%>
<div class="well">
    <div class="row">
        <div class="col-sm-12">E-Register</div>
        <div class="row"></div>
        <br>
        <form class="navbar-form" role="search" name="search_form" method="post">
            <div style="float:left;" class="form-group">
                <input type="text" name="search" class="form-control" placeholder="Example: 880101087765" autocomplete="off" value="<%=display_textfield %>">
            </div>
            <div class="form-group">
                <input type="submit" name="search_button" class="btn btn-primary" value="SEARCH">
            </div>
        </form>
        <%
        if(data.size() > 0)
        {
            %>
            <form method="post" action="process/bpsm/eReg/e_reg_activate_process.jsp">
            <table width="100%" class="table table-condensed" style="border-collapse: collapse; color: #000;">
            <tbody>
            <%
            String sql2 = "SELECT R.R_STAFFID, R.R_STAFFNAME, R.R_TELNO, R.R_ADDRESS  "
                + "FROM REGISTRATION R "
                + "WHERE R.PA_REFID = ? ";
            ArrayList<ArrayList<String>> r_data;
            String[] r_param = new String[1];
            for(int row = 0; row < data.size(); row++)
            {
                r_param[0] = data.get(row).get(4);
                r_data = mc.getQuery(sql2, r_param);
                %>
                <input type="hidden" name="pa_refid" value="<%=data.get(row).get(4) %>">
                <input type="hidden" name="l_icno" value="<%=data.get(row).get(1) %>">
                <tr>
                <td width="15%" style="vertical-align: middle; font-weight: bold">Registration Status</td>
                <td width="1%" style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(r_data.size() > 0)
                {
                    %>
                    <td colspan="2" width="80%" style="vertical-align: middle; color: limegreen; font-weight: bold">ACTIVATED</td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" width="80%" style="vertical-align: middle;color: orange; font-weight: bold">OFFER ACCEPTED</td>
                    <%
                }
                %>
                </tr>

                <tr>
                <td style="vertical-align: middle; font-weight: bold">Staff ID</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(r_data.size() > 0)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle; font-weight: bold"><%=r_data.get(row).get(0) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle; font-weight: bold">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Grade</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(12) %></td>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Position</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(2) %></td>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">PTJ</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(13) %></td>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Job Status</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(15) %></td>
                </tr>
                <%
                if(data.get(row).get(15).equals("CONTRACT"))
                {
                    %>
                    <tr>
                    <td style="vertical-align: middle; font-weight: bold">Contract Period</td>
                    <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(31) %> MONTHS</td>
                    </tr>
                    <%
                }
                %>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Campus</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(16) %></td>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Salary</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;">RM <%=data.get(row).get(14) %></td>
                </tr>
                <%
                String sql_ap = "SELECT AP.AP_DESC, AP.AP_ALLOWANCE "
                        + "FROM ALLOWANCE_POS AP, POS_APPLIED PA "
                        + "WHERE AP.PA_REFID = ? "
                        + "AND PA.PA_STATUS = ? ";
                String params_ap[] = { data.get(row).get(4), pa_stat_accepted };
                ArrayList<ArrayList<String>> data_ap = mc.getQuery(sql_ap, params_ap);
                for(int row_ap = 0; row_ap<data_ap.size(); row_ap++)
                {
                    %>
                    <tr>
                    <%
                    if(row_ap == 0)
                    {
                        %>
                        <td rowspan="<%=data_ap.size() %>" style="vertical-align: top; font-weight: bold">Allowance</td>
                        <td rowspan="<%=data_ap.size() %>" style="vertical-align: top; text-align: center; font-weight: bold">:</td>
                        <%
                    }
                    %>
                    <td width="25%" style="vertical-align: middle;"><%=data_ap.get(row_ap).get(0) %></td>
                    <td style="vertical-align: middle;">RM <%=data_ap.get(row_ap).get(1) %></td>
                    </tr>
                    <%
                }
                %>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">IC Number</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(1) %></td>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Name</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;">
                <%
                if(r_data.size() > 0)
                {
                    %>
                    <%=r_data.get(row).get(1) %>
                    <%
                }
                else
                {
                    %>  
                    <input value="<%=data.get(row).get(0) %>" type="text" name="r_staffname" class="form-control" placeholder="Example: Mamat" autocomplete="off">
                    <%
                }
                %>
                </td>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Phone Number</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;">
                <%
                if(r_data.size() > 0)
                {
                    %>
                    <%=r_data.get(row).get(2) %>
                    <%
                }
                else
                {
                    %>  
                    <input value="<%=data.get(row).get(6) %>" type="text" name="r_telno" class="form-control" placeholder="Example: Mamat" autocomplete="off"></td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Address</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;">
                <%
                if(r_data.size() > 0)
                {
                    %>
                    <%=r_data.get(row).get(3) %>
                    <%
                }
                else
                {
                    %>  
                    <textarea type="text" name="r_address" class="form-control" placeholder="Example: Mamat" autocomplete="off"><%=data.get(row).get(7)+", "+data.get(row).get(8)+", "+data.get(row).get(9)+", "+data.get(row).get(10)+"." %></textarea></td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Date Of Birth</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <td colspan="2" style="vertical-align: middle;"><%=Func.getDate(data.get(row).get(17)) %></td>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Age</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(18) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(18) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Birth State</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(19) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(19) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Sex</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(20) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(20) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Religion</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(21) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(21) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Race</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(22) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(22) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Nationality</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(23) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(23) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Home Tel.</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(24) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(24) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Marital Status</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(25) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(25) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Driving License</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(26) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(26) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Height</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(27) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(27) %> cm</td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">Weight</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(28) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(28) %> kg</td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <tr>
                <td style="vertical-align: middle; font-weight: bold">BMI</td>
                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                <%
                if(data.get(row).get(29) != null)
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;"><%=data.get(row).get(29) %></td>
                    <%
                }
                else
                {
                    %>
                    <td colspan="2" style="vertical-align: middle;">-</td>
                    <%
                }
                %>
                </tr>
                <%
                if(r_data.size() == 0)
                {
                    %>
                    <tr>
                        <td colspan="4" style="vertical-align: middle;"><button type="submit" style="font-weight: bold" class="btn btn-success form-control">Activate</button></td>
                    </tr>
                    <%
                }
            }
            %>
            </tbody>
            </table>
            </form>
            <%
        }
        else
        {
            if(request.getParameter("search_button") != null )
            {
                %>
                <table width="100%" class="table table-condensed" style="border-collapse: collapse; color: #000;">
                <tbody>
                <tr>
                    <td style="color: red; font-weight: bold; text-align: center;"  width="100%">No Record Found</td>
                </tr>
                </tbody>
                </table>
                <%
            }
            else
            {
                %>
                 <table width="100%" class="table table-condensed" style="border-collapse: collapse; color: #000;">
                <tbody>
                <tr>
                    <td style="color: blue; font-weight: bold; text-align: center;"  width="100%">Please Search</td>
                </tr>
                </tbody>
                </table>
                <%
            }
        }
        %>      
        </div>
    </div>
</div>