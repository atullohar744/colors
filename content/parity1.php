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
	
	$smarty->assign('numbers', getRecords($query = "select * from numbers where deleted=0 order by digit asc;"));
	
	$etime = date("Y-m-d H:i:s", strtotime(date("Y-m-d H:i:00", strtotime($time))));
	$stime = date("Y-m-d H:i:s", strtotime('-3 minutes', strtotime(date("Y-m-d H:i:59", strtotime($time)))));
	
	// $results = getRecords($query = "select j.*, n.green, n.purple, n.red, u.phone from joined_users j, numbers n, user u where j.deleted=0 and j.bdate between '{$stime}' and '{$etime}' and n.digit=j.digit and u.id=j.userid order by j.id desc;");
	
	$period = getRecordField($query = "select period from periods order by dt desc limit 1, 1");
	
	$results = getRecords($query = "select j.*, n.green, n.purple, n.red, u.phone from joined_users j, numbers n, user u where j.deleted=0 and period='{$period}' and n.digit=j.digit and u.id=j.userid order by j.id desc;");
	
	// if(!count($results))
		// $results = getRecords($query = "select j.*, n.green, n.purple, n.red, u.phone from joined_users j, numbers n, user u where j.deleted=0 and n.digit=j.digit and u.id=j.userid order by j.id desc;");
	
	$smarty->assign('results', $results);
	$smarty->assign('users', $results);
	
	$smarty->assign('stime', date("Y-m-d H:i:s", strtotime($time)));
	$smarty->assign('user', $user = getRecord($query = "select * from user where deleted=0 and id='{$userid}';"));
	
	$pricing = getRecord($query = "select * from pricing where deleted=0;");
	
	if(!$user['vip']){
		$pricing['vip_red_color'] = intval(@$pricing['vip_red_color'])?0:1;
		$pricing['vip_purple_color'] = intval(@$pricing['vip_purple_color'])?0:1;
		$pricing['vip_green_color'] = intval(@$pricing['vip_green_color'])?0:1;
		$pricing['vip_numbers'] = intval(@$pricing['vip_numbers'])?0:1;
		$pricing['vip_records'] = intval(@$pricing['vip_records'])?0:1;
	}
	else {
		$pricing['vip_red_color'] = 1;
		$pricing['vip_purple_color'] = 1;
		$pricing['vip_green_color'] = 1;
		$pricing['vip_numbers'] = 1;
		$pricing['vip_records'] = 1;
	}
	
	$smarty->assign('pricing', $pricing);
	
	$lastPeriodId = intval(getRecordField($query = "select period from periods where date_format(dt, '%Y%m%d')='" . date('Ymd') . "' order by period desc limit 1;"));
	$smarty->assign('futureid', $lastPeriodId);
	
	$smarty->assign('forVip', true);

	$smarty->display('parity1.tpl');
?>
