<%@page import="helpers.Func"%>
<%@page import="controller.Session"%>
<%@page import="libraries.My_func"%>
<%@page import="config.Config"%>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        
		<!-------->
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="<%=Config.getBase_url(request) %>assets/css/main.css" />
		<!---<link rel="stylesheet" href="<%=Config.getBase_url(request) %>assets/css/bootstrap.css" />-->
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

        <title>UMP-IMS E-Recruitment</title>

        <link href="<%=Config.getBase_url(request) %>assets/fonts/font.css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" href="<%=Config.getBase_url(request) %>assets/css/bootstrap.min.css" />
        <!-- Scripts -->
        
        <script src="<%=Config.getBase_url(request) %>assets/js/jquery.min.js"></script>
        <script src="<%=Config.getBase_url(request) %>assets/js/skel.min.js"></script>
        <script src="<%=Config.getBase_url(request) %>assets/js/util.js"></script>
        <script src="<%=Config.getBase_url(request) %>assets/js/main.js"></script>
        <link href="<%=Config.getBase_url(request) %>assets/img/ump-logo.png" rel="shortcut icon" type="image/vnd.microsoft.icon" />
        
        <script src="<%=Config.getBase_url(request) %>assets/js/jquery-1.11.3.min.js"></script>
	<script src="<%=Config.getBase_url(request) %>assets/js/bootstrap.min.js"></script>
	<script src="<%=Config.getBase_url(request) %>assets/js/highcharts.js"></script>
	<script src="<%=Config.getBase_url(request) %>assets/js/exporting.js"></script>
     <script src="<%=Config.getBase_url(request) %>assets/js/accordion.js"></script>   
	<script src="<%=Config.getBase_url(request) %>assets/ckeditor/ckeditor.js"></script>
        
<!--        <script src="<%=Config.getBase_url(request) %>assets/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="<%=Config.getBase_url(request) %>assets/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>-->
        
        <script src="<%=Config.getBase_url(request) %>assets/js/jquery.dataTables.min.js"></script>
        <link href="<%=Config.getBase_url(request) %>assets/css/jquery.dataTables.min.css" />
		
		
 
        
        <%
        String msgINFO = "-";
        try {
            msgINFO = request.getParameter(My_func.INFO_KEY).toString();
            out.print("<script>alert('"+msgINFO+"');location.href='index.jsp';</script>");
            msgINFO = "-";
            request.removeAttribute(My_func.INFO_KEY);
        } catch (Exception e) {
        }
        %>
        
        <%
        String msgERROR = "-";
        try {
            msgERROR = request.getParameter(My_func.ERROR_KEY).toString();
            out.print("<script>alert('"+msgERROR+"');location.href='index.jsp';</script>");
            msgERROR = "-";
            request.removeAttribute(My_func.ERROR_KEY);
        } catch (Exception e) {
        }
        %>
        
        <%
        String msgSUCCESS = "-";
        try {
            msgSUCCESS = request.getParameter(My_func.SUCCESS_KEY).toString();
            out.print("<script>alert('"+msgSUCCESS+"');location.href='index.jsp';</script>");
            msgSUCCESS = "-";
            request.removeAttribute(My_func.SUCCESS_KEY);
        } catch (Exception e) {
        }
        %>
        
        <%
        // session only allow pages that allowed to be logged in
        String allowPages[] = {
            "WEB-INF/jsp/login.jsp", 
            "WEB-INF/jsp/registration.jsp",
            "WEB-INF/jsp/forgot_password.jsp",
        };
        try {
            String pageURL = session.getAttribute(Session.SESSION_KEY).toString();
            boolean isMatch = Func.isMatchString(pageURL, allowPages);
            if (!session.getAttribute(Session.KEY_IS_LOGGED_IN).equals("true") && !isMatch) {
                pageURL = allowPages[0];
                session.setAttribute(Session.SESSION_KEY, pageURL);
                response.sendRedirect(Config.getBase_url(request) + "process.jsp?p=" + pageURL);
            }
        } catch (Exception e) {
            String pageURL = My_func.LOGIN_URL;
            boolean isMatch = Func.isMatchString(pageURL, allowPages);
            if (!isMatch) {
                pageURL = allowPages[0];
                session.setAttribute(Session.SESSION_KEY, pageURL);
                response.sendRedirect(Config.getBase_url(request) + "process.jsp?p=" + pageURL);
            }
        }
        %>

        <script>
            $(document).ready(function () {
                //$("#txtEditor").Editor();
            });
        </script>
		
		<style>
		#article{
			
		color:black;
		background-color:rgba(46, 186, 174, 0.05);
		}
		
		
		
		
		</style>
		
		
		
    </head>
    <body  >
        <br/><%=session.getAttribute(Session.SESSION_KEY) %>
        <br />

        <div id="wrapper">