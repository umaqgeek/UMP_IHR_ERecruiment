


    <div id="wrapper">

        <jsp:include page="../menu.jsp"></jsp:include>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        
                        <table class="table table-bordered">
                            <tr>
                                <td>
                                    <h3>Profile</h3><hr />
                                    <img src="assets/img/profileMale.png" weight="200" height="200" />
                                    <button class="btn btn-info">Upload</button>
                                </td>
                                <td>
                                    <h3>Updating Profile</h3> (Please click menu to update your resume)<hr />
                                    <div class="col-md-6">
                                        <ul>
                                            <li><a href="?m=Application-Personal"><span class="glyphicon glyphicon-list"> Personal Info</span></a></li>
                                            <li><a href="?m=Application-Academic"><span class="glyphicon glyphicon-list"> Academic</span></a></li>
                                            <li><a href="#!"><span class="glyphicon glyphicon-list"> Professional Certificate</span></a></li>
                                            <li><a href="#!"><span class="glyphicon glyphicon-list"> KPSL</span></a></li>
                                            <li><a href="?m=Application-Working"><span class="glyphicon glyphicon-list"> Experiences</span></a></li>
                                            <li><a href="#!"><span class="glyphicon glyphicon-list"> Appendix</span></a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6">
                                        <ul>
                                            <li><a href="#!"><span class="glyphicon glyphicon-list"> Skills</span></a></li>
                                            <li><a href="#!"><span class="glyphicon glyphicon-list"> Language</span></a></li>
                                            <li><a href="#!"><span class="glyphicon glyphicon-list"> Outdoor Activities</span></a></li>
                                            <li><a href="#!"><span class="glyphicon glyphicon-list"> Achievements</span></a></li>
                                            <li><a href="#!"><span class="glyphicon glyphicon-list"> My Vision</span></a></li>
                                            <li><a href="#!"><span class="glyphicon glyphicon-list"> References</span></a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <h3>Application</h3> <hr />
                                    <h4>Position</h4>
                                    <button class="btn btn-info" onclick="location.href='?m=Application-Job';">Apply New Position</button>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#.</th>
                                                <th>Position</th>
                                                <th>Grade</th>
                                                <th>Department</th>
                                                <th>Field</th>
                                                <th>Status of Application</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                    <br />
                                    <h4>Fellowship Scheme</h4>
                                    <button class="btn btn-info">Apply New Fellowship</button>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#.</th>
                                                <th>Position</th>
                                                <th>Grade</th>
                                                <th>Department</th>
                                                <th>Field</th>
                                                <th>Status of Application</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
