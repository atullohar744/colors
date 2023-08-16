<div data-v-00ea969a="" class="betting-panel {{if $smarty.request.color eq 'r'}}bg-r{{elseif $smarty.request.color eq 'g'}}bg-g{{else}}bg-v{{/if}}">
	<h2 data-v-00ea969a="">Join <strong data-v-00ea969a="" class="c-g">{{if $smarty.request.number}}{{$smarty.request.number}}{{elseif $smarty.request.color eq 'r'}}Red{{elseif $smarty.request.color eq 'g'}}Green{{else}}Violet{{/if}}</strong><span data-v-00ea969a="" class="btn-f12"></span></h2>
	<div data-v-00ea969a="" class="panel-hd">
		<div data-v-00ea969a="" class="l">
			<span data-v-00ea969a="">Balance:</span>
			<br data-v-00ea969a="">
			<strong data-v-00ea969a="">₹{{$user.balance}}</strong>
			<view data-v-00ea969a="" class="nut-button nut-button--primary nut-button--small nut-button--round">
				<a href="{{#server_url#}}recharge" class="nut-button__warp">
					<!----><!---->
					<view class="">
						Recharge
					</view>
				</a>
			</view>
		</div>
		<div data-v-00ea969a="" class="r">
			<!----><!---->
		</div>
	</div>
	<form method="post" action="{{#server_url#}}inc/join.php" id="frmJoin" name="frmJoin" validation="true">
		<input type="hidden" name="number" id="number" value="{{$smarty.request.number}}" />
		<input type="hidden" name="color" id="color" value="{{$smarty.request.color}}" />
		<div data-v-00ea969a="" class="panel-bd">
			<h6 data-v-00ea969a="">Contract Point</h6>
			<div data-v-00ea969a="" class="btnbox">
				<button type="button" data-v-00ea969a="" class="btn" onclick="setAmount('10');">
					10
				</button>
				<button type="button" data-v-00ea969a="" class="btn" onclick="setAmount('40');">
					40
				</button>
				<button type="button" data-v-00ea969a="" class="btn" onclick="setAmount('100');">
					100
				</button>
				<button type="button" data-v-00ea969a="" class="btn" onclick="setAmount('1000');">
					1000
				</button>
				<button type="button" data-v-00ea969a="" class="btn" onclick="setAmount('all');">
					All
				</button>
			</div>
			<h6 data-v-00ea969a="">Number <span data-v-00ea969a="" class="c">( Vip1+ input freely )</span></h6>
			<div data-v-00ea969a="" class="inpbox">
				<button type="button" data-v-00ea969a="" class="btn-bet btn-sub" onclick="decreaseAmount()">
					-
				</button>
				<input data-v-00ea969a="" name="betAmount" id="betAmount" class="inp-bet" type="number" required="required">
				<button type="button" data-v-00ea969a="" class="btn-bet btn-plus" onclick="increaseAmount()">
					+
				</button>
			</div>
			<div data-v-00ea969a="" class="popover">
				<h6 data-v-00ea969a="">Vip0 Rookie Guide</h6>
				<p data-v-00ea969a="">
					Follow advice and you'll win finally!
				</p>
				<table data-v-00ea969a="">
					<tr data-v-00ea969a="">
						<th data-v-00ea969a="">Input</th><th data-v-00ea969a="">FAIL</th><th data-v-00ea969a="">WIN</th>
					</tr>
					<tr data-v-00ea969a="">
						<td data-v-00ea969a="">10</td><td data-v-00ea969a="">-10</td><td data-v-00ea969a="">10*2-10 = <strong data-v-00ea969a="">10</strong></td>
					</tr>
					<tr data-v-00ea969a="">
						<td data-v-00ea969a="">40</td><td data-v-00ea969a="">-40</td><td data-v-00ea969a="">40*2-40-10 = <strong data-v-00ea969a="">30</strong></td>
					</tr>
					<tr data-v-00ea969a="">
						<td data-v-00ea969a="">100</td><td data-v-00ea969a="">-100</td><td data-v-00ea969a="">100*2-100-40-10 = <strong data-v-00ea969a="">50</strong></td>
					</tr>
				</table>
				<p data-v-00ea969a="" class="r">
					So this round should input <strong data-v-00ea969a="">10</strong>
				</p>
			</div>
			<div data-v-00ea969a="" class="btn-confirm">
				<view data-v-00ea969a="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--block btn-bg-g" onclick="$('#frmJoin').submit();">
					<view class="nut-button__warp">
						<!----><!---->
						<view class="">
							<span data-v-00ea969a="">Confirm </span>
						</view>
					</view>
				</view>
			</div>
		</div>
	</form>
</div>
<view class="nut-popup__close-icon nut-popup__close-icon--top-right" onclick="closePopuup()">
	<i class="nutui-iconfont nut-icon nut-icon-close" src="" style="font-size: 12px; width: 12px; height: 12px;"></i>
</view>

<script>
	editAjaxForm();
</script>