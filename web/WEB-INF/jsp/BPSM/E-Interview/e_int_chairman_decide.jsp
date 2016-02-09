<%-- 
    Document   : e_int_chairman_decide
    Created on : Feb 6, 2016, 11:41:14 PM
    Author     : Habib
--%>

<%-- 
    Document   : e_int_interview_room
    Created on : Feb 6, 2016, 8:46:32 PM
    Author     : User
--%>
<form action="process/bpsm/eInterview/e_int_save_chairman_decision_process.jsp" method="post">
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <h4>Chairman Marking Form:</h4>
            <table style="width: 100%" class="table-bordered">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">NAME</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 8%">PANEL 1</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 8%">PANEL 2</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 8%">PANEL 3</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 8%">PANEL 4</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 8%">PANEL 5</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">TOTAL MARK</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">DECISION</th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle"><a>Candidate Name</a></td>
                        <td style="vertical-align: middle; text-align: center">80<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">75<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">70<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">90<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">80<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">395</td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option selected disabled>-Choose-</option>
                                <option>PASS</option>
                                <option>FAIL</option>
                                <option>KIV</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">2</td>
                        <td style="vertical-align: middle"><a>Candidate Name</a></td>
                        <td style="vertical-align: middle; text-align: center">30<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">40<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">20<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">40<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">20<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">150</td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option selected disabled>-Choose-</option>
                                <option>PASS</option>
                                <option>FAIL</option>
                                <option>KIV</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">3</td>
                        <td style="vertical-align: middle"><a>Candidate Name</a></td>
                        <td style="vertical-align: middle; text-align: center">30<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">40<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">20<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">40<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">20<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">150</td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option selected disabled>-Choose-</option>
                                <option>PASS</option>
                                <option>FAIL</option>
                                <option>KIV</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">4</td>
                        <td style="vertical-align: middle"><a>Candidate Name</a></td>
                        <td style="vertical-align: middle; text-align: center">30<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">40<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">20<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">40<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">20<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">150</td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option selected disabled>-Choose-</option>
                                <option>PASS</option>
                                <option>FAIL</option>
                                <option>KIV</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; text-align: center">5</td>
                        <td style="vertical-align: middle"><a>Candidate Name</a></td>
                        <td style="vertical-align: middle; text-align: center">30<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">40<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">20<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">40<br><span style="color: limegreen; font-weight: bold">PASS</span></td>
                        <td style="vertical-align: middle; text-align: center">20<br><a style="color: red; font-weight: bold" href="#modalReason" data-toggle="modal">FAIL</a></td>
                        <td style="vertical-align: middle; text-align: center">150</td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option selected disabled>-Choose-</option>
                                <option>PASS</option>
                                <option>FAIL</option>
                                <option>KIV</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-sm-12"><button type="submit" class="btn btn-success form-control"><span style="color: white">Done & Save</span></button></div>
        </div>
    </div>
</div>
</form>

<!-- Modal Go Back -->
<div id="modalDiscard" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title" style="font-weight: bold">DISCARD THIS DECISION</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_start_chairman.jsp">OK</a>
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
