<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!--
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
-->
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript">

function gup( name )
{
	name = name.replace( /[\[]/, '\\\[' ).replace( /[\]]/, '\\\]' ) ;
	var regexS = '[\\?&]' + name + '=([^&#]*)' ;
	var regex = new RegExp( regexS ) ;
	var results = regex.exec( window.location.href ) ;

	if ( results )
		return results[ 1 ] ;
	else
		return '' ;
}

var interval;

function sendData2Master()
{
	var destination = window.parent.parent ;
	try
	{
		if ( destination.XDTMaster )
		{
			var t = destination.XDTMaster.read( [ gup( 'cmd' ), gup( 'data' ) ] ) ;
			window.clearInterval( interval ) ;
		}
	}
	catch (e) {}
}

function onLoad()
{
	interval = window.setInterval( sendData2Master, 100 );
}

</script>
</head>
<body onload="onLoad()"><p></p></body>
</html>
