<?php
	$smarty->assign('meta', array(
		'title' => $sitename_caps,
		'description' => $site_description,
		'keywords' => $sitename_caps
	));
	
	global $userid, $server_url;
	
	if(!app_login($userid, 'user'))
		header('Location: ' . $server_url . 'plogin');
	
	require('content/header.php');
	require('content/footer.php');
	
	$smarty->assign('notifications', getRecords($query = "select * from notifications where deleted=0;"));
	
	$smarty->assign('user', getRecord($query = "select * from user where deleted=0 and id='{$userid}';"));

	$smarty->display('notifications.tpl');
?>
