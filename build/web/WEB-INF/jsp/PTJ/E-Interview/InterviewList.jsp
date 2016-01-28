<%-- 
    Document   : InterviewList
    Created on : Jan 22, 2016, 10:17:33 AM
    Author     : Vijay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eInterview.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.eRecruitment.eInterview.Action"%>
<%@page import="controller.eRecruitment.eInterview.Info"%>
<%
    if (request.getParameter("hdn_Action")!= null){
        if (request.getParameter("hdn_Action").equals("A")){
            System.out.println(new Action().acceptCandidate(request.getParameter("hdn_IC_REFID"), ""));
        }
        else if (request.getParameter("hdn_Action").equals("R")){
            System.out.println(new Action().rejectCandidate(request.getParameter("hdn_IC_REFID"), ""));
        }
    }
%>    
<div id="wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12"> VACANCY POSITION LIST</div>
                </div>
                <!-- /.row -->
                <br/>
                <a class="btn" href="#" OnClick="javascript:document.getElementById('hdn_IC_REFID').value='N';" data-toggle="modal" data-target="#myInt">Add New</a>
                <br/>
                <div class="row">
                    <div class="dataTables_wrapper">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td style="width:5%">#</td>
                                    <td style="width:30%">Interview<br/>Details</td>
                                    <td style="width:20%">Chairman/<br/>Panel</td>
                                    <td style="width:30%">Grade<br/>Position<br/>Department</td>
                                    <td style="width:15%">Action</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                    objData objdata = new objData();
                                    List lq = new List();
                                    objdata = lq.getPTJInterviews("A");
                                    if (objdata.getFlag()==1){
                                        System.out.println(objdata.getErrorMessage());
                                    }
                                    else{
                                        for (int row = 0; row < objdata.getTableData().size(); row++){
                                            ArrayList Row = objdata.getTableData().get(row);
                                %>
                                <tr>
                                    <td><%=row+1%></td>
                                    <td><%=Row.get(0)%><br/><%=Row.get(1)%></td>
                                    <td><%=Row.get(2)%></td>
                                    <td><%=Row.get(3)%><br/><%=Row.get(4)%><br/><%=Row.get(5)%></td>
                                    <td>
                                        <a href="#" OnClick="javascript:document.getElementById('hdn_IC_REFID').value='<%=Row.get(6)%>';document.getElementById('hdn_Action').value='A';document.frm.submit();" class="btn">Accept</a>
                                        <br/>
                                        <a href="#" OnClick="javascript:document.getElementById('hdn_IC_REFID').value='<%=Row.get(6)%>';document.getElementById('hdn_Action').value='R';document.frm.submit();" class="btn">Reject</a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                        <form id="frm" name="frm" method="POST" action="#">
                            <input type="hidden" id="hdn_Action" name="hdn_Action" value=""/>
                            <input type="hidden" id="hdn_IC_REFID" name="hdn_IC_REFID" value=""/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>