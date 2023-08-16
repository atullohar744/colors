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
	
	$results = getRecords($query = "select j.*, n.green, n.purple, n.red, u.phone, sum(j.amount) as amount from joined_users j, numbers n, user u, periods p where j.deleted=0 and j.winner=1 and n.digit=j.digit and u.id=j.userid and p.period=j.period group by j.period, j.digit order by j.id desc;");
	
	$smarty->assign('results', $results);

	$smarty->display('results.tpl');
?>
