<div class="col-12 border-bottom mb-3">
	<h3 class="card-title text-danger">Add New Result</h3>
</div>
<div class="col-md-8">
	<form class="form-horizontal" name="form" id="frmEdit_dresult" action="https://adminapp.tech/yoswin/manager/dresult?mode=edit" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ajax" value="true" />
		<input type="hidden" name="popup" value="" />
		<input type="hidden" name="id" value="{{$smarty.request.id}}" />
		<input type="hidden" name="ts" value="{{$smarty.now}}" />
		<h1 id="demo"></h1>
		<div class="form-group row">
			<label class="col-sm-3 control-label col-form-label required">Period</label>
			<div class="col-sm-9">
				<input type="text" class="form-control required" maxlength="128" spellcheck="false" name="period" id="period" value="{{if $smarty.request.id}}{{$object_row.period}}{{else}}{{$period}}{{/if}}" validation="required" readonly="readonly"  />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-3 control-label col-form-label required">Number</label>
			<div class="col-sm-9">
				<select class="form-control required" name="digit" id="digit" validation="required">
					<option value="">Select Number</option>
					{{foreach from=$object_fields.digit.options key=ok item=ov name=foo}}
						<option value="{{if $ok neq $smarty.foreach.foo.index or $i.assoc}}{{$ok}}{{else}}{{$ov}}{{/if}}">{{$ov}}</option>
					{{/foreach}}
				</select>
			</div>
			<script type="text/javascript">selectValue("digit", "{{$object_row.digit}}");</script>
		</div>
		<div class="border-top">
			<div class="card-body">
				<input type="submit" class="icons save btn btn-primary" name="mysubmit" value="Save" />
				<input type="button" class="icons discard btn btn-danger" name="discard" value="Go Back" onclick="javascript:toggleEdit('dresult', 0, true);" />
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	try {
		$('#frmEdit_dresult').validate();
		callInputMask();
		if ( typeof (initdresultEditor) != "undefined")
			setTimeout("initdresultEditor();", 0);
	} catch(e) {
	}
	
	function start_count_down() {
		var countDownDate = Date.parse(new Date) / 1e3;
		var now = new Date().getTime();
		var distance = 180 - countDownDate % 180;
		//alert(distance);
		var i = distance / 60, n = distance % 60, o = n / 10, s = n % 10;
		var minutes = Math.floor(i);
		var seconds = ('0' + Math.floor(n)).slice(-2);
		document.getElementById("demo").innerHTML = "<span class='timer'>0" + Math.floor(minutes) + "</span>" + "<span>:</span>" + "<span class='timer'>" + seconds + "</span>";
		if (distance == 180) {
			toggleEdit('dresult', 0, true);
		}
	}
	
	var x = setInterval(function() {
		start_count_down();
	}, 1e3);
</script>
<script type="text/javascript"></script>
<script type="text/javascript">hideListingWhileEditing = true;</script>
