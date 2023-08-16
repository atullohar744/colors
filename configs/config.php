<?php
	if(!isset($CONFIG_LLD))
	{
        $testsite = 1;

		$protocol = ($_SERVER['SERVER_PORT'] == 443?"https://":"http://");
		date_default_timezone_set('Asia/Calcutta');
		if(strstr($_SERVER['HTTP_HOST'], 'adminapp.tech'))
        {
            $dbhost = 'localhost';
            $dbuser = 'u233274077_colors';
            $dbpass = 'Colors@123';
            $dbname = 'u233274077_colors';
        }
		else
		{
			$dbhost = 'localhost';
			$dbuser = 'u233274077_colors';
			$dbpass = 'Colors@123';
			$dbname = 'u233274077_colors';
		}
		
		$server_url = "{$protocol}{$_SERVER['HTTP_HOST']}/yoswin/";
		$scripts_url = "{$server_url}scripts/";
		$from = "support@meratemplate.in";
		
		define('BASE_PATH', @$_SERVER['DOCUMENT_ROOT']. "/yoswin/");
		define('SCRIPTS_DIR', BASE_PATH . "scripts/");
		define('ASSETS_DIR', "assets");
		
        $from = "support@meratemplate.in";

		$conn;
		$session = 'admin';
		$sitename_caps = "Winboss";
		$site_description = $sitename_caps;

        if(isset($_REQUEST['testsite']))
            $_SESSION[$session]['testsite'] = $_REQUEST['testsite'];

        if(in_array($_SERVER['REMOTE_ADDR'], array('127.0.0.1')) || strstr($_SERVER['REMOTE_ADDR'], '192.168.1.'))
            define('MERAT', true);

        if (!function_exists('set_magic_quotes_runtime')) {
            function set_magic_quotes_runtime($new_setting) {
                return true;
            }
        }

        function opendb()
        {
            global $dbhost, $dbuser, $dbpass, $dbname, $conn, $server, $userid, $session;
            if(!$conn)
            {
                if(!($conn = @mysqli_connect($dbhost, $dbuser, $dbpass, $dbname)))
                {
                    $timeNow = (date('H') * 100) + date('m');
                    if($timeNow >= 430 && $timeNow <= 435)
                    {
                        lifeweb_error_handler(-1, "Error connecting to MySQL database", __FILE__, 243);
                        home('/denied', true);
                    }
                }
				
                $query = "SET time_zone = '+05:30';";
                tspl_query($query);

                if(strstr($dbname, 'ijm') || strstr($dbname, 'mitten') || strstr($dbname, 'sites_ee'))
                {
                    $query = "SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'";
                    tspl_query($query);
                }

                if($userid > 0)
                    $_userid = $userid;
                else
                {
                    $asession = preg_replace("/lwc([0-9]+)/", "lwca$1", $session);
                    $_userid = -1 * intval(@$_SESSION[$asession]['userid']);
                }
            }
        }

        function closedb()
        {
            global $conn;
            if($conn)
            {
                mysqli_close($conn);
                $conn = null;
            }
        }

        function tspl_query($query)
        {
            global $conn;

            if($result = mysqli_query($conn, $query))
                return $result;
            else
                db_fail($query);
        }

        function tspl_escape_string($str)
        {
            global $conn;
            return mysqli_real_escape_string($conn, $str);
        }

        function tspl_affected_rows()
        {
            global $conn;
            return mysqli_affected_rows($conn);
        }

        function tspl_insert_id()
        {
            global $conn;
            return mysqli_insert_id($conn);
        }

        function tspl_select_db($dbname)
        {
            global $conn;
            mysqli_select_db($conn, $dbname);
        }

        function db_fail($query)
        {
            global $conn, $sitename_caps, $server_url, $headers, $testsite, $webmasters, $session, $server, $from;

            $error = @mysqli_error($conn);
			$error1 = @mysqli_connect_error($conn);

            $page = $_SERVER['REQUEST_URI'];

            if($file = @fopen((defined('CLIENT_ROOT')?CLIENT_ROOT . 'upload/':'') . 'log.txt','a'))
            {
                fwrite($file, "TimeStamp: " . date("Y-m-d H:i:s") . "Page: $page\nQuery: $query\nError: " . $error . "\n");
                fclose($file);
            }

            $message = "
Error : <pre>" . print_r($error1, true) . "</pre>
========================================\r\n
Error : <pre>" . print_r($error, true) . "</pre>
========================================\r\n
REQUEST PARAMETERS : <pre>" . print_r($_REQUEST, true) . "</pre>
========================================\r\n
STACKTRACE: <pre>" . print_r(debug_backtrace(), true) . "</pre>
========================================\r\n
SESSION PARAMETERS : <pre>" . print_r($_SESSION, true) . "  </pre>
========================================\r\n
SERVER PARAMETERS : <pre>" . print_r($_SERVER, true) . "</pre>
========================================\r\n";

            echo $message;
            closedb();
            exit();

        }

        function web_shutdown() {
            $error = error_get_last();

            $error_log = $error['message'] . '<pre>';
            if(function_exists('debug_backtrace'))
            {
                $backtrace = debug_backtrace();
                // array_shift($backtrace);
                foreach($backtrace as $i=>$l){
                    $error_log .= "[$i] in function <b>" . @$l['class'] . @$l['type'] . @$l['function'] . "</b>";
                    if(@$l['file']) $error_log .= " in <b>{$l['file']}</b>";
                    if(@$l['line']) $error_log .= " on line <b>{$l['line']}</b>";
                    $error_log .= "\n";
                }
            }
            $error_log .= "\n</pre>";

            $dieOn = E_ALL & ~E_WARNING & ~E_NOTICE & ~E_DEPRECATED;
            if($dieOn & $error['type'])
            {
                if(defined('MERAT'))
                {
                    echo $error_log;
                    closedb();
                    exit();
                }

                if($error && $error['type'])
                    db_fail($error_log);
            }
        }

        if(!defined('MERAT') || !@$_REQUEST['debug'])
            register_shutdown_function('web_shutdown');

		$userid = intval(@$_SESSION[$session]['userid']);

		function check_login($admin = null, $ajax = false)
		{
			global $userid, $server_url, $smarty, $session;

			if($smarty)
			{
				$smarty->assign('loggedIn', true);
				if($admin)
					$smarty->assign('adminLoggedIn', true);
			}

			$error = false;

			if(!$userid)
				$error = true;
			elseif($admin && !($_SESSION[$session]['usertype'] == 'Administrator' || $_SESSION[$session]['usertype'] == $admin || $_SESSION[$session][$admin]))
				$error = true;

			if($error == true)
			{
				closedb();

				if($ajax)
				{
					echo '<div class="fail">You do not have permission to view this page.</div>';
				}
				elseif ($userid)
					header('Location: ' . $server_url . 'denied');
				else
				{
					$_SESSION[$session]['referer'] = $_SERVER['REQUEST_URI'];
					header('Location: ' . $server_url . '');
				}
				exit();
			}
			return true;
		}

		function dashboard()
		{
			global $userid, $admin, $server_url, $session;

			if($admin || $userid){
            	home("users/dashboard");
			}

		}

        function home($url = '', $absolute = false)
        {
            global $server_url;
            closedb();
            header("Location: " . ($absolute?"":$server_url) . $url);
            exit();
        }

        function homeJS($url = '', $absolute = false)
        {
            global $server_url;
            closedb();
            // echo '<script type="text/javascript">alert("' . ($absolute?"":$server_url) . $url . '");window.top.location = "' . ($absolute?"":$server_url) . $url . '";</script>';
			echo '<script type="text/javascript">window.top.location = "' . ($absolute?"":$server_url) . $url . '";</script>';
            exit();
        }

		function getRecords($query)
		{
			$records = array();
			$result = tspl_query($query);
			while($row = mysqli_fetch_assoc($result))
				$records[] = $row;
			return $records;
		}

		function getRecord($query)
		{
			$records = getRecords($query);
			if(count($records))
				return $records[0];
			else
				return null;
		}

		function getRecordField($query)
		{
			$result = tspl_query($query);
			if($row = mysqli_fetch_row($result))
				return $row[0];
			else
				return null;
		}

        function debug($query)
        {
            if(is_object($query))
                echo "<pre>" . var_dump($query) . "</pre><br />" . PHP_EOL . PHP_EOL;
            elseif(is_array($query))
                echo "<pre>" . print_r($query, true) . "</pre><br />" . PHP_EOL . PHP_EOL;
            else
                echo "{$query}<br /><br /><br />" . PHP_EOL . PHP_EOL . PHP_EOL;

            global $log, $debug;
            if($debug)
                $log .= $query;
        }
		
		function app_login($userid, $type = 'user'){
			if(intval($userid) && $type)
			{
				if(getRecordField($query = "select id from user where id='{$userid}' and usertype='{$type}' and deleted=0 and status=1;"))
					return true;
				
				return false;
			}
			else
				return false;
		}
		
		function detectRequestBody() {
		    $rawInput = fopen('php://input', 'r');
		    $tempStream = fopen('php://temp', 'r+');
		    stream_copy_to_stream($rawInput, $tempStream);
		    rewind($tempStream);
		
		    return $tempStream;
		}
		
		function getCurlResponse($url){
			$curl = curl_init($url);
			curl_setopt($curl, CURLOPT_URL, $url);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			
			curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
			curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
			
			$resp = curl_exec($curl);
			curl_close($curl);
			
			return $resp;
		}
		
		function getLevels($userid){
			$users = array();
			
			$users['level1'] = getRecords($query = "select * from user where parentId='{$userid}' and deleted=0;");
			
			$settings = getRecord($query = "select * from site_settings where deleted=0;");
			
			foreach ($users['level1'] as &$user) {
				
				$l2Users = getRecords($query = "select * from user where parentId='{$user['id']}' and deleted=0;");
				
				foreach ($l2Users as &$user1) {
					$user1['recharge'] = getRecordField($query = "select amount from transactions where userid='{$user1['id']}' and remark='Recharge' order by id asc limit 1;");
					
					$user1['trecharge'] = getRecordField($query = "select sum(amount) as amount from transactions where userid='{$user1['id']}' and remark='Recharge' group by userid;");
					
					$bettingAmt = getRecordField($query = "select sum(amount) as amount from transactions where userid='{$user1['id']}' and type='debit' group by userid;");
					$user1['commission'] = floatval($settings['level1_comm']) / 100 * floatval($bettingAmt);
				}
				
				$users['level2'][] = $l2Users;
				
				$user['recharge'] = getRecordField($query = "select amount from transactions where userid='{$user['id']}' and remark='Recharge' order by id asc limit 1;");
				
				$user['trecharge'] = getRecordField($query = "select sum(amount) as amount from transactions where userid='{$user['id']}' and remark='Recharge' group by userid;");
				
				$bettingAmt = getRecordField($query = "select sum(amount) as amount from transactions where userid='{$user['id']}' and type='debit' group by userid;");
				$user['commission'] = floatval($settings['level1_comm']) / 100 * floatval($bettingAmt);
			}
			
			return $users;
		}
		
		$CONFIG_LLD = true;
	}
?>
