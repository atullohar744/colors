<?php
	session_start();
	error_reporting(0);
	if(@$_REQUEST['mode'] != 'session')
	{
		require_once('../configs/config.php');
		opendb();
	}
	error_reporting(0);
	if(!in_array($_REQUEST['mode'], array('sendOtp', 'verifyOtp')))
		check_login();
	global $userid, $session;
	opendb();
	switch(@$_REQUEST['mode'])
	{
		case 'sendOtp':
			if(@$_REQUEST['phone']){
				$otp = rand(1111, 9999);
				
				$url = "https://www.fast2sms.com/dev/bulkV2?authorization=sC0gYcr2uQmRbfNOAy6WjKGEi5a7VkSUBwMPTx38dX1zheoZqlH9NqeWliyToGgvx5u37aIU20ARdnPF&route=otp&variables_values={$otp}&flash=0&numbers={$_REQUEST['phone']}";
				
				$response = json_decode(file_get_contents($url), 1);
				
				if($response['return']){
					$query = "insert into user_otp(phone, otp) values('{$_REQUEST['phone']}', '{$otp}')";
					tspl_query($query);
					
					echo 'success';
				}
			}
			exit();
			break;
		case 'verifyOtp':
			if(@$_REQUEST['phone'] && @$_REQUEST['otp']){
				
				$otp = getRecordField($query = "select otp from user_otp where phone='{$_REQUEST['phone']}' and deleted=0 order by id desc limit 1");
				if($_REQUEST['otp'] == $otp)
				{
					echo 'success';
					$query = "update user_otp set deleted=1 where phone='{$_REQUEST['phone']}';";
					tspl_query($query);
				}
				else
					echo 'failed';
				
			}
			exit();
			break;
		case 'futureid':
			$lastPeriodId = intval(str_replace(date('Ymd'), "", getRecordField($query = "select period from periods where date_format(dt, '%Y%m%d')='" . date('Ymd') . "' order by period desc limit 1;")));
			
			$futureid = date('Ymd') . ($lastPeriodId?$lastPeriodId:100) + 1;
			
			$query = "insert into periods (period) value('{$futureid}');";
			
			tspl_query($query);
			
			echo 'success';
			exit();
			break;
		case 'declare':
			if($futureid = @$_REQUEST['futureid']){
				$record = getRecord($query = "select *, sum(amount) as amount from joined_users where period='{$futureid}' and declared=0 group by digit order by sum(amount) asc limit 1;");
				
				if($record){
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
			else{
				$time = getRecordField($query = "select now();");
				$etime = date("Y-m-d H:i:s", strtotime(date("Y-m-d H:i:00", strtotime($time))));
				$stime = date("Y-m-d H:i:s", strtotime('-3 minutes', strtotime(date("Y-m-d H:i:59", strtotime($time)))));
				
				$record = getRecord($query = "select *, sum(amount) as amount from joined_users where bdate between '{$stime}' and '{$etime}' and declared=0 group by digit order by sum(amount) asc limit 1;");
				
				if($record){
					$query = "update joined_users set winner=1 where digit='{$record['digit']}' and declared=0;";
					tspl_query($query);
					
					$query = "update joined_users set declared=1 where bdate between '{$stime}' and '{$etime}' and declared=0;";
					tspl_query($query);
					
					$pricing = getRecord($query = "select * from pricing where deleted=0;");
					
					$results = getRecords($query = "select j.*, n.green, n.purple, n.red from joined_users j, numbers n where j.deleted=0 and j.bdate between '{$stime}' and '{$etime}' and j.winner=1 and n.digit=j.digit order by id desc;");
					
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
			break;
		case 'paid_withdraw':
	        if($id = intval(@$_REQUEST['id'])){
	            $query = "update user u, transactions w set w.paid=1, u.balance=u.balance-w.amount where w.id='{$id}' and u.id=w.userid and u.deleted=0 and w.deleted=0 and w.paid=0;"; 
	            tspl_query($query);
				
	            exit();
	        }
	        break;
		case 'confirmOrder':
	        if($id = intval(@$_REQUEST['id'])){
	            $query = "update bookings set confirmed=1 where id='{$id}';"; 
	            tspl_query($query);
				
	            exit();
	        }
	        break;
		case 'cancelOrder':
	        if($id = intval(@$_REQUEST['id'])){
	            $query = "update bookings set cancelled=1 where id='{$id}';"; 
	            tspl_query($query);
				
	            exit();
	        }
	        break;
		case 'completeOrder':
	        if($id = intval(@$_REQUEST['id'])){
	            $query = "update bookings set checkout=1 where id='{$id}';"; 
	            tspl_query($query);
				
	            exit();
	        }
	        break;
	    case 'notify':
	        if($id = intval(@$_REQUEST['id'])){
	            $news = getRecord("select id, title,videopath, news as message from news where id='{$id}';");
	            
	            $query = "insert into notifications (title, message, news, sent,vpath) values('{$news['title']}', '{$news['message']}', '{$news['id']}', 1,'{$news['videopath']}');";
	            tspl_query($query);
	            
	            require_once(BASE_PATH . "content/fcm.php");
	            
	            $fcm = new FCM();
	            $fcm->send_notification($news);
	            
	            
	            exit();
	        }
	        break;
		case 'video':
			if(@$_FILES)
			{
				require_once(SCRIPTS_DIR . 'tspl/upload.php');
				$tmp = uploadFile('main_videopath', '', BASE_PATH . "upload/news/", array('mp4', 'wav', 'mp3'));
				if(@$tmp['_main'])
					echo json_encode(
								array(
									'imgpath' => str_replace(BASE_PATH, "", $tmp['_main']),
									'original' => @$_REQUEST['fileId']
								));
			}
			exit();
		case 'img':
			if(@$_FILES)
			{
				require_once(SCRIPTS_DIR . 'tspl/upload.php');
				$tmp = uploadFile('imgpath', '', BASE_PATH . "/upload/news/", array("png", "jpg","jpeg", "gif"));
				if(@$tmp['_main'])
					echo json_encode(
								array(
									'imgpath' => str_replace(BASE_PATH, "", $tmp['_main']),
									'original' => @$_REQUEST['fileId']
								));
			}
			exit();
		break;
		case 'accept_order':
			if($id = intval(@$_REQUEST['id']))
			{
				$status = (@getRecordField($query = "select accepted from orders where id='{$id}';")?0:1);
				$query = "update orders set accepted={$status}, ostatus='" . ($status?'Accepted':'Rejected') . "' where id='{$id}';";
				tspl_query($query);
				
				echo json_encode($record = getRecord($query = "select * from orders where id='{$id}';"));
			}
			exit();
		break;
		case 'category':
			if($category = intval(@$_REQUEST['category']))
			{
				$records['data'] = getRecords($query = "select id, name from subcategories where category='{$category}' and status=1;");
				if($id = intval(@$_REQUEST['id']))
					$records['id'] = getRecordField($query = "select subcategory from products where id='{$id}';");
				echo json_encode($records);
			exit();
			}
		break;
		case 'unlock':
			$query = "select id from user where id=$userid and pass='" . md5(@$_REQUEST['pass']) . "';";
			$result = tspl_query($query);
			if($row = mysqli_fetch_assoc($result))
			{
				unset($_SESSION['locked']);
				echo 'unlock';
			}
			else
				echo 'password';
			break;
		case 'session':
			$_SESSION['last'] = time();
			$_SESSION['locked'] = true;
			break;
			
	}

	if(@$_REQUEST['mode'] != 'session')
		closedb();
?>