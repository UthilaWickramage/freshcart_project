<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<layout:extends name="auth_base">
    <layout:put block="content">

        <!-- navigation -->
        <div class="border-bottom shadow-sm">
            <nav class="navbar navbar-light py-2">
                <div class="container justify-content-center justify-content-lg-between">
                    <a class="navbar-brand" href="/">
                        <img src="${BASE_URL}assets/images/logo/freshcart-logo.svg" alt=""
                             class="d-inline-block align-text-top">
                    </a>
                    <span class="navbar-text">
                        No Account yet? <button onclick=clicked()>Register</button>
                    </span>
                </div>
            </nav>
        </div>

        <main>
            <!-- section -->
            <section class="my-lg-14 my-8">
                <div class="container">
                    <!-- row -->
                    <div class="row justify-content-center align-items-center">
                        <div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
                            <!-- img -->
                            <img src="${BASE_URL}assets/images/svg-graphics/signin-g.svg" alt="" class="img-fluid">
                        </div>
                        <!-- col -->
                        <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
                            <div class="mb-lg-9 mb-5">
                                <h1 class="mb-1 h2 fw-bold">Sign in to FreshCart</h1>
                                <p>Welcome back to FreshCart! Enter your email to get started.</p>
                            </div>

                            <form>
                                <div class="row g-3">
                                    <!-- row -->

                                    <div class="col-12">
                                        <!-- input -->
                                        <input type="email" class="form-control" id="email" placeholder="Email"
                                               required>
                                    </div>
                                    <div class="col-12">
                                        <!-- input -->
                                        <div class="password-field position-relative">
                                            <input type="password" id="password" placeholder="Enter Password"
                                                   class="form-control" required>
                                            <span><i id="passwordToggler" class="bi bi-eye-slash"></i></span>
                                        </div>

                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <!-- form check -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                   id="flexCheckDefault">
                                            <!-- label --> <label class="form-check-label" for="flexCheckDefault">
                                            Remember me
                                        </label>
                                        </div>
                                        <div> Forgot password? <a href="${BASE_URL}forgotPassword">Reset It</a></div>
                                    </div>
                                    <!-- btn -->
                                    <div class="col-12 d-grid">
                                        <button type="submit" class="btn btn-primary sign_in">Sign In</button>
                                    </div>
                                    <!-- link -->
                                    <div>Do not have an account? <a href="${BASE_URL}register"> Sign Up</a></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>

        </main>


    </layout:put>
    <layout:put block="script">
        <%--        <script type="text/javascript">--%>
        <%--            window.addEventListener('load', function () {--%>
        <%--                navigator--%>
        <%--                    .serviceWorker--%>
        <%--                    .register(interceptor())--%>
        <%--                    .then(function (registration) {--%>
        <%--                        console.log('Service worker registered with scope: ', registration.scope);--%>
        <%--                    }, function (err) {--%>
        <%--                        console.log('ServiceWorker registration failed: ', err);--%>
        <%--                    });--%>
        <%--            });--%>
        <%--            function interceptor(){--%>
        <%--                self.addEventListener('fetch', function (event) {--%>
        <%--                    event.respondWith(async function () {--%>
        <%--                        let headers = new Headers()--%>
        <%--                        headers.append("X-Custom-Header", `Authorization:Bearer ${localStorage.getItem("accessToken")}`)--%>
        <%--                        return fetch(event.request, {headers: headers})--%>
        <%--                    }());--%>
        <%--                })}--%>
        <%--        </script>--%>
        <script type="text/javascript">
            function clicked() {
                let token = localStorage.getItem("accessToken")

                fetch('${BASE_URL}register', {
                    method: 'get',

                    headers: {
                        'Authorization': 'Bearer ' + token,

                        'Content-Type': 'application/json',
                        'Accept': 'application/json',

                    },

                }).then(response => response.text())
                    .then(text => {

                        console.log(text)

                    })
                    .catch(e => {
                        alert(e)

                    });
            }


            document.getElementsByClassName('sign_in').item(0).addEventListener('click', () => {
                let token = localStorage.getItem("accessToken")
                let email = document.getElementById('email').value;
                let password = document.getElementById('password').value;
                fetch('${BASE_URL}signin', {
                    method: 'post',

                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json',

                    },
                    body: JSON.stringify({
                        email: email,
                        password: password
                    })
                }).then(async response => {
                    if(!response.ok){
                        alert(response.text())
                    }else{
                        return response.json()
                    }

                })
                    .then(json => {

                        localStorage.setItem("accessToken", json.accessToken)
                        localStorage.setItem("refreshToken", json.refreshToken)
                        localStorage.setItem("expireIn", json.expireIn);
                        alert("signin successfull")
                        document.location.href = "${BASE_URL}home";
                    })
                    .catch(e => {
                        alert(e)

                    });
            });
        </script>
    </layout:put>
</layout:extends>