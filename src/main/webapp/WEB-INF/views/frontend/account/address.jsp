<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="base">
  <layout:put block="content">
    <main>
      <!-- section -->
      <section>
        <!-- container -->
        <div class="container">
          <!-- row -->
          <div class="row">
            <!-- col -->
<jsp:include page="../include/account_menu.jsp"/>
            <div class="col-lg-9 col-md-8 col-12">
              <div class="py-6 p-md-6 p-lg-10">
                <div class="d-flex justify-content-between mb-6">
                  <!-- heading -->
                  <h2 class="mb-0">Address</h2>
                  <!-- button -->

                </div>
                <div class="row">
                  <!-- col -->
                  <div class="col-lg-5 col-xxl-4 col-12 mb-4">
                    <!-- form -->
                    <div class="card">
                      <div class="card-body p-6">
                        <div class="form-check mb-4">
                          <input class="form-check-input" type="radio" name="flexRadioDefault" id="homeRadio" checked>
                          <label class="form-check-label text-dark fw-semi-bold" for="homeRadio">
                            Home
                          </label>
                        </div>
                        <c:set var="user" scope="page" value="${it}"/>
                        <!-- address -->
                        <p class="mb-6">${user.first_name} ${user.last_name}<br>

                          ${user.address}, <br>

                          ${user.city},<br>

                          ${user.post_code}</p>
                        <!-- btn -->
                        <a href="#" class="btn btn-info btn-sm">Default address</a>

                      </div>
                    </div>
                  </div>
                  <div class="col-lg-7">
                    <form>
                      <!-- input -->
                      <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input type="text" id="address"
placeholder="enter address"
                               class="form-control">
                      </div>
                      <!-- input -->
                      <div class="mb-3">
                        <label class="form-label">City</label>
                        <input type="email" id="city"
                               class="form-control" placeholder="enter city">
                      </div>
                      <!-- input -->
                      <div class="mb-5">
                        <label class="form-label">Post Code</label>
                        <input type="text" class="form-control" id="post_code"
                               placeholder="enter post code">
                      </div>
                      <!-- button -->
                      <div class="mb-3">
                        <button class="btn btn-primary " id="save-btn">Save Details</button>
                      </div>
                    </form>

                  </div>

                </div>

              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  </layout:put>
  <layout:put block="script">
<script>
  document.getElementById('save-btn').addEventListener('click', () => {
    let address = document.getElementById("address").value;
    let city = document.getElementById("city").value;
    let post_code = document.getElementById("post_code").value;
    let formData = new URLSearchParams();
    formData.append("address", address);
    formData.append("city", city);
    formData.append("post_code", post_code);

    let options = {
      method: 'put',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: formData,
    }
    secureFetch('${BASE_URL}api/account-addresses',options).then(response => response.text()).then(text => alert(text))


  })
</script>
  </layout:put>
</layout:extends>