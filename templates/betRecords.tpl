{{section name="r" loop=$results}}
<li data-v-00ea969a="" class="{{if $results[r].green}}g{{elseif $results[r].red}}r{{else}}v v-5{{/if}}">
	<span data-v-00ea969a="">{{$results[r].id}}</span>
	<strong data-v-00ea969a="">{{$results[r].digit}}</strong>
</li>
{{/section}}