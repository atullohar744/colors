<?php
	session_start();
	require('../configs/config.php');
	opendb();
	global $userid, $server_url;
	$user = getRecord($query = "select * from user where id='{$userid}';");
	
	if($user && @$_POST['payment_id'])
	{
		$query = "update user set balance=balance+'" . floatval($_REQUEST['amount']) . "' where id='{$userid}';";
		tspl_query($query);
		
		$query = "insert into transactions (type, amount, userid, remark) values('credit', '" . floatval($_REQUEST['amount']) . "', '{$userid}', 'Recharge')";
		tspl_query($query);

		closedb();
		echo "success";
		// header("Location: {$server_url}recharge?status=Success");
	}
	else
	{
		closedb();
		
		echo 'failed';
		// header("Location: {$server_url}recharge?status=$status");
	}
	exit();
?>