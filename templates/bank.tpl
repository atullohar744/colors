{{include file="pheader.tpl"}}
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-fc3cf8d6="">
			<view data-v-fc3cf8d6="" class="nut-navbar--placeholder mb0 nav-icon-right nut-navbar--fixed" style="height: 44px;">
				<view class="nut-navbar nut-navbar--fixed" style="z-index: 10;">
					<a href="{{#server_url#}}pmenu" class="nut-navbar__left">
						<i data-v-fc3cf8d6="" class="nutui-iconfont nut-icon nut-icon-left"></i>
					</a>
					<view class="nut-navbar__title">
						<view class="title">
							Bank Card
						</view><i class="nutui-iconfont nut-icon nut-icon-home icon mb0 nav-icon-right nut-navbar--fixed" src=""></i>
					</view>
					<view class="nut-navbar__right">
						<!---->
					</view>
				</view>
			</view>
			<div data-v-fc3cf8d6="" class="login form-add">
				<div data-v-fc3cf8d6="" class="login-bn">
					&nbsp;
				</div>
				<div data-v-fc3cf8d6="" class="login-bd">
					<form method="post" action="{{#server_url#}}inc/bank.php" id="frmBank" name="frmbank">
						<input type="hidden" name="id" value="{{$bank.id}}" />
						<h3 data-v-fc3cf8d6="">Add Bank Card</h3>
						<p data-v-fc3cf8d6="" class="addcard-text">
							Please make sure that the information is correct, avoid not being able to receive withdrawals.
						</p>
						<div data-v-fc3cf8d6="" class="login-inp">
							<p data-v-fc3cf8d6="" class="fs10 fc-999">
								Real name<span data-v-fc3cf8d6="" class="c-red">*</span>
							</p>
							<view data-v-fc3cf8d6="" class="nut-input nut-input-border" rule="^.{4,30}$">
								<!----><!---->
								<view class="nut-input-value">
									<view class="nut-input-inner">
										<view class="nut-input-box">
											<input type="text" class="input-text" value="{{$bank.name}}" name="name" id="name" required="required" maxlength="30" placeholder="Real name(English)" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
										</view>
										<view class="nut-input-clear-box">
											<!---->
										</view><!----><!----><!---->
									</view><!----><!---->
								</view>
							</view>
						</div>
						<div data-v-fc3cf8d6="" class="login-inp">
							<p data-v-fc3cf8d6="" class="fs10 fc-999">
								IFSC Code<span data-v-fc3cf8d6="" class="c-red">*</span>
							</p>
							<view data-v-fc3cf8d6="" class="nut-input nut-input-border" rule="^.{4,30}$">
								<!----><!---->
								<view class="nut-input-value">
									<view class="nut-input-inner">
										<view class="nut-input-box">
											<input type="text" class="input-text" value="{{$bank.ifsc}}" name="ifsc" id="ifsc" required="required" maxlength="30" placeholder="IFSC Code" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
										</view>
										<view class="nut-input-clear-box">
											<!---->
										</view><!----><!----><!---->
									</view><!----><!---->
								</view>
							</view>
						</div>
						<div data-v-fc3cf8d6="" class="login-inp">
							<p data-v-fc3cf8d6="" class="fs10 fc-999">
								Bank Name<span data-v-fc3cf8d6="" class="c-red">*</span>
							</p>
							<view data-v-fc3cf8d6="" class="nut-input nut-input-border" rule="^.{4,30}$">
								<!----><!---->
								<view class="nut-input-value">
									<view class="nut-input-inner">
										<view class="nut-input-box">
											<input type="text" class="input-text" value="{{$bank.bank_name}}" name="bank_name" id="bank_name" required="required" maxlength="30" placeholder="Bank Name" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
										</view>
										<view class="nut-input-clear-box">
											<!---->
										</view><!----><!----><!---->
									</view><!----><!---->
								</view>
							</view>
						</div>
						<div data-v-fc3cf8d6="" class="login-inp">
							<p data-v-fc3cf8d6="" class="fs10 fc-999">
								Bank Account<span data-v-fc3cf8d6="" class="c-red">*</span>
							</p>
							<view data-v-fc3cf8d6="" class="nut-input nut-input-border" rule="^.{4,30}$">
								<!----><!---->
								<view class="nut-input-value">
									<view class="nut-input-inner">
										<view class="nut-input-box">
											<input type="text" class="input-text" value="{{$bank.bank_account}}" name="bank_account" id="bank_account" required="required" maxlength="30" placeholder="Bank Account" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
										</view>
										<view class="nut-input-clear-box">
											<!---->
										</view><!----><!----><!---->
									</view><!----><!---->
								</view>
							</view>
						</div>
						<div data-v-fc3cf8d6="" class="login-inp">
							<p data-v-fc3cf8d6="" class="fs10 fc-999">
								UPI ID (Vpa)<span data-v-fc3cf8d6="" class="c-red">*</span>
							</p>
							<view data-v-fc3cf8d6="" class="nut-input nut-input-border" rule="^.{4,30}$">
								<!----><!---->
								<view class="nut-input-value">
									<view class="nut-input-inner">
										<view class="nut-input-box">
											<input type="text" class="input-text" value="{{$bank.upi}}" name="upi" id="upi" required="required" maxlength="30" placeholder="UPI ID (Vpa)" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
										</view>
										<view class="nut-input-clear-box">
											<!---->
										</view><!----><!----><!---->
									</view><!----><!---->
								</view>
							</view>
						</div>
						<div data-v-fc3cf8d6="" class="login-inp">
							<p data-v-fc3cf8d6="" class="fs10 fc-999">
								E-mail<span data-v-fc3cf8d6="" class="c-red">*</span>
							</p>
							<view data-v-fc3cf8d6="" class="nut-input nut-input-border" rule="^.{4,30}$">
								<!----><!---->
								<view class="nut-input-value">
									<view class="nut-input-inner">
										<view class="nut-input-box">
											<input type="text" class="input-text" name="email" id="email" value="{{$bank.email}}" maxlength="30" placeholder="E-mail" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
										</view>
										<view class="nut-input-clear-box">
											<!---->
										</view><!----><!----><!---->
									</view><!----><!---->
								</view>
							</view>
						</div>
						<div data-v-fc3cf8d6="" class="login-btn">
							<a href="javascript:$('#frmBank').submit();" data-v-fc3cf8d6="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--block">
								<view class="nut-button__warp">
									<!----><!---->
									<view class="">
										Confirm
									</view>
								</view>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		{{if $smarty.request.status}}
		<view class="nut-overlay" style="transition-duration: 0.3s; z-index: 2000; "></view>
		<view class="nut-popup popup-center pop-bankName" style="z-index: 2000; transition-duration: 0.3s;height: auto; width:auto !important;padding: 15px;">
			<!----><!----><!---->
			<a href="{{#server_url#}}pmenu" data-v-fc3cf8d6="" class="nut-button nut-button--primary nut-button--normal nut-button--round">
				<view class="nut-button__warp">
					<!----><!---->
					<view class="" style="color:#fff;">
						{{$smarty.request.status}}
					</view>
				</view>
			</a><!---->
		</view>
		{{/if}}
	</div>
</div>
