{{if !$smarty.request.ajax}}
{{include file="pheader.tpl"}}
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-390f3b3e="" data-v-fe31f972="" class="transactionsHistoryList">
			<view data-v-390f3b3e="" class="nut-navbar--placeholder mb0 nav-icon-right nut-navbar--fixed" style="height: 44px;">
				<view class="nut-navbar nut-navbar--fixed" style="z-index: 10;">
					<a href="{{#server_url#}}{{if $smarty.request.mode}}{{$smarty.request.mode}}{{else}}pmenu{{/if}}" class="nut-navbar__left">
						<i data-v-390f3b3e="" class="nutui-iconfont nut-icon nut-icon-left"></i>
					</a>
					<view class="nut-navbar__title">
						<view class="title">{{if $smarty.request.mode eq 'withdrwal'}}Withdrwal History{{elseif $smarty.request.mode eq 'recharge'}}Recharge History{{else}}Transactions{{/if}}</view>
						<!---->
					</view>
					<view class="nut-navbar__right">
						<!---->
					</view>
				</view>
			</view>
			<div data-v-390f3b3e="" class="pt50 scroll-body">
				<div data-v-390f3b3e="" class="p20" style="padding: 10px 5px !important;">
					{{if !$smarty.request.mode}}
					<div data-v-390f3b3e="" class="type-title">
						<span onclick="changeAccount('g')" class="a g" data-v-390f3b3e="">Game account</span>
						<span onclick="changeAccount('b')" class="b" data-v-390f3b3e="">Betting account</span>
						<span onclick="changeAccount('w')" class="w" data-v-390f3b3e="">Winning account</span>
					</div>
					{{/if}}
					<div data-v-390f3b3e="" class="tabs-nav">
						<ul data-v-390f3b3e="">
							<li onclick="changeTab('today')" data-v-390f3b3e="" class="transactions today active">Today</li>
							<li onclick="changeTab('week')" data-v-390f3b3e="" class="transactions week">1 Week</li>
							<li onclick="changeTab('month')" data-v-390f3b3e="" class="transactions month">1 Month</li>
							<li onclick="changeTab('3month')" data-v-390f3b3e="" class="transactions 3month">3 Month</li>
						</ul>
					</div>
					<div data-v-390f3b3e="" class="csls" id="scroll">
						<view data-v-390f3b3e="" class="nut-infiniteloading" id="transactions">
{{/if}}
							{{section name="t" loop=$transactions}}
							<view class="nut-infinite-container">
								<div data-v-390f3b3e="" class="csls-item">
									<h4 data-v-390f3b3e="">
										{{if $transactions[t].type eq 'credit' or $transactions[t].type eq 'winning'}}
										<span data-v-390f3b3e="" class="fc-green">+ ₹{{$transactions[t].amount}}</span>
										<span data-v-390f3b3e="" class="tx-right-g"> 0 &gt;&gt; {{$transactions[t].amount}}</span>
										{{elseif $transactions[t].type eq 'winning'}}
										<span data-v-390f3b3e="" class="fc-{{if $transactions[t].paid}}green{{else}}red{{/if}}">+ ₹{{$transactions[t].amount}}</span>
										<span data-v-390f3b3e="" class="tx-right-{{if $transactions[t].paid}}g{{else}}r{{/if}}">{{if $transactions[t].paid}}Paid{{else}}Pending{{/if}}</span>
										{{else}}
										<span data-v-390f3b3e="" class="fc-red">- ₹{{$transactions[t].amount}}</span>
										<span data-v-390f3b3e="" class="tx-right-r">0 &lt;&lt; {{$transactions[t].amount}}</span>
										{{/if}}
										
									</h4>
									<div data-v-390f3b3e="" class="bd">{{$transactions[t].remark}}</div>
									<p data-v-390f3b3e="">{{$transactions[t].date|date_format:"%d/%m/%Y %H:%M:%S"}}</p>
								</div>
							</view>
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
changeTab('today');

function changeTab(type){
	$.ajax({
		type: 'POST',
		url: base + 'transactions?ajax=true&type=' + type + '{{if $smarty.request.mode}}&mode={{$smarty.request.mode}}{{/if}}{{if !$smarty.request.mode}}&account=' + $('.type-title span.a').attr('class').replace('a', '').trim() + '{{/if}}',
		success: function(response){
			$('#transactions').html(response);
			$('.tabs-nav li.transactions').removeClass('active');
			$('.tabs-nav li.transactions.' + type).addClass('active');
		}
	});
}

function changeAccount(type){
	$.ajax({
		type: 'POST',
		url: base + 'transactions?ajax=true&type=' + type,
		success: function(response){
			changeTab('today');
			$('.type-title span').removeClass('a');
			$('.type-title span.' + type).addClass('a');
		}
	});
}
</script>
{{/if}}
