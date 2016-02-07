<%-- 
    Document   : e_int_start_chairman
    Created on : Feb 6, 2016, 10:55:20 PM
    Author     : Habib
--%>

<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <form method="post" action="process/bpsm/eInterview/e_int_go_interview_room.jsp">
                <table class="table-bordered" id="candidate_list" width="100%" style="font-size: 90%">
            <thead style="vertical-align: middle;">
                <tr style="vertical-align: middle;">
                    <th colspan="5" style="vertical-align: middle; text-align: center; font-weight: bold">Application</th>
                    <th colspan="5" style="vertical-align: middle; text-align: center; font-weight: bold">Panels</th>
                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Action</th>
                </tr>
                <tr style="vertical-align: middle;">
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Grade</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Status</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Panel 1</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Panel 2</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Panel 3</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Panel 4</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Panel 5</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="vertical-align: middle; text-align: center">1</td>
                    <td style="vertical-align: middle; text-align: center">Grade 1</td>
                    <td style="vertical-align: middle">Position 1</td>
                    <td style="vertical-align: middle">PTJ 1</td>
                    <td rowspan="3" style="vertical-align: middle; text-align: center; color: turquoise; font-weight: bold">LIVE</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center;"><a href="process.jsp?p=BPSM/E-Interview/e_int_chairman_decide.jsp" class="btn btn-primary">Decide</a></td>
                </tr>
                <tr>
                    <td style="vertical-align: middle; text-align: center">2</td>
                    <td style="vertical-align: middle; text-align: center">Grade 2</td>
                    <td style="vertical-align: middle">Position 2</td>
                    <td style="vertical-align: middle">PTJ 2</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">SUBMITED</td>
                    <td style="vertical-align: middle; text-align: center;"><a href="process.jsp?p=BPSM/E-Interview/e_int_chairman_decide.jsp" class="btn btn-primary">Decide</a></td>
                </tr>
                <tr>
                    <td style="vertical-align: middle; text-align: center">3</td>
                    <td style="vertical-align: middle; text-align: center">Grade 3</td>
                    <td style="vertical-align: middle">Position 3</td>
                    <td style="vertical-align: middle">PTJ 3</td>
                    <td style="vertical-align: middle; text-align: center">-</td>
                    <td style="vertical-align: middle; text-align: center">-</td>
                    <td style="vertical-align: middle; text-align: center">-</td>
                    <td style="vertical-align: middle; text-align: center">-</td>
                    <td style="vertical-align: middle; text-align: center">-</td>
                    <td style="vertical-align: middle; text-align: center;"><a href="process.jsp?BPSM/E-Interview/e_int_chairman_decide.jsp" class="btn btn-primary disabled">Decide</a></td>
                </tr>
                </tbody>
            </table>
            </form>
        </div>
        <div class="row">
            <form method="post" action="process/bpsm/eInterview/e_int_end_interview_process.jsp">
                <div class="col-sm-12"><button type="submit" class="btn btn-success form-control"><span style="color: white">End Interview & Submit</span></button></div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Go Back -->
<div id="modalDiscard" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title" style="font-weight: bold">GO BACK</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_my_invitation_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<script type="text/javascript">
$(document).ready(function()
{
    $("#interview").prop('disabled', true);
});

function checkTotalCheckedBoxes()
{
     var checkLength = 0;
     var boxes = document.getElementById("candidate_list").getElementsByTagName("input");
     for (var i = 0; i < boxes.length; i++)
     {
         boxes[i].checked ? checkLength++ : null;
     }

     if(checkLength > 0)
     {
         $("#interview").prop('disabled', false);
     }
     else if(checkLength == 0)
     {
         $("#interview").prop('disabled', true);
     }
     //alert (checkLength + " boxes are checked." );
}
</script>