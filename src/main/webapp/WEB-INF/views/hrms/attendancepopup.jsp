<div class="modal fade" id="tenderform" data-bs-backdrop="static"
	tabindex="-1">
	<div class="modal-dialog modal-xl modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="calendar">
						<header>
							<pre class="left">◀</pre>

							<div class="header-display">
								<p class="display">""</p>
							</div>

							<pre class="right">▶</pre>

						</header>

						<div class="week">
							<div>Sun</div>
							<div>Mon</div>
							<div>Tue</div>
							<div>Wed</div>
							<div>Thu</div>
							<div>Fri</div>
							<div>Sat</div>
						</div>
						<div class="days"></div>
					</div>
					<div class="display-selected">
						<p class="selected"></p>
					</div>
				</div>



				<div class="nav-align-top mb-4">
					<ul class="nav nav-pills mb-3" role="tablist">
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link active" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-pills-top-home"
								aria-controls="navs-pills-top-home" aria-selected="false"
								tabindex="-1">1. Attendance Info</button>
						</li>

					</ul>
					<div class="tab-content">
						<div class="tab-pane fade active show" id="navs-pills-top-home"
							role="tabpanel">
							<div class="row g-2">
								<div class="col-12">
									<div class="card-datatable table-responsive">
										<table id="attendance1" class="table nowrap"
											style="width: 100%">
											<thead>
												<tr>
													<th>Employee Name</th>
													<th>Attendance Date</th>
													<th>Status</th>
													<th>Attendance Type</th>
												</tr>
											</thead>


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
</div>