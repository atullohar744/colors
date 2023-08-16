<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="description" content="{{$meta.description}}" />
		<meta name="keywords" content="{{$meta.keywords}}" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta http-equiv="refresh" content="180">
		<link rel="icon" type="image/png" href="{{#server_url#}}{{$settings.favicon}}">
		<title>{{if $settings.title}}{{$settings.title}}{{else}}{{#sitename_caps#}}{{/if}}</title>
		
		<link rel="stylesheet" href="{{#server_url#}}scripts/winoxmall/style.css?t={{$smarty.now|date_format:'%d%m%Y%H%I%S'}}">
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link href="{{#server_url#}}scripts/winoxmall/dataTables.bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<style>
			body {
				-ms-user-select: text;
				user-select: text;
				-moz-user-select: text;
				-webkit-user-select: text
			}
			.layout--tabs .nav-item {
				width: 33%;
			}
			.table thead th {
				color: #000;
				text-align: center;
			}
			.accordion .btn-link::after {
				display: none;
			}
			.card {
				border: 1px solid #E5E9F2;
				border-radius: 3px;
				padding: 0px;
			}
			.card .card-title {
				margin-bottom: 7px;
			}
			.nav-tabs.size2 .cvc {
				width: 33%;
			}
			.modal-body {
				padding: 0 15px !important;
			}
			h3 {
				font-weight: normal;
				font-size: 20px;
			}
			h4 {
				font-weight: normal;
				font-size: 18px;
				color: #858585;
			}
			.card-body {
				padding: .6rem;
			}
			td {
				padding: 3px;
			}
			.btn-sm {
				height: 26px;
				padding: 0px 12px;
			}
			.form-control {
				box-shadow: none;
				border-bottom: #ccc solid 1px;
				margin-bottom: 3px;
			}
			#alert h4 {
				font-size: 1rem;
				font-weight: bold;
				color: #333;
			}
			#alert p {
				font-size: 13px;
				margin-top: 20px;
			}
			#alert .modal-content {
				border-radius: 3px
			}
			#alert .modal-dialog {
				padding: 20px;
				margin-top: 130px;
			}
			label {
				color: #999;
			}
			#bonus .modal-dialog {
				margin-top: 100px;
			}
			#bonus .modal-footer {
				border: none;
			}
			.dropdown-menu {
				background: #fff;
				top: -15px;
				left: -145px;
				border: none;
				border-radius: 0px;
				-webkit-box-shadow: 0 3px 1px -2px rgba(0, 0, 0, .2), 0 2px 2px 0 rgba(0, 0, 0, .14), 0 1px 5px 0 rgba(0, 0, 0, .12);
				box-shadow: 0 3px 1px -2px rgba(0, 0, 0, .2), 0 2px 2px 0 rgba(0, 0, 0, .14), 0 1px 5px 0 rgba(0, 0, 0, .12);
			}
			.appHeader1 .right {
				right: 20px;
			}
			.dropdown-item {
				padding:  .75rem 1.5 rem;
			}
			.nav-tabs .nav-link.active {
				background: #ccc !important;
				padding: 0 198px;
			}
			.tab-content {
				padding: 0;
			}
			.card {
				border-radius: 0 0 .25rem .25rem;
				border-top: 0;
			}
			.table td, .table th {
				text-align: center;
			}
			.nav-tabs {
				height: 42px;
				padding: 0;
				position: relative;.nav-item {
				margin-left: 0;a {
				color: black;
				display: block;
				padding: 8px 25px;
			}
			&
			.overflow-tab {
				background-color: white;
				display: none;
				position: absolute;
				right: 0;
				width: 150px;
				z-index: 1;a {
				border: 1px solid lightgray;
				border-radius: 0;
				padding: 6px 10px;&:hover,
				&:focus,
				&:active,
				&.active {
				background-color: lightgray;
			}
			}
			&
			:last-child {
				border-radius: 0 0 0 4px;
			}
			}
			&
			.overflow-tab-action {
				position: absolute;
				right: 0;
			}
			}
			}
			/* ----- CSS ----- */
			#popup {
				display: inline-block;
				opacity: 0;
				width: 63%;
				height: 50%;
				z-index: 99;
				position: fixed;
				top: 120px;
				left: 770px;
				padding: 1em;
				transform: translateX(-50%);
				background: #fff;
				border: 1px solid #888;
				box-shadow: 1px 1px 0.5em 0 rgb(0 0 0 / 50%);
				transition: opacity .3s ease-in-out;
			}
			#popup.hidden {
				display: none;
			}
			#popup.fade-in {
				opacity: 1;
			}
			.notice_zz {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: rgba(0,0,0,.4);
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.wrapper {
				background: #fff;
				padding: 15px;
				box-sizing: border-box;
				border-radius: 4px;
				width: 70%;
				box-shadow: 0 3px 1px -2px rgb(0 0 0 / 20%), 0 2px 2px 0 rgb(0 0 0 / 14%), 0 1px 5px 0 rgb(0 0 0 / 12%);
				transition: .3s cubic-bezier(.25,.8,.5,1);
			}
			.tz_title {
				font-size: 18px;
				padding: 15px;
			}
			.tz_info {
				font-size: 14px;
				padding: 15px;
				line-height: 1.5;
				max-height: 47vh;
				overflow-y: auto;
			}
			.tz_close {
				display: flex;
				justify-content: flex-end;
				padding: 8px 5px 8px 15px;
				box-sizing: border-box;
			}
			.tz_close button {
				color: #00897b;
				font-size: 14px;
				padding: 5px 10px;
				border: 0;
				background: transparent;
				margin-left: 10px;
			}
			.hide {
				display: none;
			}
			.dropdown {
				position: relative;
				display: inline-block;
			}
			.dropdown-content {
				display: none;
				position: absolute;
				background-color: #f9f9f9;
				min-width: 160px;
				box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
				padding: 12px 16px;
				z-index: 1;
				margin-left: -120px;
			}
			.dropdown-content p {
				font-size: 16px;
				padding: 10px;
			}
			.dropdown:hover .dropdown-content {
				display: block;
			}
			.modal-header {
				background: none;
				border-bottom: none;
			}
			.appBottomMenu .item.active span {
				color: #1f005c !important;
			}
			.appBottomMenu .item .ion-md-person {
				color: #1f005c !important;
			}
			.appBottomMenu .item .toggleSidebar span {
				color: #1f005c !important;
			}
			@media only screen and (max-width: 600px) {
				.nav-tabs .nav-link.active {
					background: #ccc !important;
					padding: 0 28px;
				}
				.modal-header {
					height: 46px !important;
				}
				.modal-dialog {
					margin: 0.5 rem 0 !important;
				}
			}
		</style>
	</head>
	<body>
		<!-- Page loading -->
		<div class="loading" id="loading" style="display: none;">
			<div class="spinner-grow"></div>
		</div>
		<!-- * Page loading -->
		<div id="modal-content" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							×
						</button>
					</div>
					<div class="modal-body">
						<p class="signCenter">
							<span class="closeSymbol">X</span>
						</p>
					</div>
					<div class="modal-footer signCenter">
						<p class="snapHdr">
							Oh Snap !
						</p>
						<p class="info">
							Your time has limited. Try checking once again
						</p>
						<a href="#" class="btn closeftr" data-dismiss="modal">Close</a>
					</div>
				</div>
			</div>
		</div>
		<div class="appHeader1">
			<div class="left">
				<a href="#" onclick="goBack();" class="icon goBack"> <i class="icon ion-md-arrow-back"></i> </a>
				<div class="pageTitle">
					Promotion
				</div>
			</div>
			<div class="right" style="display: none;">
				<div class="dropdown">
					<span><i style="font-size:20px;" class="icon ion-md-list"></i></span>
					<div class="dropdown-content">
						<p>
							<a style="color:#1f005c !important;" href="bonusrecord.php">Bonus Record</a>
						</p>
						<p>
							<a style="color:#1f005c !important;" href="promotion_apply_record.php">Apply Record</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div id="appCapsule" class="pb-2">
			<div class="appContent1 pb-5">
				<h3 class="text-center m-2">Bonus: <span>₹ <span id="bms">{{$user.bonus}}</span></span></h3>
				<div class="text-center mb-2">
					<a href="{{#server_url#}}recharge" data-backdrop="static" data-keyboard="false" class="btn btn-primary" style="width:160px; height:36px;background:#1f005c !important;">Apply to Balance</a>
				</div>
				<ul class="nav nav-tabs size2" id="myTab3" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="home-tab3" data-toggle="tab" href="#level1" role="tab">Level 1</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="profile-tab3" data-toggle="tab" href="#level2" role="tab">Level 2</a>
					</li>
				</ul>
				<div class="mt-1">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade active show" id="level1" role="tabpanel">
							<div class="row">
								<div class="col-6">
									<div class="mb-3">
										<div class="text-center">
											<h4>Total People</h4>
											<h3> 0</h3>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<div class="text-center ">
											<h4 style="font-style:normal;">Contribution</h4>
											<h3>₹ 0</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--=========================tab-1 end========================================-->
						<!--=========================tab-2========================================-->
						<div class="tab-pane fade" id="level2" role="tabpanel">
							<div class="row">
								<div class="col-6">
									<div class="mb-3">
										<div class="text-center">
											<h4>Total People </h4>
											<h3> 0 </h3>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<div class="text-center">
											<h4><em>Contribution</em></h4>
											<h3>₹ 0</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mt-1" style="margin: 0 15px;">
					<div class="mt-3 border-bottom">
						<label>My Promotion Code</label>
						<p>
							<strong>{{$user.referral_code}}</strong>
						</p>
					</div>
					<div class="mt-3 border-bottom">
						<label>Long press to share or copy download app link</label>
						<p>
							<strong style="color:#333;">{{#server_url#}}register?code={{$user.referral_code}}</strong>
						</p>
					</div>
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6">
								<button class="btn copyBtn" style="width: 100%;" data-clipboard-text="{{#server_url#}}register?code={{$user.referral_code}}">
									Copy Link
								</button>
							</div>
							<div class="col-md-6">
								<a style="width: 100%;" href="{{#server_url#}}register?code={{$user.referral_code}}" class="btn bnt btn-light">Open Link</a>
							</div>
						</div>
					</div>
					<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.6/clipboard.min.js"></script>
					<script type="text/javascript">
						function showToast(text) {
							var ele = document.createElement("div");
							ele.className = "toast";
							ele.innerHTML = text;
							document.body.appendChild(ele);
							setTimeout(function() {
								document.body.removeChild(ele);
							}, 2000)
						}

						var btns = document.querySelectorAll('.btn');
						var clipboard = new ClipboardJS(btns);
						clipboard.on('success', function(e) {
							showToast("COPY SUCCESS");
						});
						clipboard.on('error', function(e) {
							showToast("COPY FAIL");
						});
					</script>
					<style>
						.tabbable-responsive {
							display: block;
							min-width: 100%;
							overflow-x: auto;
							margin: 0px -20px -13px -20px;
						}
						.tabbable {
							min-width: 100%;
						}
						.tabbable .nav-tabs {
							white-space: nowrap;
							display: inline-block;
							min-width: 100%;
							padding: 0px 21px;
						}
						.tabbable .nav-tabs .nav-item {
							display: inline-block;
						}
						.tabbable .nav-tabs .nav-item .nav-link {
							display: inline-block;
						}
						small {
							font-size: 12px;
						}
						.card {
							box-shadow: 0 5px 15px -5px rgba(0, 0, 0, 0.15);
						}
						a {
							color: #0da58e;
						}
						a:hover {
							color: #075e51;
						}
						.text-dark {
							text-decoration: none !important;
						}
						.elmahio-ad {
							background: #fff;
							box-shadow: 0px 0px 0px 1px #ddd;
							border-radius: 4px;
							overflow: hidden;
						}
						.elmahio-ad .logo {
							background: #0da58e;
							width: 60px;
							height: 60px;
							text-align: center;
							line-height: 52px;
						}
						.elmahio-ad .logo img {
							width: 50px;
						}
						.elmahio-ad .motto {
							width: 180px;
							font-size: 12px;
							font-weight: bolder;
							padding: 12px;
						}
						.nav-tabs .nav-link {
							line-height: 44px;
							background: #fff;
						}
						.nav-tabs .nav-item {
							text-align: center;
							width: 49%;
						}
					</style>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<!-- START TABS DIV -->
									<div class="tabbable-responsive">
										<div class="tabbable">
											<ul class="nav nav-tabs" id="myTab" role="tablist">
												<li class="nav-item">
													<a class="nav-link active" id="first-tab" data-toggle="tab" href="#first" role="tab" aria-controls="first" aria-selected="true">Level 1</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" id="second-tab" data-toggle="tab" href="#second" role="tab" aria-controls="second" aria-selected="false">Level 2</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane fade active show" id="first" role="tabpanel" aria-labelledby="first-tab">
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th>ID</th>
															<th>Phone</th>
															<th>Bidding Commission</th>
															<th>First Recharge</th>
															<th>Date</th>
															<th>Total Recharge</th>
														</tr>
													</thead>
													<tbody>
														{{section name="f" loop=$cusers.level1}}
														<tr>
															<td>{{$cusers.level1[f].id}}</td>
															<td>{{$cusers.level1[f].phone}}</td>
															<td>{{$cusers.level1[f].commission}}</td>
															<td>{{$cusers.level1[f].recharge}}</td>
															<td>{{$cusers.level1[f].dt}}</td>
															<td>{{$cusers.level1[f].trecharge}}</td>
														</tr>
														{{/section}}
													</tbody>
												</table>
											</div>
										</div>
										<div class="tab-pane fade" id="second" role="tabpanel" aria-labelledby="second-tab">
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th scope="col">ID</th>
															<th scope="col">Phone</th>
															<th scope="col">Bidding Commission</th>
															<th>First Recharge</th>
															<th>Date</th>
															<th>Total Recharge</th>
														</tr>
													</thead>
													<tbody>
														{{section name="f" loop=$cusers.level2}}
															{{section name="l2" loop=$cusers.level2[f]}}
															<tr>
																<td>{{$cusers.level2[f][l2].id}}</td>
																<td>{{$cusers.level2[f][l2].phone}}</td>
																<td>{{$cusers.level2[f][l2].commission}}</td>
																<td>{{$cusers.level2[f][l2].recharge}}</td>
																<td>{{$cusers.level2[f][l2].dt}}</td>
																<td>{{$cusers.level2[f][l2].trecharge}}</td>
															</tr>
															{{/section}}
														{{/section}}
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
			<script>
				$(document).ready(function() {
					$('#popupModal').modal('show');
				});
			</script>
		</div>
		{{include file="pfooter.tpl"}}
		<div id="bonus" class="modal fade" role="dialog">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content ">
					<div class="modal-header paymentheader" id="paymenttitle">
						<h4 class="modal-title text-dark">Apply to Balance</h4>
					</div>
					<form action="#" method="post" id="bonusForm" autocomplete="off" novalidate="novalidate">
						<div class="modal-body mt-1" id="loadform">
							<div class="row">
								<div class="col-12">
									<div class="inner-addon left-addon mt-3">
										<i class="icon"><i class="fa fa-rupee"></i></i>
										<input type="number" id="bonusammount" name="bonusammount" class="form-control" placeholder="Bonus" onkeypress="return isNumber(event)">
									</div>
									<input type="hidden" name="userid" id="userid" class="form-control" value="2126">
									<input type="hidden" name="action" id="action" class="form-control" value="bonus">
								</div>
							</div>
						</div>
						<input type="hidden" name="tab" id="tab" value="parity">
						<div class="modal-footer">
							<a type="button" class="pull-left btn btn-sm closebtn" data-dismiss="modal">CANCEL</a>
							<button type="submit" class="pull-left btn btn-sm btn-white text-info">
								CONFIRM
							</button>
						</div>
					</form>
				</div>
			</div>
			</div>
		<div id="alert" class="modal fade" role="dialog">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-body" id="alertmessage"></div>
					<div class="text-center pb-1">
						<a type="button" class="text-info" data-dismiss="modal">OK</a>
					</div>
				</div>
			</div>
		</div>
		<script>
			var tabsActions = function(element) {
				this.element = $(element);
				this.setup = function() {
					if (this.element.length <= 0) {
						return;
					}
					this.init();
					// Update after resize window.
					var resizeId = null;
					$(window).resize( function() {
						clearTimeout(resizeId);
						resizeId = setTimeout(() => {
							this.init()
						}, 50);
					}.bind(this));
				};
				this.init = function() {
					// Add class to overflow items.
					this.actionOverflowItems();
					var tabs_overflow = this.element.find('.overflow-tab');
					// Build overflow action tab element.
					if (tabs_overflow.length > 0) {
						if (!this.element.find('.overflow-tab-action').length) {
							var tab_link = $('<a>').addClass('nav-link').attr('href', '#').attr('data-toggle', 'dropdown').text('...').on('click', function(e) {
								e.preventDefault();
								$(this).parents('.nav.nav-tabs').children('.nav-item.overflow-tab').toggle();
							});
							var overflow_tab_action = $('<li>').addClass('nav-item').addClass('overflow-tab-action').append(tab_link);
							// Add hide to overflow tabs when click on any tab.
							this.element.find('.nav-link').on('click', function(e) {
								$(this).parents('.nav.nav-tabs').children('.nav-item.overflow-tab').hide();
							});
							this.element.append(overflow_tab_action);
						}
						this.openOverflowDropdown();
					} else {
						this.element.find('.overflow-tab-action').remove();
					}
				};
				this.openOverflowDropdown = function() {
					var overflow_sum_height = 0;
					var overflow_first_top = 41;
					this.element.find('.overflow-tab').hide();
					// Calc top position of overflow tabs.
					this.element.find('.overflow-tab').each(function() {
						var overflow_item_height = $(this).height() - 1;
						if (overflow_sum_height === 0) {
							$(this).css('top', overflow_first_top + 'px');
							overflow_sum_height += overflow_first_top + overflow_item_height;
						} else {
							$(this).css('top', overflow_sum_height + 'px');
							overflow_sum_height += overflow_item_height;
						}
					});
				};
				this.actionOverflowItems = function() {
					var tabs_limit = this.element.width() - 100;
					var count = 0;
					// Calc tans width and add class to any tab that is overflow.
					for (var i = 0; i < this.element.children().length; i += 1) {
						var item = $(this.element.children()[i]);
						if (item.hasClass('overflow-tab-action')) {
							continue;
						}
						count += item.width();
						if (count > tabs_limit) {
							item.addClass('overflow-tab');
						} else if (count < tabs_limit) {
							item.removeClass('overflow-tab');
							item.show();
						}
					}
				};
			};
			var tabsAction = new tabsActions('.layout--tabs .nav-tabs-wrapper .nav-tabs');
			tabsAction.setup();
		</script>
		<script src="{{#server_url#}}scripts/winoxmall/jquery-3.4.1.min.js"></script>
		<script src="{{#server_url#}}scripts/winoxmall/popper.min.js"></script>
		<script src="{{#server_url#}}scripts/winoxmall/bootstrap.min.js"></script>
		<script src="{{#server_url#}}scripts/winoxmall/owl.carousel.min.js"></script>
		<script src="{{#server_url#}}scripts/winoxmall/app.js"></script>
		<script src="{{#server_url#}}scripts/winoxmall/jquery.validate.min.js"></script>
		<script src="{{#server_url#}}scripts/winoxmall/bonus.js"></script>
	</body>
</html>