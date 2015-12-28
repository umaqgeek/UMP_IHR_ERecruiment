<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->

        <div class="modal-content">
            <form method="post" action="Register">
                <div class="modal-header">
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