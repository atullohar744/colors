{{include file="pheader.tpl"}}
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-4b374f0f="" data-v-fe31f972="" class="">
			<view data-v-4b374f0f="" class="nut-navbar--placeholder mb0 nav-icon-right nut-navbar--fixed" style="height: 44px;">
				<view class="nut-navbar nut-navbar--fixed" style="z-index: 10;">
					<view class="nut-navbar__left">
						<i data-v-4b374f0f="" class="nutui-iconfont nut-icon nut-icon-left"></i>
					</view>
					<view class="nut-navbar__title">
						<view class="title">
							Withdrawal
						</view>
						<a href="{{#server_url#}}transactions?mode=withdrwal"><i class="nutui-iconfont nut-icon nut-icon-horizontal icon mb0 nav-icon-right nut-navbar--fixed" src=""></i></a>
					</view>
					<view class="nut-navbar__right"></view>
				</view>
			</view>
			<div data-v-4b374f0f="" class="recharge-bd balanceVue">
				<div data-v-4b374f0f="" class="top-text">
					<strong data-v-4b374f0f="">Available Balance</strong>
					<br data-v-4b374f0f="">
					<span data-v-4b374f0f="" class="f-24">{{$user.balance}}</span>
				</div>
				<div data-v-4b374f0f="" class="top-text-b">&nbsp;</div>
				<div data-v-4b374f0f="" class="recharge-ls">
					<div data-v-4b374f0f="" class="recharge-btn">
						<strong data-v-4b374f0f="200">₹200</strong>
					</div>
					<div data-v-4b374f0f="" class="recharge-btn">
						<strong data-v-4b374f0f="300">₹300</strong>
					</div>
					<div data-v-4b374f0f="" class="recharge-btn">
						<strong data-v-4b374f0f="500">₹500</strong>
					</div>
					<div data-v-4b374f0f="" class="recharge-btn">
						<strong data-v-4b374f0f="1000">₹1000</strong>
					</div>
					<div data-v-4b374f0f="" class="recharge-btn">
						<strong data-v-4b374f0f="5000">₹5000</strong>
					</div>
					<div data-v-4b374f0f="" class="recharge-btn">
						<strong data-v-4b374f0f="10000">₹10000</strong>
					</div>
					<div data-v-4b374f0f="" class="recharge-btn">
						<strong data-v-4b374f0f="50000">₹50000</strong>
					</div>
				</div>
				<form data-v-4fbee4ce="" class="nut-form label-w150" method="post" action="{{#server_url#}}inc/withdrwal.php" id="frmWithdrwal" name="frmWithdrwal">
					<view class="nut-cell-group">
						<view class="nut-cell-group__warp">
							<view data-v-4b374f0f="" class="nut-cell nut-form-item line">
								<view class="nut-cell__title nut-form-item__label">
									Withdraw amount
								</view>
								<view class="nut-cell__value nut-form-item__body">
									<view class="nut-form-item__body__slots">
										<input data-v-4b374f0f="" class="nut-input-text" type="text" name="amount" id="amount" required="required">
									</view>
								</view>
							</view>
						</view>
					</view>
				</form>
				<div data-v-4b374f0f="" class="login-btn m10">
					<a href="javascript:void(0);" onclick="$('#frmWithdrwal').submit()" data-v-4b374f0f="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--block">
						<view class="nut-button__warp">
							<view class="">
								Withdrawal
							</view>
						</view>
					</a>
				</div>
				<div data-v-4b374f0f="" class="bt-tx">
					<p data-v-4b374f0f="">
						<strong data-v-4b374f0f="">Description</strong>
					</p>
					<p data-v-4b374f0f="">
						1.If there is any problem with the withdrawal, please contact us through <strong data-v-4b374f0f="">E-mail: support@yoswin.com</strong> , working hours: 7:00-20:00
					</p>
					<p data-v-4b374f0f="">
						2.Higher VIP level can increase the withdrawal limit.
					</p>
					<p data-v-4b374f0f="">
						See the<strong data-v-4b374f0f="" class="text-color" style="color: rgb(71, 16, 153);">“VIP Description”</strong>.
					</p>
					<p data-v-4b374f0f="">
						3.In order to prevent money laundering, you must reach enough amount of input before you can withdraw.
					</p>
				</div>
			</div>
			{{include file="pfooter.tpl"}}
			{{if !$bank}}
			<view class="nut-overlay" style="transition-duration: 0.3s; z-index: 2000;"></view>
			<view class="nut-popup round popup-center" style="z-index: 2000; transition-duration: 0.3s;">
				<view class="nut-dialog">
					<view class="nut-dialog__content" style="text-align: center;">
						<view>
							Please add a bank card to withdraw.
						</view>
					</view>
					<view class="nut-dialog__footer horizontal">
						<a href="{{#server_url#}}bank" class="nut-button nut-button--primary nut-button--small nut-button--round nut-dialog__footer-ok">
							<view class="nut-button__warp">
								<view class="">
									OK
								</view>
							</view>
						</a>
					</view>
				</view>
			</view>
			{{/if}}
			{{if $smarty.request.reason}}
			<view class="nut-overlay" style="transition-duration: 0.3s; z-index: 2000;"></view>
			<view class="nut-popup round popup-center" style="z-index: 2000; transition-duration: 0.3s;">
				<view class="nut-dialog">
					<view class="nut-dialog__content" style="text-align: center;">
						<view>
							{{if $smarty.request.reason eq 'balance'}}
							You don't have sufficient balance for withdrawal.
							{{else}}
							Withdrawal Request SenT To Admin. Will contact you soon.
							{{/if}}
						</view>
					</view>
					<view class="nut-dialog__footer horizontal">
						<a href="{{#server_url#}}parity" class="nut-button nut-button--primary nut-button--small nut-button--round nut-dialog__footer-ok">
							<view class="nut-button__warp">
								<view class="">
									OK
								</view>
							</view>
						</a>
					</view>
				</view>
			</view>
			{{/if}}
		</div>
	</div>
</div>
<script>
$('.recharge-ls .recharge-btn').click(function(){
	$('.recharge-ls .recharge-btn').removeClass('active');
	var amount = parseInt($(this).find('strong:eq(0)').attr('data-v-4b374f0f'));
	$('input#amount').val(amount);
	$(this).addClass('active');
});
</script>