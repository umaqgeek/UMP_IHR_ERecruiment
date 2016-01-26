<%@page import="java.util.ArrayList"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eInterview.List"%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"> List of Interviews of <%="DEPARTMENT"%></div>
        </div>
        <!-- /.row -->
        <br/><br/>
        <div class="row">
            <div class="dataTables_wrapper">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <td style="width:5%">#</td>
                            <td style="width:15%">Grade<br/>Position<br/>Department</td>
                            <td style="width:10%">Date & Time</td>
                            <td style="width:20%">VENUE</td>
                            <td style="width:20%">PANEL</td>
                            <td style="width:10%">&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody>
                        <!--Html Test data-->
                        <!--
                        <tr>
                            <td>1</td>
                            <td>Grade<br/>Position<br/>HR</td>
                            <td>02/01/2016 10:15AM</td>
                            <td>MESYURAT HR</td>
                            <td>HARYANI, LILA</td>
                            <td>UMAR BIN AHMAD<br/>123456-12-1234</td>
                            <td><a href="#">Accept</a><br/><a href="#">Reject</a></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Grade<br/>Position<br/>HR</td>
                            <td>02/01/2016 11:15AM</td>
                            <td>MESYURAT HR</td>
                            <td>HARYANI, SAKINA</td>
                            <td>NABILLA BINTI MUHAMMAD<br/>654321-12-1234</td>
                            <td><a href="#">Accept</a><br/><a href="#">Reject</a></td>
                        </tr>
                        -->
                        <%
                            objData objdata = new objData();
                            List lq = new List();
                            objdata = lq.getInterviewsOfDept("DEPT");
                            if (objdata.getFlag() == 1) {
                                System.out.println(objdata.getErrorMessage());
                            } else {
                                for (int row = 0; row < objdata.getTableData().size(); row++) {
                                    ArrayList Row = objdata.getTableData().get(row);
                        %>
                        <tr>
                            <td><%=row + 1%></td>
                            <td><%=Row.get(0)%><br/><%=Row.get(1)%><br/><%=Row.get(2)%></td>
                            <td><%=Row.get(3)%></td>
                            <td><%=Row.get(4)%></td>
                            <td><%=Row.get(5)%></td>
                            <td><a href="#">Accept</a><a href="#">Reject</a></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>