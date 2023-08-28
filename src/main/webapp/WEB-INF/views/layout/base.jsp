<%@ taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<!DOCTYPE html>
<html lang="en">


<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="Codescandy" name="author">
    <title>Homepage v1 - eCommerce HTML Template - FreshCart </title>

    <link href="${BASE_URL}assets/libs/slick-carousel/slick/slick.css" rel="stylesheet" />
    <link href="${BASE_URL}assets/libs/slick-carousel/slick/slick-theme.css" rel="stylesheet" />
    <link href="${BASE_URL}assets/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet">

    <!-- Favicon icon-->
    <link rel="shortcut icon" type="image/x-icon" href="${BASE_URL}assets/images/favicon/favicon.ico">


    <!-- Libs CSS -->
    <link href="${BASE_URL}assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="${BASE_URL}assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
    <link href="${BASE_URL}assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


    <!-- Theme CSS -->
    <link rel="stylesheet" href="${BASE_URL}assets/css/theme.min.css">
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-M8S4MT3EYG"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-M8S4MT3EYG');
    </script>

</head>

<body>

<jsp:include page="../frontend/include/header.jsp"/>

<!-- Modal -->
<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content p-4">
            <div class="modal-header border-0">
                <h5 class="modal-title fs-3 fw-bold" id="userModalLabel">Sign Up</h5>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="fullName" placeholder="Enter Your Name" required="">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter Email address" required="">
                    </div>

                    <div class="mb-5">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter Password" required="">
                        <small class="form-text">By Signup, you agree to our <a href="#!">Terms of Service</a> & <a
                                href="#!">Privacy Policy</a></small>
                    </div>

                    <button type="submit" class="btn btn-primary">Sign Up</button>
                </form>
            </div>
            <div class="modal-footer border-0 justify-content-center">

                Already have an account? <a href="${BASE_URL}signin">Sign in</a>
            </div>
        </div>
    </div>
</div>

