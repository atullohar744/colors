{{if !$smarty.request.ajax}}
{{include file="pheader.tpl"}}
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-08116ea4="" class="transactionsHistoryList">
			<view data-v-08116ea4="" class="nut-navbar--placeholder mb0 nav-icon-right nut-navbar--fixed" style="height: 44px;">
				<view class="nut-navbar nut-navbar--fixed" style="z-index: 10;">
					<a href="{{#server_url#}}{{if $smarty.request.mode}}{{$smarty.request.mode}}{{else}}pmenu{{/if}}" class="nut-navbar__left"> <i data-v-08116ea4="" class="nutui-iconfont nut-icon nut-icon-left"></i> </a>
					<view class="nut-navbar__title">
						<view class="title">
							Rewards
						</view>
						<!---->
					</view>
					<view class="nut-navbar__right">
						<!---->
					</view>
				</view>
			</view>
			<div data-v-08116ea4="" class="agentList">
				<img data-v-08116ea4="" class="img-w100" src="{{#server_url#}}assets/yoswin/bg53.f0083158.png">
				<p data-v-08116ea4="" class="p-info">
					The Agent crore cash growth plan is divided in 19 levels, and each level has generous rewards. Complete the highest level and get a reward of 2500000 immediately.
				</p>
				{{section name="r" loop=$rewards}}
				<div data-v-08116ea4="" class="agentList-item" taskid="18" tasktype="series">
					<div data-v-08116ea4="" class="item-t lv1">
						<h3 data-v-08116ea4="">{{$rewards[r].reward}}</h3><span data-v-08116ea4="" class="l">{{$smarty.section.$r.index}}</span><!----><span data-v-08116ea4="" class="r">+₹{{$rewards[r].amount}}</span>
					</div>
					<div data-v-08116ea4="" class="item-b">
						<div data-v-08116ea4="">
							<h4 data-v-08116ea4="">Reward Description</h4>
							{{$rewards[r].description}}
							{{if $rewards[r].link}}
							<view data-v-08116ea4="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--block">
								<a href="{{$rewards[r].link}}" target="_blank" class="nut-button__warp">
									<view class="">
										Go
									</view>
								</a>
							</view>
							{{/if}}
						</div>
					</div>
				</div>
				{{/section}}
				<div data-v-08116ea4="" class="nut-backtop" style="right: 10px; bottom: 20px; z-index: 10;">
					<i class="nutui-iconfont nut-icon nut-icon-top nut-backtop-main" src="" style="font-size: 19px; width: 19px; height: 19px;"></i>
				</div>
			</div>
		</div>
	</div>
</div>
{{/if}} 