<?php
	$smarty->assign('meta', array(
		'title' => $sitename_caps,
		'description' => $site_description,
		'keywords' => $sitename_caps
	));

	require('content/header.php');
	require('content/footer.php');

	$row = getRecord($query = "select * from pricing where deleted=0;");
	$smarty->assign('row', $row);
	
	$smarty->display('pricing.tpl');
?>
