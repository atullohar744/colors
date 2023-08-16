<?php
	session_start();
	require_once('../configs/config.php');
	require_once(SCRIPTS_DIR . "tspl/DB3.php");
		
	opendb();
	global $userid, $session;
	
	if(@$_REQUEST['phone'])
	{
		if(getRecordField($query = "select id from user where phone='{$_REQUEST['phone']}' and deleted=0 and usertype='user';"))
			header("Location: {$server_url}register?reason=dphone");
		else if(getRecordField($query = "select id from user where referral_code='{$_REQUEST['referral']}' and deleted=0;"))
			header("Location: {$server_url}register?reason=referral");
	}
	
	$fields = array('name', 'phone', 'pass');
	
	$values = array();
	foreach ($fields as $f) {
		if($_REQUEST[$f])
			$values[$f] = $_REQUEST[$f];
	}
	$values['usertype'] = 'user';
	$id = DB3::updateObject('user', $values);
	
	$query = "update user set referral_code='PARI" . sprintf("%04d", $id) . "' where id='{$id}';";
	tspl_query($query);
	
	if(@$_REQUEST['referral']){
		$referId = getRecordField($query = "select id from user where referral_code='{$_REQUEST['referral']}' and deleted=0;");
		
		$query = "insert into transactions(type, amount, userid, date, time, message) values('credit', '100', '{$referId}', curdate(), '" . date("H:i") . "', 'Referral bonus');";
		tspl_query($query);
		
		$query = "update user set balance=balance+100 where id='{$referId}';";
		tspl_query($query);
		
		$query = "insert into transactions(type, amount, userid, date, time, message) values('credit', '50', '{$id}', curdate(), '" . date("H:i") . "', 'Referral bonus');";
		tspl_query($query);
		
		$query = "update user set parentId='{$referId}', balance=balance+50 where id='{$id}';";
		tspl_query($query);
	}
	
	closedb();		
	
	header("Location: {$server_url}register?reason=success");
?>