<?php
	$smarty->assign('meta', array(
		'title' => $sitename_caps,
		'description' => $site_description,
		'keywords' => $sitename_caps
	));

	require('content/header.php');
	require('content/footer.php');

	$records = getRecords($query = "select * from numbers where deleted=0;");
	$smarty->assign('records', $records);
	
	$smarty->display('numbers.tpl');
?>
