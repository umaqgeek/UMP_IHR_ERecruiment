
<%@page import="libraries.My_func"%>
<%@page import="config.Config"%>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>UMP-IMS E-Recruitment</title>

        <!-- Bootstrap Core CSS -->
        <link href="<%=Config.getBase_url(request) %>assets/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="<%=Config.getBase_url(request) %>assets/css/landing-page.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="<%=Config.getBase_url(request) %>assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- jQuery -->
        <script src="<%=Config.getBase_url(request) %>assets/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<%=Config.getBase_url(request) %>assets/js/bootstrap.min.js"></script>
        
        <link href="<%=Config.getBase_url(request) %>assets/img/ump-logo.png" rel="shortcut icon" type="image/vnd.microsoft.icon" />
        
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="<%=Config.getBase_url(request) %>assets/js/ie10-viewport-bug-workaround.js"></script>
        
        <!-- Custom CSS -->
        <link href="<%=Config.getBase_url(request) %>assets/css/sb-admin.css" rel="stylesheet">
        
        <%
        String msgINFO = "-";
        try {
            msgINFO = request.getAttribute(My_func.INFO_KEY).toString();
            out.print("<script>alert('"+msgINFO+"');</script>");
            msgINFO = "-";
            request.removeAttribute(My_func.INFO_KEY);
        } catch (Exception e) {
        }
        %>
        
        <%
        String msgERROR = "-";
        try {
            msgERROR = request.getAttribute(My_func.ERROR_KEY).toString();
            out.print("<script>alert('"+msgERROR+"');</script>");
            msgERROR = "-";
            request.removeAttribute(My_func.ERROR_KEY);
        } catch (Exception e) {
        }
        %>
        
        <%
        String msgSUCCESS = "-";
        try {
            msgSUCCESS = request.getAttribute(My_func.SUCCESS_KEY).toString();
            out.print("<script>alert('"+msgSUCCESS+"');</script>");
            msgSUCCESS = "-";
            request.removeAttribute(My_func.SUCCESS_KEY);
        } catch (Exception e) {
        }
        %>

    </head>
    <body>