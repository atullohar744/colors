{{$header}}
<div class="row">
    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-4" style="opacity: 0.5;">
						<i class="fa fa-users fa-5x"></i>
					</div>
					<div class="col-5">
						<div class="d-flex align-items-center align-self-start" style="justify-content: center;">
							<h1 class="mb-0">{{$customers}}</h1>
						</div>
					</div>
					<div class="col-3">
						<div class="icon icon-box-success">
							<a href="{{#server_url#}}manager/customers"><span class="mdi mdi-arrow-top-right icon-item"></span></a>
						</div>
					</div>
				</div>
				<h6 class="text-muted font-weight-normal text-center">Total Users</h6>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-4" style="opacity: 0.5;">
						<i class="fa fa-images fa-5x"></i>
					</div>
					<div class="col-5">
						<div class="d-flex align-items-center align-self-start" style="justify-content: center;">
							<h1 class="mb-0">{{$banners}}</h1>
						</div>
					</div>
					<div class="col-3">
						<div class="icon icon-box-success">
							<a href="{{#server_url#}}manager/banners"><span class="mdi mdi-arrow-top-right icon-item"></span></a>
						</div>
					</div>
				</div>
				<h6 class="text-muted font-weight-normal text-center">Total Banners</h6>
			</div>
		</div>
	</div>
</div>
{{$footer}}