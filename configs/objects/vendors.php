<?php

	function edit_vendors($id){
		$query = "update user set usertype='vendor', status=1 where id='{$id}';";
		tspl_query($query);
	}
	
	
	$objects['vendors'] = array(
		'meta' => array(
			'access' => ($_SESSION[$session]['usertype'] == 'Administrator'),
			'singular' => 'Vendor',
			'plural' => 'Vendors',
			'table' => 'user',
			'default_sort_field' => 'id',
			'default_sort_order' => 'desc',
			'add' => true,
			'edit' => true,
			'search' => true,
			'details' => true,
			'delete' => true,
			'fullpage' => false,
			'filter' => "deleted=0 and usertype='vendor'"
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
			'pass' => array(
				'displayname' => 'Password',
				'sort' => true,
				'list' => false,
				'edit' => falsr,
				'search' => false,
				'details' => false,
				'input' => 'password',
				'validation' => 'required',
				'help' => 'Leave blank to keep the same password'
			),
		)
	);
?>
