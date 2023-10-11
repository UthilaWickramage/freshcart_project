<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="vendor_base">
    <layout:put block="content">
        <main class="main-content-wrapper">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row mb-8">
                    <div class="col-md-12">
                        <div class="d-md-flex justify-content-between align-items-center">
                            <!-- page header -->
                            <div>
                                <h2>Add New Product</h2>
                                <!-- breacrumb -->

                            </div>
                            <!-- button -->
                            <div>
                                <a href="${BASE_URL}products" class="btn btn-light">Back to Product</a>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- row -->
                <div class="row">

                    <div class="col-lg-8 col-12">
                        <!-- card -->
                        <div class="card mb-6 card-lg">
                            <!-- card body -->
                            <div class="card-body p-6 ">
                                <h4 class="mb-4 h5">Product Information</h4>
                                <div class="row">
                                    <!-- input -->
                                    <div class="mb-3 col-lg-6">
                                        <label class="form-label">Title</label>
                                        <input type="text" class="form-control" placeholder="Product Name" id="name"
                                               required>
                                    </div>
                                    <!-- input -->
                                    <div class="mb-3 col-lg-6">
                                        <label class="form-label">Product Category</label>
                                        <select class="form-select" id="category">
                                            <option selected>Product Category</option>
                                            <c:forEach items="${it}" var="items">
                                                <option value="${items.id}"><c:out
                                                        value="${items.name}"></c:out></option>
                                            </c:forEach>


                                        </select>
                                    </div>
                                    <!-- input -->
                                    <div class="mb-3 col-lg-6">
                                        <label class="form-label">Weight</label>
                                        <input type="text" class="form-control" id="weight" placeholder="Weight"
                                               required>
                                    </div>
                                    <!-- input -->
                                    <div class="mb-3 col-lg-6">
                                        <label class="form-label">Units</label>
                                        <select class="form-select" id="units">
                                            <option selected>Select Units</option>
                                            <option value="Grams">Grams</option>
                                            <option value="Kilo Grams">Kilo Grams</option>
                                            <option value="Milli Litres">Milli Litres</option>
                                            <option value="Litres">Litres</option>
                                        </select>
                                    </div>
                                    <div>
                                        <div class="mb-3 col-lg-12 mt-5">
                                            <!-- heading -->
                                            <h4 class="mb-3 h5">Product Images</h4>

                                            <!-- input -->
                                            <div class="mb-4 d-flex">
                                                <div class="position-relative">
                                                    <img class="image  icon-shape icon-xxxl bg-light rounded-4"
                                                         src="${BASE_URL}assets/images/icons/bakery.svg" alt="Image">

                                                    <div class="file-upload position-absolute end-0 top-0 mt-n2 me-n1">
                                                        <input type="file" class="file-input" id="file-input">
                                                        <span class="icon-shape icon-sm rounded-circle bg-white">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                                                     fill="currentColor" class="bi bi-pencil-fill text-muted"
                                                     viewBox="0 0 16 16">
                                                    <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                                                  </svg>
                                                </span>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <!-- input -->
                                    <div class="mb-3 col-lg-12 mt-5">
                                        <h4 class="mb-3 h5">Product Descriptions</h4>
                                        <div class="py-8 d-grid">
                                            <textarea class="form-control" id="editor" cols="10"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-4 col-12">
                        <!-- card -->
                        <div class="card mb-6 card-lg">
                            <!-- card body -->
                            <div class="card-body p-6">
                                <!-- input -->

                                <!-- input -->
                                <div>

                                    <!-- input -->
                                    <div class="mb-3">
                                        <label class="form-label">Brand</label>
                                        <input type="text" class="form-control" id="brand"
                                               placeholder="Enter Brand">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Product Quantity</label>
                                        <input type="text" class="form-control" id="qty"
                                               placeholder="Enter Product Quantity">
                                    </div>
                                    <!-- input -->
                                    <div class="mb-3">
                                        <label class="form-label" id="productSKU">Status</label><br>
                                        <select class="form-select" id="status">
                                            <option value="status" selected>Status</option>
                                            <option value="Active">Active</option>
                                            <option value="Inactive">Inactive</option>
                                        </select>

                                        <!-- input -->

                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- card -->
                        <div class="card mb-6 card-lg">
                            <!-- card body -->
                            <div class="card-body p-6">
                                <h4 class="mb-4 h5">Product Price</h4>
                                <!-- input -->
                                <div class="mb-3">
                                    <label class="form-label">Regular Price</label>
                                    <input type="text" id="r-price" class="form-control" placeholder="$0.00">
                                </div>
                                <!-- input -->
                                <div class="mb-3">
                                    <label class="form-label">Sale Price</label>
                                    <input type="text" id="s-price" class="form-control" placeholder="$0.00">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Shipping Price</label>
                                    <input type="text" id="ship-price" class="form-control" placeholder="$0.00">
                                </div>

                            </div>
                        </div>
                        <!-- card -->

                        <!-- button -->
                        <div class="d-grid">
                            <a href="#" class="btn btn-primary create-product">
                                Create Product
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </main>
    </layout:put>
    <layout:put block="script">
        <script type="text/javascript">
            document.getElementsByClassName('create-product').item(0).addEventListener('click', () => {

                let form = new URLSearchParams()

                let file = document.getElementById('file-input').files[0];
                let title = document.getElementById('name').value;
                let desc = document.getElementById('editor').value;
                let brand = document.getElementById('brand').value;
                let category = document.getElementById('category').value;
                let weight = document.getElementById('weight').value;
                let units = document.getElementById('units').value;
                let qty = document.getElementById('qty').value;
                let r_price = document.getElementById('r-price').value;
                let s_price = document.getElementById('s-price').value;
                let ship_price = document.getElementById('ship-price').value;
                let status = document.getElementById('status').value;


                form.append("title", title);
                form.append("desc", desc);
                form.append("category", category);
                form.append("weight", weight);
                form.append("units", units);
                form.append("r_price", r_price);
                form.append("s_price", s_price);
                form.append("brand", brand);
                form.append("file", file)
                form.append("status", status)
                form.append("ship_price",ship_price);
                form.append("qty",qty);



                let options = {
                    method: 'post',
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                    body: form,
                }
                    secureFetch('${BASE_URL}vendor/add-product',options)
                    .then(response => response.text())
                    .then(text => console.log(text));

            });


        </script>
    </layout:put>
</layout:extends>