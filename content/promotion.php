<?php
	$smarty->assign('meta', array(
		'title' => $sitename_caps,
		'description' => $site_description,
		'keywords' => $sitename_caps
	));
	
	global $userid, $server_url;
	
	if(!app_login($userid, 'user'))
		header('Location: ' . $server_url . 'plogin');
	
	$smarty->assign('user', getRecord($query = "select * from user where deleted=0 and id='{$userid}';"));
	
	$cusers = getLevels($userid);
	
	$smarty->assign('cusers', $cusers);

	$smarty->display('promotion.tpl');
?>
