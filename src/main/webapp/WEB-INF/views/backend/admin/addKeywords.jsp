<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="admin_base">
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
                                <h2>Keywords</h2>
                                <!-- breacrumb -->

                            </div>
                            <!-- button -->

                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-xl-12 col-12 mb-5">
                        <!-- card -->
                        <div class="card card-lg">
                            <div class="px-6 py-6 ">
                                <div class="row">
                                    <div class="col-lg-8 col-md-10 col-12 mb-2">
                                        <!-- form -->
                                        <div class="d-flex">
                                            <input class="form-control me-5" type="text" id="name"
                                                   placeholder="Enter Name">
                                            <input class="form-control me-5" type="text" id="value"
                                                   placeholder="Enter Value">
                                            <a href="#" class="btn btn-primary save-btn">Save </a>
                                        </div>
                                    </div>
                                    <!-- select option -->

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

                                            <th>Name</th>
                                            <th>Value</th>
                                            <th>Action</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${it.appSettings}" var="items">
                                            <tr>

                                                <td>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value=""
                                                               id="categoryOne">
                                                        <label class="form-check-label" for="categoryOne">

                                                        </label>
                                                    </div>
                                                </td>

                                                <td>${items.name}</td>
                                                <td>${items.value}</td>


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
    <layout:put block="script">
        <script>
            document.getElementsByClassName('save-btn').item(0).addEventListener('click', () => {

                let name = document.getElementById("name").value;
                let value = document.getElementById("value").value;

                let formData = new URLSearchParams();
                formData.append("name", name);
                formData.append("value", value);
                secureFetch('${BASE_URL}admin/keywords', {
                    method: 'post',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: formData
                }).then(response => {
                    if (!response.ok) {
                        alert(response.json())
                    } else {
                        window.location.href = '${BASE_URL}admin/keywords'
                    }

                }).then(json => {
                    alert(json.text())
                })
            })
        </script>
    </layout:put>
</layout:extends>