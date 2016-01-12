<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String sql = "SELECT pph.pph_grade, pph.pph_position, c.c_name, c.c_icno, "
        + "pa.pa_dateapplied, c.c_refid "
        + "FROM pos_applied pa, vacancy_pos_ptj vpp, position_ptj_hr pph, "
        + "candidate c "
        + "WHERE pa.vpp_refid = vpp.vpp_refid "
        + "AND vpp.pph_refid = pph.pph_refid "
        + "AND pa.c_refid = c.c_refid ";  
String param[] = {};
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d = mc.getQuery(sql, param);
%>

<div class="row">
    <div class="col-md-12">
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th >#</th>
                    <th >Grade</th>
                    <th >Position</th>
                    <th >Candidate</th>
                    <th >IC/No Passport</th>
                    <th >Register Date</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < d.size(); i++) { %>
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=d.get(i).get(0) %></td>
                    <td><%=d.get(i).get(1) %></td>
                    <td><%=d.get(i).get(2) %></td>
                    <td><a href="process.jsp?p=BPSM/E-Apply/e-applypersonal/e-applyinformation1.jsp&c=<%=d.get(i).get(5) %>"><%=d.get(i).get(3) %></a></td>
                    <td><%=d.get(i).get(4) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>
</div>

<!--<div class="row">

    <div class="well">	

        <form class="navbar-form" role="search">

            <div style="float:left;" class="form-group">
                <select class="form-control" id="view">
                    <option>10</option>
                    <option>25</option>
                    <option>50</option>
                    <option>100</option>
                </select>

                <div class="form-group">
                    <select class="form-control" id="option">
                        <option>Search Option</option>
                        <option>Grade</option>
                        <option>Position</option>
                    </select>
                </div>


                <input type="text" class="form-control" placeholder="Search">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
            </div>
        </form>

        <table class="table table-condensed" style="border-collapse:collapse;">
            <thead>
                <tr>
                    <th >#</th>
                    <th >Grade</th>
                    <th >Position</th>
                    <th >Candidate</th>
                    <th >IC/No Passport</th>
                    <th >Register Date</th>


            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>N47</td>
                    <td>Pegawai Teknologi Maklumat</td>
                    <td>Ali Bin Abu</td>
                    <td><a href="e-applyperonal/e-applyinformation1.html">890218059645</a></td>
                    <td>12/12/2015</td>

                    <td>Fail</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>N46</td>
                    <td>Pegawai Takbir</td>
                    <td>Saripah Binti Kasim</td>
                    <td><a href="e-applyperonal/e-applyinformation2.html">850218059645</a></td>
                    <td>12/12/2015</td>

                    <td>Fail</td>
                </tr>							

            </tbody>
        </table>

        <nav>
            <ul class="pagination pagination-sm pull-right">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>







    </div>
</div>-->