<!-- Shop Cart -->

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header border-bottom">
        <div class="text-start">
            <h5 id="offcanvasRightLabel" class="mb-0 fs-4">Shop Cart</h5>
            <small>Location in 382480</small>
        </div>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">

        <div class="">
            <!-- alert -->
            <div class="alert alert-danger p-2" role="alert">
                You have got FREE delivery. Start <a href="#!" class="alert-link">checkout now!</a>
            </div>
            <ul class="list-group list-group-flush">
                <!-- list group -->
                <li class="list-group-item py-3 ps-0 border-top">
                    <!-- row -->
                    <div class="row align-items-center">

                        <div class="col-6 col-md-6 col-lg-7">
                            <div class="d-flex">
                                <img src="${BASE_URL}assets/images/products/product-img-1.jpg" alt="Ecommerce"
                                     class="icon-shape icon-xxl">
                                <div class="ms-3">
                                    <!-- title -->
                                    <a href="pages/shop-single.html" class="text-inherit">
                                        <h6 class="mb-0">Haldiram's Sev Bhujia</h6>
                                    </a>
                                    <span><small class="text-muted">.98 / lb</small></span>
                                    <!-- text -->
                                    <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span
                                            class="me-1 align-text-bottom">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-trash-2 text-success">
                      <polyline points="3 6 5 6 21 6"></polyline>
                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                      </path>
                      <line x1="10" y1="11" x2="10" y2="17"></line>
                      <line x1="14" y1="11" x2="14" y2="17"></line>
                    </svg></span><span class="text-muted">Remove</span></a></div>
                                </div>
                            </div>
                        </div>
                        <!-- input group -->
                        <div class="col-4 col-md-3 col-lg-3">
                            <!-- input -->
                            <!-- input -->
                            <div class="input-group input-spinner  ">
                                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                                <input type="number" step="1" max="10" value="1" name="quantity"
                                       class="quantity-field form-control-sm form-input   ">
                                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                            </div>

                        </div>
                        <!-- price -->
                        <div class="col-2 text-lg-end text-start text-md-end col-md-2">
                            <span class="fw-bold">$5.00</span>

                        </div>
                    </div>

                </li>
                <!-- list group -->
                <li class="list-group-item py-3 ps-0">
                    <!-- row -->
                    <div class="row align-items-center">
                        <div class="col-6 col-md-6 col-lg-7">
                            <div class="d-flex">
                                <img src="${BASE_URL}assets/images/products/product-img-2.jpg" alt="Ecommerce"
                                     class="icon-shape icon-xxl">
                                <div class="ms-3">
                                    <a href="pages/shop-single.html" class="text-inherit">
                                        <h6 class="mb-0">NutriChoice Digestive </h6>
                                    </a>
                                    <span><small class="text-muted">250g</small></span>
                                    <!-- text -->
                                    <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span
                                            class="me-1 align-text-bottom">
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                             class="feather feather-trash-2 text-success">
                          <polyline points="3 6 5 6 21 6"></polyline>
                          <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                          </path>
                          <line x1="10" y1="11" x2="10" y2="17"></line>
                          <line x1="14" y1="11" x2="14" y2="17"></line>
                        </svg></span><span class="text-muted">Remove</span></a></div>
                                </div>
                            </div>
                        </div>


                        <!-- input group -->
                        <div class="col-4 col-md-3 col-lg-3">
                            <!-- input -->
                            <!-- input -->
                            <div class="input-group input-spinner  ">
                                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                                <input type="number" step="1" max="10" value="1" name="quantity"
                                       class="quantity-field form-control-sm form-input   ">
                                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                            </div>
                        </div>
                        <!-- price -->
                        <div class="col-2 text-lg-end text-start text-md-end col-md-2">
                            <span class="fw-bold text-danger">$20.00</span>
                            <div class="text-decoration-line-through text-muted small">$26.00</div>
                        </div>
                    </div>

                </li>
                <!-- list group -->
                <li class="list-group-item py-3 ps-0">
                    <!-- row -->
                    <div class="row align-items-center">

                        <div class="col-6 col-md-6 col-lg-7">
                            <div class="d-flex">
                                <img src="${BASE_URL}assets/images/products/product-img-3.jpg" alt="Ecommerce"
                                     class="icon-shape icon-xxl">
                                <div class="ms-3">
                                    <!-- title -->
                                    <a href="pages/shop-single.html" class="text-inherit">
                                        <h6 class="mb-0">Cadbury 5 Star Chocolate</h6>
                                    </a>
                                    <span><small class="text-muted">1 kg</small></span>
                                    <!-- text -->
                                    <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span
                                            class="me-1 align-text-bottom">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-trash-2 text-success">
                      <polyline points="3 6 5 6 21 6"></polyline>
                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                      </path>
                      <line x1="10" y1="11" x2="10" y2="17"></line>
                      <line x1="14" y1="11" x2="14" y2="17"></line>
                    </svg></span><span class="text-muted">Remove</span></a></div>
                                </div>
                            </div>
                        </div>

                        <!-- input group -->
                        <div class="col-4 col-md-3 col-lg-3">
                            <!-- input -->
                            <!-- input -->
                            <div class="input-group input-spinner  ">
                                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                                <input type="number" step="1" max="10" value="1" name="quantity"
                                       class="quantity-field form-control-sm form-input   ">
                                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                            </div>
                        </div>
                        <!-- price -->
                        <div class="col-2 text-lg-end text-start text-md-end col-md-2">
                            <span class="fw-bold">$15.00</span>
                            <div class="text-decoration-line-through text-muted small">$20.00</div>
                        </div>
                    </div>

                </li>
                <!-- list group -->
                <li class="list-group-item py-3 ps-0">
                    <!-- row -->
                    <div class="row align-items-center">
                        <div class="col-6 col-md-6 col-lg-7">
                            <div class="d-flex">
                                <img src="${BASE_URL}assets/images/products/product-img-4.jpg" alt="Ecommerce"
                                     class="icon-shape icon-xxl">
                                <div class="ms-3">
                                    <!-- title -->
                                    <!-- title -->
                                    <a href="pages/shop-single.html" class="text-inherit">
                                        <h6 class="mb-0">Onion Flavour Potato</h6>
                                    </a>
                                    <span><small class="text-muted">250g</small></span>
                                    <!-- text -->
                                    <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span
                                            class="me-1 align-text-bottom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                     class="feather feather-trash-2 text-success">
                                  <polyline points="3 6 5 6 21 6"></polyline>
                                  <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                  </path>
                                  <line x1="10" y1="11" x2="10" y2="17"></line>
                                  <line x1="14" y1="11" x2="14" y2="17"></line>
                                </svg></span><span class="text-muted">Remove</span></a></div>
                                </div>
                            </div>
                        </div>

                        <!-- input group -->
                        <div class="col-4 col-md-3 col-lg-3">
                            <!-- input -->
                            <!-- input -->
                            <div class="input-group input-spinner  ">
                                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                                <input type="number" step="1" max="10" value="1" name="quantity"
                                       class="quantity-field form-control-sm form-input   ">
                                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                            </div>
                        </div>
                        <!-- price -->
                        <div class="col-2 text-lg-end text-start text-md-end col-md-2">
                            <span class="fw-bold">$15.00</span>
                            <div class="text-decoration-line-through text-muted small">$20.00</div>
                        </div>
                    </div>

                </li>
                <!-- list group -->
                <li class="list-group-item py-3 ps-0 border-bottom">
                    <!-- row -->
                    <div class="row align-items-center">
                        <div class="col-6 col-md-6 col-lg-7">
                            <div class="d-flex">
                                <img src="${BASE_URL}assets/images/products/product-img-5.jpg" alt="Ecommerce"
                                     class="icon-shape icon-xxl">
                                <div class="ms-3">
                                    <!-- title -->
                                    <a href="pages/shop-single.html" class="text-inherit">
                                        <h6 class="mb-0">Salted Instant Popcorn </h6>
                                    </a>
                                    <span><small class="text-muted">100g</small></span>
                                    <!-- text -->
                                    <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span
                                            class="me-1 align-text-bottom">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-trash-2 text-success">
                      <polyline points="3 6 5 6 21 6"></polyline>
                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                      </path>
                      <line x1="10" y1="11" x2="10" y2="17"></line>
                      <line x1="14" y1="11" x2="14" y2="17"></line>
                    </svg></span><span class="text-muted">Remove</span></a></div>
                                </div>
                            </div>
                        </div>

                        <!-- input group -->
                        <div class="col-4 col-md-3 col-lg-3">
                            <!-- input -->
                            <!-- input -->
                            <div class="input-group input-spinner  ">
                                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                                <input type="number" step="1" max="10" value="1" name="quantity"
                                       class="quantity-field form-control-sm form-input   ">
                                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                            </div>
                        </div>
                        <!-- price -->
                        <div class="col-2 text-lg-end text-start text-md-end col-md-2">
                            <span class="fw-bold">$15.00</span>
                            <div class="text-decoration-line-through text-muted small">$25.00</div>
                        </div>
                    </div>

                </li>

            </ul>
            <!-- btn -->
            <div class="d-flex justify-content-between mt-4">
                <a href="#!" class="btn btn-primary">Continue Shopping</a>
                <a href="#!" class="btn btn-dark">Update Cart</a>
            </div>

        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="locationModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-body p-6">
                <div class="d-flex justify-content-between align-items-start ">
                    <div>
                        <h5 class="mb-1" id="locationModalLabel">Choose your Delivery Location</h5>
                        <p class="mb-0 small">Enter your address and we will specify the offer you area. </p>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="my-5">
                    <input type="search" class="form-control" placeholder="Search your area">
                </div>
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <h6 class="mb-0">Select Location</h6>
                    <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Clear All</a>


                </div>
                <div>
                    <div data-simplebar style="height:300px;">
                        <div class="list-group list-group-flush">

                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action active">
                                <span>Alabama</span><span>Min:$20</span></a>
                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                                <span>Alaska</span><span>Min:$30</span></a>
                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                                <span>Arizona</span><span>Min:$50</span></a>
                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                                <span>California</span><span>Min:$29</span></a>
                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                                <span>Colorado</span><span>Min:$80</span></a>
                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                                <span>Florida</span><span>Min:$90</span></a>
                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                                <span>Arizona</span><span>Min:$50</span></a>
                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                                <span>California</span><span>Min:$29</span></a>
                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                                <span>Colorado</span><span>Min:$80</span></a>
                            <a href="#"
                               class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
                                <span>Florida</span><span>Min:$90</span></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<layout:block name="content">

</layout:block>




<jsp:include page="../frontend/include/footer.jsp"/>

<!-- Javascript-->

<!-- Libs JS -->
<script src="${BASE_URL}assets/libs/jquery/dist/jquery.min.js"></script>
<script src="${BASE_URL}assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${BASE_URL}assets/libs/simplebar/dist/simplebar.min.js"></script>

<!-- Theme JS -->
<script src="${BASE_URL}assets/js/theme.min.js"></script>
<script src="${BASE_URL}assets/libs/jquery-countdown/dist/jquery.countdown.min.js"></script>
<script src="${BASE_URL}assets/js/vendors/countdown.js"></script>
<script src="${BASE_URL}assets/libs/slick-carousel/slick/slick.min.js"></script>
<script src="${BASE_URL}assets/js/vendors/slick-slider.js"></script>
<script src="${BASE_URL}assets/libs/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="${BASE_URL}assets/js/vendors/tns-slider.js"></script>
<script src="${BASE_URL}assets/js/vendors/zoom.js"></script>
<script src="${BASE_URL}assets/js/vendors/increment-value.js"></script>



</body>


</html>