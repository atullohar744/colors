{{if !$smarty.request.ajax}}
{{include file="pheader.tpl"}}
<style>
	.bet-disabled {
		background: #fff;
		background-size: 30px;
		opacity: .8;
		position: absolute;
		top: 0;
		right: -3px;
		bottom: -4px;
		left: 0;
		z-index: 999;
	}
	.bet-disabled p {
		background: #fff url(data:image/png;base64,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) center 100px no-repeat;
		background-size: 50px;
		color: red;
		padding-top: 100px;
		font-size: 25px;
		text-align: center;
	}
</style>
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-00ea969a="" data-v-fe31f972="" class="">
			<div data-v-00ea969a="" class="rg-main">
				<div data-v-00ea969a="" class="rg-hd">
					<div data-v-00ea969a="" class="parity-btn"></div>
					<div data-v-00ea969a="" class="c">
						<span data-v-00ea969a="" class="title">PARITY</span>
						<a href="javascript: void(0)" onclick="$('#play-rules').show(); $('#overlay').show();"><span data-v-00ea969a="" class="r"><i data-v-00ea969a="">?</i></span></a>
					</div>
				</div>
				<div data-v-00ea969a="" class="rg-top topbg1">
					<div data-v-00ea969a="" class="room-tabs">
						<div data-v-00ea969a="" class="nav">
							<span data-v-00ea969a="" class="a">Fast</span>
							<span data-v-00ea969a="" class="">Prediction</span>
						</div>
					</div>
					<div data-v-00ea969a="" class="prediction prediction-none">
						<div data-v-00ea969a="" class="prediction-avatar"></div>
						<div data-v-00ea969a="" class="prediction-say">
							<h5 data-v-00ea969a="" style="padding: 5px 10px;">LIVE Prediction is now available in <strong data-v-00ea969a="">Prediction </strong> room!</h5>
						</div>
					</div>
					<div data-v-00ea969a="" class="gm-number">
						<span data-v-00ea969a="">P{{$smarty.now}}<strong data-v-00ea969a="">{{$user.id}}</strong></span>
					</div>
					<div data-v-00ea969a="" class="timer-box">
						<div data-v-00ea969a="" class="countdown">
							<div data-v-00ea969a="" class="c-3">
								<h6 data-v-00ea969a="" style="display: none;">My Choice</h6>
								<ul data-v-00ea969a="" style="display: none;"></ul>
							</div>
							<div data-v-00ea969a="" class="c-3" style="width: 40%;">
								<h6 data-v-00ea969a="">Choose time</h6>
								<strong data-v-00ea969a="" style="">
								<view data-v-00ea969a="" class="nut-countdown" style="font-size: 30px; color: rgb(166, 255, 170);">
									{{math assign="timer" equation="x - y" x=60 y=$stime|date_format:"%S"}}
									<view id="timer" class="nut-cd-block">
										{{$timer}}
									</view>
								</view> </strong>
								<strong data-v-00ea969a="" style="display: none;">
								<view data-v-00ea969a="" class="nut-countdown" style="font-size: 30px; color: rgb(255, 199, 69);">
									<view class="nut-cd-block">
										00:00
									</view>
								</view> </strong>
								<strong data-v-00ea969a="" style="display: none;"> <span data-v-00ea969a="" style="font-size: 20px; color: rgb(255, 166, 166);">Paused</span> </strong>
							</div>
							<div data-v-00ea969a="" class="c-3">
								<h6 data-v-00ea969a="" style="display: none;">My Point</h6>
								<span data-v-00ea969a="" class="c-y" style="display: none;">₹0</span>
							</div>
						</div>
					</div>
				</div>
				<div data-v-00ea969a="" class="rg-body">
					<div data-v-00ea969a="" class="bet-container">
						<div data-v-00ea969a="" class="bet-disabled" style="">
							<p data-v-00ea969a="" style="">
								Betting Closed
							</p>
						</div>
						<div data-v-00ea969a="" class="btc-price">
							<strong data-v-00ea969a=""><i class="fa fa-inr"></i>{{$user.balance}}</strong>
							<span data-v-00ea969a="">BTC price by Binance</span>
							<a href="javascript: void(0)" onclick="$('#play-rules').show(); $('#overlay').show();"><i data-v-00ea969a="">?</i></a>
						</div>
						<ul data-v-00ea969a="" class="c-3" style="margin-top: 10px;">
							<li data-v-00ea969a="" class="g" {{if $pricing.vip_green_color}}onclick="joinColor('g')"{{/if}}>
								{{if !$pricing.vip_green_color}}
								<div data-v-00ea969a="" class="disabled" style="">
									<p data-v-00ea969a="" style="">
										Vip
									</p>
								</div>
								{{/if}}
								<div data-v-00ea969a="" class="p15">
									<strong data-v-00ea969a="">Join Green</strong><h5 data-v-00ea969a="">1:{{$pricing.green_color}}</h5>
								</div>
							</li>
							<li data-v-00ea969a="" class="v" {{if $pricing.vip_purple_color}}onclick="joinColor('v')"{{/if}}>
								{{if !$pricing.vip_purple_color}}
								<div data-v-00ea969a="" class="disabled" style="">
									<p data-v-00ea969a="" style="">
										Vip
									</p>
								</div>
								{{/if}}
								<div data-v-00ea969a="" class="p15">
									<strong data-v-00ea969a="">Join Violet</strong>
									<h5 data-v-00ea969a="">1:{{$pricing.purple_color}}</h5>
								</div>
							</li>
							<li data-v-00ea969a="" class="r" {{if $pricing.vip_red_color}}onclick="joinColor('r')"{{/if}}>
								{{if !$pricing.vip_red_color}}
								<div data-v-00ea969a="" class="disabled" style="">
									<p data-v-00ea969a="" style="">
										Vip
									</p>
								</div>
								{{/if}}
								<div data-v-00ea969a="" class="p15">
									<strong data-v-00ea969a="">Join Red</strong>
									<h5 data-v-00ea969a="">1:{{$pricing.red_color}}</h5>
								</div>
							</li>
						</ul>
						<h5 data-v-00ea969a="">Join Number 1:9</h5>
						<div data-v-00ea969a="" class="c-5-div">
							<ul data-v-00ea969a="" class="c-5">
								{{section name="i" loop=$numbers}}
								<li data-v-00ea969a="" class="{{if $numbers[i].green}}g{{elseif $numbers[i].red}}r{{else}}v v-5{{/if}}" {{if $pricing.vip_numbers}}onclick="joinNumber('{{$numbers[i].digit}}', '{{if $numbers[i].green}}g{{elseif $numbers[i].red}}r{{else}}v{{/if}}')"{{/if}}>
									<strong data-v-00ea969a="">{{$numbers[i].digit}}</strong>
								</li>
								{{/section}}
							</ul>
							{{if !$pricing.vip_numbers}}
							<div data-v-00ea969a="" class="disabled" style="">
								<p data-v-00ea969a="" style="">
									Vip
								</p>
							</div>
							{{/if}}
						</div>
					</div>
					<div id="ajaxResponse">
						{{/if}}
						<div data-v-00ea969a="" class="tabs tabs-3">
							<strong data-v-00ea969a="record" onclick="changeRTab('r')" class="a">Record</strong>
							<strong data-v-00ea969a="continuous" onclick="changeRTab('c')" class="">Continuous</strong>
							<strong data-v-00ea969a="probability" onclick="changeRTab('p')" class="">Probability</strong>
						</div>
						<div data-v-00ea969a="" class="result-announcement">
							<div data-v-00ea969a="">
								<ul id="betRecords" data-v-00ea969a="" class="c-10">
									{{section name="r" loop=$results}}
									<li data-v-00ea969a="" class="{{if $results[r].green}}g{{elseif $results[r].red}}r{{else}}v v-5{{/if}}">
										<span data-v-00ea969a="">{{$results[r].id}}</span>
										<strong data-v-00ea969a="">{{$results[r].digit}}</strong>
									</li>
									{{/section}}
								</ul>
							</div>
							<div data-v-00ea969a="" class="recharge-btn-box" style="display: none;">
								<view data-v-00ea969a="" class="nut-button nut-button--info nut-button--small nut-button--round nut-button--plain" style="min-width: 105px; height: 25px; padding: 0px;">
									<view class="nut-button__warp">
										<view class="">
											VIP Description
										</view>
									</view>
								</view>
								<view data-v-00ea969a="" class="nut-button nut-button--info nut-button--small nut-button--round ml5" style="min-width: 105px; height: 25px; padding: 0px;">
									<view class="nut-button__warp">
										<view class="">
											Upgrade
										</view>
									</view>
								</view>
							</div>
						</div>
						<div data-v-00ea969a="" class="tabs tabs-2">
							<strong data-v-00ea969a="allOrders" class="a" onclick="changeTab('a')">Everyone's Order</strong>
							<strong data-v-00ea969a="myOrders" class="" onclick="changeTab('m')">My Order</strong>
						</div>
						<div data-v-00ea969a="" class="result-announcement">
							<div data-v-00ea969a="" class="g-players" id="betOrders">
								<ul data-v-00ea969a="" style="">
									<li data-v-00ea969a="">
										<span data-v-00ea969a="" class="l" style="width: 130px; color: rgb(111, 86, 117);">User</span>
										<span data-v-00ea969a="" class="l" style="width: 70px; color: rgb(111, 86, 117);">Choose</span>
										<span data-v-00ea969a="" class="r" style="color: rgb(111, 86, 117);">Input</span>
									</li>
									{{section name="u" loop=$users}}
									<li data-v-00ea969a="">
										<span data-v-00ea969a="" class="l" style="width: 130px;"> <img data-v-00ea969a="" src="/img/a4.f89843b3.png">{{$users[u].phone}} </span>
										<span data-v-00ea969a="" class="l" style="width: 70px;">
											<div data-v-00ea969a="" class="dots {{if $users[u].green}}g{{elseif $users[u].red}}r{{else}}v v-5{{/if}}">
												<strong data-v-00ea969a="">{{$users[u].digit}}</strong>
											</div> </span>
										<span data-v-00ea969a="" class="r" style="color: rgb(187, 175, 120);">₹{{$users[u].amount}}</span>
									</li>
									{{/section}}
								</ul>
							</div>
						</div>
						{{if !$smarty.request.ajax}}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<view id="overlay" class="nut-overlay" style="transition-duration: 0.3s; z-index: 2000; display: none;"></view>
