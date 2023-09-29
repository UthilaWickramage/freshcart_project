<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="vendor_base">
    <layout:put block="content">
        <!-- main -->
        <main class="main-content-wrapper">
            <div class="container">
                <!-- row -->
                <div class="row mb-8">
                    <div class="col-md-12">
                        <div class="d-md-flex justify-content-between align-items-center">
                            <!-- pageheader -->
                            <div>
                                <h2>Categories</h2>
                                <!-- breacrumb -->

                            </div>
                            <!-- button -->

                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-xl-12 col-12 mb-5">
                        <!-- card -->
                        <div class="card h-100 card-lg">
                            <div class=" px-6 py-6 ">
                                <div class="row justify-content-between">
                                    <div class="col-lg-4 col-md-6 col-12 mb-2 mb-md-0">
                                        <!-- form -->
                                        <form class="d-flex" role="search">
                                            <input class="form-control" type="search" placeholder="Search Category"
                                                   aria-label="Search">
                                        </form>
                                    </div>
                                    <!-- select option -->
                                    <div class="col-xl-2 col-md-4 col-12">
                                        <select class="form-select">
                                            <option selected>Status</option>
                                            <option value="Published">Published</option>
                                            <option value="Unpublished">Unpublished</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!-- card body -->
                            <div class="card-body p-0">
                                <!-- table -->
                                <div class="table-responsive ">
                                    <table class="table table-centered table-hover mb-0 text-nowrap table-borderless table-with-checkbox">
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
                                            <th>Icon</th>
                                            <th> Name</th>
                                            <th>Description</th>
                                            <th>Status</th>

                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${it}" var="items">
                                            <tr>

                                                <td>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value=""
                                                               id="categoryOne">
                                                        <label class="form-check-label" for="categoryOne">

                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <a href="#!"> <img src="${BASE_URL}${items.image_url}" alt=""
                                                                       class="icon-shape icon-sm"></a>
                                                </td>
                                                <td><a href="#" class="text-reset">${items.name}</a></td>
                                                <td>${items.description}</td>

                                                <td>
                                                    <c:choose>
                                                        <c:when test="${items.status}">
                                                            <span class="badge bg-light-primary text-dark-primary">Published</span>

                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-light-danger text-dark-danger">Unpublished</span>
                                                        </c:otherwise>
                                                    </c:choose>
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
                            </div>
                            <div class="border-top d-md-flex justify-content-between align-items-center  px-6 py-6">
                                <span>Showing 1 to 8 of 12 entries</span>
                                <nav class="mt-2 mt-md-0">
                                    <ul class="pagination mb-0 ">
                                        <li class="page-item disabled"><a class="page-link " href="#!">Previous</a></li>
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
        </main>
    </layout:put>
</layout:extends>