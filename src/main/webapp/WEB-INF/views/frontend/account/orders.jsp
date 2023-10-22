<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="base">
  <layout:put block="content">
    <main>
        <c:set value="${it[1]}" var="pageCount"/>
      <!-- section -->
      <section>
        <div class="container">
          <!-- row -->
          <div class="row">
            <!-- col -->

            <!-- col -->

              <jsp:include page="../include/account_menu.jsp"/>

            <div class="col-lg-9 col-md-8 col-12">
              <div class="py-6 p-md-6 p-lg-10">
                <!-- heading -->
                <h2 class="mb-6">Your Orders</h2>

                <div class="table-responsive-xxl border-0">
                  <!-- Table -->
                  <table class="table mb-0 text-nowrap table-centered ">
                    <!-- Table Head -->
                    <thead class="bg-light">
                    <tr>

                      <th>Order</th>
                      <th>Date</th>
                      <th>Items</th>
                      <th>Status</th>
                      <th>Amount</th>

                      <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Table body -->
                    <c:forEach var="order" items="${it[0]}">
                      <tr>
                        <td class="align-middle border-top-0 w-0">
<%--                          <a href="#"> <img src="${BASE_URL}assets/images/products/product-img-1.jpg" alt="Ecommerce"--%>
<%--                                            class="icon-shape icon-xl"></a>--%>
<h6>${order.id}</h6>
</td>
                        <td class="align-middle border-top-0">

                          <a href="#" class="fw-semi-bold text-inherit">
                            <h6 class="mb-0">${order.createdAt}</h6>
                          </a>


                        </td>
                        <td class="align-middle border-top-0">

                          <c:forEach items="${order.orderItems}" var="items">
                            <c:forEach items="${items.productId.images}" var="images" end="0">
                              <img class="icon-shape icon-sm" src="${BASE_URL}${images}"/>
                            </c:forEach>
                          </c:forEach>


                        </td>

                        <td class="align-middle border-top-0">
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
                        </td>
                        <td class="align-middle border-top-0">
                          $${order.total}0
                        </td>
                        <td class="text-muted align-middle border-top-0">
                          <a href="#" class="text-inherit" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="View"><i class="feather-icon icon-eye"></i></a>
                        </td>
                      </tr>
                    </c:forEach>


                    </tbody>
                  </table>
                </div>
              </div>
                <div class="border-top d-md-flex justify-content-between align-items-center p-6">
                    <span>Showing 1 to 8 of 12 entries</span>
                    <nav class="mt-2 mt-md-0">
                        <ul class="pagination mb-0 ">
                            <li class="page-item disabled"><a class="page-link " href="#!">Previous</a></li>
                            <c:forEach var="i" begin="1" end="${pageCount}">
                                <li class="page-item"><a class="page-link" href="${BASE_URL}account-orders?page=${i}">${i}</a></li>
                            </c:forEach>

                            <li class="page-item"><a class="page-link" href="#!">Next</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
          </div>
        </div>
      </section>

    </main>
  </layout:put>
</layout:extends>