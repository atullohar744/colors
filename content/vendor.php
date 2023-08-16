<?php
require_once ('configs/config.php');
require_once (SCRIPTS_DIR . 'tspl/upload.php');
require_once (SCRIPTS_DIR . 'tspl/DB3.php');
class vendor {
	function vendor() {
		tspl_query("SET session TIME_ZONE = '+05:30'");
	}

	function settings() {
		global $server_url;
		if ($settings = getRecord($query = "select userid, email, phone, onesignal_app_id, onesignal_api_key, rider_app_id, rider_api_key, title, concat('{$server_url}','',logo_imgpath) as logo_imgpath, concat('{$server_url}','', favicon) as favicon, terms_url, privacy_url from site_settings where deleted=0")) {
			$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $settings);
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Settings Not Found");
		echo json_encode($response);
		exit();
	}

	// params : {fname:"test", lname:"test",email:"test@test.com",phone:"9168109933", dob: "1991-05-07"password:"test"}
	function register() {
		if ((@$_REQUEST['email'] || @$_REQUEST['phone']) && @$_REQUEST['password']) {
			if ((@$_REQUEST['phone'] && getRecordField($query = "select id from user where phone='" . @$_REQUEST['phone'] . "' and status=1 and deleted=0 and usertype='user';")) || (@$_REQUEST['email'] && getRecordField($query = "select id from user where phone='" . @$_REQUEST['email'] . "' and status=1 and deleted=0 and usertype='user';"))) {
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Duplicate User");
			} else {
				$query = "insert into user(usertype, fname, lname, name, email, phone, dob, pass, status) values('vendor', '" . tspl_escape_string(@$_REQUEST['fname']) . "', '" . tspl_escape_string(@$_REQUEST['lname']) . "', '" . tspl_escape_string(@$_REQUEST['fname']) . " " . tspl_escape_string(@$_REQUEST['lname']) . "', '" . tspl_escape_string($_REQUEST['email']) . "', '" . $_REQUEST['phone'] . "', '" . date("Y-m-d", strtotime($_REQUEST['dob'])) . "', '" . ($_REQUEST['password']) . "', '1')";
				tspl_query($query);
				$id = tspl_insert_id();
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('id' => "{$id}"));
			}
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Required Parameters");
		echo json_encode($response);
		exit();
	}

