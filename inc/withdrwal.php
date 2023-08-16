<?php
	session_start();
	require_once('../configs/config.php');

	check_login();
	require_once(SCRIPTS_DIR . "tspl/DB3.php");
		
	opendb();
	global $userid, $session;
	
	if(@$_REQUEST['amount'])
	{
		$balance = getRecordField($query = "select balance from user where id='{$userid}' and deleted=0;");
		if(floatval($balance) >= floatval($_REQUEST['amount']))
			header("Location: {$server_url}withdrwal?reason=balance");
	}
	
		
	$query = "insert into transactions(type, amount, userid, date, time, message) values('withdraw', '{$_REQUEST['amount']}', '{$userid}', curdate(), '" . date("H:i") . "', 'Withdraw Request');";
	tspl_query($query);
	
	closedb();		
	
	header("Location: {$server_url}withdrwal?reason=success");
?>