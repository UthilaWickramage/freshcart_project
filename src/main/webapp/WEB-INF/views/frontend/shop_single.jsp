<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="base">
    <layout:put block="content">
        <main>
            <c:forEach items="${it}" var="items">
                <section class="mt-8">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-6">

<%--                                    <!-- img slide -->--%>
<%--                                    <div class="product" id="product">--%>
<%--                                        <div class="zoom" onmousemove="zoom(event)"--%>
<%--                                             style="background-image: url(${BASE_URL}assets/images/products/product-single-img-1.jpg)">--%>
<%--                                            <!-- img -->--%>
<%--                                            <!-- img --><img src="${BASE_URL}assets/images/products/product-single-img-1.jpg" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div>--%>
<%--                                            <div class="zoom" onmousemove="zoom(event)"--%>
<%--                                                 style="background-image: url(${BASE_URL}assets/images/products/product-single-img-2.jpg)">--%>
<%--                                                <!-- img -->--%>
<%--                                                <img src="${BASE_URL}assets/images/products/product-single-img-2.jpg" alt="">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div>--%>
<%--                                            <div class="zoom" onmousemove="zoom(event)"--%>
<%--                                                 style="background-image: url(${BASE_URL}assets/images/products/product-single-img-3.jpg)">--%>
<%--                                                <!-- img -->--%>
<%--                                                <img src="${BASE_URL}assets/images/products/product-single-img-3.jpg" alt="">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div>--%>
<%--                                            <div class="zoom" onmousemove="zoom(event)"--%>
<%--                                                 style="background-image: url(${BASE_URL}assets/images/products/product-single-img-4.jpg)">--%>
<%--                                                <!-- img -->--%>
<%--                                                <img src="${BASE_URL}assets/images/products/product-single-img-4.jpg" alt="">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <!-- product tools -->--%>
<%--                                    <div class="product-tools">--%>
<%--                                        <div class="thumbnails row g-3" id="productThumbnails">--%>
<%--                                            <div class="col-3">--%>
<%--                                                <div class="thumbnails-img">--%>
<%--                                                    <!-- img -->--%>
<%--                                                    <img src="${BASE_URL}assets/images/products/product-single-img-1.jpg" alt="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-3">--%>
<%--                                                <div class="thumbnails-img">--%>
<%--                                                    <!-- img -->--%>
<%--                                                    <img src="${BASE_URL}assets/images/products/product-single-img-2.jpg" alt="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-3">--%>
<%--                                                <div class="thumbnails-img">--%>
<%--                                                    <!-- img -->--%>
<%--                                                    <img src="${BASE_URL}assets/images/products/product-single-img-3.jpg" alt="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-3">--%>
<%--                                                <div class="thumbnails-img">--%>
<%--                                                    <!-- img -->--%>
<%--                                                    <img src="${BASE_URL}assets/images/products/product-single-img-4.jpg" alt="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-3">--%>
<%--                                                <div class="thumbnails-img">--%>
<%--                                                    <!-- img -->--%>
<%--                                                    <img src="${BASE_URL}assets/images/products/product-single-img-1.jpg" alt="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                </div>--%>
                                <!-- img slide -->
                                <div class="product mt-5" id="product">
                                    <c:forEach items="${items.images}" var="s" end="0">
                                        <div class="d-flex justify-content-center align-items-center border border-black border-1 overflow-hidden">

                                            <!-- img -->

                                            <!-- img --><img style="transform: scale(1.1); overflow: hidden" src="${BASE_URL}${s}" height="400px"
                                                             alt="">

                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- product tools -->
                                                  <div class="product-tools">
                                                    <div class="thumbnails row gx-3 " id="productThumbnails">

                                                     <c:forEach items="${items.images}" var="t" begin="1" end="5">
                                                         <div class="col-3 d-flex align-items-center " style="min-height: 100px">
                                                             <div class="thumbnails-img ">
                                                                 <!-- img -->
                                                                 <img src="${BASE_URL}${t}" class="border border-black border-1" alt="">
                                                             </div>
                                                         </div>
                                                     </c:forEach>

                                                    </div>
                                                  </div>
                            </div>
                            <div class="col-md-6">
                                <div class="ps-lg-10 mt-6 mt-md-0">
                                    <!-- content -->
                                    <a href="#!" class="mb-4 d-block">${items.brand}</a>
                                    <!-- heading -->
                                    <h1 class="mb-1">${items.title}</h1>
                                    <div class="mb-4">
                                        <!-- rating -->
                                        <!-- rating --> <small class="text-warning"> <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i></small><a href="#" class="ms-2">(30 reviews)</a>
                                    </div>
                                    <div class="fs-4">
                                        <!-- price --><span class="fw-bold text-dark">Sale Price: Rs ${items.sale_price}0</span><br>
                                        <span class="fw-bold text-dark-info fs-6">Shipping Price: Rs ${items.shipping_price}0</span><br>
                                        <c:set var="total" scope="application"
                                               value="${items.shipping_price+items.sale_price}"/>
                                        <span class="fw-bold text-primary fs-2">Total Price: Rs <c:out
                                                value="${total}"></c:out>0</span>


                                    </div>
                                    <!-- hr -->
                                    <hr class="my-6">
                                    <div class="mb-5"><span
                                            class="text-primary-emphasis fs-4">${items.weight} ${items.unit}</span>
                                            <%--                    <!-- btn --> <button type="button" class="btn btn-outline-secondary">500g</button>--%>
                                            <%--                    <!-- btn --> <button type="button" class="btn btn-outline-secondary">1kg</button></div>--%>
                                        <div>


                                            <!-- input -->
                                            <div class="input-group input-spinner  ">
                                                <input type="button" value="-" class="button-minus  btn  btn-sm "
                                                       data-field="quantity">
                                                <input type="number" id="qty" step="1" max="10" value="1"
                                                       name="quantity"
                                                       class="quantity-field form-control-sm form-input   ">
                                                <input type="button" value="+" class="button-plus btn btn-sm "
                                                       data-field="quantity">
                                            </div>

                                        </div>
                                        <div class="mt-3 row justify-content-start g-2 align-items-center">

                                            <div class="col-xxl-4 col-lg-4 col-md-5 col-5 d-grid">
                                                <!-- button -->
                                                <!-- btn -->
                                                <button type="button" onclick="addToCart(${items.id})"
                                                        class="btn btn-primary"><i
                                                        class="feather-icon icon-shopping-bag me-2"></i>Add to
                                                    cart
                                                </button>
                                            </div>
                                            <div class="col-md-4 col-4">
                                                <!-- btn -->
                                                <a class="btn btn-light " href="#" data-bs-toggle="tooltip"
                                                   data-bs-html="true" aria-label="Compare"><i
                                                        class="bi bi-arrow-left-right"></i></a>
                                                <a class="btn btn-light " href="shop-wishlist.html"
                                                   data-bs-toggle="tooltip" data-bs-html="true" aria-label="Wishlist"><i
                                                        class="feather-icon icon-heart"></i></a>
                                            </div>
                                        </div>
                                        <!-- hr -->
                                        <hr class="my-6">
                                        <div>
                                            <!-- table -->
                                            <table class="table table-borderless mb-0">

                                                <tbody>
                                                <tr>
                                                    <td>Remaining Quantity:</td>
                                                    <td>${items.qty}</td>

                                                </tr>
                                                <tr>
                                                    <td>Availability:</td>
                                                    <c:choose>
                                                        <c:when test="${items.inStock}">
                                                            <td><span class="badge bg-primary">In Stock</span></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><span class="badge bg-danger">Out of Stock</span></td>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </tr>
                                                <tr>
                                                    <td>Type:</td>
                                                    <td>Fruits</td>

                                                </tr>
                                                <tr>
                                                    <td>Shipping:</td>
                                                    <td><small>01 day shipping.<span class="text-muted">( Free pickup today)</span></small>
                                                    </td>

                                                </tr>


                                                </tbody>
                                            </table>

                                        </div>
                                        <div class="mt-8">
                                            <!-- dropdown -->
                                            <div class="dropdown">
                                                <a class="btn btn-outline-secondary dropdown-toggle" href="#"
                                                   role="button"
                                                   data-bs-toggle="dropdown" aria-expanded="false">
                                                    Share
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="#"><i
                                                            class="bi bi-facebook me-2"></i>Facebook</a></li>
                                                    <li><a class="dropdown-item" href="#"><i
                                                            class="bi bi-twitter me-2"></i>Twitter</a></li>
                                                    <li><a class="dropdown-item" href="#"><i
                                                            class="bi bi-instagram me-2"></i>Instagram</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="mt-lg-14 mt-8 ">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
                                    <!-- nav item -->
                                    <li class="nav-item" role="presentation">
                                        <!-- btn -->
                                        <button class="nav-link active" id="product-tab" data-bs-toggle="tab"
                                                data-bs-target="#product-tab-pane" type="button" role="tab"
                                                aria-controls="product-tab-pane"
                                                aria-selected="true">Product Details
                                        </button>
                                    </li>
                                    <!-- nav item -->
                                    <li class="nav-item" role="presentation">
                                        <!-- btn -->
                                        <button class="nav-link" id="details-tab" data-bs-toggle="tab"
                                                data-bs-target="#details-tab-pane" type="button" role="tab"
                                                aria-controls="details-tab-pane"
                                                aria-selected="false">Information
                                        </button>
                                    </li>
                                    <!-- nav item -->
                                    <li class="nav-item" role="presentation">
                                        <!-- btn -->
                                        <button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
                                                data-bs-target="#reviews-tab-pane" type="button" role="tab"
                                                aria-controls="reviews-tab-pane"
                                                aria-selected="false">Reviews
                                        </button>
                                    </li>
                                    <!-- nav item -->
                                    <li class="nav-item" role="presentation">
                                        <!-- btn -->
                                        <button class="nav-link" id="sellerInfo-tab" data-bs-toggle="tab"
                                                data-bs-target="#sellerInfo-tab-pane" type="button" role="tab"
                                                aria-controls="sellerInfo-tab-pane"
                                                aria-selected="false" disabled>Seller
                                            Info
                                        </button>
                                    </li>
                                </ul>
                                <!-- tab content -->
                                <div class="tab-content" id="myTabContent">
                                    <!-- tab pane -->
                                    <div class="tab-pane fade show active" id="product-tab-pane" role="tabpanel"
                                         aria-labelledby="product-tab"
                                         tabindex="0">
                                        <div class="my-8">
                                            <div class="mb-5">
                                                <!-- text -->
                                                <h4 class="mb-1">Nutrient Value & Benefits</h4>
                                                <p class="mb-0">${items.description}</p>
                                            </div>
                                            <div class="mb-5">
                                                <h5 class="mb-1">Storage Tips</h5>
                                                <p class="mb-0">${items.description}
                                                </p>
                                            </div>
                                            <!-- content -->
                                            <div class="mb-5">
                                                <h5 class="mb-1">Unit</h5>
                                                <p class="mb-0">${items.unit}</p>
                                            </div>
                                            <div class="mb-5">
                                                <h5 class="mb-1">Seller</h5>
                                                <p class="mb-0">DMart Pvt. LTD</p>
                                            </div>
                                            <div>
                                                <h5 class="mb-1">Disclaimer</h5>
                                                <p class="mb-0">Image shown is a representation and may slightly vary
                                                    from the actual product. Every
                                                    effort
                                                    is made to maintain accuracy of all information displayed.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- tab pane -->
                                    <div class="tab-pane fade" id="details-tab-pane" role="tabpanel"
                                         aria-labelledby="details-tab" tabindex="0">
                                        <div class="my-8">
                                            <div class="row">
                                                <div class="col-12">
                                                    <h4 class="mb-4">Details</h4>
                                                </div>
                                                <div class="col-12 col-lg-6">
                                                    <table class="table table-striped">
                                                        <!-- table -->
                                                        <tbody>
                                                        <tr>
                                                            <th>Weight</th>
                                                            <td>${items.weight} ${items.unit}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Ingredient Type</th>
                                                            <td>Vegetarian</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Brand</th>
                                                            <td>${items.brand}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Item Package Quantity</th>
                                                            <td>1</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Form</th>
                                                            <td>Larry the Bird</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Manufacturer</th>
                                                            <td>Dmart</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Net Quantity</th>
                                                            <td>${items.qty}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Product Dimensions</th>
                                                            <td>9.6 x 7.49 x 18.49 cm</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-12 col-lg-6">
                                                    <table class="table table-striped">
                                                        <!-- table -->
                                                        <tbody>
                                                        <tr>
                                                            <th>ASIN</th>
                                                            <td>SB0025UJ75W</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Best Sellers Rank</th>
                                                            <td>#2 in Fruits</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Date First Available</th>
                                                            <td>30 April 2022</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Item Weight</th>
                                                            <td>${items.weight} ${items.unit}</td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- tab pane -->
                                    <div class="tab-pane fade" id="reviews-tab-pane" role="tabpanel"
                                         aria-labelledby="reviews-tab" tabindex="0">
                                        <div class="my-8">
                                            <!-- row -->
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="me-lg-12 mb-6 mb-md-0">
                                                        <div class="mb-5">
                                                            <!-- title -->
                                                            <h4 class="mb-3">Customer reviews</h4>
                                                            <span>
                          <!-- rating --> <small class="text-warning"> <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-half"></i></small><span class="ms-3">4.1 out of 5</span><small
                                                                    class="ms-3">11,130 global ratings</small></span>
                                                        </div>
                                                        <div class="mb-8">
                                                            <!-- progress -->
                                                            <div class="d-flex align-items-center mb-2">
                                                                <div class="text-nowrap me-3 text-muted"><span
                                                                        class="d-inline-block align-middle text-muted">5</span><i
                                                                        class="bi bi-star-fill ms-1 small text-warning"></i>
                                                                </div>
                                                                <div class="w-100">
                                                                    <div class="progress" style="height: 6px;">
                                                                        <div class="progress-bar bg-warning"
                                                                             role="progressbar" style="width: 60%;"
                                                                             aria-valuenow="60" aria-valuemin="0"
                                                                             aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <span class="text-muted ms-3">53%</span>
                                                            </div>
                                                            <!-- progress -->
                                                            <div class="d-flex align-items-center mb-2">
                                                                <div class="text-nowrap me-3 text-muted"><span
                                                                        class="d-inline-block align-middle text-muted">4</span><i
                                                                        class="bi bi-star-fill ms-1 small text-warning"></i>
                                                                </div>
                                                                <div class="w-100">
                                                                    <div class="progress" style="height: 6px;">
                                                                        <div class="progress-bar bg-warning"
                                                                             role="progressbar" style="width: 50%;"
                                                                             aria-valuenow="50" aria-valuemin="0"
                                                                             aria-valuemax="50"></div>
                                                                    </div>
                                                                </div>
                                                                <span class="text-muted ms-3">22%</span>
                                                            </div>
                                                            <!-- progress -->
                                                            <div class="d-flex align-items-center mb-2">
                                                                <div class="text-nowrap me-3 text-muted"><span
                                                                        class="d-inline-block align-middle text-muted">3</span><i
                                                                        class="bi bi-star-fill ms-1 small text-warning"></i>
                                                                </div>
                                                                <div class="w-100">
                                                                    <div class="progress" style="height: 6px;">
                                                                        <div class="progress-bar bg-warning"
                                                                             role="progressbar" style="width: 35%;"
                                                                             aria-valuenow="35" aria-valuemin="0"
                                                                             aria-valuemax="35"></div>
                                                                    </div>
                                                                </div>
                                                                <span class="text-muted ms-3">14%</span>
                                                            </div>
                                                            <!-- progress -->
                                                            <div class="d-flex align-items-center mb-2">
                                                                <div class="text-nowrap me-3 text-muted"><span
                                                                        class="d-inline-block align-middle text-muted">2</span><i
                                                                        class="bi bi-star-fill ms-1 small text-warning"></i>
                                                                </div>
                                                                <div class="w-100">
                                                                    <div class="progress" style="height: 6px;">
                                                                        <div class="progress-bar bg-warning"
                                                                             role="progressbar" style="width: 22%;"
                                                                             aria-valuenow="22" aria-valuemin="0"
                                                                             aria-valuemax="22"></div>
                                                                    </div>
                                                                </div>
                                                                <span class="text-muted ms-3">5%</span>
                                                            </div>
                                                            <!-- progress -->
                                                            <div class="d-flex align-items-center mb-2">
                                                                <div class="text-nowrap me-3 text-muted"><span
                                                                        class="d-inline-block align-middle text-muted">1</span><i
                                                                        class="bi bi-star-fill ms-1 small text-warning"></i>
                                                                </div>
                                                                <div class="w-100">
                                                                    <div class="progress" style="height: 6px;">
                                                                        <div class="progress-bar bg-warning"
                                                                             role="progressbar" style="width: 14%;"
                                                                             aria-valuenow="14" aria-valuemin="0"
                                                                             aria-valuemax="14"></div>
                                                                    </div>
                                                                </div>
                                                                <span class="text-muted ms-3">7%</span>
                                                            </div>
                                                        </div>
                                                        <div class="d-grid">
                                                            <h4>Review this product</h4>
                                                            <p class="mb-0">Share your thoughts with other
                                                                customers.</p>
                                                            <a href="#"
                                                               class="btn btn-outline-gray-400 mt-4 text-muted">Write
                                                                the Review</a>
                                                        </div>

                                                    </div>
                                                </div>
                                                <!-- col -->
                                                <div class="col-md-8">
                                                    <div class="mb-10">
                                                        <div class="d-flex justify-content-between align-items-center mb-8">
                                                            <div>
                                                                <!-- heading -->
                                                                <h4>Reviews</h4>
                                                            </div>
                                                            <div>
                                                                <select class="form-select">
                                                                    <option selected>Top Review</option>
                                                                    <option value="1">One</option>
                                                                    <option value="2">Two</option>
                                                                    <option value="3">Three</option>
                                                                </select>
                                                            </div>

                                                        </div>


                                                        <c:forEach items="${items.reviews}" var="review">
                                                            <div class="d-flex border-bottom pb-6 mb-6 pt-4">
                                                                <!-- img --><img
                                                                    src="${BASE_URL}assets/images/avatar/default.png"
                                                                    alt=""
                                                                    class="rounded-circle avatar-lg">
                                                                <div class="ms-5 flex-grow-1">
                                                                    <h6 class="mb-1">
                                                                        Sandra Langevin

                                                                    </h6>
                                                                    <!-- content -->
                                                                    <p class="small"><span class="text-muted">8 December 2022</span>
                                                                        <span class="text-danger ms-3 fw-bold">Unverified Purchase</span>
                                                                    </p>
                                                                    <!-- rating -->
                                                                    <div class=" mb-2">
                                                                        <c:forEach begin="1" end="${review.rating}">

                                                                            <i class="bi bi-star-fill text-warning"></i>
                                                                        </c:forEach>

                                                                            <%--                                                                       <i class="bi bi-star-fill text-warning"></i>--%>
                                                                            <%--                                                                       <i class="bi bi-star-fill text-warning"></i>--%>
                                                                            <%--                                                                       <i class="bi bi-star-fill text-warning"></i>--%>
                                                                            <%--                                                                       <i class="bi bi-star text-warning"></i>--%>
                                                                        <span class="ms-3 text-dark fw-bold">${review.title}</span>
                                                                    </div>

                                                                    <p>${review.description} </p>

                                                                    <!-- icon -->
                                                                    <div class="d-flex justify-content-end mt-4">
                                                                        <a href="#" class="text-muted"><i
                                                                                class="feather-icon icon-thumbs-up me-1"></i>Helpful</a>
                                                                        <a href="#" class="text-muted ms-4"><i
                                                                                class="feather-icon icon-flag me-2"></i>Report
                                                                            abuse</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <div>
                                                            <a href="#" class="btn btn-outline-gray-400 text-muted">Read
                                                                More Reviews</a>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <!-- rating -->
                                                        <h3 class="mb-5">Create Review</h3>
                                                        <div class="border-bottom py-4 mb-4">
                                                            <h4 class="mb-3">Overall rating</h4>
                                                            <select class="form-select" id="rating">
                                                                <option value="1">1 Star</option>
                                                                <option value="2">2 Star</option>
                                                                <option value="3">3 Star</option>
                                                                <option value="4">4 Star</option>
                                                                <option value="5">5 Star</option>
                                                            </select>
                                                        </div>

                                                        <!-- form control -->
                                                        <div class="border-bottom py-4 mb-4">
                                                            <h5>Add a headline</h5>
                                                            <input id="title" type="text" class="form-control"
                                                                   placeholder="What is most important to know">
                                                        </div>

                                                        <div class=" py-4 mb-4">
                                                            <!-- heading -->
                                                            <h5>Add a written review</h5>
                                                            <textarea class="form-control" id="desc" rows="3"
                                                                      placeholder="What did you like or dislike? What did you use this product for?"></textarea>

                                                        </div>
                                                        <!-- button -->
                                                        <div class="d-flex justify-content-end">
                                                            <a onclick="saveReview(${items.id})"
                                                               class="btn btn-primary">Submit Review</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <!-- tab pane -->
                                    <div class="tab-pane fade" id="sellerInfo-tab-pane" role="tabpanel"
                                         aria-labelledby="sellerInfo-tab"
                                         tabindex="0">...
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </section>
            </c:forEach>

            <!-- section -->

        </main>
    </layout:put>
    <layout:put block="script">
        <script>
            function saveReview(product_id) {

                let rating = document.getElementById("rating").value;
                let title = document.getElementById("title").value;
                let desc = document.getElementById("desc").value;


                let options = {
                    method: 'post',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        product_id: product_id,
                        rating: rating,
                        title: title,
                        desc: desc,
                    })
                }
                    secureFetch('${BASE_URL}api/reviews',options)
                    .then(response => response.text())
                    .then(text => alert(text));
            }

            function addToCart(id) {
                let qty = document.getElementById("qty").value;

                let options ={
                    method: 'post',
                    headers: {

                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        id: id,
                        qty: qty,

                    })
                }
                secureFetch("${BASE_URL}api/cart",options).then(response => response.text())
                    .then(text=>{
                        if(text=="Success"){
                            window.location.href="${BASE_URL}cart";
                        }else {
                            alert(text)
                        }
                    }

 );
            }
        </script>
    </layout:put>
</layout:extends>