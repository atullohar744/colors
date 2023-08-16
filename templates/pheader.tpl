<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,viewport-fit=cover,user-scalable=no">
		<meta http-equiv="Expires" content="0">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Cache" content="no-cache">
		<meta name="description" content="{{#server_url#}}">
		<meta name="keywords" content="Geme,Crash,play">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta property="url" content="{{#server_url#}}">
		<meta property="type" content="article">
		<meta property="title" content="{{if $settings.title}}{{$settings.title}}{{else}}{{#sitename_caps#}}{{/if}}">
		<meta property="description" content="{{#server_url#}}">
		<meta property="image" ccontent="logo.png">
		<meta property="site_name" content="YOSWIN Easily Earn 1 Crore">
		<meta property="author" content="{{if $settings.title}}{{$settings.title}}{{else}}{{#sitename_caps#}}{{/if}}">
		<link rel="shortcuticon icon" type="image/x-icon" href="/favicon.ico">
		<title>{{if $settings.title}}{{$settings.title}}{{else}}{{#sitename_caps#}}{{/if}}</title>
		<link href="{{#scripts_url#}}yoswin/chunk-vendors.c522d089.css?t={{$smarty.now|date_format:'%d%m%Y%H%I%S'}}" rel="stylesheet">
		<link href="{{#scripts_url#}}yoswin/app.38811e6a.css?t={{$smarty.now|date_format:'%d%m%Y%H%I%S'}}" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="{{#scripts_url#}}yoswin/100.4f034e44.css?t={{$smarty.now|date_format:'%d%m%Y%H%I%S'}}">
		
		<script type="text/javascript" src="{{#server_url#}}scripts/jquery.min.js"></script>
		<script type="text/javascript" src="{{#server_url#}}scripts/jquery.form.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script type="text/javascript">
			//	jQuery.noConflict();
			var base = '{{#server_url#}}';
			var currency = '$';
			var base_scripts = '{{#scripts_url#}}';
			var userid = '{{$smarty.session.$session.userid}}';
			
		</script>
	</head>
	<body dm="true" c="in" s="s1" class="in">
