<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<layout:extends name="base">
  <layout:put block="content">
    <main>
      <!-- section -->
      <section>
        <!-- container -->
        <div class="container">
          <!-- row -->
          <div class="row">
            <!-- col -->
<jsp:include page="../include/account_menu.jsp"/>
            <div class="col-lg-9 col-md-8 col-12">
              <div class="py-6 p-md-6 p-lg-10">
                <div class="d-flex justify-content-between mb-6">
                  <!-- heading -->
                  <h2 class="mb-0">Address</h2>
                  <!-- button -->
                  <a href="#" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addAddressModal">Add a
                    new address </a>
                </div>
                <div class="row">
                  <!-- col -->
                  <div class="col-lg-5 col-xxl-4 col-12 mb-4">
                    <!-- form -->
                    <div class="card">
                      <div class="card-body p-6">
                        <div class="form-check mb-4">
                          <input class="form-check-input" type="radio" name="flexRadioDefault" id="homeRadio" checked>
                          <label class="form-check-label text-dark fw-semi-bold" for="homeRadio">
                            Home
                          </label>
                        </div>
                        <!-- address -->
                        <p class="mb-6">Jitu Chauhan<br>

                          4450 North Avenue Oakland, <br>

                          Nebraska, United States,<br>

                          402-776-1106</p>
                        <!-- btn -->
                        <a href="#" class="btn btn-info btn-sm">Default address</a>
                        <div class="mt-4">
                          <a href="#" class="text-inherit">Edit </a>
                          <a href="#" class="text-danger ms-3" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-5 col-xxl-4 col-12 mb-4">
                    <!-- input -->
                    <div class="card">
                      <div class="card-body p-6">
                        <div class="form-check mb-4">
                          <input class="form-check-input" type="radio" name="flexRadioDefault" id="officeRadio">
                          <label class="form-check-label text-dark fw-semi-bold" for="officeRadio">
                            Office
                          </label>
                        </div>
                        <!-- nav item -->
                        <p class="mb-6">Nitu Chauhan<br>

                          3853 Coal Road <br>

                          Tannersville, Pennsylvania, 18372, United States <br>

                          402-776-1106</p>
                        <!-- link -->
                        <a href="#" class="link-primary">Set as Default</a>
                        <div class="mt-4">
                          <a href="#" class="text-inherit">Edit </a>
                          <!-- btn -->
                          <a href="#" class="text-danger ms-3" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>


    <!-- Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <!-- modal content -->
        <div class="modal-content">
          <!-- modal header -->
          <div class="modal-header">
            <h5 class="modal-title" id="deleteModalLabel">Delete address</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <!-- modal body -->
          <div class="modal-body">
            <h6>Are you sure you want to delete this address?</h6>
            <p class="mb-6">Jitu Chauhan<br>

              4450 North Avenue Oakland, <br>

              Nebraska, United States,<br>

              402-776-1106</p>
          </div>
          <!-- modal footer -->
          <div class="modal-footer">
            <!-- btn -->
            <button type="button" class="btn btn-outline-gray-400" data-bs-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-danger">Delete</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="addAddressModal" tabindex="-1" aria-labelledby="addAddressModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <!-- modal content -->
        <div class="modal-content">
          <!-- modal body -->
          <div class="modal-body p-6">
            <div class="d-flex justify-content-between mb-5">
              <div>
                <!-- heading -->
                <h5 class="mb-1" id="addAddressModalLabel">New Shipping Address</h5>
                <p class="small mb-0">Add new shipping address for your order delivery.</p>
              </div>
              <div>
                <!-- button -->
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
            </div>
            <!-- row -->
            <div class="row g-3">
              <!-- col -->
              <div class="col-12">
                <!-- input -->
                <input type="text" class="form-control" placeholder="First name" aria-label="First name" required="">
              </div>
              <!-- col -->
              <div class="col-12">
                <!-- input -->
                <input type="text" class="form-control" placeholder="Last name" aria-label="Last name" required="">
              </div>
              <!-- col -->
              <div class="col-12">
                <!-- input -->
                <input type="text" class="form-control" placeholder="Address Line 1">
              </div>
              <!-- col -->
              <div class="col-12">
                <!-- input -->
                <input type="text" class="form-control" placeholder="Address Line 2">
              </div>
              <!-- col -->
              <div class="col-12">
                <!-- input -->
                <input type="text" class="form-control" placeholder="City">
              </div>
              <!-- col -->
              <div class="col-12">
                <!-- form select -->
                <select class="form-select">
                  <option selected=""> India</option>
                  <option value="1">UK</option>
                  <option value="2">USA</option>
                  <option value="3">UAE</option>
                </select>
              </div>
              <!-- col -->
              <div class="col-12">
                <!-- form select -->
                <select class="form-select">
                  <option selected="">Gujarat</option>
                  <option value="1">Northern Ireland</option>
                  <option value="2"> Alaska</option>
                  <option value="3">Abu Dhabi</option>
                </select>
              </div>
              <!-- col -->
              <div class="col-12">
                <!-- input -->
                <input type="text" class="form-control" placeholder="Zip Code">
              </div>
              <!-- col -->
              <div class="col-12">
                <!-- input -->
                <input type="text" class="form-control" placeholder="Business Name">
              </div>
              <!-- col -->
              <div class="col-12">
                <!-- form check -->
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                  <label class="form-check-label" for="flexCheckDefault">
                    Set as Default
                  </label>
                </div>
              </div>
              <!-- col -->
              <div class="col-12 text-end">
                <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Cancel</button>
                <button class="btn btn-primary" type="button">Save Address</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- modal -->

  </layout:put>
</layout:extends>