	//params : {"phone":"1234567890"}
	function loginWithPhone() {
		global $server_url;
		if (@$_REQUEST['phone']) {
			$user = getRecord($query = "select u.* from user u where u.deleted=0 and u.usertype in('vendor') and (u.phone='" . $_REQUEST['phone'] . "');");
			if ($user) {
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('id' => $user['id'], 'message' => 'Sign In Successfully'));
			} else{
				$query = "insert into user(usertype, phone, status) values('vendor', '{$_REQUEST['phone']}', 1);";
				tspl_query($query);
				
				$id = tspl_insert_id();
				
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('id' => $id, 'message' => 'Sign In Successfully'));
			}
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Phone");
		echo json_encode($response);
		exit();
	}

	function verifyOtp(){
		if ($otp = @$_REQUEST['otp']) {
			$data = getRecord($query = "select * from user_otp where deleted=0;");
			if ($data) {
				if($otp == $data['otp'])
					$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('id' => $data['userid']));
				else
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Wrong OTP");
			} else
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing OTP");
		}
		echo json_encode($response);
		exit();
	}
	
	//params : {"phone":"test@test.com", "password":"admin"}
	function login() {
		global $server_url;
		if (@$_REQUEST['phone']) {
			$user = getRecord($query = "select u.* from user u where u.deleted=0 and u.usertype in('vendor') and ((u.email='" . $_REQUEST['email'] . "') or (u.email='" . $_REQUEST['email'] . "'));");
			if ($user) {
				$securityCheckPass = false;
				if ($password && ($user['pass'] == $password || $user['pass'] == md5($password)))
					$securityCheckPass = true;
				if ($securityCheckPass && $user['status']) {
					if ($user['imgpath'])
						$user['imgpath'] = $server_url . $user['imgpath'];
					$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $user);
				} elseif (!$securityCheckPass)
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Password not match");
				elseif (!$row['status'])
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "User inactive");
				else
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Some technical issue");
			} else
				$response = array('status' => '200', 'error' => "User Not Found");
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Emial Or Password");
		echo json_encode($response);
		exit();
	}

	// params : {name:"test",email:"test@test.com",auth:"sfsd44564gdfgdfg"}
	function googleLogin() {
		if (@$_REQUEST['name'] && @$_REQUEST['email'] && @$_REQUEST['auth']) {
			$query = "insert into user(usertype, name, email, status, auth,imgpath) values('user', '" . tspl_escape_string(@$_REQUEST['name']) . "', '" . tspl_escape_string($_REQUEST['email']) . "', '1', '" . tspl_escape_string(@$_REQUEST['auth']) . "', '" . urldecode((@$_REQUEST['imgpath'])) . "') on duplicate key update deleted=0, status=1, name='" . tspl_escape_string(@$_REQUEST['name']) . "', auth='" . tspl_escape_string(@$_REQUEST['auth']) . "', 
		   imgpath='" . (@$_REQUEST['imgpath']) . "', id=LAST_INSERT_ID(id);";
			tspl_query($query);
			$id = tspl_insert_id();
			if (!$id)
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Something Went Wrong');
			else
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $this -> getprofile($id, true));
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Required Parameters");
		echo json_encode($response);
		exit();
	}

	function getprofile($id = 0, $internal = false) {
		global $server_url;
		if (!$id)
			$id = intval(@$_REQUEST['userid']);
		if (!app_login($id, 'vendor')) {
			if ($internal)
				return array();
			else {
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
				echo json_encode($response);
				exit();
			}
		}
		if ($id) {
			//{$server_url}
			$user = getRecord($query = "select u.* from user u where u.id='{$id}' and u.usertype='vendor' group by u.id;");
			if ($internal)
				return $user;
			else {
				if (empty($user))
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'User Not Found');
				else
					$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $user);
			}
		} elseif ($internal)
			return array();
		else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Userid");
		if (!$internal) {
			echo json_encode($response);
			exit();
		}
	}

	//params : {userid:"1", fname:"test", lname:"est",email:"test@test.com",phone:"9168109933",password:"test", "imgpath":'images.test.jpeg'}
	function updateprofile() {
		global $server_url;
		if (!app_login(intval(@$_REQUEST['userid']), 'vendor')) {
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
			echo json_encode($response);
			exit();
		}
		if (($id = intval(@$_REQUEST['userid'])) && @$_REQUEST['name']) {
			$fields = array('fname', 'lname', 'email', 'phone', 'bio');
			$values = array();
			foreach ($fields as $f) {
				$values[$f] = tspl_escape_string(@$_REQUEST[$f]);
			}
			if (@$_REQUEST['password'])
				$values['pass'] = (@$_REQUEST['password']);
			$values['id'] = $id;
			if (@$_FILES['imgpath']) {
				$tmp = uploadFile('imgpath', '', "upload/users/", array("png", "jpg", "jpeg"));
				if (@$tmp['_main'])
					$values['imgpath'] = $tmp['_main'];
			}
			$id = DB3::updateObject('user', $values);
			$result = array('id' => $id);
			if (@$tmp['_main'])
				$result['imgpath'] = $server_url . $tmp['_main'];
			$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $result);
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Rquired Parameters");
		echo json_encode($response);
		exit();
	}

	//params : {userid:"1",oldPassword:"test",password:"test"}
	function changepswd() {
		if (!app_login(intval(@$_REQUEST['userid']), 'vendor')) {
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
			echo json_encode($response);
			exit();
		}
		if (($id = intval(@$_REQUEST['userid'])) && ($oldPassword = (trim($_REQUEST['oldPassword']))) && ($password = (trim($_REQUEST['password'])))) {
			$userPass = getRecordField($query = "select pass from user where id='{$id}';");
			if ($userPass == $oldPassword) {
				$id = DB3::updateObject('user', array('id' => $id, 'pass' => $password));
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('userid' => $id));
			} else
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Old Password doesnt match");
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Old Passwrd or New Password");
		echo json_encode($response);
		exit();
	}
	
	function categories($id = 0, $internal = false) {
		global $server_url;
		$categories = getRecords($query = "select * from categories where deleted=0 and status=1 order by id desc;");
		if ($internal)
			return $categories;
		else {
			if (empty($categories))
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Categories Not Found');
			else
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $categories);
		}
		if (!$internal) {
			echo json_encode($response);
			exit();
		}
	}
	//params: {name:"test": imgpath:"test.png"}
	//params: {name:"test": imgpath:"test.png", id: "2"}
	function addAmenities() {
		global $server_url;
		if(@$_REQUEST['name']){
			$values['name'] = $_REQUEST['name'];
			$values['status'] = 1;
			
			if(intval(@$_REQUEST['id']))
				$values['id'] = intval($_REQUEST['id']);
			
			if (@$_FILES['imgpath']) {
				$tmp = uploadFile('imgpath', '', "upload/amenities/", array("png", "jpg", "jpeg"));
				if (@$tmp['_main'])
					$values['imgpath'] = $tmp['_main'];
			}
			$id = DB3::updateObject('categories', $values);
			
			$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array("message" => "Category Added Successfully"));
		}
		else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Missing Required Fields');
		
		echo json_encode($response);
		exit();
	}
	
	function amenities($id = 0, $internal = false) {
		global $server_url;
		$amenities = getRecords($query = "select * from amenities where deleted=0 and status=1 order by id desc;");
		if ($internal)
			return $amenities;
		else {
			if (empty($amenities))
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Amenities Not Found');
			else
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $amenities);
		}
		if (!$internal) {
			echo json_encode($response);
			exit();
		}
	}
	
	//params : {userid:"1"}
	function houses($id = 0, $internal = false) {
		global $server_url;
		if (!app_login(intval(@$_REQUEST['userid']), 'vendor')) {
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
			echo json_encode($response);
			exit();
		}
		
		$houses = getRecords($query = "select h.*, c.name as category_name, (sum(r.rating)/count(distinct r.id)) as rating from houses h left join categories c on c.id=h.category and c.deleted=0 left join reviews r on r.house=h.id and r.deleted=0 where h.deleted=0 and h.publish=1 and vendor='" . intval(@$_REQUEST['userid']) . "' order by h.id desc;");
		foreach ($houses as &$house) {
			$house['images'] = getRecords($query = "select imgpath from house_images where deleted=0 and house='{$house['id']}';");
			if($house['amenities'])
				$house['amenities'] = getRecords($query = "select name from amenities where deleted=0 and id in({$house['amenities']});");
			else
				$house['amenities'] = array();
		}
		
		if ($internal)
			return $houses;
		else {
			if (empty($houses))
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Houses Not Found');
			else
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $houses);
		}
		if (!$internal) {
			echo json_encode($response);
			exit();
		}
	}
	
	//params: {userid: "2", name:"test", phone: "1234567890", address: "test address", yards: "400", bedrooms: 2, day_capacity: 5, night_capacity: 4, category: "2", amenities:"4,2,6", publish:0/1, recommended:0/1, amount: 10000, discount: 5, rules: "Terms and conditions", imgpath:"test.png"}
	
	//params: {userid: "2", name:"test", phone: "1234567890", address: "test address", yards: "400", bedrooms: 2, day_capacity: 5, night_capacity: 4, category: "2", amenities:"4,2,6", publish:0/1, recommended:0/1, amount: 10000, discount: 5, rules: "Terms and conditions", imgpath:"test.png", id: "2"}
	function addHouse() {
		global $server_url;
		$userid = intval(@$_REQUEST['userid']);
		if (!app_login($userid, 'vendor') || !$userid) {
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
			echo json_encode($response);
			exit();
		}
		
		if(@$_REQUEST['name']){
			$values = array(
					'vendor' => $userid,
					'name' => $_REQUEST['name'],
					'phone' => $_REQUEST['name'],
					'address' => $_REQUEST['address'],
					'yards' => $_REQUEST['yards'],
					'bedrooms' => intval($_REQUEST['bedrooms']),
					'day_capacity' => intval($_REQUEST['day_capacity']),
					'night_capacity' => intval($_REQUEST['night_capacity']),
					'category' => intval($_REQUEST['category']),
					'amenities' => $_REQUEST['amenities'],
					'publish' => intval($_REQUEST['publish']),
					'recommended' => intval($_REQUEST['recommended']),
					'amount' => floatval($_REQUEST['amount']),
					'discount' => floatval($_REQUEST['discount']),
					'rules' => $_REQUEST['rules']
				);
			
			if(intval(@$_REQUEST['id']))
				$values['id'] = intval($_REQUEST['id']);
			
			if (@$_FILES['imgpath']) {
				$tmp = uploadFile('imgpath', '', "upload/amenities/", array("png", "jpg", "jpeg"));
				if (@$tmp['_main'])
					$values['imgpath'] = $tmp['_main'];
			}
			$id = DB3::updateObject('categories', $values);
			
			$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array("message" => "House Added Successfully"));
		}
		else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Missing Required Fields');
		
		echo json_encode($response);
		exit();
	}

	//params:{house: "2"}
	function houseDetails($id = 0, $internal = false) {
		global $server_url;
		if ($house = intval(@$_REQUEST['house'])) {
			
			$house = getRecord($query = "select h.*, c.name as category_name, (sum(r.rating)/count(distinct r.id)) as rating from houses h left join categories c on c.id=h.category and c.deleted=0 left join reviews r on r.house=h.id and r.deleted=0 where h.deleted=0 and h.publish=1 and h.id='{$house}' order by h.id desc;");
			$house['images'] = getRecords($query = "select imgpath from house_images where deleted=0 and house='{$house['id']}';");
			if($house['amenities'])
				$house['amenities'] = getRecords($query = "select name  from amenities where deleted=0 and id in({$house['amenities']});");
			else
				$house['amenities'] = array();
			
			if ($internal)
				return $house;
			else {
				if (empty($house))
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Houses Not Found');
				else
					$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $house);
			}
		} elseif ($internal)
			return array();
		else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing House ID");
		if (!$internal) {
			echo json_encode($response);
			exit();
		}
	}
	
	//params:{house: "2", userid:"1"}
	function deleteHouse($id = 0, $internal = false) {
		global $server_url;
		$userid = intval(@$_REQUEST['userid']);
		if (!app_login($userid, 'vendor') || !$userid) {
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
			echo json_encode($response);
			exit();
		}
		if ($house = intval(@$_REQUEST['house'])) {
			
			$house = getRecord($query = "select h.* where h.deleted=0 and h.publish=1 and h.id='{$house}' and vendor='{$userid}' order by h.id desc;");
			
			if ($internal)
				return $house;
			else {
				if (empty($house))
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Houses Not Found');
				else{
					$query = "update houses set deleted=1 where id='{$house}';";
					tspl_query($query);
					$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('message' => "Deleted Successfully"));					
				}
			}
		} elseif ($internal)
			return array();
		else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing House ID");
		if (!$internal) {
			echo json_encode($response);
			exit();
		}
	}

	//params : {"userid":"4"}
	function rewards($id = 0, $internal = false) {
		global $server_url;
		if (!$id)
			$id = intval(@$_REQUEST['userid']);
		if (!app_login($id, 'vendor')) {
			if ($internal)
				return array();
			else {
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
				echo json_encode($response);
				exit();
			}
		}
		if ($id) {
			
			$rewards = getRecords($query = "select r.* from rewards r where r.deleted=0 order by r.id desc;");
			
			if ($internal)
				return $rewards;
			else {
				if (empty($rewards))
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Not Found');
				else
					$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $rewards);
			}
		} elseif ($internal)
			return array();
		else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Userid");
		
		if (!$internal) {
			echo json_encode($response);
			exit();
		}
	}
	
}
?>