<?php

	function edit_customers($id){
		$query = "update user set usertype='user' where id='{$id}';";
		tspl_query($query);
	}
	
	function editor_customers($id){
	}
	
	$objects['customers'] = array(
		'meta' => array(
			'access' => ($_SESSION[$session]['usertype'] == 'Administrator'),
			'singular' => 'User',
			'plural' => 'Users',
			'table' => 'user',
			'default_sort_field' => 'name',
			'default_sort_order' => 'asc',
			'add' => true,
			'edit' => true,
			'search' => true,
			'details' => true,
			'delete' => true,
			'fullpage' => false,
			'filter' => "deleted=0 and usertype='user'"
		),
		'fields' => array(
			'fname' => array(
				'displayname' => 'First Name',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'validation' => 'required',
			),
			'lname' => array(
				'displayname' => 'Last Name',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'validation' => 'required',
			),
			'phone' => array(
				'displayname' => 'Mobile Number',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'validation' => 'required, int',
			),
			'email' => array(
				'displayname' => 'Email',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'validation' => 'required',
			),
			'dob' => array(
				'displayname' => 'DOB',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'date',
				'validation' => 'required',
			),
			'state' => array(
				'displayname' => 'State',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'validation' => 'required',
			),
			'gender' => array(
				'displayname' => 'Gender',
				'sort' => true,
				'list' => false,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'select',
				'options' => array('male' => 'Male', 'female' => 'Female', 'other' => 'Other'),
				'assoc' => true,
				'validation' => 'required',
			),
			'vip' => array(
				'displayname' => 'Membership',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'select',
				'validation' => 'required',
				'options' => array('0' => 'Normal', '1' => 'VIP'),
				'assoc' => true,
			),
			'pass' => array(
				'displayname' => 'Password',
				'sort' => true,
				'list' => false,
				'edit' => false,
				'search' => false,
				'details' => false,
				'input' => 'password',
				'validation' => 'required',
			),
			'imgpath' => array(
				'displayname' => 'Profile Image',
				'sort' => true,
				'list' => false,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'file',
				'validation' => 'required'
			),
		)
	);
?>
