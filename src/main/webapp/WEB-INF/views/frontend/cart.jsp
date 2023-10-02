<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="base">
    <layout:put block="content">
        <section class="mb-lg-14 mb-8 mt-8">
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-12">
                        <!-- card -->
                        <div class="card py-1 border-0 mb-8">
                            <div>
                                <h1 class="fw-bold">Shop Cart</h1>
                                <p class="mb-0">Shopping in 382480</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-lg-8 col-md-7">

                        <div class="py-3">
                            <!-- alert -->
                            <div class="alert alert-primary p-2" role="alert">
                                You have successfully added an item to the Cart<a href="#!" class="alert-link"> checkout
                                now!</a>
                            </div>

                                <!-- list group -->
                                <c:forEach items="${it.list}" var="item">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item py-3 py-lg-0 px-0 border-top">
                                    <!-- row -->
                                    <div class="row align-items-center">
                                        <div class="col-3 col-md-2">
                                            <!-- img -->
                                            <c:forEach items="${item.productId.productImage}" var="i" end="0">
                                                <img src="${BASE_URL}${i.url}" alt="Ecommerce" class="img-fluid"/>
                                            </c:forEach>
                                        </div>
                                        <div class="col-4 col-md-5">
                                            <!-- title -->
                                            <a href="shop-single.html" class="text-inherit"><h6
                                                    class="mb-0">${item.productId.title}<small>(${item.productId.brand})</small>
                                            </h6></a>
                                            <span><small
                                                    class="text-muted">${item.productId.weight} ${item.productId.unit}</small></span>
                                            <!-- text -->
                                            <div class="mt-2 small lh-1">
                                                <a onclick="removeItem(${item.id})"
                                                                            class="text-decoration-none text-inherit"> <span
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
                                        <!-- input group -->
                                        <div class="col-3 col-md-3 col-lg-2">
                                            <!-- input -->
                                            <div class="input-group input-spinner  ">
                                                <input type="button" value="-" disabled class="button-minus  btn  btn-sm "
                                                       data-field="quantity">
                                                <input type="number" step="1" max="10" value="${item.qty}" name="quantity"
                                                       class="quantity-field form-control-sm form-input   ">
                                                <input type="button" value="+" disabled class="button-plus btn btn-sm "
                                                       data-field="quantity">
                                            </div>


                                        </div>
                                        <!-- price -->
                                        <div class="col-2 text-lg-end text-start text-md-end col-md-2">
                                            <span class="fw-bold">Rs ${item.item_sale_total}0</span><br>
                                            <span class=""><small>Rs ${item.item_shipping_total}0</small></span>
                                        </div>
                                    </div>

                        </li>

                        </ul>
                        </c:forEach>



                        <!-- btn -->
                        <div class="d-flex justify-content-between mt-4">
                            <a href="#!" class="btn btn-primary">Continue Shopping</a>
                            <a href="#!" class="btn btn-dark">Update Cart</a>
                        </div>

                    </div>
                </div>

                <!-- sidebar -->
                <div class="col-12 col-lg-4 col-md-5">
                    <!-- card -->
                    <div class="mb-5 card mt-6">
                        <div class="card-body p-6">
                            <!-- heading -->
                            <h2 class="h5 mb-4">Summary</h2>
                            <div class="card mb-2">
                                <!-- list group -->
                                <ul class="list-group list-group-flush">
                                    <!-- list group item -->
                                    <li class="list-group-item d-flex justify-content-between align-items-start">
                                        <div class="me-auto">
                                            <div>Item Subtotal</div>

                                        </div>
                                        <span>Rs ${it.sale_price}0</span>
                                    </li>

                                    <!-- list group item -->
                                    <li class="list-group-item d-flex justify-content-between align-items-start">
                                        <div class="me-auto">
                                            <div>Shipping Fee</div>

                                        </div>
                                        <span>Rs ${it.shipping_price}0</span>
                                    </li>
                                    <!-- list group item -->
                                    <li class="list-group-item d-flex justify-content-between align-items-start">
                                        <div class="me-auto">
                                            <div class="fw-bold">Grand Total</div>

                                        </div>
                                        <span class="fw-bold">Rs ${it.total}0</span>
                                    </li>
                                </ul>

                            </div>
                            <div class="d-grid mb-1 mt-4">
                                <!-- btn -->
                                <button class="btn btn-primary btn-lg d-flex justify-content-between align-items-center"
                                        type="submit">
                                    Go to Checkout <span class="fw-bold">Rs ${it.total}0</span></button>
                            </div>
                            <!-- text -->
                            <p><small>By placing your order, you agree to be bound by the Freshcart <a href="#!">Terms
                                of Service</a>
                                and <a href="#!">Privacy Policy.</a> </small></p>

                            <!-- heading -->
                            <div class="mt-8">
                                <h2 class="h5 mb-3">Add Promo or Gift Card</h2>
                                <form>
                                    <div class="mb-2">
                                        <!-- input -->
                                        <label for="giftcard" class="form-label sr-only">Email address</label>
                                        <input type="text" class="form-control" id="giftcard"
                                               placeholder="Promo or Gift Card">

                                    </div>
                                    <!-- btn -->
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-outline-dark mb-1">Redeem</button>
                                    </div>
                                    <p class="text-muted mb-0"><small>Terms & Conditions apply</small></p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </section>

    </layout:put>
    <layout:put block="script">
        <script>
            function removeItem(id){
                let formData = new FormData();
                formData.append("id",id);
                alert(id)
                fetch("${BASE_URL}cart",{
                    method:'put',
                    body:formData
                }).then(response=>response.text())
                    .then(text=>alert(text))

            }
        </script>
    </layout:put>
</layout:extends>