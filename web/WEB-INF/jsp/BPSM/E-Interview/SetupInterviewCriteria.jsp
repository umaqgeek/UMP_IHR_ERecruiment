<%@page import="java.util.ArrayList"%>
<%@page import="helpers.objData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.eRecruitment.eInterview.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.eRecruitment.eInterview.Action"%>
<%@page import="controller.eRecruitment.eInterview.Info"%>
<%
    String strQ = "";
    String strM = "";
    String strD = "";
    String strI = "";
    if (request.getParameter("hdn_Action")!=null && request.getParameter("hdn_Action").equals("D")){
        System.out.println(new Action().deleteInterviewQuestion(request.getParameter("hdn_IQ_REFID")));
    }
    else if (request.getParameter("hdn_Action")!=null && request.getParameter("hdn_Action").equals("E")){
        objData objdata = new objData();
        objdata = new Info().getInterviewQuestion(request.getParameter("hdn_IQ_REFID"));
        
        if (objdata.getFlag()==1)
            System.out.println(objdata.getErrorMessage());
        else{
            strI = objdata.getTableData().get(0).get(0);
            strQ = objdata.getTableData().get(0).get(1);
            strM = objdata.getTableData().get(0).get(2);
            strD = objdata.getTableData().get(0).get(3);
        }
            
    }
    else if (request.getParameter("hdn_Action")!=null && request.getParameter("hdn_Action").equals("S")){
        if (request.getParameter("hdn_IQ_REFID")!=null){
            ArrayList<String> data = new ArrayList<String>();

            data.add(request.getParameter("hdn_IQ_REFID"));
            data.add(request.getParameter("txt_IQ_QUESTION"));
            data.add(request.getParameter("txt_IQ_MAX_MARK"));
            data.add(request.getParameter("txt_IQ_DESC"));

            Action a = new Action();
            a.saveInterviewQuestions(data);
        }
    }
%>    
<div id="wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12"> SETUP INTERVIEW QUESTIONS</div>
                </div>
                <!-- /.row -->
                <br/><br/>
                <div class="row">
                    <div class="dataTables_wrapper">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td style="width:10%">#</td>
                                    <td style="width:35%">Question</td>
                                    <td style="width:10%">Max Marks</td>
                                    <td style="width:35%">Description</td>
                                    <td style="width:5%">&nbsp;</td>
                                    <td style="width:5%">&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                    objData objdata = new objData();
                                    List lq = new List();
                                    objdata = lq.getInterviewQuestions();
                                    if (objdata.getFlag()==1){
                                        System.out.println(objdata.getErrorMessage());
                                    }
                                    else{
                                        for (int row = 0; row < objdata.getTableData().size(); row++){
                                            ArrayList Row = objdata.getTableData().get(row);
                                %>
                                <tr>
                                    <td><%=row+1%></td>
                                    <td><%=Row.get(1)%></td>
                                    <td><%=Row.get(2)%></td>
                                    <td><%=Row.get(3)%></td>
                                    <td><a href="#" OnClick="javascript:document.getElementById('hdn_IQ_REFID').value='<%=Row.get(0)%>';document.getElementById('hdn_Action').value='E';document.frmQ.submit();" class="btn" data-toggle="modal" data-target="#myInt">Edit</a></td>
                                    <td><a href="#" OnClick="javascript:document.getElementById('hdn_IQ_REFID').value='<%=Row.get(0)%>';document.getElementById('hdn_Action').value='D';document.frmQ.submit();">Del</a></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <a href="#" OnClick="javascript:document.getElementById('hdn_IQ_REFID').value='N';" class="btn" data-toggle="modal" data-target="#myInt">Add New</a>
                <!-- Add/Edit DIV-->
                <div id="myInt" class="modal fade" role="dialog">
                    <form id="frmQ" name="frmQ" method="GET" class="form-horizontal" action="#">
                        <input type="hidden" id="hdn_Action" name="hdn_Action" value=""/>
                        <div class="modal-dialog">
                            <!-- Modal content for Universiti-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Interview Question </h4>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" id="hdn_IQ_REFID" name="hdn_IQ_REFID" class="form-control" value="<%=strI%>"/>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Question</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_IQ_QUESTION" name="txt_IQ_QUESTION" value="<%=strQ%>"/>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Max Marks</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_IQ_MAX_MARK" name="txt_IQ_MAX_MARK" value="<%=strM%>"/>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Description</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="txt_IQ_DESC" name="txt_IQ_DESC" value="<%=strD%>"/>
                                        </div>
                                    </div>    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" onclick="javascript:document.getElementById('hdn_Action').value='S';document.frmQ.submit();" class="btn btn-default" data-dismiss="modal">Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!--DIV-->
            </div>
        </div>
    </div>
</div>