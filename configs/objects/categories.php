<?php
	$objects['categories'] = array(
		'meta' => array(
			'access' => (in_array($_SESSION[$session]['usertype'], array('Administrator', 'vendor'))),
			'singular' => 'Categories',
			'plural' => 'Category',
			'table' => 'categories',
			'default_sort_field' => 'id',
			'default_sort_order' => 'desc',
			'add' => ($_SESSION[$session]['usertype'] == 'Administrator'),
			'edit' => ($_SESSION[$session]['usertype'] == 'Administrator'),
			'search' => true,
			'details' => true,
			'delete' => ($_SESSION[$session]['usertype'] == 'Administrator'),
			'fullpage' => false,
			'filter' => "deleted=0"
		),
		'fields' => array(
			'name' => array(
				'displayname' => 'Name',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'validation' => 'required',
			),
			'imgpath' => array(
				'displayname' => 'Image',
				'sort' => true,
				'list' => false,
				'edit' => true,
				'search' => false,
				'details' => true,
				'path' => 'upload/categories/',
				'input' => 'image',
			),
			'status' => array(
				'displayname' => 'Status',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'select',
				'options' => array('1' => 'Active', 'Inactive'),
				'assoc' => true,
				'validation' => 'required'
			),
		)
	)
?>