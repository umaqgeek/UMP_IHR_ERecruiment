<%@page import="config.Config"%>
<div class="container">

    <form class="form-signin" action="process/login_process.jsp" method="post">
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
        <a style="float:justify;" href="process.jsp?p=registration.jsp" data-toggle="modal" data-target="#myModal">New Registration</a>&nbsp;&nbsp;
        <a style="float:right;" href="#" data-toggle="modal" data-target="#">Forgot Password?</a>
    </form>



</div> <!-- /container -->


