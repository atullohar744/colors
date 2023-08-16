<?php

	function list_bookings($id){
		global $row;
		if($id){
			$row['status'] = getRecordField($query = "select if(confirmed > 0, 'confirmed', if(cancelled > 0,'cancelled', if(checkout > 0, 'checkout', ''))) as status from bookings where id='{$id}';");
		}
	}
	
	$objects['bookings'] = array(
		'meta' => array(
			'access' => (in_array($_SESSION[$session]['usertype'], array('Administrator', 'vendor'))),
			'singular' => 'Booking',
			'plural' => 'Bookings',
			'table' => 'bookings',
			'default_sort_field' => 'id',
			'default_sort_order' => 'asc',
			'add' => false,
			'edit' => false,
			'search' => true,
			'details' => true,
			'delete' => 'deleted',
			'fullpage' => false,
			'filter' => "deleted=0" . ($_SESSION[$session]['usertype'] == 'vendor'? " and vendor='{$_SESSION[$session]['userid']}'":""),
			'row_actions' => array(
			        array(
    					'link' => "javascript: confirmOrder(ID);",
    					'title' => 'Confirm',
    					'text' => 'Confirm',
    					'icon' => 'fas fa-clipboard-check'
    				),
    				array(
    					'link' => "javascript: cancelOrder(ID);",
    					'title' => 'Cancel',
    					'text' => 'Cancel',
    					'icon' => 'fas fa-window-close'
    				),
    				array(
    					'link' => "javascript: completeOrder(ID);",
    					'title' => 'Complete',
    					'text' => 'Complete',
    					'icon' => 'fas fa-shopping-cart'
    				)
			    )
		),
		'fields' => array(
			'userid' => array(
				'displayname' => 'User',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'select',
				'options' => DB3::findChildren('user', 'name', array(), "deleted=0"),
				'assoc' => true,
				'validation' => 'required',
			),
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
			'house' => array(
				'displayname' => 'House',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'select',
				'options' => DB3::findChildren('houses', 'name', array(), "deleted=0"),
				'assoc' => true,
				'validation' => 'required',
			),
			'check_in' => array(
				'displayname' => 'Check In',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'date',
				'validation' => 'required',
			),
			'check_out' => array(
				'displayname' => 'Check Out',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => true,
				'details' => true,
				'input' => 'date',
				'validation' => 'required',
			),
			'checkin_time' => array(
				'displayname' => 'Check-In Time',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'time',
				'validation' => 'required',
			),
			'checkout_time' => array(
				'displayname' => 'Check-Out Time',
				'sort' => true,
				'list' => false,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'time',
				'validation' => 'required'
			),
			'guest' => array(
				'displayname' => 'Guest',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'rent' => array(
				'displayname' => 'Rent',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'discount' => array(
				'displayname' => 'Discount',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'payable_amount' => array(
				'displayname' => 'Payable Amount',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'number',
				'validation' => 'required',
			),
			'status' => array(
				'displayname' => 'Status',
				'sort' => true,
				'list' => true,
				'edit' => true,
				'search' => false,
				'details' => true,
				'input' => 'select',
				'options' => array('confirmed' => 'Confirmed', 'cancelled' => 'Cancelled', 'checkout' => 'Checkout'),
				'assoc' => true
			),
		)
	);
?>