<view id="frm-overlay" class="nut-popup round popup-bottom betPanelBox" style="z-index: 2073; transition-duration: 0.3s; display: none;">
</view>
<view id="play-rules" class="nut-popup round popup-top" style="z-index: 2001; transition-duration: 0.3s; height: 70%;display: none;">
	<div data-v-3693670c="" data-v-00ea969a="" class="play-rule">
		<h4 data-v-3693670c=""><i data-v-3693670c="" class="nutui-iconfont nut-icon nut-icon-tips" src="" style="vertical-align: middle; margin-right: 5px; margin-bottom: 4px;"></i>Play Rules</h4>
		<dl data-v-3693670c="">
			<dt data-v-3693670c="">
				Truth is the real fair, reliable must require transparency
			</dt>
			<dd data-v-3693670c="">
				In order to ensure the interests of each investment user, in order to comply with the IBAS and MGA certification standards, the following instructions are given for the generation of parity number results.
			</dd>
			<dd data-v-3693670c="">
				1. Result source: Take the last digit of the closing price of Binance BTC/USDT spot trading pair at the moment when the Parity choose time ends.
			</dd>
			<dd data-v-3693670c="">
				2. Data verification: You can view the time of historical results and corresponding price from the order page, and compare the second-level historical data of Binance.
			</dd>
			<dd data-v-3693670c=""><img data-v-3693670c="" src="/img/bg155.f87a2ade.jpg">
			</dd>
			<dd data-v-3693670c="">
				Note: Binance is currently the world's largest cryptocurrency exchange.BTC/USDT refers to the trading price of Bitcoin/Tether. With a trading volume of $760k/day, nobody can manipulate price figures in seconds.
			</dd>
			<dt data-v-3693670c="">
				Fast
			</dt>
			<dd data-v-3693670c="">
				A round of 30 seconds, 25 seconds to place an order, 5 seconds to announce the result, 24 hours non-stop,a total of 2880 rounds a day.
			</dd>
			<dd data-v-3693670c="">
				Input 100 rupees in a round
			</dd>
			<dd data-v-3693670c="" style="color: rgb(7, 121, 66);">
				Join Green:
			</dd>
			<dd data-v-3693670c="">
				If the result is 1,3,7,9, you will get 195 rupees, if the result is 5, you will get 142.5 rupees.
			</dd>
			<dd data-v-3693670c="" style="color: rgb(190, 56, 22);">
				Join Red:
			</dd>
			<dd data-v-3693670c="">
				If the result is 2,4,6,8, you will get 195 rupees, if the result is 0, you will get 142.5 rupees.
			</dd>
			<dd data-v-3693670c="" style="color: rgb(72, 68, 180);">
				Join Violet:
			</dd>
			<dd data-v-3693670c="">
				If the result is 0,5, you will get 427.5 rupees.
			</dd>
			<dd data-v-3693670c="">
				Chose Number:
			</dd>
			<dd data-v-3693670c="">
				If the result is the number of your choice,you will get 855 rupees.
			</dd>
			<dt data-v-3693670c="">
				Prediction
			</dt>
			<dd data-v-3693670c="">
				A round of 90 seconds, 80 seconds to place an order, 10 seconds to announce the result, 24 hours non-stop,a total of 960 rounds a day.
			</dd>
			<dd data-v-3693670c="">
				Input 100 rupees in a round
			</dd>
			<dd data-v-3693670c="" style="color: rgb(7, 121, 66);">
				Join Green:
			</dd>
			<dd data-v-3693670c="">
				If the result is 1,3,7,9, you will get 195 rupees, if the result is 5, you will get 142.5 rupees.
			</dd>
			<dd data-v-3693670c="" style="color: rgb(190, 56, 22);">
				Join Red:
			</dd>
			<dd data-v-3693670c="">
				If the result is 2,4,6,8, you will get 195 rupees, if the result is 0, you will get 142.5 rupees.
			</dd>
			<dd data-v-3693670c="" style="color: rgb(72, 68, 180);">
				Join Violet:
			</dd>
			<dd data-v-3693670c="">
				If the result is 0,5, you will get 427.5 rupees.
			</dd>
			<dd data-v-3693670c="">
				Chose Number:
			</dd>
			<dd data-v-3693670c="">
				If the result is the number of your choice,you will get 855 rupees.
			</dd>
		</dl>
	</div>
	<a href="javascript: void(0)" onclick="$('#play-rules').hide(); $('#overlay').hide();" class="nut-popup__close-icon nut-popup__close-icon--top-right">
		<i class="nutui-iconfont nut-icon nut-icon-close" src="" style="font-size: 12px; width: 12px; height: 12px;"></i>
	</a>
