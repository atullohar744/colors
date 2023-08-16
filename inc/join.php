<?php
	session_start();
	require_once('../configs/config.php');

	check_login();
	require_once(SCRIPTS_DIR . "tspl/DB3.php");
		
	opendb();
	global $userid, $session;
	
	$balance = getRecordField($query = "select balance from user where id='{$userid}';");
	if(floatval($balance) < floatval(@$_REQUEST['finalamount'])){
		echo "<h4>Fail !</h4><p>The balance is not enough !</p>";
		exit();
	}
	
	$values = array(
		'userid' => $userid,
		'digit' => intval(@$_REQUEST['digit']?$_REQUEST['digit']:@$_REQUEST['number']),
		'color' => @$_REQUEST['color'],
		'amount' => floatval(@$_REQUEST['finalamount']),
		'period' => @$_REQUEST['inputgameid'],
		'bdate' => getRecordField($query = "select now();")
	);
	
	DB3::updateObject('joined_users', $values);
	
	$query = "update user set balance=balance-'{$values['amount']}' where id='{$userid}';";
	tspl_query($query);
	
	$query = "insert into transactions (type, amount, userid, remark) values('debit', '" . floatval($values['amount']) . "', '{$values['userid']}', 'Betting Amount')";
	tspl_query($query);
	
	closedb();		
	
	echo "<h4>Completed</h4><p>Your contract is successful completed</p>";
	exit();
?>