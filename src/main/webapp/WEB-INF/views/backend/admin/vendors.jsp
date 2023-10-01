<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="admin_base">
  <layout:put block="content">
    <!-- main -->
    <main class="main-content-wrapper">
      <div class="container">
        <div class="row mb-8">
          <div class="col-md-12">
            <!-- pageheader -->
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <h2>Vendors</h2>

              </div>
              <div>
                <!-- button -->
                <a href="" class="btn btn-primary btn-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                       class="bi bi-grid" viewBox="0 0 16 16">
                    <path
                            d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z" />
                  </svg>
                </a>
                <a href="" class="btn btn-light  btn-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                       class="bi bi-list-task" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                          d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z" />
                    <path
                            d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z" />
                    <path fill-rule="evenodd"
                          d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z" />
                  </svg>
                </a>
              </div>

            </div>
          </div>
        </div>
        <!-- row -->
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 g-lg-6">
        <c:forEach items="${it}" var="items">
          <!-- col -->
          <div class="col">
            <!-- card -->
            <div class="card border-0 text-center card-lg">
              <div class="card-body p-6">
                <div>
                  <!-- img -->
                  <img src="${BASE_URL}assets/images/stores-logo/stores-logo-1.svg" alt=""
                       class="rounded-circle icon-shape icon-xxl mb-6">
                  <!-- content -->
                  <h2 class="mb-2 h5"><a href="#!" class="text-inherit">${items.first_name} ${items.last_name}</a></h2>
                  <div class="mb-2">Seller ID: #${items.id}</div>
                  <div>${items.email}</div>
                </div>
                <!-- meta content -->
                <div class="row justify-content-center mt-8">
                  <div class="col">
                    <div>Gross Sale</div>
                    <h5 class="mb-0 mt-1">$200.00</h5>
                  </div>
                  <div class="col">
                    <div>Earning</div>
                    <h5 class="mb-0 mt-1">$200.00</h5>
                  </div>

                </div>


              </div>
            </div>
          </div>
        </c:forEach>


        </div>
      </div>

    </main>

  </layout:put>
</layout:extends>