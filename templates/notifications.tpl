{{if !$smarty.request.ajax}}
{{include file="pheader.tpl"}}
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-7f4ac60a="" data-v-fe31f972="" class="transactionsHistoryList">
			<view data-v-7f4ac60a="" class="nut-navbar--placeholder mb0 nav-icon-right nut-navbar--fixed" style="height: 44px;">
				<view class="nut-navbar nut-navbar--fixed" style="z-index: 10;">
					<a href="{{#server_url#}}{{if $smarty.request.mode}}{{$smarty.request.mode}}{{else}}pmenu{{/if}}" class="nut-navbar__left">
						<i data-v-7f4ac60a="" class="nutui-iconfont nut-icon nut-icon-left"></i>
					</a>
					<view class="nut-navbar__title">
						<view class="title">Envelopes Center</view>
						<!---->
					</view>
					<view class="nut-navbar__right">
						<!---->
					</view>
				</view>
			</view>
			<div data-v-7f4ac60a="" class="pt50">
				<div data-v-7f4ac60a="" class="p20" style="padding: 10px 5px !important;">
					<div data-v-7f4ac60a="" class="csls" id="scroll">
						<view data-v-7f4ac60a="" class="nut-infinite-container" id="notifications">
{{/if}}
							{{section name="n" loop=$notifications}}
							<div class="notifications">
								<view id="overlay_{{$notifications[n].id}}" class="nut-overlay" style="transition-duration: 0.3s; z-index: 2000; display: none;"></view>
								<view id="overlay_msg_{{$notifications[n].id}}" class="nut-popup round popup-bottom" style="z-index: 2001; transition-duration: 0.3s; height: 70%;display: none;">
									<div data-v-3693670c="" data-v-00ea969a="" class="play-rule">
									{{$notifications[n].message}}
									</div>
									<a href="javascript: void(0)" onclick="closePoupup('{{$notifications[n].id}}');" class="nut-popup__close-icon nut-popup__close-icon--top-right">
										<i class="nutui-iconfont nut-icon nut-icon-close" src="" style="font-size: 12px; width: 12px; height: 12px;"></i>
									</a>
								</view>
								<div data-v-7f4ac60a="" class="csls-item">
									<h4 data-v-7f4ac60a="">{{$notifications[n].title}}</h4>
									<p data-v-7f4ac60a="">{{$notifications[n].dt|date_format:"%d/%m/%Y %H:%M:%S"}}</p>
								</div>
							</div>
							{{/section}}
							<view class="nut-infinite-bottom">
								<view class="tips">No more!</view>
							</view>
{{if !$smarty.request.ajax}}
						</view>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$('div.csls-item').click(function(){
	$(this).parents('.notifications').find('.nut-overlay:eq(0)').show();
	$(this).parents('.notifications').find('.nut-popup:eq(0)').show();
});

function closePoupup(id){
	$('#overlay_msg_' + id).hide(); 
	$('#overlay_' + id).hide();
}
</script>
{{/if}}
