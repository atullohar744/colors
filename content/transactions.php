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
	
	$where = "";
	
	if(@$_REQUEST['mode'] == 'recharge')
		$where .= " and remark='Recharge'";
	else
		$where .= " and remark!='Recharge'";
	
	if(@$_REQUEST['account'] == 'b')
		$where .= " and type='debit'";
	else if(@$_REQUEST['account'] == 'w')
		$where .= " and type='winning'";
	else if(@$_REQUEST['mode'] == 'withdrwal')
		$where .= " and type='withdraw'";
	
	if(@$_REQUEST['type'] == 'week')
		$where .= " and DATE_FORMAT(date, '%Y-%m-%d') between DATE_SUB(curdate(), INTERVAL 7 DAY) and curdate()";
	else if(@$_REQUEST['type'] == '3month')
		$where .= " and month(date) between month(curdate()) and month(date_sub(curdate(), INTERVAL 3 MONTH)) and YEAR(date) between YEAR(date_sub(curdate(), INTERVAL 3 MONTH)) and YEAR(date) = YEAR(curdate())";
	else if(@$_REQUEST['type'] == 'month')
		$where .= " and month(date) = month(curdate()) and YEAR(date) = YEAR(curdate())";
	else
		$where .= " and DATE_FORMAT(date, '%Y-%m-%d') between curdate() and  curdate()";
	
	$smarty->assign('transactions', getRecords($query = "select * from transactions where deleted=0 and userid='{$userid}' {$where};"));
	
	$smarty->assign('user', getRecord($query = "select * from user where deleted=0 and id='{$userid}';"));

	$smarty->display('transactions.tpl');
?>
