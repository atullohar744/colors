<?php
	$objects['banners'] = array(
		'meta' => array(
			'access' => (in_array($_SESSION[$session]['usertype'], array('Administrator', 'vendor'))),
			'singular' => 'Banner',
			'plural' => 'Banners',
			'table' => 'banners',
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
			'imgpath' => array(
				'displayname' => 'Banner Image',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'image',
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
		)
	);
?>
