<%-- 
    Document   : e_int_criteria_bank
    Created on : Feb 4, 2016, 4:58:28 PM
    Author     : Habib
--%>

<%@page import="controller.Session"%>
<%@page import="config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
MainClient mc = new MainClient(DBConn.getHost());
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><h1>E-INTERVIEW</h1></div>
        </div>
        <div class="row">
            <ul class="nav nav-tabs">
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_published_list.jsp">PUBLISHED INTERVIEW</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_to_setup_list.jsp">POSITION READY TO SETUP</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">SAVED INTERVIEW SETUP</a></li>
              <li><a href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">MY INVITATION</a></li>
              <li class="active"><a>CRITERIA BANK</a></li>
            </ul>
        </div>
        <div class="row">
            <a data-toggle="modal" href="#modalAdd" class="btn btn-primary">Add New Criteria <span class="glyphicon glyphicon-plus"></span></a>
        </div>
        <div class="row">
            <table style="width: 100%" id="criteriaList" class="table-bordered">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">Criteria</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Min. Mark</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Max. Score</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Edit</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Delete</th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle">Kelayakan Akademi</td>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle; text-align: center">10</td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalEdit" class="glyphicon glyphicon-pencil"></a></td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalDelete" style="color: red" class="glyphicon glyphicon-trash"></a></td>
                     </tr>
                     <tr>
                        <td style="vertical-align: middle; text-align: center">2</td>
                        <td style="vertical-align: middle">Kelayakan Akademi</td>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle; text-align: center">10</td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalEdit" class="glyphicon glyphicon-pencil"></a></td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalDelete" style="color: red" class="glyphicon glyphicon-trash"></a></td>
                     </tr>
                     <tr>
                        <td style="vertical-align: middle; text-align: center">3</td>
                        <td style="vertical-align: middle">Kelayakan Akademi</td>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle; text-align: center">10</td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalEdit" class="glyphicon glyphicon-pencil"></a></td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalDelete" style="color: red" class="glyphicon glyphicon-trash"></a></td>
                     </tr>
                     <tr>
                        <td style="vertical-align: middle; text-align: center">4</td>
                        <td style="vertical-align: middle">Kelayakan Akademi</td>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle; text-align: center">10</td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalEdit" class="glyphicon glyphicon-pencil"></a></td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalDelete" style="color: red" class="glyphicon glyphicon-trash"></a></td>
                     </tr>
                     <tr>
                        <td style="vertical-align: middle; text-align: center">5</td>
                        <td style="vertical-align: middle">Kelayakan Akademi</td>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle; text-align: center">10</td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalEdit" class="glyphicon glyphicon-pencil"></a></td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalDelete" style="color: red" class="glyphicon glyphicon-trash"></a></td>
                     </tr>
                     <tr>
                        <td style="vertical-align: middle; text-align: center">6</td>
                        <td style="vertical-align: middle">Kelayakan Akademi</td>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle; text-align: center">10</td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalEdit" class="glyphicon glyphicon-pencil"></a></td>
                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalDelete" style="color: red" class="glyphicon glyphicon-trash"></a></td>
                     </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Add -->
<div id="modalAdd" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4 class="modal-title" style="font-weight: bold">Add New Criteria</h4>
            </div>
            <div class="modal-body" align="center">
                <fieldset>
                    <table style="width: 100%" class="table-condensed">
                        <tbody>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Criteria Type</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle; text-align: center"><input type="text" name="criteria_type" class="form-control" placeholder="Example: Working Experience"></td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Min</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle; text-align: center"><input class="form-control" name="min_score" type="number" id="replyNumbermin" min="0" step="1" data-bind="value:replyNumbermin" /></td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Max</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle; text-align: center"><input class="form-control" name="max_score" type="number" id="replyNumbermax" min="0" step="1" data-bind="value:replyNumbermax" /></td>
                             </tr>
                        </tbody>
                    </table>
                </fieldset>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success form-control">ADD</button>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Add -->
<!-- Modal Edit -->
<div id="modalEdit" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4 class="modal-title" style="font-weight: bold">Edit Criteria</h4>
            </div>
            <div class="modal-body" align="center">
                <fieldset>
                    <table style="width: 100%" class="table-condensed">
                        <tbody>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Criteri Type</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle; text-align: center"><input type="text" name="criteria_type" class="form-control" placeholder="Example: Working Experience" value="WORKING EXPERIENCE"></td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Min</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle; text-align: center"><input class="form-control" name="min_score" type="number" id="replyNumbermin" min="0" step="1" data-bind="value:replyNumbermin" value="1" /></td>
                             </tr>
                             <tr>
                                <td style="vertical-align: middle; font-weight: bold">Max</td>
                                <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                                <td style="vertical-align: middle; text-align: center"><input class="form-control" name="max_score" type="number" id="replyNumbermax" min="0" step="1" data-bind="value:replyNumbermax" value="10"/></td>
                             </tr>
                        </tbody>
                    </table>
                </fieldset>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success form-control">SAVE</button>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Edit -->
<!-- Modal Edit -->
<div id="modalDelete" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title" style="font-weight: bold">REMOVE THIS CRITERIA</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger form-control">YES</button>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Edit -->
<script type="text/javascript">
$(document).ready(function()
{
    $('#criteriaList').DataTable();
});
</script>