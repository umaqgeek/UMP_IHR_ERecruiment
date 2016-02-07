<%-- 
    Document   : e_int_start
    Created on : Feb 6, 2016, 5:25:53 PM
    Author     : Habib
--%>


<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <form method="post" action="process/bpsm/eInterview/e_int_go_interview_room.jsp">
            <table class="table-bordered" id="candidate_list" width="100%">
            <thead style="vertical-align: middle;">
                <tr style="vertical-align: middle;">
                    <th colspan="4" style="vertical-align: middle; text-align: center; font-weight: bold">Application</th>
                    <th colspan="5" style="vertical-align: middle; text-align: center; font-weight: bold">Candidate</th>
                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold"><button class="form-control btn btn-primary" name="interview" type="submit" id="interview"><span style="color: white">Start</span></button></th>
                </tr>
                <tr style="vertical-align: middle;">
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">#</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Grade</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">#</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Name</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">IC Number</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Avg Mark</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Decision</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td rowspan="4" style="vertical-align: middle; text-align: center">1</td>
                    <td rowspan="4" style="vertical-align: middle; text-align: center">Grade 1</td>
                    <td rowspan="4" style="vertical-align: middle">Position 1</td>
                    <td rowspan="4" style="vertical-align: middle">PTJ 1</td>
                    <td style="vertical-align: middle; text-align: center">1</td>
                    <td style="vertical-align: middle;">Candidate Name 1</td>
                    <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                    <td style="vertical-align: middle; text-align: center">8</td>
                    <td style="vertical-align: middle; text-align: center">PASS</td>
                    <td style="vertical-align: middle; text-align: center">DONE</td>
                </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">2</td>
                        <td style="vertical-align: middle;">Candidate Name 2</td>
                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                        <td style="vertical-align: middle; text-align: center">10</td>
                        <td style="vertical-align: middle; text-align: center">PASS</td>
                        <td style="vertical-align: middle; text-align: center">DONE</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">3</td>
                        <td style="vertical-align: middle;">Candidate Name 3</td>
                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                        <td style="vertical-align: middle; text-align: center">2</td>
                        <td style="vertical-align: middle; text-align: center">FAIL</td>
                        <td style="vertical-align: middle; text-align: center">DONE</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">4</td>
                        <td style="vertical-align: middle;">Candidate Name 4</td>
                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center"><input type="checkbox" onclick="checkTotalCheckedBoxes();" id="candidate" name="candidate" value="<%//=data_pos_list.get(row).get(3) %>"></td>
                    </tr>
                    <tr>
                        <td rowspan="4" style="vertical-align: middle; text-align: center">2</td>
                        <td rowspan="4" style="vertical-align: middle; text-align: center">Grade 2</td>
                        <td rowspan="4" style="vertical-align: middle">Position 2</td>
                        <td rowspan="4" style="vertical-align: middle">PTJ 2</td>
                        <td style="vertical-align: middle; text-align: center">5</td>
                        <td style="vertical-align: middle;">Candidate Name 5</td>
                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center"><input type="checkbox" onclick="checkTotalCheckedBoxes();" id="candidate" name="candidate" value="<%//=data_pos_list.get(row).get(3) %>"></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">6</td>
                        <td style="vertical-align: middle;">Candidate Name 6</td>
                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center"><input type="checkbox" onclick="checkTotalCheckedBoxes();" id="candidate" name="candidate" value="<%//=data_pos_list.get(row).get(3) %>"></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">7</td>
                        <td style="vertical-align: middle;">Candidate Name 7</td>
                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center"><input type="checkbox" onclick="checkTotalCheckedBoxes();" id="candidate" name="candidate" value="<%//=data_pos_list.get(row).get(3) %>"></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">8</td>
                        <td style="vertical-align: middle;">Candidate Name 8</td>
                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center">-</td>
                        <td style="vertical-align: middle; text-align: center"><input type="checkbox" onclick="checkTotalCheckedBoxes();" id="candidate" name="candidate" value="<%//=data_pos_list.get(row).get(3) %>"></td>
                    </tr>
                </tbody>
            </table>
            </form>
        </div>
        <div class="row">
            <form method="post" action="process/bpsm/eInterview/e_int_submit_to_chairman_process.jsp">
                <div class="col-sm-12"><button type="submit" class="btn btn-success form-control"><span style="color: white">Submit To Chairman</span></button></div>
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