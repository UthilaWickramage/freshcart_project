<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="admin_base">
  <layout:put block="content">
    <!-- main -->
    <main class="main-content-wrapper">
      <div class="container">
        <div class="row mb-8">
          <div class="col-md-12">
            <div class="d-md-flex justify-content-between align-items-center">
              <div>
                <h2>Customers</h2>
              </div>
              <div>
                <a href="#!" class="btn btn-primary">Add New Customer</a>
              </div>
            </div>
          </div>
        </div>
        <div class="row ">
          <div class="col-xl-12 col-12 mb-5">
            <div class="card h-100 card-lg">

              <div class="p-6">
                <div class="row justify-content-between">
                  <div class="col-md-4 col-12">
                    <form class="d-flex" role="search">
                      <input class="form-control" type="search" placeholder="Search Customers" aria-label="Search">

                    </form>
                  </div>

                </div>
              </div>
              <div class="card-body p-0 ">

                <div class="table-responsive">
                  <table
                          class="table table-centered table-hover table-borderless mb-0 table-with-checkbox text-nowrap">
                    <thead class="bg-light">
                    <tr>
                      <th>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" value="" id="checkAll">
                          <label class="form-check-label" for="checkAll">

                          </label>
                        </div>
                      </th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Mobile</th>
                      <th>Status</th>
                      <th>Spent</th>

                      <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${it}" var="items">
                      <tr>

                        <td>
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="customerOne">
                            <label class="form-check-label" for="customerOne">

                            </label>
                          </div>
                        </td>

                        <td>
                          <div class="d-flex align-items-center">
                            <img src="${BASE_URL}assets/images/avatar/avatar-1.jpg" alt=""
                                 class="avatar avatar-xs rounded-circle">
                            <div class="ms-2">
                              <a href="#" class="text-inherit">${items.first_name} ${items.last_name}</a>
                            </div>
                          </div>
                        </td>
                        <td>${items.email}</td>

                        <td>
                          ${items.mobile}
                        </td>
                        <td>
                         <c:choose>
                           <c:when test="${items.active}">
                             <span class="badge bg-light-primary text-dark-primary">Active</span>

                           </c:when>
                           <c:otherwise>
                             <span class="badge bg-light-danger text-dark-danger">Inactive</span>

                           </c:otherwise>
                         </c:choose>
                        </td>
                        <td>
                          $49.00
                        </td>

                        <td>
                          <div class="dropdown">
                            <a href="#" class="text-reset" data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="feather-icon icon-more-vertical fs-5"></i>
                            </a>
                            <ul class="dropdown-menu">
                              <li><a class="dropdown-item" href="#"><i class="bi bi-trash me-3"></i>Delete</a></li>
                              <li><a class="dropdown-item" href="#"><i class="bi bi-pencil-square me-3 "></i>Edit</a>
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
      </div>
    </main>


  </layout:put>
</layout:extends>