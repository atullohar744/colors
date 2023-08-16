{{include file="pheader.tpl"}}
		<div id="app" data-v-app="">
			<div data-v-fe31f972="">
				<div data-v-5acf0172="" data-v-fe31f972="" class="myHome">
					<view data-v-5acf0172="" class="nut-navbar--placeholder mb0 nav-icon-right nut-navbar--fixed nut-navbar-b0" style="height: 44px;">
						<view class="nut-navbar nut-navbar--fixed" style="z-index: 10;">
							<view class="nut-navbar__left">
								
							</view>
							<view class="nut-navbar__title">
								<view class="title">My Home</view>
								<a href="{{#server_url#}}notifications" style="color:#fff;"><i class="nutui-iconfont nut-icon nut-icon-notice icon mb0 nav-icon-right nut-navbar--fixed nut-navbar-b0" src=""></i></a>
							</view>
							<view class="nut-navbar__right">
								
							</view>
						</view>
					</view>
					<div data-v-5acf0172="" class="my-info">
						<div data-v-5acf0172="" class="my-info-t">
							<div data-v-5acf0172="" class="p-avatar">
								<img data-v-5acf0172="" class="abg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAN4AAADeAQAAAAB6HIMaAAAAAnRSTlMAAHaTzTgAAAAcSURBVFjD7cEBAQAAAIIg/69uSEABAAAAAAA8GhkmAAG/ZA38AAAAAElFTkSuQmCC" style="">
								<img data-v-5acf0172="" class="avatarimg" src="{{#server_url#}}{{$user.imgpath}}" style="">
							</div>
							<ul data-v-5acf0172="">
								<li data-v-5acf0172="">{{$user.phone}}</li>
								{{if $user.vip}}
								<li data-v-5acf0172="" class="tx"><span data-v-5acf0172="">VIP</span></li>
								{{/if}}
							</ul>
						</div>
						<div data-v-5acf0172="" class="my-info-c">
							<div data-v-5acf0172="" class="t">
								<div data-v-5acf0172="" class="h5">
									<span data-v-5acf0172="">Game account <i data-v-5acf0172="" class="nutui-iconfont nut-icon nut-icon-ask copyicon" src="" style="vertical-align: bottom;"></i></span>
									<strong data-v-5acf0172="">₹{{$user.balance}}</strong>
								</div>
								<div data-v-5acf0172="" class="btn-box"><a href="{{#server_url#}}recharge" data-v-5acf0172="" class="btn-t">Recharge</a><a href="{{#server_url#}}withdrwal" data-v-5acf0172="" class="btn-t">Withdrawal</a></div>
							</div>
							<div data-v-5acf0172="" class="t b1" style="display: none;">
								<div data-v-5acf0172="" class="h5"><span data-v-5acf0172="">Agent account <i data-v-5acf0172="" class="nutui-iconfont nut-icon nut-icon-ask copyicon" src="" style="vertical-align: bottom;"></i></span><strong data-v-5acf0172="">₹0</strong></div>
								<div data-v-5acf0172="" class="btn-box"><span data-v-5acf0172="" class="btn-t">Transfer</span><span data-v-5acf0172="" class="btn-t">Withdrawal</span></div>
							</div>
						</div>
						<div data-v-5acf0172="" class="my-info-b">
							<div data-v-5acf0172="" class="t mr5">
								<h5 data-v-5acf0172="">Rewards</h5>
								<a href="{{#server_url#}}rewards"><span data-v-5acf0172="">Check-in &gt;</span></a>
							</div>
							<div data-v-5acf0172="" class="t">
								<h5 data-v-5acf0172="">InviteCode</h5>
								<span data-v-5acf0172="">{{$user.referral_code}} <a href="javascript: void(0);" onclick="copyToClipboard('inviteLink');"> <i data-v-5acf0172="" class="nutui-iconfont nut-icon nut-icon-link copyicon" src=""></i></a></span>
							</div>
						</div>
					</div>
					<div data-v-5acf0172="" class="m8" style="padding-bottom: 80px;">
						<view data-v-5acf0172="" class="nut-cell-group">
							
							<view class="nut-cell-group__warp">
								<a href="{{#server_url#}}promotion"  data-v-5acf0172="" class="nut-cell nut-cell--clickable icon-t4">
									
									<view class="nut-cell__title">Promotion</view>
									<i class="nutui-iconfont nut-icon nut-icon-right nut-cell__link icon-t4" src=""></i>
								</a>
								<a href="{{#server_url#}}transactions"  data-v-5acf0172="" class="nut-cell nut-cell--clickable icon-t4">
									
									<view class="nut-cell__title">Transactions</view>
									<i class="nutui-iconfont nut-icon nut-icon-right nut-cell__link icon-t4" src=""></i>
								</a>
								<a href="{{#server_url#}}bank"  data-v-5acf0172="" class="nut-cell nut-cell--clickable icon-t5">
									
									<view class="nut-cell__title">Bank Card</view>
									<i class="nutui-iconfont nut-icon nut-icon-right nut-cell__link icon-t5" src=""></i>
								</a>
								<a href="{{#server_url#}}recharge"  data-v-5acf0172="" class="nut-cell nut-cell--clickable icon-t10">
									
									<view class="nut-cell__title">Recharge</view>
									<i class="nutui-iconfont nut-icon nut-icon-right nut-cell__link icon-t10" src=""></i>
								</a>
								<a href="{{#server_url#}}transactions?mode=recharge"  data-v-5acf0172="" class="nut-cell nut-cell--clickable icon-t10">
									
									<view class="nut-cell__title">Recharge History</view>
									<i class="nutui-iconfont nut-icon nut-icon-right nut-cell__link icon-t10" src=""></i>
								</a>
								<a href="{{#server_url#}}transactions?mode=withdrwal"  data-v-5acf0172="" class="nut-cell nut-cell--clickable icon-t10">
									
									<view class="nut-cell__title">Withdrawal History</view>
									<i class="nutui-iconfont nut-icon nut-icon-right nut-cell__link icon-t10" src=""></i>
								</a>
								<a href="{{#server_url#}}resetpswd"  data-v-5acf0172="" class="nut-cell nut-cell--clickable icon-t6">
									
									<view class="nut-cell__title">Reset Password</view>
									<i class="nutui-iconfont nut-icon nut-icon-right nut-cell__link icon-t6" src=""></i>
								</a>
								<a href="javascript: void(0);" onclick="$('#dialog-complaints').show();" data-v-5acf0172="" class="nut-cell nut-cell--clickable icon-t7">
									
									<view class="nut-cell__title">Complaints &amp; Suggestions</view>
									<i class="nutui-iconfont nut-icon nut-icon-right nut-cell__link icon-t7" src=""></i>
								</a>
							</view>
						</view>
						<a href="{{#server_url#}}plogout" data-v-5acf0172="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--plain nut-button--block" style="margin-top: 20px;">
							<view class="nut-button__warp">
								
								<view class="">Logout</view>
							</view>
						</a>
					</div>
					{{include file="pfooter.tpl"}}
				</div>
			</div>
		</div>
		<view id="dialog-complaints" data-v-app="" style="display:none;">
			<view class="nut-overlay" style="transition-duration: 0.3s; z-index: 2000;"></view>
			<view class="nut-popup round popup-center" style="z-index: 2000; transition-duration: 0.3s;">
				<view class="nut-dialog">
					
					<view class="nut-dialog__content" style="text-align: center;">
						<view>If there is any problem, please contact us through Email:support@yoswin.com, working hours: 7:00-20:00</view>
					</view>
					<view class="nut-dialog__footer horizontal">
						
						<a href="javascript: void(0);" onclick="$('#dialog-complaints').hide();" class="nut-button nut-button--primary nut-button--small nut-button--round nut-dialog__footer-ok">
							<view class="nut-button__warp">
								
								<view class="">OK</view>
							</view>
						</a>
					</view>
				</view>
				
			</view>
		</view>
	</body>
</html>