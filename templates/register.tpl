{{include file="pheader.tpl"}}
{{if $smarty.request.reason eq 'dphone'}}
{{$header}}
<div class="card">
	<div class="card-body">
		<div class="card-body border-top">
			<div class="alert alert-danger text-black">
				<h4 class="alert-heading">Duplicate Phone Number</h4>
				This Phone Number Already Registered With Us.
				<br />
				Please <a href="{{#server_url#}}register">Try Again</a> to your account.
				<br />
				<br />
			</div>
		</div>
	</div>
</div>
{{elseif $smarty.request.reason eq 'referral'}}
{{$header}}
<div class="card">
	<div class="card-body">
		<div class="card-body border-top">
			<div class="alert alert-danger text-black">
				<h4 class="alert-heading">Invalid Referral</h4>
				<a href="{{#server_url#}}register">Retry</a>
			</div>
		</div>
	</div>
</div>
{{elseif $smarty.request.reason eq 'success'}}
{{$header}}
<div class="card">
	<div class="card-body">
		<div class="card-body border-top">
			<div class="alert alert-success text-black">
				<h4 class="alert-heading">Registered Successfully</h4>
				Please <a href="{{#server_url#}}plogin">Login</a> to access Parity.
			</div>
		</div>
	</div>
</div>
{{else}}
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-307eea4c="" data-v-fe31f972="" class="">
			<view data-v-307eea4c="" class="nut-navbar--placeholder mb0 nav-icon-right nut-navbar--fixed" style="height: 44px;">
				<view class="nut-navbar nut-navbar--fixed" style="z-index: 10;">
					<a href="{{#server_url#}}plogin" class="nut-navbar__left"> <i data-v-307eea4c="" class="nutui-iconfont nut-icon nut-icon-left"></i> </a>
					<view class="nut-navbar__title">
						<view class="title">
							Register
						</view>
					</view>
					<view class="nut-navbar__right"></view>
				</view>
			</view>
			<div data-v-307eea4c="" class="login userLogin pt280">
				<div data-v-307eea4c="" class="login-bn"></div>
				<div data-v-307eea4c="" class="login-bd">
					<form data-v-4fbee4ce="" class="nut-form" method="post" action="{{#server_url#}}inc/pregister.php" id="frmRegister" name="frmRegister">
						<view class="nut-cell-group">
							<view class="nut-cell-group__warp">
								<div data-v-307eea4c="" class="login-inp">
									<p data-v-307eea4c="" class="fs10 fc-999">
										Mobile Number
									</p>
									<div data-v-307eea4c="" class="nation">
										+91
									</div>
									<view data-v-307eea4c="" class="nut-input nut-input-border pl40" rule="^.{1,18}$" autocomplete="off">
										<view class="nut-input-value">
											<view class="nut-input-inner">
												<view class="nut-input-box">
													<input type="text" class="input-text" maxlength="9999" name="phone" id="phone" required="required" placeholder="Mobile Number" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
												</view>
												<view class="nut-input-clear-box"></view>
											</view>
										</view>
									</view>
								</div>
								<div data-v-307eea4c="" class="login-inp">
									<p data-v-307eea4c="" class="fs10 fc-999">
										Password
									</p>
									<view data-v-307eea4c="" class="nut-input nut-input-border" rule="^.{1,32}$" autocomplete="off">
										<view class="nut-input-value">
											<view class="nut-input-inner">
												<view class="nut-input-box">
													<input type="password" class="input-text" name="pass" id="pass" required="required" maxlength="32" placeholder="6~32 length" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
												</view>
												<view class="nut-input-clear-box"></view>
											</view>
										</view>
									</view>
									<div data-v-307eea4c="" class="inp-r">
										<i data-v-307eea4c="" class="nutui-iconfont nut-icon nut-icon-marshalling" src=""></i>
									</div>
								</div>
								<div data-v-307eea4c="" class="login-inp">
									<p data-v-307eea4c="" class="fs10 fc-999">
										Confirm Password
									</p>
									<view data-v-307eea4c="" class="nut-input nut-input-border" rule="^.{1,32}$" autocomplete="off">
										<view class="nut-input-value">
											<view class="nut-input-inner">
												<view class="nut-input-box">
													<input type="password" class="input-text" maxlength="32" name="cpass" required="required" id="cpass" placeholder="Confirm Password" formattrigger="onChange" enterkeyhint="done" style="text-align: left;">
												</view>
												<view class="nut-input-clear-box"></view>
											</view>
										</view>
									</view>
								</div>
								<div data-v-307eea4c="" class="login-inp mb10">
									<p data-v-307eea4c="" class="fs10 fc-999">
										Recommendation Code
									</p>
									<view data-v-307eea4c="" class="nut-input nut-input-border" autocomplete="off" value="">
										<view class="nut-input-value">
											<view class="nut-input-inner">
												<view class="nut-input-box">
													<input type="text" class="input-text" maxlength="10" name="referral" id="referral" placeholder="Not required" formattrigger="onChange" enterkeyhint="done" style="text-align: left;" {{if $smarty.request.code}}value="{{$smarty.request.code}}" readonly="readonly"{{/if}}>
												</view>
												<view class="nut-input-clear-box"></view>
											</view>
										</view>
									</view>
								</div>
								<div data-v-307eea4c="" class="login-checkbox">
									<view data-v-307eea4c="" class="nut-checkbox nut-checkbox--round ">
										<i class="nutui-iconfont nut-icon nut-icon-checked nut-checkbox__icon" src="" style="font-size: 14px; width: 14px; height: 14px;"></i>
										<view class="nut-checkbox__label ">
											I agree <span data-v-307eea4c="">Privacy Policy</span>
										</view>
									</view>
								</div>
								<div data-v-307eea4c="" class="login-btn">
									<a href="javascript:void(0);" onclick="sendOtp()" data-v-307eea4c="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--block">
									<view class="nut-button__warp">
										<view class="">
											Register
										</view>
									</view> </a>
									<p data-v-307eea4c="" class="f-c-login">
										<span data-v-307eea4c="" style="color: rgb(204, 204, 204);">Already registered? </span>
										<a href="{{#server_url#}}plogin"> <span data-v-307eea4c="">Login</span> </a>
									</p>
								</div>
							</view>
						</view>
					</form>
				</div>
				<p data-v-307eea4c="" style="text-align: center; color: rgb(102, 102, 102); padding-bottom: 5px; margin: 0px;">
					Service Email: support@yoswin.com
				</p>
				<p data-v-307eea4c="" style="text-align: center; color: rgb(102, 102, 102); padding-bottom: 20px; margin: 0px;">
					Business Email: support@yoswin.com
				</p><view class="nut-overlay" style="transition-duration: 0.3s; z-index: 100; display: none;"></view>
			</div>
		</div>
	</div>
