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
		<link rel="stylesheet" href="{{#server_url#}}scripts/winoxmall/app.css">
		<script type="text/javascript">
			//	jQuery.noConflict();
			var base = '{{#server_url#}}';
			var currency = '$';
			var base_scripts = '{{#scripts_url#}}';
			var userid = '{{$smarty.session.$session.userid}}';
		</script>
		</head>
	<body>
		<!-- Page loading -->
		<!-- App Header -->
		<div class="vcard">
			<div class="appContent3 text-white" style="background-color:#1f005c !important;">
				<div class="row">
					<div class="col-12">
						<div class="col-12 mb-1" style="font-size:15px;">
							Available balance: ₹ <span id="balance">{{$user.balance}}</span>
						</div>
						<div class="col-12">
							<div>
								<a style="background-color:#39b54a;color:#fff;font-size: 12px;" href="{{#server_url#}}recharge" class="btn btn-blue btn-blue m-0">Recharge</a>
								<a data-toggle="modal" href="#rule" data-backdrop="static" data-keyboard="false" class="btn " style="background-color:#fff !important;color:#000 !important;font-size: 12px;">Read Rule</a><!---->
								<a href="{{#server_url#}}parity1" class="reaload text-white pull-right mt-1"> <i class="icon ion-md-refresh"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- searchBox -->
		<!-- * searchBox -->
		<!-- * App Header -->
		<!-- App Capsule -->
		<div class="mb-5">
			<div class="long mb-3">
				<!-- listview -->
				<ul class="nav nav-tabs size4" id="myTab3" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="home-tab3" data-toggle="tab" href="#parity" role="tab" onclick="tabname('parity');getResultbyCategory('parity','parity');">Parity</a>
					</li>
				</ul>
				<!--=====================game area============================-->
				<div class="appContent1 container-fluid bg-light mt-n1">
					<div class="layout">
						<div class="gameidtimer" style="margin-top:10px;">
							<h5 style="font-size:14px; font-weight:bold;" class="mb-2"><i class="icon ion-md-trophy"></i> Period</h5>
							<h5><span class="showload" style="display: none;"> <div class="spinnner-border text-danger" role="status"></div></span><span id="gameid" class="none" style="display: inline;">{{$futureid}}</span>
							<input type="hidden" id="futureid" name="futureid" value="{{$futureid}}">
							</h5>
						</div>
						<div class="gameidtimer text-right" style="margin-top:10px;">
							<h5 style="font-size:14px; font-weight:bold;" class="mb-2">Count Down</h5>
							<h5 id="demo"><span class="timer">0</span><span>:</span><span class="timer">0</span></h5>
						</div>
					</div>
					<div class="bg-light  layout text-center mt-2">
						<div class="divsize4">
							<button type="button" class="btn btn-lg btn-success gbutton none" onclick="betbutton('g','button','Green');" style="display: inline-block;">
								Join Green
							</button>
						</div>
						<div class="divsize4">
							<button type="button" class="btn btn-lg btn-violet gbutton none" onclick="betbutton('v','button','Violet');" style="display: inline-block;">
								Join Violet
							</button>
						</div>
						<div class="divsize4">
							<button type="button" class="btn btn-lg btn-danger gbutton none" onclick="betbutton('r','button','Red');" style="display: inline-block;">
								Join Red
							</button>
						</div>
					</div>
					<div class="container-fluid all_btn ">
						<div class="layout text-center bg-light  d-flex justify-content-center">
							{{section name="i" loop=$numbers}}
							<div class="divsize2">
								<button type="button" class="btn btn-lg w-d gbutton none btn-blue {{if $numbers[i].green}}btn-success{{elseif $numbers[i].red}}btn-danger{{else}}btn3{{/if}}" onclick="betbutton('{{if $numbers[i].green}}g{{elseif $numbers[i].red}}r{{else}}v{{/if}}','button','{{$numbers[i].digit}}');" style="display: inline-block;">
									{{$numbers[i].digit}}
								</button>
							</div>
							
							{{if $smarty.section.i.iteration % 5 eq 0 and $smarty.section.i.iteration lt 10}}
						</div>
						<div class="layout text-center bg-light  d-flex justify-content-center">
							{{/if}}
							{{/section}}
						</div>
					</div>
				</div>
				<!--=====================game area end============================-->
				<div class="mt-1 pb-5">
					<div class="tab-content" id="myTabContent">
						<!--=========================tab-1========================================-->
						<div class="tab-pane fade active show" id="parity" role="tabpanel">
							<style>
								.p-text {
									display: none;
								}
							</style>
							<div class="containerrecord text-center">
								<a href="#" class="recordlink">
								<p>
									<i class="icon ion-md-trophy"></i>
								</p>
								<div class="title">
									Parity Record
								</div> <p></p> </a>
							</div>
							<div class="table-container" id="paritycontainer">
								<div id="parityt_wrapper" class="dataTables_wrapper no-footer">
								</div>
							</div>
							<div class="containerrecord text-center mt-1">
								<a href="#" class="recordlink">
								<p>
									<i class="icon ion-md-paper"></i>
								</p>
								<div class="title">
									My Parity Record
								</div> <p></p> </a>
							</div>
							<div class="table-container">
								<div id="paritywait">
									<div class="table-container">
										<table class="table table-borderless">
											<thead>
												<tr>
													<th></th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
									</div>
								</div>
								<p class="p-text text-center">
									There is no unsettled order at present. If you want to query the settled order, please go to the order record to query.
								</p>
								<div id="myrecordparityt_wrapper" class="dataTables_wrapper no-footer">
									<table class="table table-borderless dataTable no-footer" id="myrecordparityt" role="grid" aria-describedby="myrecordparityt_info">
										<thead>
											<tr role="row">
												<th class="sorting_disabled" rowspan="1" colspan="1"></th>
											</tr>
										</thead>
										<tbody>
											<tr class="odd">
												<td valign="top" colspan="1" class="dataTables_empty">No data available in table</td>
											</tr>
										</tbody>
									</table>
									<div class="dataTables_info" id="myrecordparityt_info" role="status" aria-live="polite">
										0-0 of 0
									</div>
									<div class="dataTables_paginate paging_simple_numbers" id="myrecordparityt_paginate">
										<a class="paginate_button previous disabled" aria-controls="myrecordparityt" data-dt-idx="0" tabindex="-1" id="myrecordparityt_previous"><i class="icon ion-ios-arrow-back"></i></a><span></span><a class="paginate_button next disabled" aria-controls="myrecordparityt" data-dt-idx="1" tabindex="-1" id="myrecordparityt_next"><i class="icon ion-ios-arrow-forward"></i></a>
									</div>
								</div>
							</div>
						</div>
						<!--=========================tab-1 end========================================-->
						<!--=========================tab-2========================================-->
						<div class="tab-pane fade" id="sapre" role="tabpanel">
							<div class="containerrecord text-center">
								<a href="gamedashboard.php" class="recordlink">
								<p>
									<i class="icon ion-md-trophy"></i>
								</p>
								<div class="title">
									Sapre Record
								</div> <p></p> </a>
							</div>
							<div class="table-container">
								<div id="sapret_wrapper" class="dataTables_wrapper no-footer">
									<table class="table table-borderless table-hover text-center dataTable no-footer" id="sapret" role="grid" aria-describedby="sapret_info">
										<thead>
											<tr role="row">
												<th class="sorting_disabled" rowspan="1" colspan="1">Period</th><th class="sorting_disabled" rowspan="1" colspan="1">Price</th><th class="sorting_disabled" rowspan="1" colspan="1">Number</th><th class="sorting_disabled" rowspan="1" colspan="1">Result</th>
											</tr>
										</thead>
										<tbody>
											<tr role="row" class="odd">
												<td>20230808237</td>
												<td>31480</td>
												<td><span style="color:#ff2d55;">0</span></td>
												<td>
												<div style="display: flex;">
													<div class="spacer"></div>
													<div class="point" style="background:#ff2d55;"></div>
													&nbsp; <div class="point" style="background:#9c27b0;"></div>
													<div class="spacer"></div>
												</div></td>
											</tr>
										</tbody>
									</table>
									<div class="dataTables_info" id="sapret_info" role="status" aria-live="polite">
										1-10 of 238
									</div>
									<div class="dataTables_paginate paging_simple_numbers" id="sapret_paginate">
										<a class="paginate_button previous disabled" aria-controls="sapret" data-dt-idx="0" tabindex="-1" id="sapret_previous"><i class="icon ion-ios-arrow-back"></i></a>
										<span>
											<a class="paginate_button current" aria-controls="sapret" data-dt-idx="1" tabindex="0">1</a>
											<a class="paginate_button " aria-controls="sapret" data-dt-idx="2" tabindex="0">2</a>
											<a class="paginate_button " aria-controls="sapret" data-dt-idx="3" tabindex="0">3</a>
											<a class="paginate_button " aria-controls="sapret" data-dt-idx="4" tabindex="0">4</a>
											<a class="paginate_button " aria-controls="sapret" data-dt-idx="5" tabindex="0">5</a>
											<span class="ellipsis">…</span>
											<a class="paginate_button " aria-controls="sapret" data-dt-idx="6" tabindex="0">24</a>
										</span>
										<a class="paginate_button next" aria-controls="sapret" data-dt-idx="7" tabindex="0" id="sapret_next">
											<i class="icon ion-ios-arrow-forward"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="containerrecord text-center mt-1">
								<a href="#" class="recordlink">
								<p>
									<i class="icon ion-md-paper"></i>
								</p>
								<div class="title">
									My Sapre Record
								</div> <p></p> </a>
							</div>
							<div class="table-container">
								<div id="saprewait">
									<div class="table-container">
										<table class="table table-borderless">
											<thead>
												<tr>
													<th></th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
									</div>
								</div>
								<p class="p-text text-center">
									There is no unsettled order at present. If you want to query the settled order, please go to the order record to query.
								</p>
								<div id="myrecordsapret_wrapper" class="dataTables_wrapper no-footer">
									<table class="table table-borderless dataTable no-footer" id="myrecordsapret" role="grid" aria-describedby="myrecordsapret_info">
										<thead>
											<tr role="row">
												<th class="sorting_disabled" rowspan="1" colspan="1"></th>
											</tr>
										</thead>
										<tbody>
											<tr class="odd">
												<td valign="top" colspan="1" class="dataTables_empty">No data available in table</td>
											</tr>
										</tbody>
									</table>
									<div class="dataTables_info" id="myrecordsapret_info" role="status" aria-live="polite">
										0-0 of 0
									</div>
									<div class="dataTables_paginate paging_simple_numbers" id="myrecordsapret_paginate">
										<a class="paginate_button previous disabled" aria-controls="myrecordsapret" data-dt-idx="0" tabindex="-1" id="myrecordsapret_previous"><i class="icon ion-ios-arrow-back"></i></a>
										<span></span>
										<a class="paginate_button next disabled" aria-controls="myrecordsapret" data-dt-idx="1" tabindex="-1" id="myrecordsapret_next"><i class="icon ion-ios-arrow-forward"></i></a>
									</div>
								</div>
							</div>
						</div>
						<!--=========================tab-2 end========================================-->
						<!--=========================tab-3========================================-->
						<div class="tab-pane fade" id="bcone" role="tabpanel">
							<div class="containerrecord text-center">
								<a href="gamedashboard.php" class="recordlink">
								<p>
									<i class="icon ion-md-trophy"></i>
								</p>
								<div class="title">
									Bcone Record
								</div> <p></p> </a>
							</div>
							<div class="table-container">
								<div id="bconet_wrapper" class="dataTables_wrapper no-footer">
									<table class="table table-borderless table-hover text-center dataTable no-footer" id="bconet" role="grid" aria-describedby="bconet_info">
										<thead>
											<tr role="row">
												<th class="sorting_disabled" rowspan="1" colspan="1">Period</th>
												<th class="sorting_disabled" rowspan="1" colspan="1">Price</th>
												<th class="sorting_disabled" rowspan="1" colspan="1">Number</th>
												<th class="sorting_disabled" rowspan="1" colspan="1">Result</th>
											</tr>
										</thead>
										<tbody>
											<tr role="row" class="odd">
												<td>20230808237</td>
												<td>31467</td>
												<td><span style="color:#1DCC70;">7</span></td>
												<td>
												<div style="display: flex;">
													<div class="spacer"></div>
													<div class="point green" style="background:#1DCC70;"></div>
													<div class="spacer"></div>
												</div></td>
											</tr>
										</tbody>
									</table>
									<div class="dataTables_info" id="bconet_info" role="status" aria-live="polite">
										1-10 of 238
									</div>
									<div class="dataTables_paginate paging_simple_numbers" id="bconet_paginate">
										<a class="paginate_button previous disabled" aria-controls="bconet" data-dt-idx="0" tabindex="-1" id="bconet_previous"><i class="icon ion-ios-arrow-back"></i></a>
										<span>
											<a class="paginate_button current" aria-controls="bconet" data-dt-idx="1" tabindex="0">1</a>
											<a class="paginate_button " aria-controls="bconet" data-dt-idx="2" tabindex="0">2</a>
											<a class="paginate_button " aria-controls="bconet" data-dt-idx="3" tabindex="0">3</a>
											<a class="paginate_button " aria-controls="bconet" data-dt-idx="4" tabindex="0">4</a>
											<a class="paginate_button " aria-controls="bconet" data-dt-idx="5" tabindex="0">5</a>
											<span class="ellipsis">…</span>
											<a class="paginate_button " aria-controls="bconet" data-dt-idx="6" tabindex="0">24</a>
										</span>
										<a class="paginate_button next" aria-controls="bconet" data-dt-idx="7" tabindex="0" id="bconet_next"><i class="icon ion-ios-arrow-forward"></i></a>
									</div>
								</div>
							</div>
							<div class="containerrecord text-center mt-1">
								<a href="#" class="recordlink">
								<p>
									<i class="icon ion-md-paper"></i>
								</p>
								<div class="title">
									My Bcone Record
								</div> <p></p> </a>
							</div>
							<div class="table-container">
								<div id="bconewait">
									<div class="table-container">
										<table class="table table-borderless">
											<thead>
												<tr>
													<th></th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
									</div>
								</div>
								<p class="p-text text-center">
									There is no unsettled order at present. If you want to query the settled order, please go to the order record to query.
								</p>
								<div id="myrecordbconet_wrapper" class="dataTables_wrapper no-footer">
									<table class="table table-borderless dataTable no-footer" id="myrecordbconet" role="grid" aria-describedby="myrecordbconet_info">
										<thead>
											<tr role="row">
												<th class="sorting_disabled" rowspan="1" colspan="1"></th>
											</tr>
										</thead>
										<tbody>
											<tr class="odd">
												<td valign="top" colspan="1" class="dataTables_empty">No data available in table</td>
											</tr>
										</tbody>
									</table>
									<div class="dataTables_info" id="myrecordbconet_info" role="status" aria-live="polite">
										0-0 of 0
									</div>
									<div class="dataTables_paginate paging_simple_numbers" id="myrecordbconet_paginate">
										<a class="paginate_button previous disabled" aria-controls="myrecordbconet" data-dt-idx="0" tabindex="-1" id="myrecordbconet_previous"><i class="icon ion-ios-arrow-back"></i></a>
										<span></span>
										<a class="paginate_button next disabled" aria-controls="myrecordbconet" data-dt-idx="1" tabindex="-1" id="myrecordbconet_next"><i class="icon ion-ios-arrow-forward"></i></a>
									</div>
								</div>
							</div>
						</div>
						<!--=========================tab-3 end========================================-->
						<!--=========================tab-4========================================-->
						<div class="tab-pane fade" id="emerd" role="tabpanel">
							<div class="containerrecord text-center">
								<a href="gamedashboard.php" class="recordlink">
								<p>
									<i class="icon ion-md-trophy"></i>
								</p>
								<div class="title">
									Emerd Record
								</div> <p></p> </a>
							</div>
							<div class="table-container">
								<div id="emerdt_wrapper" class="dataTables_wrapper no-footer">
									
								</div>
							</div>
							<div class="containerrecord text-center mt-1">
								<a href="#" class="recordlink">
								<p>
									<i class="icon ion-md-paper"></i>
								</p>
								<div class="title">
									My Emerd Record
								</div> <p></p> </a>
							</div>
							<div class="table-container">
								<div id="emerdwait">
									<div class="table-container">
										<table class="table table-borderless">
											<thead>
												<tr>
													<th class="sorting_disabled" rowspan="1" colspan="1">Period</th>
													<th class="sorting_disabled" rowspan="1" colspan="1">Price</th>
													<th class="sorting_disabled" rowspan="1" colspan="1">Number</th>
													<th class="sorting_disabled" rowspan="1" colspan="1">Color</th>
												</tr>
											</thead>
											<tbody>
												
											</tbody>
										</table>
									</div>
								</div>
								<p class="p-text text-center">
									There is no unsettled order at present. If you want to query the settled order, please go to the order record to query.
								</p>
								<div id="myrecordemerdt_wrapper" class="dataTables_wrapper no-footer">
								</div>
							</div>
						</div>
						<!--=========================tab-4 end========================================-->
					</div>
				</div>
			</div>
		</div>
		{{include file="pfooter.tpl"}}
		<div id="rule" class="modal fade" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content ">
					<div class="modal-header">
						<h3 style="font-size:14px;text-align:center;">Rule of Guess</h3>
					</div>
					<div class="modal-body responsive">
						<p style="font-size:10px">
							3 minutes 1 issue, 2 minutes and 30 seconds to order, 30 seconds to show the lottery result. It opens all day. The total number of trade is 480 issues
						</p>
						<p style="font-size:10px">
							If you spend 100 to trade, after deducting 5 service fee, your contract amount is 95:
						</p>
						<p style="font-size:10px">
							1. JOIN GREEN: if the result shows 1,3,7,9, you will get (95*2) 190
						</p>
						<p style="font-size:10px">
							If the result shows 5, you will get (95*1.5) 142.5
						</p>
						<p style="font-size:10px">
							2. JOIN RED: if the result shows 2,4,6,8, you will get (95*2) 190; If the result shows 0, you will get (95*1.5) 142.5
						</p>
						<p style="font-size:10px">
							3. JOIN VIOLET: if the result shows 0 or 5, you will get (95*4.5) 427.5
						</p>
						<p style="font-size:10px">
							4. SELECT NUMBER: if the result is the same as the number you selected, you will get (95*9) 855
						</p>
					</div>
					<div class="modal-footer">
						<a type="button" class="pull-left" data-dismiss="modal"><strong>CLOSE</strong></a>
					</div>
				</div>
			</div>
		</div>
		<div id="payment" class="modal fade" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content ">
					<div class="modal-header paymentheader" id="paymenttitle">
						<h4 class="modal-title" id="chn"></h4>
					</div>
					<form action="#" method="post" id="bettingForm" autocomplete="off">
						<div class="modal-body mt-1" id="loadform">
							<div class="row">
								<div class="col-12">
									<p class="mb-1">
										Contract Money
									</p>
									<div class="btn-group btn-group-toggle mb-2" data-toggle="buttons">
										<!--<label class="btn btn-secondary active" onClick="contract(5);">-->
										<!--  <input class="contract" type="radio" name="contract" id="hoursofoperation" value="5" checked >-->
										<!--  5 </label>-->
										<label class="btn btn-secondary active" onclick="contract(10);">
											<input class="contract" type="radio" name="contract" id="hoursofoperation" value="10" checked="">
											10 </label>
										<label class="btn btn-secondary" onclick="contract(100);">
											<input type="radio" class="contract" name="contract" id="hoursofoperation" value="100">
											100 </label>
										<label class="btn btn-secondary" onclick="contract(1000);">
											<input type="radio" class="contract" name="contract" id="hoursofoperation" value="1000">
											1000 </label>
										<label class="btn btn-secondary" onclick="contract(10000);">
											<input type="radio" class="contract" name="contract" id="hoursofoperation" value="10000">
											10000 </label>
									</div>
									<input type="hidden" id="contractmoney" name="contractmoney" value="10">
									<p class="mb-1">
										Contract Count
									</p>
									<div class="def-number-input number-input safari_only">
										<button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown(); addvalue();" class="minus"></button>
										<input class="quantity" min="1" name="amount" id="amount" value="1" type="number" onkeyup="addvalue();">
										<button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); addvalue();" class="plus"></button>
									</div>
									<input type="hidden" name="userid" id="userid" class="form-control" value="2126">
									<input type="hidden" name="type" id="type" class="form-control" value="">
									<input type="hidden" name="value" id="value" class="form-control" value="">
									<input type="hidden" name="counter" id="counter" class="form-control" value="143">
									<input type="hidden" name="inputgameid" id="inputgameid" class="form-control" value="20230808238">
									<div class="mt-2">
										Total contract money is <span id="showamount">10</span>
									</div>
									<input type="hidden" name="finalamount" id="finalamount" value="10">
									<div class="custom-control custom-checkbox mt-2">
										<input type="checkbox" checked="" class="custom-control-input" id="presalerule" name="presalerule">
										<label class="custom-control-label text-muted" for="presalerule">I agree <a data-toggle="modal" href="#privacy" data-backdrop="static" data-keyboard="false">PRESALE RULE</a></label>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" name="tab" id="tab" value="parity">
						<div class="modal-footer">
							<a type="button" class="pull-left btn btn-sm closebtn" data-dismiss="modal">CANCEL</a>
							<button type="submit" class="pull-left btn btn-sm btn-blue">
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
					<div class="text-right pb-1 pr-2">
						<a type="button" class="text-info" data-dismiss="modal">OK</a>
					</div>
				</div>
			</div>
		</div>
		<div id="loader" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" style="background:transparent; border:none;">
					<div class="text-center pb-1">
						<a type="button" id="closbtnloader" data-dismiss="modal"> <div class="spinner-grow text-success"></div></a>
					</div>
				</div>
			</div>
		</div>
		<!-- Jquery -->
		<script src="{{#server_url#}}scripts/winoxmall/jquery-3.4.1.min.js"></script>
		<!-- Bootstrap-->
		<script src="{{#server_url#}}scripts/winoxmall/popper.min.js"></script>
		<script src="{{#server_url#}}scripts/winoxmall/bootstrap.min.js"></script>
		<!-- Owl Carousel -->
		<script src="{{#server_url#}}scripts/winoxmall/owl.carousel.min.js"></script>
		<!-- Main Js File -->
		<script src="{{#server_url#}}scripts/winoxmall/app.js"></script>
		<script src="{{#server_url#}}scripts/winoxmall/betting.js?t={{$smarty.now|date_format:'%d%m%Y%H%I%S'}}"></script>
		<script src="{{#server_url#}}scripts/winoxmall/jquery.dataTables.min.js"></script>
		<script>
			$(document).ready(function() {
				var x = setInterval(function() {
					start_count_down();
					$('#closbtnloader').click();
				}, 1e3);
				// getResultbyCategory('parity', 'parity');
				$('#example').DataTable({
					"paging" : true,
					"lengthChange" : false,
					"searching" : false,
					"ordering" : false,
					"info" : true,
					"autoWidth" : false
				});
			});
			
			function start_count_down() {
				$(".showload").hide();
				$(".none").show();
				var countDownDate = Date.parse(new Date) / 1e3;
				var now = new Date().getTime();
				var distance = 180 - countDownDate % 180;
				//alert(distance);
				var i = distance / 60, n = distance % 60, o = n / 10, s = n % 10;
				var minutes = Math.floor(i);
				var seconds = ('0' + Math.floor(n)).slice(-2);
				document.getElementById("demo").innerHTML = "<span class='timer'>0" + Math.floor(minutes) + "</span>" + "<span>:</span>" + "<span class='timer'>" + seconds + "</span>";
				document.getElementById("counter").value = distance;
				if (distance == 180 || distance == 175 || distance == 170 || distance == 165 || distance == 160) {
				}
				if (distance == 180) {
					declareResult();
					generateGameid();
				}
				if (distance <= 30) {
					$(".gbutton").prop('disabled', true);
				} else {
					$(".gbutton").prop('disabled', false);
				}
			}

			function generateGameid() {
				var futureid = $('#futureid').val();
				$.ajax({
					type : "Post",
					data : "futureid=" + futureid + "& type=" + "generate",
					url : base + "inc/ajax.php?mode=futureid",
					success : function(html) {
						window.location.reload();
						// return false;
					},
					error : function(e) {
					}
				});
			}

			function betbutton(color, type, name) {
				var bgcolor = "";
				if(color == 'g')
					bgcolor = '#1DCC70';
				else if(color == 'r')
					bgcolor = '#ff2d55';
				else
					bgcolor = '#9c27b0';
					
				var futureid = $('#futureid').val();
				
				$.ajax({
					type : "Post",
					data : "type=" + type + "&name=" + name + "&futureid=" + futureid + "&color=" + color,
					url : "betform",
					success : function(html) {
						document.getElementById("loadform").innerHTML = html;
						return false;
					},
					error : function(e) {
					}
				});
				
				if (type == 'number') {
					$(".paymentheader").css("background-color", bgcolor);
					document.getElementById('chn').innerHTML = 'Select ' + name;
				} else {
					$(".paymentheader").css("background-color", bgcolor);
					document.getElementById('chn').innerHTML = 'Join ' + name;
				}
				
				$('#payment').modal({
					backdrop : 'static',
					keyboard : false
				});
				
				$('#payment').modal('show');
				document.getElementById('type').value = type;
				document.getElementById('value').value = name;
			}

			//=====================amount calculation======================
			function contract(abc) {//alert(abc);
				var amount = $("#amount").val();
				document.getElementById('contractmoney').value = abc;
				var addvalue = abc * amount;
				document.getElementById('showamount').innerHTML = addvalue;
				document.getElementById('finalamount').value = addvalue;
			};
			function addvalue() {
				var amount = $("#amount").val();
				var contractmoney = $("#contractmoney").val();
				var addvalue = contractmoney * amount;
				document.getElementById('showamount').innerHTML = addvalue;
				document.getElementById('finalamount').value = addvalue;
			}

			function tabname(tabname) {
				document.getElementById('tab').value = tabname;
			}

			//=====================amount calculation======================
			//====================== get Result==============================
			function getResultbyCategory(category, containerid) {
				$.ajax({
					type : "Post",
					data : "category=" + category,
					url : "getResultbyCategory.php",
					success : function(html) {
						document.getElementById(containerid).innerHTML = html;
						waitlist('parity', 2126, 'paritywait');
						waitlist('sapre', 2126, 'saprewait');
						waitlist('bcone', 2126, 'bconewait');
						waitlist('emerd', 2126, 'emerdwait');
						if (category == 'parity') {
							$('#parityt').DataTable({
								"paging" : true,
								"lengthChange" : false,
								"searching" : false,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false
							});
							$('#myrecordparityt').DataTable({
								"paging" : true,
								"lengthChange" : false,
								"searching" : false,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false
							});
						} else if (category == 'sapre') {
							$('#sapret').DataTable({
								"paging" : true,
								"lengthChange" : false,
								"searching" : false,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false
							});
							$('#myrecordsapret').DataTable({
								"paging" : true,
								"lengthChange" : false,
								"searching" : false,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false
							});
						} else if (category == 'bcone') {
							$('#bconet').DataTable({
								"paging" : true,
								"lengthChange" : false,
								"searching" : false,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false
							});
							$('#myrecordbconet').DataTable({
								"paging" : true,
								"lengthChange" : false,
								"searching" : false,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false
							});
						} else if (category == 'emerd') {
							$('#emerdt').DataTable({
								"paging" : true,
								"lengthChange" : false,
								"searching" : false,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false
							});
							$('#myrecordemerdt').DataTable({
								"paging" : true,
								"lengthChange" : false,
								"searching" : false,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false
							});
						}
						return false;
					},
					error : function(e) {
					}
				});
			}


			$(document).ready(function() {
				// waitlist('parity', 2126, 'paritywait');
				loadResult();
				myRecords();
			});
			function reloadbtn(id) {
				$('#loader').modal({
					backdrop : 'static',
					keyboard : false
				});
				$('#loader').modal('show');
				$.ajax({
					type : "Post",
					data : "userid=" + id,
					url : "getwalletbalance.php",
					success : function(html) {
						document.getElementById('balance').innerHTML = html;
						return false;
					},
					error : function(e) {
					}
				});
			}
			
		</script>
	</body>
</html>