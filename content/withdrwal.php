<?php
	$smarty->assign('meta', array(
		'title' => $sitename_caps,
		'description' => $site_description,
		'keywords' => $sitename_caps
	));
	
	global $userid, $server_url;
	
	if(!app_login($userid, 'user'))
		header('Location: ' . $server_url . 'plogin');
	
	$smarty->assign('settings', getRecord($query = "select * from site_settings where deleted=0 limit 1;"));
	
	$smarty->assign('user', getRecord($query = "select * from user where deleted=0 and id='{$userid}';"));
	
	$smarty->assign('bank', getRecordField($query = "select id from user_banks where userid='{$userid}' and deleted=0;"));

	$smarty->display('withdrwal.tpl');
?>
