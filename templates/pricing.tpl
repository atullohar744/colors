{{$header}}
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="table-responsive">
							<div id="divEdit_contests" class="popup_div">
								<div class="col-12 border-bottom mb-3">
									<h3 class="card-title text-danger">Color Pricing</h3>
								</div>
								<div class="col-md-8">
									<form class="form-horizontal" name="form" id="frmEdit_contests" action="{{#server_url#}}inc/pricing.php" method="post" enctype="multipart/form-data" novalidate="novalidate">
										<input type="hidden" name="ajax" value="true">
										<input type="hidden" name="popup" value="">
										<input type="hidden" name="id" value="{{$row.id}}">
										<div class="form-group row">
											<label class="col-sm-3 control-label col-form-label required">Red Color</label>
											<div class="col-sm-5">
												<input type="text" class="form-control valid" maxlength="128" spellcheck="false" name="red_color" id="red_color" value="{{$row.red_color}}" validation="required" aria-invalid="false">
											</div>
											<div class="col-sm-4">
												<label class="checkbox-inline">
													<input type="checkbox" name="vip_red_color" id="vip_red_color" value="1" {{if $row.vip_red_color}}checked{{/if}}> VIP Only
												</label>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 control-label col-form-label required">Purple Color</label>
											<div class="col-sm-5">
												<input type="text" class="form-control valid" maxlength="128" spellcheck="false" name="purple_color" id="purple_color" value="{{$row.purple_color}}" validation="required" aria-invalid="false">
											</div>
											<div class="col-sm-4">
												<label class="checkbox-inline">
													<input type="checkbox" name="vip_purple_color" id="vip_purple_color" value="1" {{if $row.vip_purple_color}}checked{{/if}}> VIP Only
												</label>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 control-label col-form-label required">Green Color</label>
											<div class="col-sm-5">
												<input type="text" class="form-control valid" maxlength="128" spellcheck="false" name="green_color" id="green_color" value="{{$row.green_color}}" validation="required" aria-invalid="false">
											</div>
											<div class="col-sm-4">
												<label class="checkbox-inline">
													<input type="checkbox" name="vip_green_color" id="vip_green_color" value="1" {{if $row.vip_green_color}}checked{{/if}}> VIP Only
												</label>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 control-label col-form-label required">&nbsp;</label>
											<div class="col-sm-9">
												<label class="checkbox-inline">
													<input type="checkbox" name="vip_numbers" id="vip_numbers" value="1" {{if $row.vip_numbers}}checked{{/if}}> Allow Numbers For VIP Only
												</label>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 control-label col-form-label required">&nbsp;</label>
											<div class="col-sm-9">
												<label class="checkbox-inline">
													<input type="checkbox" name="vip_records" id="vip_records" value="1" {{if $row.vip_records}}checked{{/if}}> Allow Records For VIP Only
												</label>
											</div>
										</div>
										<div class="border-top">
											<div class="card-body">
												<input type="submit" class="icons save btn btn-primary" name="mysubmit" value="Save">
												<input type="button" class="icons discard btn btn-danger" name="discard" value="Go Back" onclick="javascript:toggleEdit('pricing', 0, true);">
											</div>
										</div>
									</form>
								</div>
								<script type="text/javascript">
									try {
										$('#frmEdit_contests').validate();
										callInputMask();
										if ( typeof (initcontestsEditor) != "undefined")
											setTimeout("initcontestsEditor();", 0);
									} catch(e) {
									}
								</script>
								<script type="text/javascript">
									hideListingWhileEditing = true;
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{{$footer}}