</div>
{{/if}} <view id="overlay" class="nut-overlay" style="transition-duration: 0.3s; z-index: 2000; display: none;"></view>
<view id="frm-overlay" class="nut-popup round popup-bottom betPanelBox" style="z-index: 2073; transition-duration: 0.3s; display: none;">
	<div data-v-307eea4c="" class="login-bd">
		<form data-v-4fbee4ce="" class="nut-form" method="post" action="{{#server_url#}}inc/ajax.php?mode=otp" id="frmOtp" name="frmOtp">
			<view class="nut-cell-group">
				<view class="nut-cell-group__warp">
					<div data-v-307eea4c="" class="login-inp">
						<p data-v-307eea4c="" class="fs10 fc-999">
							OTP
						</p>
						<view data-v-307eea4c="" class="nut-input nut-input-border pl40" rule="^.{1,18}$" autocomplete="off">
							<view class="nut-input-value">
								<view class="nut-input-inner">
									<view class="nut-input-box">
										<input type="text" class="input-text" maxlength="9999" name="otp" id="otp" required="required" placeholder="Enter OTP" style="text-align: left;">
									</view>
									<view class="nut-input-clear-box"></view>
								</view>
							</view>
						</view>
					</div>
					<div data-v-307eea4c="" class="login-btn">
						<a href="javascript:void(0);" onclick="verifyOtp();" data-v-307eea4c="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--block">
							<view class="nut-button__warp">
								<view class="">
									Register
								</view>
							</view> 
						</a>
						<p data-v-307eea4c="" class="f-c-login">
							<a href="javascript:void(0);" onclick="sendOtp()"> <span data-v-307eea4c="">Resend</span> </a>
						</p>
					</div>
				</view>
			</view>
		</form>
	</div>
</view>
<script>
	function sendOtp(){
		$.ajax({
			type : 'POST',
			url : base + 'inc/ajax.php?mode=sendOtp&phone=' + $('input#phone').val(),
			success : function(response) {
				if(response == 'success'){
					$('#overlay').show(); 
					$('#frm-overlay').show();
				}
			}
		});
	}
	
	function verifyOtp(){
		var otp = $('input#otp').val();
		
		$.ajax({
			type : 'POST',
			url : base + 'inc/ajax.php?mode=verifyOtp&phone=' + $('input#phone').val() + '&otp=' + otp,
			success : function(response) {
				if(response == 'success'){
					$('#frmRegister').submit();
				}
				else
					alert("Invalid Otp");
			}
		});
	}
</script>