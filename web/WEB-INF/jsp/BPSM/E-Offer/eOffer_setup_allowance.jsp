<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>
<%  
    
    String sql = "SELECT G.G_REFID, G.G_GRADE "
            + "FROM GRADE G";
    String params[] = {  };
    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
%>

<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>Grade List</h1></div>
        </div>
        <!-- /.row -->
        <div class="row">
            <table class="table table-bordered" width="100%">
                <thead>
                    <tr>
                        <th style="text-align:center; vertical-align: middle; width:1%">No.</th>
                        <th style="text-align:center; vertical-align: middle; width:15%">Grade</th>
                        <th style="text-align:center; vertical-align: middle; width:15%">Action</th>
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
                        <td style="vertical-align: middle; text-align: center"><%=row+1 %></td>
                        <td style="vertical-align: middle; text-align: center"><%=data.get(row).get(1) %></td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modal_<%=row %>" class="open-modal_<%=row %> btn btn-sm <% %>">Setup</a></td>
                        </tr>
                        <%
                    }
                }
                else
                {
                    %>
                    <tr>
                        <td colspan="7" style="font-weight: bold; vertical-align: middle; text-align: center; color: red">No Record</td>
                    </tr>
                    <%
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
         
<%
if(data.size()>0)
{
    for(int row=0; row<data.size(); row++)
    {
        %>
        <div id="modal_<%=row %>" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <!--<form method="post" action="Register">-->
                    
                        <input type="hidden" name="pa_refid" value="">
                        <div class="modal-header">
                            <h4 class="modal-title">Setup General Allowance</h4>
                        </div>
                        <div class="modal-body">
                            
                            <fieldset>
                            <form method="post" action="" class="form-horizontal">
                                <label for="pa_grade">Grade : <%=data.get(row).get(1) %></label><br>
                                <input type="hidden" name="pph_grade" class="form-control" value="<%=data.get(row).get(1) %>">
                                 <div class="form-group">
                                    <label class="col-md-2">Campus</label>
                                    <div class="col-md-10">
                                        <select name="campus" class="form-control">
                                            <%
                                            String lm_desc = "Campus";
                                            String sql_campus = "SELECT LD.LD_DESC "
                                                    + "FROM LOOKUP_DETAIL LD, LOOKUP_MASTER LM "
                                                    + "WHERE LM.LM_REFID = LD.LM_REFID "
                                                    + "AND LM.LM_DESC = ? ";
//                                            String sql_campus = "SELECT * "
//                                                    + "FROM LOOKUP_MASTER";
                                            String param_campus[] = { lm_desc };
                                            ArrayList<ArrayList<String>> data_campus = mc.getQuery(sql_campus, param_campus);
                                            for(int row1=0; row1<data_campus.size(); row1++)
                                            {
                                                %>
                                                <option value="<%=data_campus.get(row1).get(0) %>"><%=data_campus.get(row1).get(0) %></option>
                                                <%
                                            }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">Salary (RM)</label>
                                    <div class="col-md-10">
                                        <input type="text" name="pph_salary" class="form-control" placeholder="Example : 1500">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-6">Allowance Name</label><label class="col-md-6">Allowance Amount (RM)</label>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <input type="text" name="allowance_name[]" class="form-control" placeholder="Example : Travel Allowance">
                                    </div>
                                    <div class="col-xs-4">
                                        <input type="text" name="allowance_amount[]" class="form-control" placeholder="Example : 1500">
                                    </div>
                                    <div class="col-xs-1">
                                        <button type="button" class="btn btn-default addButton"><i class="fa fa-plus"></i></button>
                                    </div>
                                </div>
                                <!--<input type="text" id="c_icno" name="c_icno" class="form-control" placeholder="Identification Number &nbsp;/&nbsp; Passport Number">-->
                            </form>

                            </fieldset>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default">Save</button>
                        </div>
                </div>
            </div>
        </div>
        <%
    }
} 
%>
     <!--           
<script type="text/javascript">
$(document).on("click", ".open-setupAllowance", function ()
{
    var grade = $(this).data('grade');
    $(".modal-body #grade").val( grade );
});
</script>-->