<div class="modal fade" id="tenderform1" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="nav-align-top mb-4">
                    <ul class="nav nav-pills mb-3" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-top-home" aria-controls="navs-pills-top-home" aria-selected="false" tabindex="-1" disabled="disabled">
                                1. Resign Info
                            </button>
                        </li>
                      
                    </ul>
                    <form name="designation" id="designation">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="navs-pills-top-home" role="tabpanel">
                            <div class="row g-2">
                            
                                <div class="col-12 col-lg-12 mb-3">
                                    <label class="form-label" for="department_name">Relieving Date<span class="mandatory">*</span></label>
                                    <input type="date"
                                           class="form-control"
                                           id="relieving_date"
                                           placeholder=" "
                                           name="relieving_date"
                                           aria-label=" " />
                                </div>
                                   <div class="col-12 col-lg-12 mb-3" style="text-align: right; margin-top:2rem;" >
                                 	<button type="button" onclick="update()"  class="btn btn-sm btn-primary" >Save </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                    </div>
                </div>
            </div>
         
        </div>
    </div>