<%-- 
    Document   : e_int_pre_interview_result
    Created on : Feb 7, 2016, 11:14:53 AM
    Author     : Habib
--%>

<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="process.jsp?p=BPSM/E-Interview/e_int_published_list.jsp" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <h1></h1>
            <h4>PRE-INTERVIEW RESULT</h4>
        </div>
        <div class="row">
            <table style="width: 100%" class="table-condensed">
                <tbody>
                     <tr>
                        <td style="vertical-align: middle; font-weight: bold; width: 20%">Grade</td>
                        <td style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">:</td>
                        <td style="vertical-align: middle">Grade 1</td>
                     </tr>
                     <tr>
                        <td style="vertical-align: middle; font-weight: bold">Position</td>
                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                        <td style="vertical-align: middle">Position 1</td>
                     </tr>
                     <tr>
                        <td style="vertical-align: middle; font-weight: bold">PTJ</td>
                        <td style="vertical-align: middle; text-align: center; font-weight: bold">:</td>
                        <td style="vertical-align: middle">PTJ 1</td>
                     </tr>
                </tbody>
            </table>
            
            <table class="table-bordered" width="100%">
            <thead style="vertical-align: middle;">
                <tr style="vertical-align: middle;">
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Name</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">IC Number</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Total Mark</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Result</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="vertical-align: middle; text-align: center">1</td>
                    <td style="vertical-align: middle;">Candidate Name 1</td>
                    <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                    <td style="vertical-align: middle; text-align: center">110</td>
                    <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">PASS</td>
                </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">2</td>
                        <td style="vertical-align: middle;">Candidate Name 2</td>
                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                        <td style="vertical-align: middle; text-align: center">120</td>
                        <td style="vertical-align: middle; text-align: center; color: limegreen; font-weight: bold">PASS</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">3</td>
                        <td style="vertical-align: middle;">Candidate Name 3</td>
                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                        <td style="vertical-align: middle; text-align: center">2</td>
                        <td style="vertical-align: middle; text-align: center; "><a data-toggle="modal" href="#modalReason" style="color: red; font-weight: bold">FAIL</a></td>
                    </tr>
                </tbody>
            </table>
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
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_published_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<!-- Modal Reason -->
<div id="modalReason" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4 class="modal-title" style="font-weight: bold">FAIL REASON</h4>
            </div>
            <div class="modal-body" align="center">
                <fieldset>
                    <h6 class="modal-title">This candidate shown the rude attitude</h6>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<!-- ENd Modal Reason -->
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