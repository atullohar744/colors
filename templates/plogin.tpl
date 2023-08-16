{{include file="pheader.tpl"}}
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-ef635a9c="" data-v-fe31f972="" class="login userLogin">
			<div data-v-ef635a9c="" class="login-bn">
				<h2 data-v-ef635a9c="">&nbsp;</h2>
			</div>
			<div data-v-ef635a9c="" class="login-bd">
				<h3 data-v-ef635a9c="">Sign In</h3>
				<form data-v-4fbee4ce="" class="nut-form" method="post" action="{{#server_url#}}inc/plogin.php" id="frmLogin" name="frmLogin">
					<div data-v-ef635a9c="" class="login-inp">
						<p data-v-ef635a9c="" class="fs10 fc-999">
							Mobile Number
						</p><p data-v-ef635a9c="" class="err-info" style="display: none;"></p>
						<div data-v-ef635a9c="" class="nation">
							+91
						</div><!----><!----><!----><!----><!---->
						<view data-v-ef635a9c="" class="nut-input nut-input-border pl40" rule="^.{1,18}$" autocomplete="off">
							<!----><!---->
							<view class="nut-input-value">
								<view class="nut-input-inner">
									<view class="nut-input-box">
										<input type="text" class="input-text" name="phone" id="phone" required="required" maxlength="9999" placeholder="Mobile Number" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
									</view>
									<view class="nut-input-clear-box">
										<!---->
									</view><!----><!----><!---->
								</view><!----><!---->
							</view>
						</view>
					</div>
					<div data-v-ef635a9c="" class="login-inp">
						<p data-v-ef635a9c="" class="fs10 fc-999">
							Password
						</p><p data-v-ef635a9c="" class="err-info" style="display: none;"></p><span data-v-ef635a9c="" class="f-r">Forgot password?</span>
						<view data-v-ef635a9c="" class="nut-input nut-input-border" rule="^.{1,32}$" autocomplete="off">
							<!----><!---->
							<view class="nut-input-value">
								<view class="nut-input-inner">
									<view class="nut-input-box">
										<input type="password" class="input-text" name="pass" id="pass" required="required" maxlength="32" placeholder="6~32 length" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
									</view>
									<view class="nut-input-clear-box">
										<!---->
									</view><!----><!----><!---->
								</view><!----><!---->
							</view>
						</view>
					</div>
					<div data-v-ef635a9c="" class="login-btn">
						<a href="javascript: $('#frmLogin').submit();" data-v-ef635a9c="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--block">
							<view class="nut-button__warp">
								<!----><!---->
								<view class="">
									Login
								</view>
							</view>
						</a>
					</div>
				</form>
				<view data-v-ef635a9c="" class="nut-row-
				nut-row-justify-start
				nut-row-align-flex-start
				nut-row-flex-nowrap
				nut-row">
					<a href="{{#server_url#}}register" data-v-ef635a9c="" class="nut-col nut-col-12 nut-col-offset-0" style="padding-left: 0px; padding-right: 0px;">
						<div data-v-ef635a9c="" class="flex-content">
							<span data-v-ef635a9c="" class="a-lk">Register</span>
						</div>
					</a>
					<view data-v-ef635a9c="" class="nut-col nut-col-12 nut-col-offset-0" style="padding-left: 0px; padding-right: 0px; display: none;">
						<div data-v-ef635a9c="" class="flex-content ta-right">
							<span data-v-ef635a9c="" class="a-lk">SMS verification login</span>
						</div>
					</view>
				</view>
			</div>
		</div>
	</div>
</div>
<view id="overlay" class="nut-overlay" style="transition-duration: 0.3s; z-index: 2000;display: none;"></view>
<view id="play-rules" class="nut-popup round popup-top" style="z-index: 2001; transition-duration: 0.3s; top: 50%; left: 50%; transform: translate(-50%, -50%);display: none;">
	<div data-v-3693670c="" data-v-00ea969a="" class="play-rule" style="padding-top:80px;">
		<img src="{{#server_url#}}assets/yoswin/shared image.png" style="width:100%" />
	</div>
	<a href="javascript: void(0)" onclick="$('#play-rules').hide(); $('#overlay').hide();" class="nut-popup__close-icon nut-popup__close-icon--top-right">
		<i class="nutui-iconfont nut-icon nut-icon-close" src="" style="font-size: 12px; width: 12px; height: 12px;"></i>
	</a>
</view>
</body>
</html>