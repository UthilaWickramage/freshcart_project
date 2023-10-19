<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="admin_base">
  <layout:put block="content">
    <main class="main-content-wrapper">
      <c:set var="order" scope="page" value="${it}"/>
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row mb-8">
          <div class="col-md-12">
            <div class="d-md-flex justify-content-between align-items-center">
              <div>
                <!-- page header -->
                <h2>Order Single</h2>
                <!-- breacrumb -->

              </div>
              <!-- button -->
              <div>
                <a href="${BASE_URL}admin_orders" class="btn btn-primary">Back to all orders</a>
              </div>

            </div>
          </div>
        </div>
        <!-- row -->
        <div class="row ">
          <div class="col-xl-12 col-12 mb-5">
            <!-- card -->
            <div class="card h-100 card-lg">
              <div class="card-body p-6">
                <div class="d-md-flex justify-content-between">
                  <div class="d-flex align-items-center mb-2 mb-md-0">
                    <h2 class="mb-0">Order ID: #${order.id}</h2>
                    <c:choose>
                      <c:when test="${order.orderStatus=='PENDING'}">
                        <span class="badge bg-light-warning text-dark-warning ms-2">Pending</span> </c:when>
                      <c:otherwise>
                        <c:choose>
                          <c:when test="${order.orderStatus=='VERIFIED'}">
                            <span class="badge bg-light-info text-dark-warning ms-2">Verified</span> </c:when>
                          <c:otherwise>
                            <c:choose>
                              <c:when test="${order.orderStatus=='SHIPPED'}">
                                <span class="badge bg-light-subtle text-dark-warning ms-2">Shipped</span> </c:when>
                              <c:otherwise>
                                <c:choose>
                                  <c:when test="${order.orderStatus=='DELIVERED'}">
                                    <span class="badge bg-light-success text-dark-warning ms-2">Delivered</span> </c:when>
                                  <c:otherwise>
                                    <span class="badge bg-light-danger text-dark-warning ms-2">Cancelled</span> </c:otherwise>
                                </c:choose>
                              </c:otherwise>
                            </c:choose>
                          </c:otherwise>
                        </c:choose>
                      </c:otherwise>
                    </c:choose>

                  </div>
                  <!-- select option -->
                  <div class="d-md-flex">
                    <div class="mb-2 mb-md-0">
                      <select class="form-select">
                        <option selected>Status</option>
                        <option value="Success">Success</option>
                        <option value="Pending">Pending</option>
                        <option value="Cancel">Cancel</option>
                      </select>
                    </div>
                    <!-- button -->
                    <div class="ms-md-3">
                      <a href="#" class="btn btn-primary">Save</a>
                      <a href="#" class="btn btn-secondary">Download Invoice</a>
                    </div>
                  </div>
                </div>
                <div class="mt-8">
                  <div class="row">
                    <!-- address -->
                    <div class="col-lg-4 col-md-4 col-12">
                      <div class="mb-6">
                        <h6>Customer Details</h6>
                        <p class="mb-1 lh-lg">${order.userId.first_name} ${order.userId.last_name}<br>
                            ${order.userId.email}<br>
                          <c:choose>
                            <c:when test="${order.userId.mobile eq null}">
                              <span class="badge bg-light-danger text-dark-warning ms-2">Not Available</span>
                            </c:when>

                            <c:otherwise>
                              ${order.userId.mobile}
                            </c:otherwise>
                          </c:choose>
                        </p>
                        <a href="#">View Profile</a>
                      </div>
                    </div>
                    <!-- address -->
                    <div class="col-lg-4 col-md-4 col-12">
                      <div class="mb-6">
                        <h6>Shipping Address</h6>
                        <p class="mb-1 lh-lg">${order.userId.first_name} ${order.userId.last_name}<br>
                          <c:choose>
                            <c:when test="${order.userId.address eq null and order.userId.city eq null}">
                              <span class="badge bg-light-danger text-dark-warning ms-2">Not Available</span>
                            </c:when>

                            <c:otherwise>
                              ${order.userId.address}.<br>
                              ${order.userId.city}<br>
                            </c:otherwise>
                          </c:choose>

                          Contact No.  <c:choose>
                            <c:when test="${order.userId.mobile eq null}">
                              <span class="badge bg-light-danger text-dark-primary ms-2">Not Available</span>
                            </c:when>

                            <c:otherwise>
                              ${order.userId.mobile}.
                            </c:otherwise>
                          </c:choose></p>

                      </div>
                    </div>
                    <!-- address -->
                    <div class="col-lg-4 col-md-4 col-12">
                      <div class="mb-6">
                        <h6>Order Details</h6>
                        <p class="mb-1 lh-lg">Order ID: <span class="text-dark">${order.id}</span><br>
                          Order Date: <span class="text-dark">${order.createdAt}</span><br>
                          Order Total: <span class="text-dark">$${order.total}</span></p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <div class="table-responsive">
                    <!-- Table -->
                    <table class="table mb-0 text-nowrap table-centered">
                      <!-- Table Head -->
                      <thead class="bg-light">
                      <tr>
                        <th>Products</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                      </tr>
                      </thead>
                      <!-- tbody -->
                      <tbody>
                      <c:forEach items="${order.orderItems}" var="items">
                        <tr>
                          <td>
                            <a href="#" class="text-inherit">
                              <div class="d-flex align-items-center">
                                <div>
                                  <c:forEach var="images" items="${items.productId.images}" end="0">
                                    <img src="${BASE_URL}${images}" alt=""
                                         class="icon-shape icon-lg">
                                  </c:forEach>

                                </div>
                                <div class="ms-lg-4 mt-2 mt-lg-0">
                                  <h5 class="mb-0 h6">
                                      ${items.productId.title}
                                  </h5>

                                </div>
                              </div>
                            </a>
                          </td>
                          <c:set var="price" scope="page" value="${items.productId.sale_price+ items.productId.shipping_price}"/>
                          <td><span class="text-body">$${price}</span></td>
                          <td>${items.qty}</td>
                          <td>$${items.qty*price}</td>
                        </tr>
                      </c:forEach>

                      <tr>
                        <td></td>
                        <td></td>
                        <td colspan="1" class="fw-semi-bold text-dark ">
                          <!-- text -->
                          Grand Total
                        </td>
                        <td class="fw-semi-bold text-dark ">
                          <!-- text -->
                          $${order.total}0
                        </td>
                      </tr>

                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div class="card-body p-6">
                <div class="row">
                  <div class="col-md-6 mb-4 mb-lg-0">
                    <h6>Payment Info</h6>
                    <span>Cash on Delivery</span>
                  </div>
                  <div class="col-md-6">
                    <h5>Notes</h5>
                    <textarea class="form-control mb-3" rows="3" placeholder="Write note for order"></textarea>
                    <a href="#" class="btn btn-primary">Save Notes</a>
                  </div>
                </div>
              </div>
            </div>

          </div>

        </div>

      </div>

    </main>
  </layout:put>
</layout:extends>
