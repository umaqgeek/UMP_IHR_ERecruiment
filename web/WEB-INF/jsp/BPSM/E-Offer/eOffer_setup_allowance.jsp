<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%@page import="controller.Session"%>
<%  
    String pa_refid = session.getAttribute("pa_refid").toString();
    String sql = "SELECT PA.PA_REFID, PPH.PPH_GRADE, PPH.PPH_SALARY_MIN, PPH.PPH_SALARY_MAX, PPH.PPH_POSITION, PPH.PPH_PTJ, "
            + "C.C_NAME, L.L_ICNO, PA.PA_JOB_STATUS, PA.PA_PERIOD_CONTRACT, PA.PA_CAMPUS, PA.PA_SALARY "
            + "FROM POS_APPLIED PA, POSITION_PTJ_HR PPH, CANDIDATE C, LOGIN1 L "
            + "WHERE C.C_REFID = PA.C_REFID "
            + "AND PPH.PPH_REFID = PA.PPH_REFID "
            + "AND C.C_REFID = L.C_REFID "
            + "AND PA.PA_REFID = ? ";
    String params[] = { pa_refid };
    MainClient mc = new MainClient(DBConn.getHost());
    ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
%>

<div class="row">
    <div class="well col-md-12">
        <a href="process.jsp?p=BPSM/E-Offer/off_bpsm_list.jsp" class="btn btn-default">Back</a>
        <div class="row">
            <div class="col-md-12"><h4>Setup Offer</h4></div>
        </div>
        <div class="row">
            <form method="post" action="process/bpsm/eOffer/eOff_setup_process.jsp" class="col-md-12">
            <!--<form method="post" action="" class="col-md-12">-->
            <table class="table table-condensed" width="100%" id="formSetup">
            <tbody>
            <%
            for(int row = 0; row < data.size(); row++)
            {
                %>
                <input type="hidden" name="pa_refid" value="<%=data.get(row).get(0) %>">
                <input type="hidden" name="ap_size" id="allowanceSize" value="">
                <tr>
                    <td style="font-weight: bold;vertical-align: middle;" width="19%">Grade</td><td style="font-weight: bold; text-align: center; vertical-align: middle">:</td>
                    <td><%=data.get(row).get(1) %> (Expected Salary : RM <%=data.get(row).get(2) %> - RM <%=data.get(row).get(3) %>) </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;vertical-align: middle">Position</td><td style="font-weight: bold; text-align: center; vertical-align: middle">:</td>
                    <td><%=data.get(row).get(4) %></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;vertical-align: middle">PTJ</td><td style="font-weight: bold; text-align: center; vertical-align: middle">:</td>
                    <td><%=data.get(row).get(5) %></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;vertical-align: middle">Cabdidate Name</td><td style="font-weight: bold; text-align: center; vertical-align: middle">:</td>
                    <td><%=data.get(row).get(6) %></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;vertical-align: middle">IC Number</td><td style="font-weight: bold; text-align: center; vertical-align: middle">:</td>
                    <td><%=data.get(row).get(7) %></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;vertical-align: middle">Job Status</td><td style="font-weight: bold; text-align: center; vertical-align: middle">:</td>
                    <td><select required name="pa_job_status" class="form-control" id="selectedJob">
                            <%
                            String lm_desc1 = "Job Status";
                            String sql_job_status = "SELECT LD.LD_DESC "
                                    + "FROM LOOKUP_DETAIL LD, LOOKUP_MASTER LM "
                                    + "WHERE LM.LM_REFID = LD.LM_REFID "
                                    + "AND LM.LM_DESC = ? ";
                            String param_job_status[] = { lm_desc1 };
                            ArrayList<ArrayList<String>> data_job_status = mc.getQuery(sql_job_status, param_job_status);
                            for(int row11=0; row11<data_job_status.size(); row11++)
                            {
                                if(data.get(row).get(8) != null)
                                {
                                    if(data.get(row).get(8).equalsIgnoreCase(data_job_status.get(row11).get(0)))
                                    {
                                        %>
                                        <option selected value="<%=data_job_status.get(row11).get(0) %>"><%=data_job_status.get(row11).get(0) %></option>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <option value="<%=data_job_status.get(row11).get(0) %>"><%=data_job_status.get(row11).get(0) %></option>
                                        <%
                                    }
                                }
                                else
                                {
                                    %>
                                    <option value="<%=data_job_status.get(row11).get(0) %>"><%=data_job_status.get(row11).get(0) %></option>
                                    <%
                                }
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr id="contractPeriod">
                    <td style="font-weight: bold;vertical-align: middle">Contract Period (Month)</td><td style="font-weight: bold; text-align: center; vertical-align: middle">:</td>
                    <td>
                        <%
                        if(data.get(row).get(9) != null)
                        {
                            %>
                            <input type="text" name="pa_period" class="form-control" id="pa_field" placeholder="6 Month" required="" value="<%=data.get(row).get(9) %>">
                            <%
                        }
                        else
                        {
                            %>
                            <input type="text" name="pa_period" class="form-control" id="pa_field" placeholder="6 Month" required="">
                            <%
                        }
                        %>
                    </td>
                </tr>
               <tr>
                    <td style="font-weight: bold;vertical-align: middle">Campus</td><td style="font-weight: bold; text-align: center; vertical-align: middle">:</td>
                    <td><select name="pa_campus" class="form-control">
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
                                if(data.get(row).get(10) != null)
                                {
                                    if(data.get(row).get(10).equalsIgnoreCase(data_campus.get(row1).get(0)))
                                    {
                                        %>
                                        <option selected value="<%=data_campus.get(row1).get(0) %>"><%=data_campus.get(row1).get(0) %></option>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <option value="<%=data_campus.get(row1).get(0) %>"><%=data_campus.get(row1).get(0) %></option>
                                        <%
                                    }
                                }
                                else
                                {
                                    %>
                                    <option value="<%=data_campus.get(row1).get(0) %>"><%=data_campus.get(row1).get(0) %></option>
                                    <%
                                }
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;vertical-align: middle">Salary (RM)</td><td style="font-weight: bold; text-align: center; vertical-align: middle">:</td>
                    <td><%
                        if(data.get(row).get(11) != null)
                        {
                            %>
                            <input type="text" name="pa_salary" class="form-control" placeholder="Example : 1500" required value="<%=data.get(row).get(11) %>">
                            <%
                        }
                        else
                        {
                            %>
                            <input type="text" name="pa_salary" class="form-control" placeholder="Example : 1500" required>
                            <%
                        }
                        %>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Allowance</td><td style="font-weight: bold; text-align: center">:</td>
                    <td style="vertical-align: top">
                        <div class="form-group">
                            <label class="col-md-6" style="text-align: center">Allowance Name</label><label  style="text-align: center" class="col-md-4">Allowance Amount (RM)</label>
                        </div>
                        <%
                        String sql_check_allowance = "SELECT AP.AP_DESC, AP.AP_ALLOWANCE "
                                + "FROM ALLOWANCE_POS AP "
                                + "WHERE AP.PA_REFID = ? ";
                        String params_check_allowance[] = { data.get(row).get(0) };
                        ArrayList<ArrayList<String>> data_check_allowance = mc.getQuery(sql_check_allowance, params_check_allowance);
                        if(data_check_allowance.size() > 0)
                        {
                            %>
                            <input name="rowExist" data-rowExist="<%=data_check_allowance.size()-1 %>" id="rowExistId" class="open-rowExist" type="hidden" value="<%=data_check_allowance.size()-1 %>">
                            <div id="itemRows">
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <input type="text" name="allowance_name" class="form-control" placeholder="Example : Travel Allowance" required value="<%=data_check_allowance.get(0).get(0) %>">
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" name="allowance_amount" class="form-control" placeholder="Example : 1500" required  value="<%=data_check_allowance.get(0).get(1) %>">
                                    </div>
                                    <div class="col-md-2"  style="text-align: center">
                                        <button type="button" id="addButton" class="btn btn-default form-control"><i class="fa fa-plus"></i></button>
                                    </div>
                                </div>
                            </div>
                            <%
                            for(int rowE = 1 ; rowE < data_check_allowance.size(); rowE++)
                            {
                                %>
                                <div class="form-group" id="rowNum<%=rowE %>">
                                    <div class="col-md-6">
                                        <input type="text" name="allowance_name" class="form-control" placeholder="Example : Travel Allowance" value="<%=data_check_allowance.get(rowE).get(0) %>" required>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" name="allowance_amount" class="form-control" placeholder="Example : 1500" value="<%=data_check_allowance.get(rowE).get(1) %>" required>
                                    </div>
                                    <div class="col-md-2"  style="text-align: center">
                                            <button type="button" id="removeButton" data-rnum="<%=rowE %>" class="btn open-removeButton btn-danger form-control"><strong style="color: white"><i class="fa fa-minus"></i></strong></button>
                                    </div>
                                </div>
                                <%
                            }
                        }
                        else
                        {
                            %>
                            <input name="rowExist" data-rowExist="0" id="rowExistId" class="open-rowExist" type="hidden" value="0">
                            <div id="itemRows">
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <input type="text" name="allowance_name" class="form-control" placeholder="Example : Travel Allowance" required="">
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" name="allowance_amount" class="form-control" placeholder="Example : 1500" required>
                                    </div>
                                    <div class="col-md-2"  style="text-align: center">
                                        <button type="button" id="addButton" class="btn btn-default form-control"><i class="fa fa-plus"></i></button>
                                    </div>
                                </div>
                            </div>
                            <%
                        }
                        %>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-success form-control"><strong style="color: white">Save</strong></button>
                            </div>
                        </div>
                    </td>
                </tr>
                <%
            }
            %>
            </tbody>
            </table>
            </form>
        </div>
    </div>
</div>
            
<script type="text/javascript">
$(document).ready(function ()
{
    $("#pa_job_status").attr('required', 'required');
    $("#campus").attr('required', 'required');
    //var pa_period = this.getField("pa_period");
    //pa_period.required = false;
    $('#contractPeriod').hide();
    $('#pa_field').hide();
    var initSelectedJob = document.getElementById("selectedJob").value;
    if(initSelectedJob === "CONTRACT")
    {
        $("#pa_field").attr('required', '');
        //pa_period.required = true;
        $("pa_field");
        $('#pa_field').show();
        $('#contractPeriod').show();
    }
    
    $('#selectedJob').change(function ()
    {
        
        var selectedJob = $('#selectedJob').val();
        if(selectedJob === "CONTRACT")
        {
            $("#pa_field").attr('required', '');
            //pa_period.required = true;
            $("pa_field");
            $('#pa_field').show();
            $('#contractPeriod').show();
        }
        else
        {
            $("#pa_field").removeAttr('required');
            //pa_period.required = false;
            $('#pa_field').hide();
            $('#contractPeriod').hide();
        }
    });
    
    $("#allowanceSize").val('1');
    
    var rowNum = document.getElementById("rowExistId").value;
    $('#addButton').click(function addRow()
    {
        rowNum ++;
        //var row = '<p id="rowNum'+rowNum+'">Item quantity: <input type="text" name="qty[]" size="4" value="'+frm.add_qty.value+'"> Item name: <input type="text" name="name[]" value="'+frm.add_name.value+'"> <input type="button" value="Remove" onclick="removeRow('+rowNum+');"></p>';
        var row = '<div class="form-group" id="rowNum'+rowNum+'">'
                        +'<div class="col-md-6">'
                            +'<input type="text" name="allowance_name" class="form-control" placeholder="Example : Travel Allowance" required>'
                        +'</div>'
                        +'<div class="col-md-4">'
                            +'<input type="text" name="allowance_amount" class="form-control" placeholder="Example : 1500" required>'
                        +'</div>'
                        +'<div class="col-md-2"  style="text-align: center">'
                                +'<button type="button" id="removeButton" data-rnum="'+rowNum+'" class="btn open-removeButton btn-danger form-control"><strong style="color: white"><i class="fa fa-minus"></i></strong></button>'
                        +'</div>'
                    +'</div>';
        $("#allowanceSize").val( rowNum+1 );
        jQuery('#itemRows').append(row);
    });
    
    $(document).on("click", ".open-removeButton", function ()
    {
        var rnum = $(this).data('rnum');
        $("#allowanceSize").val(rnum);
        jQuery('#rowNum'+rnum).remove();
    });

    /*$('#removeButton').click(function removeRow()
    {
        var rnum = $('#removeButton').data(rnum);
        jQuery('#rowNum'+rnum).remove();
    });*/
});
</script>