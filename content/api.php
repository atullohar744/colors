<?php
require_once ('configs/config.php');
require_once (SCRIPTS_DIR . 'tspl/upload.php');
require_once (SCRIPTS_DIR . 'tspl/DB3.php');
class api {
	function api() {
		tspl_query("SET session TIME_ZONE = '+05:30'");
	}

	function settings() {
		global $server_url;
		if ($settings = getRecord($query = "select *, concat('{$server_url}','',logo_imgpath) as logo_imgpath, concat('{$server_url}','', favicon) as favicon from site_settings where deleted=0")) {
			$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $settings);
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Settings Not Found");
		echo json_encode($response);
		exit();
	}
	
	function banners() {
		global $server_url;
		$categories = getRecords($query = "select imgpath, link from banners where deleted=0 order by id desc;");
		if (empty($categories))
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Banners Not Found');
		else
			$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $categories);
		
		echo json_encode($response);
		exit();
	}

	// params : {phone:"9168109933", password:"test", referral_code:"COL00014"}
	function register() {
		if (@$_REQUEST['phone'] && @$_REQUEST['password']) {
			if ((@$_REQUEST['phone'] && getRecordField($query = "select id from user where phone='" . @$_REQUEST['phone'] . "' and status=1 and deleted=0 and usertype='user';"))) {
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Duplicate User");
			} else {
				$query = "insert into user(usertype, phone, pass, status) values('user', '" . $_REQUEST['phone'] . "', '" . @$_REQUEST['password'] . "', '1')";
				tspl_query($query);
				$id = tspl_insert_id();
				
				$query = "update user set referral_code='FARM" . sprintf("%04d", $id) . "' where id='{$id}';";
				tspl_query($query);
				
				if(@$_REQUEST['referral_code']){
					$referId = getRecordField($query = "select id from user where referral_code='{$_REQUEST['referral_code']}' and deleted=0;");
					
					$query = "insert into transactions(type, amount, userid, date, time, message) values('credit', '100', '{$referId}', curdate(), '" . date("H:i") . "', 'Referral bonus');";
					tspl_query($query);
					
					$query = "update user set balance=balance+100 where id='{$referId}';";
					tspl_query($query);
					
					$query = "insert into transactions(type, amount, userid, date, time, message) values('credit', '50', '{$id}', curdate(), '" . date("H:i") . "', 'Referral bonus');";
					tspl_query($query);
					
					$query = "update user set balance=balance+50 where id='{$id}';";
					tspl_query($query);
				}
				
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('id' => "{$id}"));
			}
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Required Parameters");
		echo json_encode($response);
		exit();
	}

	//params : {"phone":"1234567890", password:"test"}
	function loginWithPhone() {
		global $server_url;
		if (@$_REQUEST['phone'] && @$_REQUEST['password']) {
			$user = getRecord($query = "select u.* from user u where u.deleted=0 and u.usertype in('user') and (u.phone='" . $_REQUEST['phone'] . "');");
			if ($user) {
				if(trim(@$_REQUEST['password']) == $user['pass'])
					$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('id' => $user['id'], 'message' => 'Sign In Successfully'));
				else
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Password");
			} else{
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "User not register with this number");
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
	
	//params : {"userid":"4", amount:"100"}
	function withdrawRequest() {
		global $server_url;
		if (($userid = intval(@$_REQUEST['userid'])) && ($amount = floatval($_REQUEST['amount']))) {
			$user = getRecord($query = "select u.* from user u where u.deleted=0 and u.usertype in('user') and u.id='{$userid}';");
			if ($user) {
				if($kid = getRecordField($query = "select id from kyc where userid='{$userid}' and approved=1 and deleted=0;")){
					if($amount <= floatval($user['balance'])){
						$query = "insert into withdraw_requests(userid, amount) values('{$userid}', '{$amount}');";
						tspl_query($query);
					}
					else
						$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Not enough balance");
				}
				else
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "KYC not approved");
			} else{
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "User Not Found");
			}
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing userid or amount");
		echo json_encode($response);
		exit();
	}

	//params : {"phone":"test@test.com", "password":"admin"}
	function login() {
		global $server_url;
		if (@$_REQUEST['phone']) {
			$user = getRecord($query = "select u.* from user u where u.deleted=0 and u.usertype in('user') and ((u.email='" . $_REQUEST['email'] . "') or (u.email='" . $_REQUEST['email'] . "'));");
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
		if (!app_login($id)) {
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
			$user = getRecord($query = "select u.* from user u where u.id='{$id}' and u.usertype='user' group by u.id;");
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

	//params : {userid:"1",name:"test est",email:"test@test.com",phone:"9168109933",password:"test", "imgpath":'images.test.jpeg'}
	function updateprofile() {
		global $server_url;
		if (!app_login(intval(@$_REQUEST['userid']))) {
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
			echo json_encode($response);
			exit();
		}
		if (($id = intval(@$_REQUEST['userid'])) && @$_REQUEST['name']) {
			$fields = array('name', 'email', 'phone');
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
		if (!app_login(intval(@$_REQUEST['userid']))) {
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
	
	//params : {"userid":"4", amount:"100"}
	function addFunds() {
		global $server_url;
		if (!app_login(@$_REQUEST['userid'])) {
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
			echo json_encode($response);
			exit();
		}
		
		$settings = getRecord($query = "select payment_limit, admin_upi from site_settings where deleted=0");
		
		if (($userid = intval(@$_REQUEST['userid'])) && ($amount = floatval($_REQUEST['amount'])) && (floatval($settings['payment_limit']) <= floatval($_REQUEST['amount']))) {
			$user = getRecord($query = "select u.* from user u where u.deleted=0 and u.usertype in('user') and u.id='{$userid}';");
			if ($user) {
					$query = "update user set balance=balance+{$amount} where id='{$userid}';";
					tspl_query($query);
					
					$query = "insert into transactions(type, amount, userid, date, remark) values('credit', '{$amount}', '{$userid}', '" . date("Y-m-d") . "', 'Fund Add');";
					tspl_query($query);
			} else{
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "User Not Found");
			}
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing userid or amount or Minimum amount should be greater than {$settings['payment_limit']}");
			
		echo json_encode($response);
		exit();
	}
	
	//params : {userid:"1"}
	function transactions() {
		global $server_url;
		$userid = intval(@$_REQUEST['userid']);
		
		if (!app_login($userid)) {
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
			echo json_encode($response);
			exit();
		}
		
		if($userid){
			$transactions = getRecords($query = "select * from transactions where userid='{$userid}' and deleted=0 order by id desc;");			
			if (empty($transactions))
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Transactions Not Found');
			else
				$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $transactions);
		}
		else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Missing Required Parameters');
		
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
	
	//params : {userid:"1", "img_pan":'img_pan.jpeg', "img_addhar":'images.img_addhar.jpeg'}
	function updateKyc() {
		global $server_url;
		if (!app_login(intval(@$_REQUEST['userid']))) {
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
			echo json_encode($response);
			exit();
		}
		if (($id = intval(@$_REQUEST['userid'])) && @$_REQUEST['name']) {
			$values['userid'] = $id;
			if (@$_FILES['img_pan']) {
				$tmp = uploadFile('img_pan', '', "upload/users/", array("png", "jpg", "jpeg"));
				if (@$tmp['_main'])
					$values['img_pan'] = $tmp['_main'];
			}
			if (@$_FILES['img_addhar']) {
				$tmp = uploadFile('img_addhar', '', "upload/users/", array("png", "jpg", "jpeg"));
				if (@$tmp['_main'])
					$values['img_addhar'] = $tmp['_main'];
			}
			$id = DB3::updateObject('kyc', $values);
			
			$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array("message" => "KYC documents uploaded successfully"));
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Rquired Parameters");
		echo json_encode($response);
		exit();
	}

	//params : {"userid":"4"}
	function rewards($id = 0, $internal = false) {
		global $server_url;
		if (!$id)
			$id = intval(@$_REQUEST['userid']);
		if (!app_login($id)) {
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
	
	//params : {"userid":"4", house: 2, rating: 4, comments: "nice place"}
	function ratingAndComment() {
		global $server_url;
		if (app_login(intval(@$_REQUEST['userid']))){
			$data = array(
				'userid' => intval($_REQUEST['userid']),
				'house' => intval($_REQUEST['house']),
				'rating' => floatval($_REQUEST['rating']),
				'comments' => $_REQUEST['comments']
			);	
			
			$id = DB3::updateObject('reviews', $data);
			
			$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('message' => 'Rating Placed Successfully'));
			
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "User Not Found");
		echo json_encode($response);
		exit();
	}

	//params : {"userid":"4", rating: 4, comments: "nice app"}
	function appFeedback() {
		global $server_url;
		if (app_login(intval(@$_REQUEST['userid']))){
			$data = array(
				'userid' => intval($_REQUEST['userid']),
				'rating' => floatval($_REQUEST['rating']),
				'comments' => $_REQUEST['comments']
			);	
			
			$id = DB3::updateObject('app_feedback', $data);
			
			$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => array('message' => 'Rating Placed Successfully'));
			
		} else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "User Not Found");
		echo json_encode($response);
		exit();
	}

	//params : {"userid":"4", "house":"2"}
	function reviews($id = 0, $internal = false) {
		global $server_url;
		if (!$id)
			$id = intval(@$_REQUEST['userid']);
		if (!app_login($id)) {
			if ($internal)
				return array();
			else {
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
				echo json_encode($response);
				exit();
			}
		}
		if ($id && ($house = intval(@$_REQUEST['house']))) {
			
			$reviews = getRecords($query = "select r.*, u.name, u.imgpath from reviews r, user u where r.deleted=0 and r.house='{$house}' and u.id=r.userid order by r.id desc;");
			
			if ($internal)
				return $reviews;
			else {
				if (empty($reviews))
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Not Found');
				else
					$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $reviews);
			}
		} elseif ($internal)
			return array();
		else
			$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Missing Userid or House ID");
		
		if (!$internal) {
			echo json_encode($response);
			exit();
		}
	}

	//params : {"userid":"4"}
	function feedbacks($id = 0, $internal = false) {
		global $server_url;
		if (!$id)
			$id = intval(@$_REQUEST['userid']);
		if (!app_login($id)) {
			if ($internal)
				return array();
			else {
				$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => "Invalid Userid or User Not Active");
				echo json_encode($response);
				exit();
			}
		}
		if ($id) {
			
			$reviews = getRecords($query = "select r.*, u.name, u.imgpath from app_feedback r, user u where r.deleted=0 and u.id=r.userid order by r.id desc;");
			
			if ($internal)
				return $reviews;
			else {
				if (empty($reviews))
					$response = array('status' => '400', 'error' => 1, 'success' => 0, 'message' => 'Not Found');
				else
					$response = array('status' => '200', 'error' => 0, 'success' => 1, 'result' => $reviews);
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