<?php
	session_start();
	require('../configs/config.php');
	opendb();
	global $userid, $server_url;
	
	$user = getRecord($query = "select * from user where id='{$userid}';");
	if($user['pass'] != $_REQUEST['opass'])
		header("Location: {$server_url}presetpswd?status=oldp");
	
	if($user)
	{
		$query = "update user set pass='{$_REQUEST['npass']}' where id='{$userid}';";
		tspl_query($query);

		closedb();
		header("Location: {$server_url}plogout");
	}
	else
	{
		closedb();
		
		$status = 'failed';
		header("Location: {$server_url}presetpswd?status=$status");
	}
?>