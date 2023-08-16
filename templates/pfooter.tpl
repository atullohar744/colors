		<link href="{{#scripts_url#}}yoswin/chunk-vendors.c522d089.css" rel="stylesheet">
		<script>
			function copyToClipboard(element) {
			  var $temp = $("<input>");
			  $("body").append($temp);
			  $temp.val($('#' + element).text()).select();
			  document.execCommand("copy");
			  $temp.remove();
			  alert('Invite Link: ' + $('#' + element).text() + '\n\n Invite Link Copied');
			}
		</script>
		<p id="inviteLink" style="display: none;">{{#server_url#}}register?code={{$smarty.session.$session.referral_code}}</p>
		<link href="{{#server_url#}}styles/footer.css?t={{$smarty.now|date_format:'%d%m%Y%H%I%S'}}" rel="stylesheet">
		<view data-v-204742f5="" data-v-00ea969a="" class="nut-tabbar nut-tabbar-bottom nut-tabbar-safebottom">
			<div data-v-204742f5="" class="nut-tabbar-item nut-tabbar-item__icon--unactive" style="color: rgb(200, 196, 217);">
				<a href="{{#server_url#}}recharge" class="nut-tabbar-item_icon-box">
					<div class="nut-tabbar-item_icon-box_icon" style="background-image: url('{{#server_url#}}assets/yoswin/footer_img.png'); width: 20px; height: 20px;"></div>
					<view class="nut-tabbar-item_icon-box_nav-word">
						<view>
							Recharge
						</view>
					</view>
				</a>
			</div>
			<div data-v-204742f5="" class="nut-tabbar-item nut-tabbar-item__icon--unactive" style="color: rgb(200, 196, 217);">
				<a href="javascript: void(0);" onclick="copyToClipboard('inviteLink');" class="nut-tabbar-item_icon-box">
					<view>
						<i class="nutui-iconfont nut-icon nut-icon-link nut-tabbar-item_icon-box_icon" src="" style="font-size: 20px; width: 20px; height: 20px;"></i>
					</view>
					<view class="nut-tabbar-item_icon-box_nav-word">
						<view>
							Invite
						</view>
					</view>
				</a>
			</div>
			<div data-v-204742f5="" class="nut-tabbar-item show-list" style="color: rgb(92, 39, 102);">
				<a href="{{#server_url#}}parity1" class="nut-tabbar-item_icon-box">
					<div class="nut-tabbar-item_icon-box_icon" style="background-image: url('{{#server_url#}}assets/yoswin/home.png'); width: 20px; height: 20px;"></div>
					<view class="nut-tabbar-item_icon-box_nav-word">
						<view></view>
					</view>
				</a>
			</div>
			<div data-v-204742f5="" class="nut-tabbar-item nut-tabbar-item__icon--unactive" style="color: rgb(200, 196, 217);">
				<a href="{{#server_url#}}rewards" class="nut-tabbar-item_icon-box">
					<view>
						<i class="nutui-iconfont nut-icon nut-icon-date nut-tabbar-item_icon-box_icon" src="" style="font-size: 20px; width: 20px; height: 20px;"></i>
					</view>
					<view class="nut-tabbar-item_icon-box_nav-word">
						<view>
							Rewards
						</view>
					</view>
				</a>
			</div>
			<div data-v-204742f5="" class="nut-tabbar-item nut-tabbar-item__icon--unactive" style="color: rgb(200, 196, 217);">
				<a href="{{#server_url#}}pmenu" class="nut-tabbar-item_icon-box">
					<view>
						<i class="nutui-iconfont nut-icon nut-icon-my nut-tabbar-item_icon-box_icon" src="" style="font-size: 20px; width: 20px; height: 20px;"></i>
					</view>
					<view class="nut-tabbar-item_icon-box_nav-word">
						<view>
							My
						</view>
					</view>
				</a>
			</div>
		</view>
	