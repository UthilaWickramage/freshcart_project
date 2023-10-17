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

                        <!-- col -->
                        <jsp:include page="../include/account_menu.jsp"/>
                        <div class="col-lg-9 col-md-8 col-12">
                            <div class="py-6 p-md-6 p-lg-10">
                                <div class="mb-6">
                                    <!-- heading -->
                                    <h2 class="mb-0">Account Setting</h2>
                                </div>
                                <div>
                                    <!-- heading -->
                                    <h5 class="mb-4">Account details</h5>
                                    <div class="row">
                                        <div class="col-lg-5">
                                            <!-- form -->
                                            <c:set value="${it}" var="user" scope="page"/>
                                            <form>
                                                <!-- input -->
                                                <div class="mb-3">
                                                    <label class="form-label">Name</label>
                                                    <input type="text" disabled
                                                           value="${user.first_name} ${user.last_name}"
                                                           class="form-control">
                                                </div>
                                                <!-- input -->
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input disabled type="email" value="${user.email}"
                                                           class="form-control" placeholder="example@gmail.com">
                                                </div>
                                                <!-- input -->
                                                <div class="mb-5">
                                                    <label class="form-label">Phone</label>
                                                    <input type="text" class="form-control" id="mobile"
                                                           value="${user.mobile}" placeholder="Phone number">
                                                </div>
                                                <!-- button -->
                                                <div class="mb-3">
                                                    <button class="btn btn-primary " id="save-btn">Save Details</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                                <hr class="my-10">
                                <div class="pe-lg-14">
                                    <!-- heading -->
                                    <h5 class="mb-4">Password</h5>
                                    <form class=" row row-cols-1 row-cols-lg-2">
                                        <!-- input -->
                                        <div class="mb-3 col">
                                            <label class="form-label">Current Password</label>
                                            <input type="password" id="current" class="form-control"
                                                   placeholder="**********">
                                        </div>
                                        <!-- input -->
                                        <div class="mb-3 col">
                                            <label class="form-label">New Password</label>
                                            <input type="password" id="new" class="form-control"
                                                   placeholder="**********">
                                        </div>
                                        <!-- input -->
                                        <div class="col-12">
                                            <p class="mb-4">Cannot remember your current password?<a href="#"> Reset
                                                your password.</a></p>
                                            <a href="#" class="btn btn-primary" id="save-password">Save Password</a>
                                        </div>
                                    </form>
                                </div>
                                <hr class="my-10">
                                <div>
                                    <!-- heading -->
                                    <h5 class="mb-4">Delete Account</h5>
                                    <p class="mb-2">Would you like to delete your account?</p>
                                    <p class="mb-5">This account contain 12 orders, Deleting your account will remove
                                        all the order details
                                        associated with it.</p>
                                    <!-- btn -->
                                    <a href="#" class="btn btn-outline-danger">I want to delete my account</a>
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
                let mobile = document.getElementById("mobile").value;
                let formData = new URLSearchParams();
                formData.append("mobile", mobile);

                let options = {
                    method: 'put',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: formData,
                }
                    secureFetch('${BASE_URL}account-settings',options).then(response => response.text()).then(text => alert(text))


            })

            document.getElementById('save-password').addEventListener('click', () => {

                let form = new URLSearchParams()
                form.append("new", document.getElementById('new').value)
                form.append("current", document.getElementById('current').value)
                    let options={
                        method:'post',
                        headers:{
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body:form,
                    }
                    secureFetch('${BASE_URL}api/account-settings',options)
                    .then(response=>response.text()).then(text=>alert(text))
            })
        </script>
    </layout:put>
</layout:extends>