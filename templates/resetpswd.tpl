{{include file="pheader.tpl"}}
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-26b11096="" data-v-fe31f972="" class="">
			<view data-v-26b11096="" class="nut-navbar--placeholder mb0 nav-icon-right nut-navbar--fixed" style="height: 44px;">
				<view class="nut-navbar nut-navbar--fixed" style="z-index: 10;">
					<a href="{{#server_url#}}pmenu" class="nut-navbar__left">
						<i data-v-26b11096="" class="nutui-iconfont nut-icon nut-icon-left"></i>
					</a>
					<view class="nut-navbar__title">
						<view class="title">Reset Password</view>
						<!---->
					</view>
					<view class="nut-navbar__right">
						<!---->
					</view>
				</view>
			</view>
			<div data-v-26b11096="" class="login">
				<div data-v-26b11096="" class="login-bn">&nbsp;</div>
				<div data-v-26b11096="" class="login-bd">
					<form method="post" action="{{#server_url#}}inc/presetpswd.php" id="frmReset" name="frmReset">
						<h3 data-v-26b11096="">Reset Password</h3>
						<div data-v-26b11096="" class="login-inp">
							<p data-v-26b11096="" class="fs10 fc-999">Old Password</p>
							<view data-v-26b11096="" class="nut-input nut-input-border" rule="^.{6,18}$">
								<!----><!---->
								<view class="nut-input-value">
									<view class="nut-input-inner">
										<view class="nut-input-box">
											<input type="password" name="opass" id="opass" class="input-text" maxlength="18" placeholder="Old Password" required="required" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
										</view>
										<view class="nut-input-clear-box">
											<!---->
										</view>
										<!----><!----><!---->
									</view>
									<!----><!---->
								</view>
							</view>
						</div>
						<div data-v-26b11096="" class="login-inp">
							<p data-v-26b11096="" class="fs10 fc-999">New Password</p>
							<view data-v-26b11096="" class="nut-input nut-input-border" rule="^.{6,18}$">
								<!----><!---->
								<view class="nut-input-value">
									<view class="nut-input-inner">
										<view class="nut-input-box">
											<input type="password" class="input-text" name="npass" id="npass" maxlength="18" placeholder="New Password" required="required" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
										</view>
										<view class="nut-input-clear-box">
											<!---->
										</view>
										<!----><!----><!---->
									</view>
									<!----><!---->
								</view>
							</view>
							<div data-v-26b11096="" class="inp-r"><i data-v-26b11096="" class="nutui-iconfont nut-icon nut-icon-marshalling" src=""></i></div>
						</div>
						<div data-v-26b11096="" class="login-inp">
							<p data-v-26b11096="" class="fs10 fc-999">Confirm Password</p>
							<view data-v-26b11096="" class="nut-input nut-input-border" rule="^.{6,18}$">
								<!----><!---->
								<view class="nut-input-value">
									<view class="nut-input-inner">
										<view class="nut-input-box"><input type="password" class="input-text" name="cpass" id="cpass" maxlength="18" placeholder="Confirm Password" required="required" formattrigger="onChange" enterkeyhint="done" style="text-align: left;"></view>
										<view class="nut-input-clear-box">
											<!---->
										</view>
										<!----><!----><!---->
									</view>
									<!----><!---->
								</view>
							</view>
						</div>
						<div data-v-26b11096="" class="login-btn">
							<view data-v-26b11096="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--block">
								<view class="nut-button__warp">
									<!----><!---->
									<view class="">Confirm</view>
								</view>
							</view>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('form#frmReset').submit(function(){
		if($('#npass').val() != $('#npass').val()){
			alert("New Password and Confirm Password doesn't match");
			return false;
		}
		return true;
	});
</script>