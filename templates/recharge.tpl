{{include file="pheader.tpl"}}
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<div id="app" data-v-app="">
	<div data-v-fe31f972="">
		<div data-v-4fbee4ce="">
			<view data-v-4fbee4ce="" class="nut-navbar--placeholder mb0 nav-icon-right nut-navbar--fixed top-desc" style="height: 44px;">
				<view class="nut-navbar nut-navbar--fixed" style="z-index: 10;">
					<view class="nut-navbar__left">
						<!----><!---->
					</view>
					<view class="nut-navbar__title">
						<view class="title">Recharge</view>
						<a href="{{#server_url#}}transactions?mode=recharge"><i class="nutui-iconfont nut-icon nut-icon-horizontal icon mb0 nav-icon-right nut-navbar--fixed top-desc" src=""></i></a>
					</view>
					<view class="nut-navbar__right">
						<!---->
					</view>
				</view>
			</view>
			
			<div data-v-4fbee4ce="" class="recharge-bd balanceVue">
				<div data-v-4fbee4ce="" class="recharge-ls" style="padding-top: 20px;">
					<a data-v-4fbee4ce="200" class="recharge-btn">
						<strong data-v-4fbee4ce="200">₹200</strong><span data-v-4fbee4ce="" class="hot" style="display: none;">&nbsp;</span>
						<p data-v-4fbee4ce="" style="display: none;">+0</p>
					</a>
					<a data-v-4fbee4ce="300" class="recharge-btn">
						<strong data-v-4fbee4ce="">₹300</strong><span data-v-4fbee4ce="" class="hot" style="display: none;">&nbsp;</span>
						<p data-v-4fbee4ce="" style="display: none;">+0</p>
					</a>
					<a data-v-4fbee4ce="500" class="recharge-btn">
						<strong data-v-4fbee4ce="">₹500</strong><span data-v-4fbee4ce="" class="hot" style="display: none;">&nbsp;</span>
						<p data-v-4fbee4ce="">+5</p>
					</a>
					<a data-v-4fbee4ce="1000" class="recharge-btn active">
						<strong data-v-4fbee4ce="">₹1000</strong><span data-v-4fbee4ce="" class="hot">&nbsp;</span>
						<p data-v-4fbee4ce="">+10</p>
					</a>
					<a data-v-4fbee4ce="5000" class="recharge-btn">
						<strong data-v-4fbee4ce="">₹5000</strong><span data-v-4fbee4ce="" class="hot">&nbsp;</span>
						<p data-v-4fbee4ce="">+75</p>
					</a>
					<a data-v-4fbee4ce="10000" class="recharge-btn">
						<strong data-v-4fbee4ce="">₹10000</strong><span data-v-4fbee4ce="" class="hot">&nbsp;</span>
						<p data-v-4fbee4ce="">+175</p>
					</a>
					<a data-v-4fbee4ce="20000" class="recharge-btn">
						<strong data-v-4fbee4ce="">₹20000</strong><span data-v-4fbee4ce="" class="hot" style="display: none;">&nbsp;</span>
						<p data-v-4fbee4ce="">+400</p>
					</a>
					<a data-v-4fbee4ce="30000" class="recharge-btn">
						<strong data-v-4fbee4ce="">₹30000</strong><span data-v-4fbee4ce="" class="hot" style="display: none;">&nbsp;</span>
						<p data-v-4fbee4ce="">+675</p>
					</a>
					<a data-v-4fbee4ce="50000" class="recharge-btn">
						<strong data-v-4fbee4ce="">₹50000</strong><span data-v-4fbee4ce="" class="hot" style="display: none;">&nbsp;</span>
						<p data-v-4fbee4ce="">+1250</p>
					</a>
				</div>
				<form data-v-4fbee4ce="" class="nut-form" method="post" action="{{#server_url#}}inc/recharge.php" id="frmRecharge" name="frmRecharge">
					<view class="nut-cell-group">
						<!----><!---->
						<view class="nut-cell-group__warp">
							<view data-v-4fbee4ce="" class="nut-cell nut-form-item line">
								<view class="nut-cell__title nut-form-item__label">Amount</view>
								<view class="nut-cell__value nut-form-item__body">
									<view class="nut-form-item__body__slots">
										<input data-v-4fbee4ce="" class="nut-input-text" placeholder="Amount" id="amount" name="amount" type="text">
										<p data-v-4fbee4ce="" class="p-info" style=""> +10</p>
									</view>
									<!---->
								</view>
							</view>
							<view data-v-4fbee4ce="" class="nut-cell nut-form-item line">
								<view class="nut-cell__title nut-form-item__label">Receipt</view>
								<view class="nut-cell__value nut-form-item__body">
									<view class="nut-form-item__body__slots">
										{{assign var=unique_id value=11111|mt_rand:999999}}
										<input data-v-4fbee4ce="" class="nut-input-text" name="receipt" placeholder="Receipt" type="text" readonly value="{{$unique_id}}">
									</view>
									<!---->
								</view>
							</view>
						</view>
					</view>
				</form>
				<div data-v-4fbee4ce="" class="login-btn m10" style="margin-top: 20px;">
					<a href="javascript: pay_now();" data-v-4fbee4ce="" class="nut-button nut-button--info nut-button--normal nut-button--round nut-button--block">
						<view class="nut-button__warp">
							<view class=""><span data-v-4fbee4ce="">Recharge</span></view>
						</view>
					</a>
				</div>
				<div data-v-4fbee4ce="" class="bt-tx">
					<p data-v-4fbee4ce=""><strong data-v-4fbee4ce="">Description</strong></p>
					<p data-v-4fbee4ce="">1.If there is any problem with the recharge, please contact us through <strong data-v-4fbee4ce="">E-mail:support@yoswin.com</strong> , working hours: 7:00-20:00</p>
					<p data-v-4fbee4ce="">2.The recharge amount will increase your VIP level, and a higher VIP level will increase your Withdrawal Amount, Daily Bonus, etc. </p>
					<p data-v-4fbee4ce="">See the<strong data-v-4fbee4ce="" class="text-color" style="color: rgb(71, 16, 153);">“VIP Description”</strong>.</p>
					<p data-v-4fbee4ce="">3.Do not reveal your password to prevent it from being stolen. Our staff will not ask for your password.</p>
				</div>
			</div>
		{{include file="pfooter.tpl"}}
		</div>
	</div>