</view>
{{include file="pfooter.tpl"}}
</body>
</html>
<script>
	function changeTab(type) {
		$.ajax({
			type : 'POST',
			url : base + 'betOrders?type=' + type,
			success : function(response) {
				$('div#betOrders').html(response);
				if (type == 'm') {
					$('[data-v-00ea969a="myOrders"]').removeClass('a').addClass('a');
					$('[data-v-00ea969a="allOrders"]').removeClass('a');
				} else {
					$('[data-v-00ea969a="allOrders"]').removeClass('a').addClass('a');
					$('[data-v-00ea969a="myOrders"]').removeClass('a');
				}
			}
		});
	}

	function changeRTab(type) {
		$.ajax({
			type : 'POST',
			url : base + 'betRecords?type=' + type,
			success : function(response) {
				$('ul#betRecords').html(response);
				if (type == 'r') {
					$('[data-v-00ea969a="record"]').removeClass('a').addClass('a');
					$('[data-v-00ea969a="continuous"]').removeClass('a');
					$('[data-v-00ea969a="probability"]').removeClass('a');
				} else if (type == 'c') {
					$('[data-v-00ea969a="record"]').removeClass('a');
					$('[data-v-00ea969a="continuous"]').removeClass('a').addClass('a');
					$('[data-v-00ea969a="probability"]').removeClass('a');
				} else {
					$('[data-v-00ea969a="record"]').removeClass('a');
					$('[data-v-00ea969a="continuous"]').removeClass('a');
					$('[data-v-00ea969a="probability"]').removeClass('a').addClass('a');
				}
			}
		});
	}

	function closePopuup() {
		$('#frm-overlay').hide().html('');
		$('#overlay').hide();
	}

	function openPopuup(number, color) {
		$.ajax({
			type : 'POST',
			url : base + 'bform?number=' + number + '&color=' + color,
			success : function(response) {
				$('#frm-overlay').html(response);
				$('#frm-overlay').show();
				$('#overlay').show();
			}
		});
	}

	var timer2 = "{{$timer}}";
	var interval = setInterval(gameTimer, 1000);
	function gameTimer() {
		timer = timer2;
		var seconds = parseInt(timer, 10);
		--seconds;
		seconds = (seconds < 0) ? 179 : seconds;
		seconds = (seconds < 10) ? '0' + seconds : seconds;
		$('#timer').html(seconds);
		timer2 = seconds;
		if (timer2 <= 10) {
			$('.bet-disabled').show();
			closePopuup();
			declareResult();
		} else
			$('.bet-disabled').hide();
	}

	function editAjaxForm() {
		$('#frmJoin').ajaxForm({
			type : 'post',
			success : function(data) {
				if (data != 'success') {
					if (confirm(data))
						closePopuup();
				} else {
					closePopuup();
					alert("Bet Placed Successfully");
				}
			},
			error : function(e) {
			}
		});
	}

	function joinNumber(number, color) {
		openPopuup(number, color);
	}

	function joinColor(color) {
		openPopuup("", color);
	}

	function declareResult() {
		$.ajax({
			type : 'POST',
			url : base + 'inc/ajax.php?mode=declare',
			success : function() {
			}
		});
		$.ajax({
			type : 'POST',
			url : base + 'parity?ajax=true',
			success : function(response) {
				$('#ajaxResponse').html(response);
			}
		});
	}

	function increaseAmount() {
		var curval = parseFloat($('#frmJoin #betAmount').val());
		curval++;
		$('#frmJoin #betAmount').val(curval);
	}

	function decreaseAmount() {
		var curval = parseFloat($('#frmJoin #betAmount').val());
		curval--;
		$('#frmJoin #betAmount').val(curval);
	}

	function setAmount(amt) {
		if (amt == 'all')
			$('#frmJoin #betAmount').val(1150);
		else
			$('#frmJoin #betAmount').val(amt);
	}
</script>
{{/if}} 