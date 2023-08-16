<?php
	session_start();
	require_once('../configs/config.php');

	check_login();
	require_once(SCRIPTS_DIR . "tspl/DB3.php");
		
	opendb();
	global $userid, $session;
	$fields = array('red_color', 'purple_color', 'green_color');
	
	$values = array();
	foreach ($fields as $f) {
		$values[$f] = $_REQUEST[$f];
	}
	
	$values['vip_red_color'] = intval(@$_REQUEST['vip_red_color']);
	$values['vip_purple_color'] = intval(@$_REQUEST['vip_purple_color']);
	$values['vip_green_color'] = intval(@$_REQUEST['vip_green_color']);
	$values['vip_numbers'] = intval(@$_REQUEST['vip_numbers']);
	$values['vip_records'] = intval(@$_REQUEST['vip_records']);
	$values['id'] = intval(@$_REQUEST['id']);
	
	DB3::updateObject('pricing', $values);
	closedb();		
	
	header("Location: {$server_url}pricing?status=updated");
?>