</div>
{{if $smarty.request.status}}
<view class="nut-overlay" style="transition-duration: 0.3s; z-index: 2000; "></view>
<view class="nut-popup popup-center pop-bankName" style="z-index: 2000; transition-duration: 0.3s;height: auto; width:auto !important;padding: 15px;">
	<!----><!----><!---->
	<a href="javascript: $('.nut-overlay').hide(); $('.nut-popup').hide();" data-v-fc3cf8d6="" class="nut-button nut-button--primary nut-button--normal nut-button--round">
		<view class="nut-button__warp">
			<!----><!---->
			<view class="" style="color:#fff;">
				{{$smarty.request.status}}
			</view>
		</view>
	</a><!---->
</view>
{{/if}}
<script>
	$('.recharge-ls .recharge-btn').click(function(){
		$('.recharge-ls .recharge-btn').removeClass('active');
		var amount = parseInt($(this).attr('data-v-4fbee4ce'));
		$('input#amount').val(amount);
		$(this).addClass('active');
	});

    function pay_now(){
        
        var name = "{{$smarty.session.$session.phone}}";
        var amt = $('input#amount').val();
        var user_id = "{{$smarty.session.$session.userid}}";
        
        jQuery.ajax({
           type:'post',
           url:'{{#server_url#}}inc/recharge.php',
           data:"amt="+amt+"&name="+name+"&user_id="+user_id,
           success:function(result){
               var options = {
                    "key": "rzp_test_mwVqforrK23LnD", 
                    "amount": amt*100, 
                    "currency": "INR",
                    "name": "Yoswin",
                    "description": "Recharge",
                    "image": "https://ludotalents.in/img/a.png",
                    "handler": function (response){
                       jQuery.ajax({
                           type:'post',
                           url:'{{#server_url#}}inc/recharge.php',
                           data:"payment_id=" + response.razorpay_payment_id + "&amount=" + amt + "&user_id=" + user_id,
                           success:function(result){
                           		window.location.href="{{#server_url#}}recharge?status=" + result;
                           }
                       });
                    }
                };
                var rzp1 = new Razorpay(options);
                rzp1.open();
           }
       });
    }
</script>
</body>
</html>