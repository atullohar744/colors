<ul data-v-00ea969a="" style="">
	<li data-v-00ea969a="">
		<span data-v-00ea969a="" class="l" style="width: 130px; color: rgb(111, 86, 117);">User</span>
		<span data-v-00ea969a="" class="l" style="width: 70px; color: rgb(111, 86, 117);">Choose</span>
		<span data-v-00ea969a="" class="r" style="color: rgb(111, 86, 117);">Input</span>
	</li>
	{{section name="u" loop=$users}}
	<li data-v-00ea969a="">
		<span data-v-00ea969a="" class="l" style="width: 130px;">
			<img data-v-00ea969a="" src="/img/a4.f89843b3.png">{{$users[u].phone}}
		</span>
		<span data-v-00ea969a="" class="l" style="width: 70px;">
			<div data-v-00ea969a="" class="dots {{if $users[u].green}}g{{elseif $users[u].red}}r{{else}}v v-5{{/if}}">
				<strong data-v-00ea969a="">{{$users[u].digit}}</strong>
			</div>
		</span>
		<span data-v-00ea969a="" class="r" style="color: rgb(187, 175, 120);">₹{{$users[u].amount}}</span>
	</li>
	{{/section}}
</ul>