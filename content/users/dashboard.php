<?php
	check_login();

	$smarty->assign('meta', array(
		'title' => "Dashboard",
		'description' => "$sitename_caps",
		'keywords' => $sitename_caps
	));

	require('content/header.php');
	require('content/footer.php');

	global $testsite, $userid, $session;
	
	$smarty->assign('customers', getRecordField($query = "select count(id) as cnt from user where usertype='user' and deleted=0 and status=1;"));
	$smarty->assign('banners', getRecordField($query = "select count(id) as cnt from banners where deleted=0;"));
	
	$smarty->display('users/dashboard.tpl');
?>