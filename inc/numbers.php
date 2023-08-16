<?php
	session_start();
	require_once('../configs/config.php');

	check_login();
	require_once(SCRIPTS_DIR . "tspl/DB3.php");
		
	opendb();
	global $userid, $session;
	
	foreach ($_REQUEST['number'] as $key => $value) {
		$values = array(
				'id' => intval($_REQUEST['id'][$key]),
				'digit' =>$value,
				'green' => intval($_REQUEST['color'][$key] == 'green'?1:0),
				'purple' => intval($_REQUEST['color'][$key] == 'purple'?1:0),
				'red' => intval($_REQUEST['color'][$key] == 'red'?1:0),
			);
		DB3::updateObject('numbers', $values);
	}
	
	closedb();		
	
	header("Location: {$server_url}numbers?status=updated");
?>