        <div class="container">

            <form class="form-signin" action="Index" method="post">
                <h2 class="form-signin-heading">e-Recruitment</h2>
                <label for="id" class="sr-only">User ID</label>
                <input type="text" id="userid" name='userid' class="form-control" placeholder="Identification Number" >
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="pwd" name='pwd' class="form-control" placeholder="Password">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                <a style="float:justify;"href="#" data-toggle="modal" data-target="#myModal">New Registration</a>&nbsp;&nbsp;
                <a style="float:right;"href="#" data-toggle="modal" data-target="#">Forgot Password?</a>
            </form>

            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->

                    <div class="modal-content">
                        <form method="post" action="Register">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">New Registration</h4>
                            </div>
                            <div class="modal-body">

                                <fieldset>
                                    <legend>Personal Information:</legend>
                                    <label for="id">My ID</label>
                                    <input type="text" id="c_icno" name="c_icno" class="form-control" placeholder="Identification Number &nbsp;/&nbsp; Passport Number">
                                    <label for="name">Name</label>
                                    <input type="text" id="c_name" name="c_name" class="form-control" placeholder="Name" >
                                    <label for="phoneEmail">E-Mail Address</label>
                                    <input type="text" id="l_email" name="l_email" class="form-control" placeholder="E-Mail Address" >
                                    <label for="inputUsername" >Username</label>
                                    <input type="text" id="l_username" name="l_username" class="form-control" placeholder="Username" >
                                    <label for="inputPassword">Password</label>
                                    <input type="password" id="l_password" name="l_password" class="form-control" placeholder="Password">
                                </fieldset>
                                <fieldset>
                                    <legend>Security Question:</legend>
                                    <div class="form-group">
                                        <select class="form-control" id="l_safequest" name="l_safequest">
                                            <option>What is your mother name?</option>
                                            <option>What is your first cat name?</option>
                                            <option>Where is your first school?</option>
                                            <option>What color is your first bike?</option>
                                        </select>
                                    </div>
                                    <label for="answer">Answer</label>
                                    <input type="text" id="l_safeans" name="l_safeans" class="form-control" placeholder="Answer" >
                                </fieldset>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-default">Register</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>

        </div> <!-- /container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>
