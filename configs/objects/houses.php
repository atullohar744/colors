<?php

	function list_news($id){
		global $row;
	}
	
	function edit_houses($id){
		global $session, $userid;
		if(count(@$_REQUEST['imgpath']))
		{
			$ids = array();
			foreach ($_REQUEST['imgpath'] as $key => $value) {
				if($value)
				{
					$values = array(
						'id' => $key,
						'house' => intval(@$id),
						'imgpath' => tspl_escape_string($value)
					);
					$ids[] = DB3::updateObject('house_images', $values);
				}
			}
			
			if($ids)
			{
				$query = "update house_images set deleted=1 where house='{$id}' and deleted=0 and id not in(" . join(",", $ids) . ");";
				tspl_query($query);
			}
		}
		else{
			$query = "update house_images set deleted=1 where house='{$id}' and deleted=0;";
			tspl_query($query);
		}
		
		if($_SESSION[$session]['usertype'] == 'vendor'){
			$query = "update houses set vendor='{$_SESSION[$session]['userid']}' where id='{$id}' and deleted=0;";
			tspl_query($query);
		} 
	}
	
	function editor_houses($id){
		global $session, $smarty;
		if($id)
		{
			$smarty->assign('images', $images = getRecords($query = "select * from house_images where house='{$id}' and deleted=0;"));
		}
	}
	
	function details_houses($id){
		global $session, $smarty;
		if($id)
		{
			$smarty->assign('images', $images = getRecords($query = "select * from house_images where house='{$id}' and deleted=0;"));
		}
	}
	
	$objects['houses'] = array(
		'meta' => array(
			'access' => (in_array($_SESSION[$session]['usertype'], array('Administrator', 'vendor'))),
			'singular' => 'Farm House',
			'plural' => 'Farm Houses',
			'table' => 'houses',
			'default_sort_field' => 'id',
			'default_sort_order' => 'asc',
			'add' => true,
			'edit' => true,
			'search' => true,
			'details' => true,
			'delete' => true,
			'fullpage' => true,
			'editor' => 'manager/edit_news.tpl',
			'viewer' => 'manager/news_details.tpl',
			'filter' => "deleted=0" . ($_SESSION[$session]['usertype'] == 'vendor'? " and vendor='{$_SESSION[$session]['userid']}'":""),
		),
		'fields' => array(
			'vendor' => array(
				'displayname' => 'Vendor',
				'sort' => true,
				'list' => ($_SESSION[$session]['usertype'] == 'Administrator'),
				'edit' => ($_SESSION[$session]['usertype'] == 'Administrator'),
				'search' => ($_SESSION[$session]['usertype'] == 'Administrator'),
				'details' => ($_SESSION[$session]['usertype'] == 'Administrator'),
				'input' => 'select',
				'options' => DB3::findChildren('user', 'name', array(), "deleted=0 and usertype='vendor'"),
				'assoc' => true,
				'validation' => 'required',
			),
			'name' => array(
				'displayname' => 'Name',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'validation' => 'required',
			),
			'phone' => array(
				'displayname' => 'Contact',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'validation' => 'required',
			),
			'address' => array(
				'displayname' => 'Address',
				'sort' => true,
				'list' => false,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'textarea',
				'rows' => 10,
				'cols' => 15,
				'validation' => 'required'
			),
			'yards' => array(
				'displayname' => 'Yards (Sqare Foot)',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'bedrooms' => array(
				'displayname' => 'Bedrooms',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'day_capacity' => array(
				'displayname' => 'Day Capacity',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'night_capacity' => array(
				'displayname' => 'Night Capacity',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'category' => array(
				'displayname' => 'Category',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'select',
				'options' => DB3::findChildren('categories', 'name', array(), "deleted=0"),
				'assoc' => true,
				'validation' => 'required',
			),
			'amenities' => array(
				'displayname' => 'Amenities',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'checkbox',
				'type' => 'csv',
				'options' => DB3::findChildren('amenities', 'name', array(), "deleted=0"),
				'assoc' => true,
				'validation' => 'required',
			),
			'publish' => array(
				'displayname' => 'Publish',
				'sort' => true,
				'list' => false,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'select',
				'validation' => 'required',
				'options' => array('1' => 'Yes', '0' => 'No')
			),
			'recommended' => array(
				'displayname' => 'Recommended',
				'sort' => true,
				'list' => false,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'select',
				'validation' => 'required',
				'options' => array('1' => 'Yes', '0' => 'No')
			),
			'amount' => array(
				'displayname' => 'Amount',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'discount' => array(
				'displayname' => 'Discount',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'rules' => array(
				'displayname' => 'House Rules',
				'sort' => true,
				'list' => false,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'cms',
				'validation' => 'required'
			),
			'imgpath' => array(
				'displayname' => 'Images',
				'sort' => true,
				'list' => false,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'image',
				'extention' => array('jpg', 'jpeg', 'png', 'webp'),
				'path' => 'upload/houses/',
			),
		)
	);
?>
