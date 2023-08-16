<?php
	session_start();
	require_once('../configs/config.php');

	check_login();
	require_once(SCRIPTS_DIR . "tspl/DB3.php");
		
	opendb();
	global $userid, $session, $server_url;
	
	$balance = getRecordField($query = "select balance from user where id='{$userid}';");
	if(floatval($balance) < floatval(@$_REQUEST['betAmount'])){
		echo 'Not enough balance';
		exit();
	}
	
	$values = array(
		'userid' => $userid,
		'name' => @$_REQUEST['name'],
		'ifsc' => @$_REQUEST['ifsc'],
		'bank_name' => @$_REQUEST['bank_name'],
		'bank_account' => @$_REQUEST['bank_account'],
		'upi' => @$_REQUEST['upi'],
		'email' => @$_REQUEST['email'],
	);
	
	if(@$_REQUEST['id'])
		$values['id'] = intval($_REQUEST['id']);
	
	DB3::updateObject('user_banks', $values);
	
	closedb();		
	
	header("Location: {$server_url}bank?status=Success");
?>