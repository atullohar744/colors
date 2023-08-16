<?php
	function edit_dresult($id){
		if($futureid = @$_REQUEST['period']){
			$query = "update joined_users set winner=1 where digit='{$record['digit']}' and declared=0 and period='{$futureid}';";
			tspl_query($query);
			
			$query = "update joined_users set declared=1 where period='{$futureid}' and declared=0;";
			tspl_query($query);
			
			$pricing = getRecord($query = "select * from pricing where deleted=0;");
			
			$results = getRecords($query = "select j.*, n.green, n.purple, n.red from joined_users j, numbers n where j.deleted=0  and period='{$futureid}' and j.winner=1 and n.digit=j.digit order by id desc;");
			
			foreach ($results as $key => $value) {
				if($value['green'])
					$rates = explode(":", $pricing['green_color']);
				else if($value['purple'])
					$rates = explode(":", $pricing['purple_color']);
				elseif($value['red'])
					$rates = explode(":", $pricing['red_color']);
				
				$rate = array_sum($rates);
				
				$query = "update user set balance=balance+'" . floatval($value['amount']) * floatval($rate) . "' where id='{$value['userid']}';";
				tspl_query($query);
				
				$query = "insert into transactions (type, amount, userid, remark) values('winning', '" . floatval($value['amount']) * floatval($rate) . "', '{$value['userid']}', 'Winnig Amount')";
				tspl_query($query);
			}
		}
	}
	
	function editor_dresult($id){
		global $smarty;
		$period = getRecordField($query = "select period from periods where deleted = 0 order by id desc;");
		$smarty->assign('period', $period);
		
		$time = getRecordField($query = "select now();");
		$smarty->assign('stime', date("Y-m-d H:i:s", strtotime($time)));
	}
	
	$objects['dresult'] = array(
		'meta' => array(
			'access' => ($_SESSION[$session]['usertype'] == 'Administrator'),
			'singular' => 'Declare Result',
			'plural' => 'Declare Results',
			'table' => 'declare_result',
			'default_sort_field' => 'id',
			'default_sort_order' => 'desc',
			'add' => true,
			'edit' => true,
			'search' => true,
			'details' => true,
			'delete' => true,
			'fullpage' => false,
			'editor' => 'manager/declare_result.tpl',
			'filter' => "deleted=0"
		),
		'fields' => array(
			'period' => array(
				'displayname' => 'Period',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'validation' => 'required',
			),
			'digit' => array(
				'displayname' => 'Number',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'select',
				'options' => array('0' => '0', '1' => '1', '2' => '2', '3' => '3', '4' => '4', '5' => '5', '6' => '6', '7' => '7', '8' => '8', '9' => '9'),
				'assoc' => true,
				'validation' => 'required',
			),
			'dt' => array(
				'displayname' => 'Date',
				'sort' => true,
				'list' => true,
				'edit' => false,
				'search' => false,
				'details' => true,
				'input' => 'datetime',
				'validation' => 'required',
			),
		)
	);
?>
