<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="base">
    <layout:put block="content">
        <main>

            <section class="mt-8">
                <div class="container">
                    <div class="hero-slider ">
                        <div
                                style="background: url(${BASE_URL}assets/images/slider/hero-img-slider-1.jpg)no-repeat; background-size: cover; border-radius: .5rem; background-position: center;">
                            <div class="ps-lg-12 py-lg-16 col-xxl-5 col-lg-7 col-md-8 py-14 px-8 text-xs-center">


                                <h1 class="text-white display-5 fw-bold mt-4">SuperMarket For Fresh Grocery </h1>
                                <p class="lead text-white">Introduced a new model for online grocery shopping
                                    and convenient home delivery at any time.</p>
                                <a href="#!" class="btn btn-dark mt-3">Shop Now <i class="feather-icon icon-arrow-right ms-1"></i></a>
                            </div>

                        </div>
                        <div class=" "
                             style="background: url(${BASE_URL}assets/images/slider/hero-img-slider-2.jpg)no-repeat; background-size: cover; border-radius: .5rem; background-position: center;">
                            <div class="ps-lg-12 py-lg-16 col-xxl-5 col-lg-7  col-md-8 py-14 px-8 text-xs-center">

                                <h1 class="text-dark display-5 fw-bold mt-4">Opening Sale<br>
                                    Discount up to <span class="text-primary display-6">50%</span></h1>
                                <p class="lead ">Snack on late-night munchies of delicious nuts & you’re guaranteed happiness before you doze!
                                </p>
                                <a href="#!" class="btn btn-dark mt-3">Shop Now <i class="feather-icon icon-arrow-right ms-1"></i></a>
                            </div>

                        </div>
                        <div class=" "
                             style="background: url(${BASE_URL}assets/images/slider/hero-img-slider-3.jpg)no-repeat; background-size: cover; border-radius: .5rem; background-position: center;">
                            <div class="ps-lg-12 py-lg-16 col-xxl-5 col-lg-7  col-md-8 py-14 px-8 text-xs-center">

                                <h1 class="text-dark display-5 fw-bold mt-4">Midnight Munch Combo </h1>
                                <p class="lead ">Snack on late-night munchies of delicious nuts & you are guaranteed happiness before you doze!
                                </p>
                                <a href="#!" class="btn btn-dark mt-3">Shop Now <i class="feather-icon icon-arrow-right ms-1"></i></a>
                            </div>

                        </div>


                    </div>
                </div>
            </section>

            <!-- Category Section Start-->
            <section class="mb-lg-10 mt-lg-14 my-8">
                <div class="container">
                    <div class="row">
                        <div class="col-12 mb-6">

                            <h3 class="mb-0">Featured Categories</h3>

                        </div>
                    </div>
                    <div class="category-slider ">

                       <c:forEach items="${it[1]}" var="items">
                           <div class="item"> <a href="pages/shop-grid.html" class="text-decoration-none text-inherit">
                               <div class="card card-product mb-lg-4">
                                   <div class="card-body text-center py-8">
                                       <img src="${BASE_URL}${items.image_url}" alt="Grocery Ecommerce Template"
                                            class="mb-3 img-fluid">
                                       <div class="text-truncate">${items.name}</div>
                                   </div>
                               </div>
                           </a></div>
                       </c:forEach>





                    </div>


                </div>
            </section>
            <!-- Category Section End-->
            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-6 mb-3 mb-lg-0">
                            <div>
                                <div class="py-10 px-8 rounded"
                                     style="background:url(${BASE_URL}assets/images/banner/grocery-banner.png)no-repeat; background-size: cover; background-position: center;">
                                    <div>
                                        <h3 class="fw-bold mb-1">Fruits & Vegetables
                                        </h3>
                                        <p class="mb-4">Get Upto <span class="fw-bold">30%</span> Off</p>
                                        <a href="#!" class="btn btn-dark">Shop Now</a>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="col-12 col-md-6 ">

                            <div>
                                <div class="py-10 px-8 rounded"
                                     style="background:url(${BASE_URL}assets/images/banner/grocery-banner-2.jpg)no-repeat; background-size: cover; background-position: center;">
                                    <div>
                                        <h3 class="fw-bold mb-1">Freshly Baked
                                            Buns
                                        </h3>
                                        <p class="mb-4">Get Upto <span class="fw-bold">25%</span> Off</p>
                                        <a href="#!" class="btn btn-dark">Shop Now</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Popular Products Start-->
            <section class="my-lg-14 my-8">
                <div class="container">
                    <div class="row">
                        <div class="col-12 mb-6">

                            <h3 class="mb-0">Popular Products</h3>

                        </div>
                    </div>

                    <div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
                      <c:forEach items="${it[0]}" var="s">
                          <div class="col">
                              <div class="card card-product" >
                                  <div class="card-body">

                                      <div class="text-center position-relative " >
                                          <div class=" position-absolute top-0 start-0">
                                              <c:choose>
                                                  <c:when test="${s.inStock}">
                                                      <span class="badge bg-primary">In Stock</span>
                                                  </c:when>
                                                  <c:otherwise>
                                                      <span class="badge bg-danger">Out of Stock</span>
                                                  </c:otherwise>
                                              </c:choose>

                                          </div>
                                          <c:forEach items="${s.images}" var="item" end="0">
                                              <a href="${BASE_URL}${s.id}"> <img src="${BASE_URL}${item}" alt="Grocery Ecommerce Template"
                                                                 class="mb-3 img-fluid" style="height: 200px; overflow: hidden"></a>
                                          </c:forEach>


                                          <div class="card-product-action">
                                              <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                      class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                                              <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i
                                                      class="bi bi-heart"></i></a>
                                              <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                                                      class="bi bi-arrow-left-right"></i></a>
                                          </div>

                                      </div>
                                      <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>${s.brand}</small></a></div>
                                      <h2 class="fs-6"><a href="pages/shop-single.html" class="text-inherit text-decoration-none">${s.title}</a></h2>
                                      <div>

                                          <small class="text-warning"> <i class="bi bi-star-fill"></i>
                                              <i class="bi bi-star-fill"></i>
                                              <i class="bi bi-star-fill"></i>
                                              <i class="bi bi-star-fill"></i>
                                              <i class="bi bi-star-half"></i></small> <span class="text-muted small">4.5(149)</span>
                                      </div>
                                      <div class="d-flex justify-content-between align-items-center mt-3">
                                          <div><span class="text-dark">Rs ${s.sale_price}0</span>
                                          </div>
                                          <div><a href="#!" class="btn btn-primary btn-sm">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                                                   stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                   class="feather feather-plus">
                                                  <line x1="12" y1="5" x2="12" y2="19"></line>
                                                  <line x1="5" y1="12" x2="19" y2="12"></line>
                                              </svg> Add</a></div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </c:forEach>


                    </div>
                </div>
            </section>
            <!-- Popular Products End-->
            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 mb-6">
                            <h3 class="mb-0">Daily Best Sells</h3>
                        </div>
                    </div>
                    <div class="table-responsive-xl pb-6">
                        <div class="row row-cols-lg-4 row-cols-1 row-cols-md-2 g-4 flex-nowrap">
                            <div class="col">
                                <div class=" pt-8 px-6 px-xl-8 rounded"
                                     style="background:url(${BASE_URL}assets/images/banner/banner-deal.jpg)no-repeat; background-size: cover; height: 470px;">
                                    <div>
                                        <h3 class="fw-bold text-white">100% Organic
                                            Coffee Beans.
                                        </h3>
                                        <p class="text-white">Get the best deal before close.</p>
                                        <a href="#!" class="btn btn-primary">Shop Now <i class="feather-icon icon-arrow-right ms-1"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card card-product">
                                    <div class="card-body">
                                        <div class="text-center  position-relative "> <a href="pages/shop-single.html"><img
                                                src="${BASE_URL}assets/images/products/product-img-11.jpg" alt="Grocery Ecommerce Template"
                                                class="mb-3 img-fluid"></a>

                                            <div class="card-product-action">
                                                <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                                                <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i
                                                        class="bi bi-heart"></i></a>
                                                <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                                                        class="bi bi-arrow-left-right"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>Tea, Coffee &
                                            Drinks</small></a></div>
                                        <h2 class="fs-6"><a href="pages/shop-single.html" class="text-inherit text-decoration-none">Roast
                                            Ground Coffee</a></h2>

                                        <div class="d-flex justify-content-between align-items-center mt-3">
                                            <div><span class="text-dark">$13</span> <span
                                                    class="text-decoration-line-through text-muted">$18</span>
                                            </div>
                                            <div>
                                                <small class="text-warning"> <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-half"></i>
                                                </small>
                                                <span><small>4.5</small></span>
                                            </div>
                                        </div>
                                        <div class="d-grid mt-2"><a href="#!" class="btn btn-primary ">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                 class="feather feather-plus">
                                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                            </svg> Add to cart </a></div>
                                        <div class="d-flex justify-content-start text-center mt-3">
                                            <div class="deals-countdown w-100" data-countdown="2028/10/10 00:00:00"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card card-product">
                                    <div class="card-body">
                                        <div class="text-center  position-relative "> <a href="pages/shop-single.html"><img
                                                src="${BASE_URL}assets/images/products/product-img-12.jpg" alt="Grocery Ecommerce Template"
                                                class="mb-3 img-fluid"></a>
                                            <div class="card-product-action">
                                                <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                                                <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i
                                                        class="bi bi-heart"></i></a>
                                                <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                                                        class="bi bi-arrow-left-right"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>Fruits &
                                            Vegetables</small></a></div>
                                        <h2 class="fs-6"><a href="pages/shop-single.html" class="text-inherit text-decoration-none">Crushed
                                            Tomatoes</a></h2>
                                        <div class="d-flex justify-content-between align-items-center mt-3">
                                            <div><span class="text-dark">$13</span> <span
                                                    class="text-decoration-line-through text-muted">$18</span>
                                            </div>
                                            <div>
                                                <small class="text-warning"> <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-half"></i>
                                                </small>
                                                <span><small>4.5</small></span>
                                            </div>
                                        </div>
                                        <div class="d-grid mt-2"><a href="#!" class="btn btn-primary ">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                 class="feather feather-plus">
                                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                            </svg> Add to cart </a></div>
                                        <div class="d-flex justify-content-start text-center mt-3 w-100">
                                            <div class="deals-countdown w-100" data-countdown="2028/12/9 00:00:00"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card card-product">
                                    <div class="card-body">
                                        <div class="text-center  position-relative "> <a href="pages/shop-single.html"><img
                                                src="${BASE_URL}assets/images/products/product-img-13.jpg" alt="Grocery Ecommerce Template"
                                                class="mb-3 img-fluid"></a>
                                            <div class="card-product-action">
                                                <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                        class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i></a>
                                                <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i
                                                        class="bi bi-heart"></i></a>
                                                <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i
                                                        class="bi bi-arrow-left-right"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small>Fruits &
                                            Vegetables</small></a></div>
                                        <h2 class="fs-6"><a href="pages/shop-single.html" class="text-inherit text-decoration-none">Golden
                                            Pineapple</a></h2>
                                        <div class="d-flex justify-content-between align-items-center mt-3">
                                            <div><span class="text-dark">$13</span> <span
                                                    class="text-decoration-line-through text-muted">$18</span>
                                            </div>
                                            <div>
                                                <small class="text-warning"> <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-half"></i></small>
                                                <span><small>4.5</small></span>
                                            </div>
                                        </div>
                                        <div class="d-grid mt-2"><a href="#!" class="btn btn-primary ">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                 class="feather feather-plus">
                                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                            </svg> Add to cart </a></div>
                                        <div class="d-flex justify-content-start text-center mt-3">
                                            <div class="deals-countdown w-100" data-countdown="2028/11/11 00:00:00"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="my-lg-14 my-8">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-3">
                            <div class="mb-8 mb-xl-0">
                                <div class="mb-6"><img src="${BASE_URL}assets/images/icons/clock.svg" alt=""></div>
                                <h3 class="h5 mb-3">
                                    10 minute grocery now
                                </h3>
                                <p>Get your order delivered to your doorstep at the earliest from FreshCart pickup stores near you.</p>
                            </div>
                        </div>
                        <div class="col-md-6  col-lg-3">
                            <div class="mb-8 mb-xl-0">
                                <div class="mb-6"><img src="${BASE_URL}assets/images/icons/gift.svg" alt=""></div>
                                <h3 class="h5 mb-3">Best Prices & Offers</h3>
                                <p>Cheaper prices than your local supermarket, great cashback offers to top it off. Get best pricess &
                                    offers.
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="mb-8 mb-xl-0">
                                <div class="mb-6"><img src="${BASE_URL}assets/images/icons/package.svg" alt=""></div>
                                <h3 class="h5 mb-3">Wide Assortment</h3>
                                <p>Choose from 5000+ products across food, personal care, household, bakery, veg and non-veg & other
                                    categories.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="mb-8 mb-xl-0">
                                <div class="mb-6"><img src="${BASE_URL}assets/images/icons/refresh-cw.svg" alt=""></div>
                                <h3 class="h5 mb-3">Easy Returns</h3>
                                <p>Not satisfied with a product? Return it at the doorstep & get a refund within hours. No questions asked
                                    <a href="#!">policy</a>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <!-- Modal -->
        <div class="modal fade" id="quickViewModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body p-8">
                        <div class="position-absolute top-0 end-0 me-3 mt-3">
                            <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                            ></button>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <!-- img slide -->
                                <div class="product productModal" id="productModal">
                                    <div
                                            class="zoom"
                                            onmousemove="zoom(event)"
                                            style="
                                                    background-image: url(${BASE_URL}assets/images/products/product-single-img-1.jpg);
                                                    "
                                    >
                                        <!-- img -->
                                        <img
                                                src="${BASE_URL}assets/images/products/product-single-img-1.jpg"
                                                alt=""
                                        >
                                    </div>
                                    <div>
                                        <div
                                                class="zoom"
                                                onmousemove="zoom(event)"
                                                style="
                                                        background-image: url(${BASE_URL}assets/images/products/product-single-img-2.jpg);
                                                        "
                                        >
                                            <!-- img -->
                                            <img
                                                    src="${BASE_URL}assets/images/products/product-single-img-2.jpg"
                                                    alt=""
                                            >
                                        </div>
                                    </div>
                                    <div>
                                        <div
                                                class="zoom"
                                                onmousemove="zoom(event)"
                                                style="
                                                        background-image: url(${BASE_URL}assets/images/products/product-single-img-3.jpg);
                                                        "
                                        >
                                            <!-- img -->
                                            <img
                                                    src="${BASE_URL}assets/images/products/product-single-img-3.jpg"
                                                    alt=""
                                            >
                                        </div>
                                    </div>
                                    <div>
                                        <div
                                                class="zoom"
                                                onmousemove="zoom(event)"
                                                style="
                                                        background-image: url(${BASE_URL}assets/images/products/product-single-img-4.jpg);
                                                        "
                                        >
                                            <!-- img -->
                                            <img
                                                    src="${BASE_URL}assets/images/products/product-single-img-4.jpg"
                                                    alt=""
                                            >
                                        </div>
                                    </div>
                                </div>
                                <!-- product tools -->
                                <div class="product-tools">
                                    <div class="thumbnails row g-3" id="productModalThumbnails">
                                        <div class="col-3" class="tns-nav-active">
                                            <div class="thumbnails-img">
                                                <!-- img -->
                                                <img
                                                        src="${BASE_URL}assets/images/products/product-single-img-1.jpg"
                                                        alt=""
                                                >
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="thumbnails-img" >
                                                <!-- img -->
                                                <img
                                                        src="${BASE_URL}assets/images/products/product-single-img-2.jpg"
                                                        alt=""
                                                >
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="thumbnails-img">
                                                <!-- img -->
                                                <img
                                                        src="${BASE_URL}assets/images/products/product-single-img-3.jpg"
                                                        alt=""
                                                >
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="thumbnails-img">
                                                <!-- img -->
                                                <img
                                                        src="${BASE_URL}assets/images/products/product-single-img-4.jpg"
                                                        alt=""
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="ps-lg-8 mt-6 mt-lg-0">
                                    <a href="#!" class="mb-4 d-block">Bakery Biscuits</a>
                                    <h2 class="mb-1 h1">Napolitanke Ljesnjak</h2>
                                    <div class="mb-4">
                                        <small class="text-warning">
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-half"></i></small
                                        ><a href="#" class="ms-2">(30 reviews)</a>
                                    </div>
                                    <div class="fs-4">
                                        <span class="fw-bold text-dark">$32</span>
                                        <span class="text-decoration-line-through text-muted">$35</span
                                        ><span
                                    ><small class="fs-6 ms-2 text-danger">26% Off</small></span
                                    >
                                    </div>
                                    <hr class="my-6">
                                    <div class="mb-4">
                                        <button type="button" class="btn btn-outline-secondary">
                                            250g
                                        </button>
                                        <button type="button" class="btn btn-outline-secondary">
                                            500g
                                        </button>
                                        <button type="button" class="btn btn-outline-secondary">
                                            1kg
                                        </button>
                                    </div>
                                    <div>
                                        <!-- input -->
                                        <!-- input -->
                                        <div class="input-group input-spinner  ">
                                            <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                                            <input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input   ">
                                            <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                                        </div>
                                    </div>
                                    <div
                                            class="mt-3 row justify-content-start g-2 align-items-center"
                                    >

                                        <div class="col-lg-4 col-md-5 col-6 d-grid">
                                            <!-- button -->
                                            <!-- btn -->
                                            <button type="button" class="btn btn-primary">
                                                <i class="feather-icon icon-shopping-bag me-2"></i>Add to
                                                cart
                                            </button>
                                        </div>
                                        <div class="col-md-4 col-5">
                                            <!-- btn -->
                                            <a
                                                    class="btn btn-light"
                                                    href="#"
                                                    data-bs-toggle="tooltip"
                                                    data-bs-html="true"
                                                    aria-label="Compare"
                                            ><i class="bi bi-arrow-left-right"></i
                                            ></a>
                                            <a
                                                    class="btn btn-light"
                                                    href="#!"
                                                    data-bs-toggle="tooltip"
                                                    data-bs-html="true"
                                                    aria-label="Wishlist"
                                            ><i class="feather-icon icon-heart"></i
                                            ></a>
                                        </div>
                                    </div>
                                    <hr class="my-6">
                                    <div>
                                        <table class="table table-borderless">
                                            <tbody>
                                            <tr>
                                                <td>Product Code:</td>
                                                <td>FBB00255</td>
                                            </tr>
                                            <tr>
                                                <td>Availability:</td>
                                                <td>In Stock</td>
                                            </tr>
                                            <tr>
                                                <td>Type:</td>
                                                <td>Fruits</td>
                                            </tr>
                                            <tr>
                                                <td>Shipping:</td>
                                                <td>
                                                    <small
                                                    >01 day shipping.<span class="text-muted"
                                                    >( Free pickup today)</span
                                                    ></small
                                                    >
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>