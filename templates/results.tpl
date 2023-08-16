<table class="table table-borderless table-hover text-center dataTable no-footer" id="emerdt" role="grid" aria-describedby="emerdt_info">
	<thead>
		<tr role="row">
			<th class="sorting_disabled" rowspan="1" colspan="1">Period</th>
			<th class="sorting_disabled" rowspan="1" colspan="1">Price</th>
			<th class="sorting_disabled" rowspan="1" colspan="1">Number</th>
			<th class="sorting_disabled" rowspan="1" colspan="1">Result</th>
		</tr>
	</thead>
	<tbody>
		{{section name="r" loop=$results}}
		<tr role="row" class="odd">
			<td>{{$results[r].period}}</td>
			<td>{{$results[r].amount}}</td>
			<td><span style="color:#1DCC70;">{{$results[r].digit}}</span></td>
			<td>
			<div style="display: flex;">
				<div class="spacer"></div>
				<div class="point {{if $results[r].color eq 'g'}}green{{elseif $results[r].color eq 'r'}}red{{/if}}" style="background:{{if $results[r].color eq 'g'}}#1DCC70;{{elseif $results[r].color eq 'r'}}#ff2d55;{{else}}#9c27b0{{/if}}"></div>
				<div class="spacer"></div>
			</div></td>
		</tr>
		{{/section}}
	</tbody>
</table>
<div class="dataTables_info" id="emerdt_info" role="status" aria-live="polite">
</div>