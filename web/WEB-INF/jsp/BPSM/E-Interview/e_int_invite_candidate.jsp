<%-- 
    Document   : e_int_invite_candidate
    Created on : Feb 5, 2016, 11:05:48 AM
    Author     : Habib
--%>

<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <div class="col-sm-12"><h4>INVITE CANDIDATE</h4></div>
        </div>
        <form method="post" action="process/bpsm/eInterview/e_int_invite_candidate_process.jsp">
        <div class="row">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab">
                        <h4 class="panel-title">
                            SHORTLISTED CANDIDATE TO PRE-INTERVIEW
                        </h4>
                    </div>
                    <div class="panel-body">              
                        <div class="row">
                            <table class="table-bordered" style="width: 100%">
                                <thead style="vertical-align: middle;">
                                <tr style="vertical-align: middle;">
                                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">#</th>
                                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">Grade</th>
                                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">Position</th>
                                    <th rowspan="2" style="vertical-align: middle; text-align: center; font-weight: bold">PTJ</th>
                                    <th colspan="3" style="vertical-align: middle; text-align: center; font-weight: bold">Candidate</th>
                                </tr>
                                <tr style="vertical-align: middle;">
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Name</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">IC Number</th>
                                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td rowspan="4" style="vertical-align: middle; text-align: center">1</td>
                                        <td rowspan="4" style="vertical-align: middle; text-align: center">Grade 1</td>
                                        <td rowspan="4" style="vertical-align: middle">Position 1</td>
                                        <td rowspan="4" style="vertical-align: middle">PTJ 1</td>
                                        <td style="vertical-align: middle;">Candidate Name 1</td>
                                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                                        <td style="vertical-align: middle; text-align: center"><a data-toggle="modal" href="#modalReason" style="color: red; font-weight: bold">REJECTED</a></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle;">Candidate Name 2</td>
                                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                                        <td style="vertical-align: middle; text-align: center"><a style="color: limegreen; font-weight: bold">ACCEPTED</a></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle;">Candidate Name 3</td>
                                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                                        <td style="vertical-align: middle; text-align: center"><a style="color: limegreen; font-weight: bold">ACCEPTED</a></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle;">Candidate Name 4</td>
                                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                                        <td style="vertical-align: middle; text-align: center"><a style="color: limegreen; font-weight: bold">ACCEPTED</a></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="4" style="vertical-align: middle; text-align: center">2</td>
                                        <td rowspan="4" style="vertical-align: middle; text-align: center">Grade 2</td>
                                        <td rowspan="4" style="vertical-align: middle">Position 2</td>
                                        <td rowspan="4" style="vertical-align: middle">PTJ 2</td>
                                        <td style="vertical-align: middle;">Candidate Name 1</td>
                                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                                        <td style="vertical-align: middle; text-align: center"><a style="color: limegreen; font-weight: bold">ACCEPTED</a></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle;">Candidate Name 2</td>
                                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                                        <td style="vertical-align: middle; text-align: center"><a style="color: limegreen; font-weight: bold">ACCEPTED</a></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle;">Candidate Name 3</td>
                                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                                        <td style="vertical-align: middle; text-align: center"><a style="color: limegreen; font-weight: bold">ACCEPTED</a></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle;">Candidate Name 4</td>
                                        <td style="vertical-align: middle; text-align: center"><a>12345789098</a></td>
                                        <td style="vertical-align: middle; text-align: center"><a style="color: limegreen; font-weight: bold">ACCEPTED</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <button type="submit" class="btn btn-warning form-control disabled"><span style="color: white">Invite Candidate</span></button><br/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- Modal Discard Setup -->
<div id="modalDiscard" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title" style="font-weight: bold">DISCARD THIS SETUP</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->
<!-- Modal Reason -->
<div id="modalReason" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4 class="modal-title">REJECT REASON</h4>
            </div>
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title">Not available on that date</h4>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<!-- End modal reason -->
