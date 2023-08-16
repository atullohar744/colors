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
	
	$smarty->assign('bank', getRecord($query = "select * from user_banks where deleted=0 and userid='{$userid}';"));

	$smarty->display('bank.tpl');
?>
