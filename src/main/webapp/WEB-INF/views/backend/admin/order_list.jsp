<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="admin_base">
    <layout:put block="content">
        <main class="main-content-wrapper">
            <c:set value="${it[1]}" var="pageCount"/>
            <div class="container">
                <!-- row -->
                <div class="row mb-8">
                    <div class="col-md-12">
                        <!-- page header -->
                        <div>
                            <h2>Order List</h2>
                            <!-- breadcrumb -->

                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-12 mb-5">
                        <!-- card -->
                        <div class="card h-100 card-lg">
                            <div class=" p-6 ">
                                <div class="row justify-content-between">
                                    <div class="col-md-4 col-12 mb-2 mb-md-0">
                                        <!-- form -->
                                        <form class="d-flex" role="search">
                                            <input class="form-control" type="search" placeholder="Search"
                                                   aria-label="Search">

                                        </form>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-12">
                                        <!-- select -->
                                        <select class="form-select">
                                            <option selected>Status</option>
                                            <option value="Success">Success</option>
                                            <option value="Pending">Pending</option>
                                            <option value="Cancel">Cancel</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!-- card body -->
                            <div class="card-body p-0">
                                <!-- table responsive -->
                                <div class="table-responsive">
                                    <table class="table table-centered table-hover text-nowrap table-borderless mb-0 table-with-checkbox">
                                        <thead class="bg-light">
                                        <tr>
                                            <th>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                           id="checkAll">
                                                    <label class="form-check-label" for="checkAll">

                                                    </label>
                                                </div>
                                            </th>
                                            <th>Order Name</th>
                                            <th>Products</th>
                                            <th>Customer</th>
                                            <th>Email</th>
                                            <th>Payment</th>
                                            <th>Status</th>

                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${it[0]}" var="order">
                                            <tr>

                                                <td>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value=""
                                                               id="orderOne">
                                                        <label class="form-check-label" for="orderOne">

                                                        </label>
                                                    </div>
                                                </td>

                                                <td><a href="${BASE_URL}admin/order/${order.id}" class="text-reset">#${order.id}</a></td>

                                                <td>
                                                    <c:forEach items="${order.orderItems}" var="items">
                                                        <c:forEach items="${items.productId.images}" var="images"
                                                                   end="0">
                                                            <img class="icon-shape icon-sm" src="${BASE_URL}${images}"/>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </td>
                                                <td>${order.userId.first_name} ${order.userId.last_name}</td>
                                                <td>${order.userId.email} </td>
                                              
                                           

                                                <td>
                                                    <c:choose>
                                                        <c:when test="${order.orderStatus=='PENDING'}">
                                                            <span ondblclick="changeStatus(${order.id})" class="badge bg-light-warning text-dark-primary">Pending</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${order.orderStatus=='VERIFIED'}">
                                                                    <span ondblclick="changeStatus(${order.id})" class="badge bg-light-info text-dark-primary">Verified</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:choose>
                                                                        <c:when test="${order.orderStatus=='SHIPPED'}">
                                                                            <span ondblclick="changeStatus(${order.id})" class="badge bg-light-subtle text-dark-primary">Shipped</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:choose>
                                                                                <c:when test="${order.orderStatus=='DELIVERED'}">
                                                                                    <span ondblclick="changeStatus(${order.id})" class="badge bg-light-success text-dark-primary">Delivered</span>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <span ondblclick="changeStatus(${order.id})" class="badge bg-light-danger text-dark-primary">Cancelled</span>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    
                                                </td>
                                                <td>Rs ${order.total}0</td>

                                                <td>
                                                    <div class="dropdown">
                                                        <a href="#" class="text-reset" data-bs-toggle="dropdown"
                                                           aria-expanded="false">
                                                            <i class="feather-icon icon-more-vertical fs-5"></i>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li><a class="dropdown-item" href="#"><i
                                                                    class="bi bi-trash me-3"></i>Delete</a></li>
                                                            <li><a class="dropdown-item" href="#"><i
                                                                    class="bi bi-pencil-square me-3 "></i>Edit</a>
                                                            </li>
                                                        </ul>
                                                    </div>
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
                                           <c:choose>
                                               <c:when test="${i eq it[2]}">
                                                   <li class="page-item"><a class="page-link active" href="${BASE_URL}admin/orders?page=${i}">${i}</a></li>
                                               </c:when>
                                               <c:otherwise>
                                                   <li class="page-item"><a class="page-link" href="${BASE_URL}admin/orders?page=${i}">${i}</a></li>
                                               </c:otherwise>
                                           </c:choose>
                                        </c:forEach>

                                        <li class="page-item"><a class="page-link" href="#!">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </main>

    </layout:put>
    <layout:put block="script">
        <script>
            function changeStatus(id){
                let form = new FormData();
                form.append("id",id);
                let options = {
                    method:'put',
                    body:form
                }
                secureFetch("${BASE_URL}admin/api/order",options).then((resp)=>{
                    if(resp.ok){
                        document.location.href="${BASE_URL}admin/orders"
                    }
                })
            }
        </script>
    </layout:put>
</layout:extends>