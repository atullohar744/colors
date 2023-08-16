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
	$time = getRecordField($query = "select now();");
	
	$stime = date("Y-m-d H:i:s", strtotime('-1 minutes', strtotime(date("Y-m-d H:i:00", strtotime($time)))));
	$etime = date("Y-m-d H:i:s", strtotime('-1 minutes', strtotime(date("Y-m-d H:i:59", strtotime($time)))));
	
	$order = (@$_REQUEST['type'] == 'c'?" j.id asc":(@$_REQUEST['type'] == 'p'?" u.id desc":"j.id desc"));
	$where = "";
	
	$results = getRecords($query = "select j.*, n.green, n.purple, n.red, u.phone from joined_users j, numbers n, user u where j.deleted=0 and j.dt between '{$stime}' and '{$etime}' and n.digit=j.digit and u.id=j.userid {$where} order by {$order};");
	
	if(!count($results))
		$results = getRecords($query = "select j.*, n.green, n.purple, n.red, u.phone from joined_users j, numbers n, user u where j.deleted=0 and n.digit=j.digit and u.id=j.userid {$where} order by {$order};");
	
	$smarty->assign('results', $results);
	$smarty->assign('users', $results);
	

	$smarty->display('betRecords.tpl');
?>
