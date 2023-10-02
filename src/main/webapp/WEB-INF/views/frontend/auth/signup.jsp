<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<layout:extends name="auth_base">
    <layout:put block="content">
        <!-- navigation -->
        <div class="border-bottom shadow-sm">
            <nav class="navbar navbar-light py-2">
                <div class="container justify-content-center justify-content-lg-between">
                    <a class="navbar-brand" href="${BASE_URL}">
                        <img src="${BASE_URL}assets/images/logo/freshcart-logo.svg" alt=""
                             class="d-inline-block align-text-top">
                    </a>
                    <span class="navbar-text">
        Already have an account? <a href="${BASE_URL}signin">Sign in</a>
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
                            <img src="${BASE_URL}assets/images/svg-graphics/signup-g.svg" alt="" class="img-fluid">
                        </div>
                        <!-- col -->
                        <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
                            <div class="mb-lg-9 mb-5">
                                <h1 class="mb-1 h2 fw-bold">Get Start Shopping</h1>
                                <p>Welcome to FreshCart! Enter your email to get started.</p>
                            </div>
                            <!-- form -->
                            <form>
                                <div class="row g-3">
                                    <!-- col -->
                                    <div class="col">
                                        <!-- input --><input type="text" id="fname" class="form-control"
                                                             placeholder="First name" aria-label="First name"
                                                             required>
                                    </div>
                                    <div class="col">
                                        <!-- input --><input type="text" id="lname" class="form-control"
                                                             placeholder="Last name" aria-label="Last name"
                                                             required>
                                    </div>
                                    <div class="col-12">

                                        <!-- input --><input type="email" class="form-control" id="email"
                                                             placeholder="Email" required>
                                    </div>
                                    <div class="col-12">

                                        <div class="password-field position-relative">
                                            <input type="password" id="password" placeholder="Enter Password"
                                                   class="form-control" required>
                                            <span><i id="passwordToggler" class="bi bi-eye-slash"></i></span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                            <%--                                       <div class="form-check">--%>
                                            <%--                                           <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1">--%>
                                            <%--                                           <!-- label --> <label class="form-check-label" for="flexCheckDefault1">--%>
                                            <%--                                           I am a Customer--%>
                                            <%--                                       </label>--%>
                                            <%--                                       </div>--%>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                   id="flexCheckDefault2">
                                            <!-- label --> <label class="form-check-label" for="flexCheckDefault2">
                                            I am a Seller
                                        </label>
                                        </div>
                                    </div>
                                    <!-- btn -->
                                    <div class="col-12 d-grid ">
                                        <a class="btn btn-primary sign-up">Register</a>
                                    </div>

                                    <!-- text -->
                                    <p><small>By continuing, you agree to our <a href="#!"> Terms of Service</a> & <a
                                            href="#!">Privacy
                                        Policy</a></small></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            </section>
        </main>

    </layout:put>
    <layout:put block="script">
        <script type="text/javascript">
            document.getElementsByClassName('sign-up').item(0).addEventListener('click', () => {
                let email = document.getElementById('email').value;
                let fname = document.getElementById('fname').value;
                let lname = document.getElementById('lname').value;
                let password = document.getElementById('password').value;
                let radiobtn = document.getElementById('flexCheckDefault2');
                let type;
                if(radiobtn.checked){
                    type= "seller";
                }else{
                    type="customer";
                }
                fetch('${BASE_URL}register', {
                    method: 'post',
                    headers: {
                        'Content-Type':'application/json'
                    },
                    body: JSON.stringify({
                        email: email,
                        fname: fname,
                        lname: lname,
                        password: password,
                        type:type,
                    })
                }).then(response => response.text())
                    .then(text => alert(text));
            });
        </script>
    </layout:put>
</layout:extends>