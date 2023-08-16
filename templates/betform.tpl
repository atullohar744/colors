<div class="row">
	<div class="col-12">
		<p class="mb-1">
			Contract Money
		</p>
		<div class="btn-group btn-group-toggle mb-2" data-toggle="buttons">
			<label class="btn btn-secondary active"  onClick="contract(10);">
				<input class="contract" type="radio" name="contract" id="hoursofoperation" value="10" checked>
				10 </label>
			<label class="btn btn-secondary" onClick="contract(100);">
				<input type="radio" class="contract" name="contract" id="hoursofoperation" value="100">
				100 </label>
			<label class="btn btn-secondary" onClick="contract(1000);">
				<input type="radio" class="contract" name="contract" id="hoursofoperation" value="1000">
				1000 </label>
			<label class="btn btn-secondary" onClick="contract(10000);">
				<input type="radio" class="contract" name="contract" id="hoursofoperation" value="10000" >
				10000 </label>
		</div>
		<input type="hidden" id="contractmoney" name="contractmoney" value="10">
		<p class="mb-1">
			Contract Count
		</p>
		<div class="def-number-input number-input safari_only">
			<button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown(); addvalue();" class="minus"></button>
			<input class="quantity" min="1" name="amount" id="amount" value="1" type="number" onKeyUp="addvalue();">
			<button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); addvalue();" class="plus"></button>
		</div>
		<input type="hidden" name="type" id="type" class="form-control" value="button">
		<input type="hidden" name="value" id="value" class="form-control" value="1">
		<input type="hidden" name="color" id="color" class="form-control" value="{{$smarty.request.color}}">
		<input type="hidden" name="digit" id="digit" class="form-control" value="{{$smarty.request.name}}">
		<input type="hidden" name="inputgameid" id="inputgameid" class="form-control" value="{{$smarty.request.futureid}}">
		<div class="mt-2">
			Total contract money is <span id="showamount">10</span>
		</div>
		<input type="hidden" name="finalamount" id="finalamount" value="10">
		<div class="custom-control custom-checkbox mt-2">
			<input type="checkbox" checked class="custom-control-input" id="presalerule" name="presalerule">
			<label class="custom-control-label text-muted" for="presalerule">I agree <a data-toggle="modal" href="#privacy" data-backdrop="static" data-keyboard="false">PRESALE RULE</a></label>
		</div>
	</div>
</div>
