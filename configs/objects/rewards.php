<?php
	$objects['rewards'] = array(
		'meta' => array(
			'access' => (in_array($_SESSION[$session]['usertype'], array('Administrator', 'vendor'))),
			'singular' => 'Reward',
			'plural' => 'Rewards',
			'table' => 'rewards',
			'default_sort_field' => 'id',
			'default_sort_order' => 'desc',
			'add' => true,
			'edit' => true,
			'search' => true,
			'details' => true,
			'delete' => false,
			'fullpage' => false,
			'filter' => "deleted=0"
		),
		'fields' => array(
			'reward' => array(
				'displayname' => 'Reward',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'validation' => 'required'
			),
			'description' => array(
				'displayname' => 'Description',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'textarea',
				'rows' => 5,
				'cols' => 5,
				'validation' => 'required'
			),
			'amount' => array(
				'displayname' => 'Amount',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'number',
				'validation' => 'required'
			),
			'link' => array(
				'displayname' => 'Banner Link',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
			),
			'button' => array(
				'displayname' => 'Button Name',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
			),
			'imgpath' => array(
				'displayname' => 'Image',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'image',
				'validation' => 'required'
			),
		)
	);
?>
