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
									<h3 class="card-title text-danger">Select Colors</h3>
								</div>
								<div class="col-md-8">
									<form class="form-horizontal" name="form" id="frmEdit_numbers" action="{{#server_url#}}inc/numbers.php" method="post" enctype="multipart/form-data" novalidate="novalidate">
										<input type="hidden" name="ajax" value="true">
										<input type="hidden" name="popup" value="">
										<div class="form-group row mb-4" style="border-bottom: 1px solid #fff;">
											<label class="col-sm-1 control-label col-form-label text-center">Number</label>
										</div>
										{{foreach from=$records key=k item=v}}
										<div class="form-group row mb-4" >
											<label class="col-sm-1 control-label col-form-label text-center">{{$v.digit}}</label>
											<input type="hidden" name="id[]" value="{{$v.id}}">
											<input type="hidden" name="number[]" value="{{$v.digit}}">
											<div class="col-sm-9">
												<label class="radio-inline col-sm-2">
													<input type="radio" name="color[{{$v.digit}}]" value="green" {{if $v.green}}checked="checked"{{/if}}>
													Green </label>
												<label class="radio-inline col-sm-2">
													<input type="radio" name="color[{{$v.digit}}]" value="purple" {{if $v.purple}}checked="checked"{{/if}}>
													Purple </label>
												<label class="radio-inline col-sm-2">
													<input type="radio" name="color[{{$v.digit}}]" value="red" {{if $v.red}}checked="checked"{{/if}}>
													Red </label>
											</div>
										</div>
										{{/foreach}}
										<div class="border-top">
											<div class="card-body">
												<input type="submit" class="icons save btn btn-primary" name="mysubmit" value="Save">
												<input type="button" class="icons discard btn btn-danger" name="discard" value="Go Back" onclick="javascript:toggleEdit('pricing', 0, true);">
											</div>
										</div>
									</form>
								</div>
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