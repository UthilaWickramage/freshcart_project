<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="vendor_base">
    <layout:put block="content">
        <!-- main -->
        <main class="main-content-wrapper">
            <div class="container">
                <div class="row mb-8">
                    <div class="col-md-12">
                        <div>
                            <!-- page header -->
                            <h2>Reviews</h2>

                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="row ">
                    <div class="col-xl-12 col-12 mb-5">
                        <!-- card -->
                        <div class="card h-100 card-lg">
                            <div class="p-6 ">
                                <div class="row justify-content-between">
                                    <div class="col-md-4 col-12 mb-2 mb-md-0">
                                        <!-- form -->
                                        <form class="d-flex" role="search">
                                            <input class="form-control" type="search" placeholder="Search Reviews"
                                                   aria-label="Search">
                                        </form>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-12">
                                        <!-- main -->
                                        <select class="form-select">
                                            <option selected>Select Rating</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                            <option value="4">Four</option>
                                            <option value="5">Five</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!-- card body -->
                            <div class="card-body p-0">
                                <!-- table -->
                                <div class="table-responsive">
                                    <table class="table table-centered table-hover table-borderless mb-0 table-with-checkbox text-nowrap">
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
                                            <th>Product</th>
                                            <th>Name</th>
                                            <th>Reviews</th>
                                            <th>Rating</th>
                                            <th>Date</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="review" items="${it}">

                                            <tr>

                                                <td>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value=""
                                                               id="reviewOne">
                                                        <label class="form-check-label" for="reviewOne">

                                                        </label>
                                                    </div>
                                                </td>

                                                <td><a href="#" class="text-reset">${review.productId.title}</a></td>
                                                <td>${review.userId.first_name} ${review.userId.last_name}</td>

                                                <td>
                                                    <span class="text-truncate">${review.title}</span>
                                                </td>
                                                <td>
                                                    <div>
                                                            <%--                                                       <c:choose>--%>
                                                            <%--                                                           <c:when test="${review.rating eq 5}">--%>
                                                            <%--                                                               <span><i class="bi bi-star-fill text-warning"></i></span>--%>
                                                            <%--                                                               <span><i class="bi bi-star-fill text-warning"></i></span>--%>
                                                            <%--                                                               <span><i class="bi bi-star-fill text-warning"></i></span>--%>
                                                            <%--                                                               <span><i class="bi bi-star-fill text-warning"></i></span>--%>
                                                            <%--                                                               <span><i class="bi bi-star-fill text-warning"></i></span>--%>
                                                            <%--                                                             --%>
                                                            <%--                                                           </c:when>--%>
                                                            <%--                                                           <c:otherwise>--%>
                                                            <%--                                                               <c:choose>--%>
                                                            <%--                                                                   <c:--%>
                                                            <%--                                                               </c:choose>--%>
                                                            <%--                                                           </c:otherwise>--%>
                                                            <%--                                                       </c:choose>--%>
                                                        <c:if test="${review.rating eq 5}">
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                        </c:if>
                                                        <c:if test="${review.rating eq 4}">
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                        </c:if>
                                                        <c:if test="${review.rating eq 3}">
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>

                                                        </c:if>
                                                        <c:if test="${review.rating eq 2}">
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>

                                                        </c:if>
                                                        <c:if test="${review.rating eq 1}">
                                                            <span><i class="bi bi-star-fill text-warning"></i></span>


                                                        </c:if>
                                                            <%--                                                       <span><i class="bi bi-star-fill text-warning"></i></span>--%>
                                                            <%--                                                       <span><i class="bi bi-star-fill text-warning"></i></span>--%>
                                                            <%--                                                       <span><i class="bi bi-star-fill text-warning"></i></span>--%>
                                                            <%--                                                       <span><i class="bi bi-star-fill text-warning"></i></span>--%>
                                                            <%--                                                       <span><i class="bi bi-star-fill text-light"></i></span>--%>
                                                    </div>
                                                </td>
                                                <td>
                                                        ${review.createdAt}
                                                </td>
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

                                <div class="border-top d-md-flex justify-content-between align-items-center p-6">
                                    <span>Showing 1 to 8 of 12 entries</span>
                                    <nav class="mt-2 mt-md-0">
                                        <ul class="pagination mb-0 ">
                                            <li class="page-item disabled"><a class="page-link " href="#!">Previous</a>
                                            </li>
                                            <li class="page-item"><a class="page-link active" href="#!">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#!">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#!">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#!">Next</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </main>
    </layout:put>
</layout:extends>
