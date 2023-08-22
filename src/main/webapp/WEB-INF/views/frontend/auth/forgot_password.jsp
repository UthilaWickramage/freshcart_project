<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<layout:extends name="auth_base">
  <layout:put block="content">
    <div class="border-bottom shadow-sm">
      <nav class="navbar navbar-light py-2">
        <div class="container justify-content-center justify-content-lg-between">
          <a class="navbar-brand" href="../index.html">
            <img src="${BASE_URL}assets/images/logo/freshcart-logo.svg" alt="" class="d-inline-block align-text-top">
          </a>
          <span class="navbar-text">
        No Account yet?  <a href="${BASE_URL}register">Register</a>
      </span>
        </div>
      </nav>
    </div>


    <main>
      <!-- section -->
      <section class="my-lg-14 my-8">
        <!-- container -->
        <div class="container">
          <!-- row -->
          <div class="row justify-content-center align-items-center">
            <div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
              <!-- img -->
              <img src="${BASE_URL}assets/images/svg-graphics/fp-g.svg" alt="" class="img-fluid">
            </div>
            <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1 d-flex align-items-center">
              <div>
                <div class="mb-lg-9 mb-5">
                  <!-- heading -->
                  <h1 class="mb-2 h2 fw-bold">Forgot your password?</h1>
                  <p>Please enter the email address associated with your account and We will email you a link to reset your
                    password.</p>
                </div>
                <!-- form -->
                <form>
                  <!-- row -->
                  <div class="row g-3">
                    <!-- col -->
                    <div class="col-12">
                      <!-- input -->
                      <input type="email" class="form-control" id="inputEmail4" placeholder="Email" required>
                    </div>

                    <!-- btn -->
                    <div class="col-12 d-grid gap-2"> <button type="submit" class="btn btn-primary">Reset Password</button>
                      <a href="${BASE_URL}signin" class="btn btn-light">Back</a>
                    </div>


                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>


      </section>
    </main>
  </layout:put>
</layout:extends>