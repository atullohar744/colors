<?php
	require_once ('configs/config.php');
	require_once (SCRIPTS_DIR . 'tspl/upload.php');
	require_once (SCRIPTS_DIR . 'tspl/DB3.php');
	class crons {
		function crons() {
			
		}
		
		function insertUpdateMatches($datArray = array(), $objectType){
			if($datArray){
				$update = array();
				foreach($datArray as $k => $v)
					$update[] = "$k='$v'";
				
				$query = "insert into {$objectType}(" . join(',', array_keys($datArray)) . ") values('" . join("','", array_values($datArray)) . "') ON DUPLICATE KEY UPDATE " . join(',', $update) . ", id=LAST_INSERT_ID(id);";
				tspl_query($query);
				
				$id = tspl_insert_id();
				
				return $id;
			}
		}
		
		function getLiveMatches(){
			global $entityToken;
			$url = "https://rest.entitysport.com/v2/matches/?status=3&token={$entityToken}";
			$response = getCurlResponse($url);
			
			if(@$response)
			{
				$data = json_decode($response, 1);
				if($items = @$response['response']['items']){
					foreach ($items as $key => $item) {
						$matchArray = array(
							'cid' => $item['competition']['cid'],
							'match_id' => $item['match_id'],
							'title' => $item['title'],
							'short_title' => $item['short_title'],
							'format_str' => $item['format_str'],
							'status' => $item['status'],
							'status_str' => $item['status_str'],
							'status_note' => $item['status_note'],
							'date_start' => date("Y-m-d H:i:s", strtotime($item['date_start'])),
							'date_end' => date("Y-m-d H:i:s", strtotime($item['date_end'])),
						);
						
						$id = $this->insertUpdateMatches($matchArray, 'matches');
						
						$teama = $item['teama'];
						$teamb = $item['teamb'];
						
						$teamaArray = array(
							'mid' => $id,
							'match_id' => $item['match_id'],
							'team_id' => $teama['team_id'],
							'name' => $teama['name'],
							'short_name' => $teama['short_name'],
							'logo_url' => $teama['logo_url'],
							'scores' => $teama['scores'],
							'overs' => $teama['overs']
						);
						$id = $this->insertUpdateMatches($teamaArray, 'teams');
						
						$teambArray = array(
							'mid' => $id,
							'match_id' => $item['match_id'],
							'team_id' => $teamb['team_id'],
							'name' => $teamb['name'],
							'short_name' => $teamb['short_name'],
							'logo_url' => $teamb['logo_url'],
							'scores' => $teamb['scores'],
							'overs' => $teamb['overs']
						);
						$id = $this->insertUpdateMatches($teambArray, 'teams');
					}
				}
			}
		}
		
		function getCompletedMatches(){
			global $entityToken;
			$url = "https://rest.entitysport.com/v2/matches/?status=2&token={$entityToken}";
			$response = getCurlResponse($url);
			debug($response); die('here');
			if(@$response)
			{
				if($items = @$response['response']['items']){
					foreach ($items as $key => $item) {
						$matchArray = array(
							'cid' => $item['competition']['cid'],
							'match_id' => $item['match_id'],
							'title' => $item['title'],
							'short_title' => $item['short_title'],
							'format_str' => $item['format_str'],
							'status' => $item['status'],
							'status_str' => $item['status_str'],
							'status_note' => $item['status_note'],
							'date_start' => date("Y-m-d H:i:s", strtotime($item['date_start'])),
							'date_end' => date("Y-m-d H:i:s", strtotime($item['date_end'])),
						);
						
						$id = $this->insertUpdateMatches($matchArray, 'matches');
					}
				}
			}
		}
		
		function getScheduledMatches(){
			global $entityToken;
			$url = "https://rest.entitysport.com/v2/matches/?status=1&token={$entityToken}";
			$response = getCurlResponse($url);
			debug($response); die('here');
			if(@$response)
			{
				if($items = @$response['response']['items']){
					foreach ($items as $key => $item) {
						$matchArray = array(
							'cid' => $item['competition']['cid'],
							'match_id' => $item['match_id'],
							'title' => $item['title'],
							'short_title' => $item['short_title'],
							'format_str' => $item['format_str'],
							'status' => $item['status'],
							'status_str' => $item['status_str'],
							'status_note' => $item['status_note'],
							'date_start' => date("Y-m-d H:i:s", strtotime($item['date_start'])),
							'date_end' => date("Y-m-d H:i:s", strtotime($item['date_end'])),
						);
						
						$id = $this->insertUpdateMatches($matchArray, 'matches');
						
						$teama = $item['teama'];
						$teamb = $item['teamb'];
						
						$teamaArray = array(
							'mid' => $id,
							'match_id' => $item['match_id'],
							'team_id' => $teama['team_id'],
							'name' => $teama['name'],
							'short_name' => $teama['short_name'],
							'logo_url' => $teama['logo_url'],
							'scores' => $teama['scores'],
							'overs' => $teama['overs']
						);
						$id = $this->insertUpdateMatches($teamaArray, 'teams');
						
						$teambArray = array(
							'mid' => $id,
							'match_id' => $item['match_id'],
							'team_id' => $teamb['team_id'],
							'name' => $teamb['name'],
							'short_name' => $teamb['short_name'],
							'logo_url' => $teamb['logo_url'],
							'scores' => $teamb['scores'],
							'overs' => $teamb['overs']
						);
						$id = $this->insertUpdateMatches($teambArray, 'teams');
					}
				}
			}
		}

		function updatePlayersByMatch(){
			$matches = getRecords($query = "select match_id, cid from matches where deleted=0 and status=1");
			foreach ($matches as $key => $match) {
				$this->getPlayersByMatchId($match['match_id'], $match['cid']);
			}
		}

		function getPlayersByMatchId($mid = 0, $cid = 0){
			global $entityToken;
			if(!$cid)
				$cid = intval($_REQUEST['cid']);
			
			if(!$mid)
				$mid = intval($_REQUEST['mid']);
			
			if($cid && $mid){
				$url = "https://rest.entitysport.com/v2/competitions/{$cid}/squads/{$mid}?token={$entityToken}";
				$response = getCurlResponse($url);
			
				if(@$response)
				{
					if($squads = @$response['response']['squads']){
						foreach ($squads as $key => $squad) {
							foreach ($squad['players'] as $key => $player) {
								$playerArray = array(
									'team_id' => intval($squad['team_id']),
									'pid' => intval($player['pid']),
									'title' => $player['title'],
									'short_name' => $player['short_name'],
									'country' => $player['country'],
									'playing_role' => $player['playing_role'],
									'fantasy_player_rating' => floatval($item['fantasy_player_rating'])
								);
								
								$id = $this->insertUpdateMatches($playerArray, 'players');
							}
						}
					}
				}
			}
		}

		function getScorecardByMatchId($mid = 0){
			global $entityToken;
			if(!$mid)
				$mid = intval($_REQUEST['mid']);
			
			if($cid && $mid){
				$url = "https://rest.entitysport.com/v2/matches/{$mid}/scorecard?token={$entityToken}";
				$response = getCurlResponse($url);
			
				if(@$response)
				{
					if($response = @$response['response']){
						$innings = $response['innings'];
						foreach ($innings as $key => $inning) {
							$batsmens = $inning['batsmen'];
							foreach ($batsmens as $key => $batsmen) {
								$batsmenArray = array(
									'iid' => intval($inning['iid']),
									'match_id' => intval($response['match_id']),
									'name' => $batsmen['name'],
									'batsman_id' => intval($batsmen['batsman_id']),
									'batting' => $batsmen['batting'],
									'position' => $batsmen['position'],
									'role' => $batsmen['role'],
									'role_str' => $batsmen['role_str'],
									'runs' => intval($batsmen['runs']),
									'balls_faced' => intval($batsmen['balls_faced']),
									'fours' => intval($batsmen['fours']),
									'sixes' => intval($batsmen['sixes']),
									'run0' => intval($batsmen['run0']),
									'run1' => intval($batsmen['run1']),
									'run2' => intval($batsmen['run2']),
									'run3' => intval($batsmen['run3']),
									'run5' => intval($batsmen['run5']),
									'how_out' => $batsmen['how_out'],
									'dismissal' => $batsmen['dismissal'],
									'strike_rate' => floatval($batsmen['strike_rate']),
									'bowler_id' => intval($batsmen['bowler_id']),
									'first_fielder_id' => intval($batsmen['first_fielder_id']),
									'second_fielder_id' => intval($batsmen['second_fielder_id']),
									'third_fielder_id' => intval($batsmen['third_fielder_id'])
								);
								
								$id = $this->insertUpdateMatches($batsmenArray, 'batsmens');
							}

							$bowlers = $inning['bowlers'];
							foreach ($bowlers as $key => $bowler) {
								$bowlersArray = array(
									'iid' => intval($inning['iid']),
									'match_id' => intval($response['match_id']),
									'name' => $bowler['name'],
									'bowler_id' => intval($bowler['batsman_id']),
									'bowling' => $bowler['bowling'],
									'position' => $bowler['position'],
									'overs' => floatval($bowler['overs']),
									'maidens' => intval($bowler['maidens']),
									'runs_conceded' => intval($bowler['runs_conceded']),
									'wickets' => intval($bowler['wickets']),
									'noballs' => intval($bowler['noballs']),
									'wides' => intval($bowler['wides']),
									'econ' => floatval($bowler['econ']),
									'run0' => intval($bowler['run0']),
									'bowledcount' => intval($bowler['bowledcount']),
									'lbwcount' => intval($bowler['lbwcount'])
								);
								
								$id = $this->insertUpdateMatches($bowlersArray, 'bowlers');
							}
							
							$fielders = $inning['fielder'];
							foreach ($fielders as $key => $fielder) {
								$fieldersArray = array(
									'iid' => intval($inning['iid']),
									'match_id' => intval($response['match_id']),
									'fielder_name' => $fielder['fielder_name'],
									'fielder_id' => intval($fielder['fielder_id']),
									'catches' => intval($fielder['catches']),
									'runout_thrower' => intval($fielder['runout_thrower']),
									'runout_catcher' => intval($fielder['runout_catcher']),
									'runout_direct_hit' => intval($fielder['runout_direct_hit']),
									'stumping' => intval($fielder['stumping']),
									'is_substitute' => $fielder['is_substitute'],
								);
								
								$id = $this->insertUpdateMatches($fieldersArray, 'fielders');
							}
						}
					}
				}
			}
		}
	}
?>