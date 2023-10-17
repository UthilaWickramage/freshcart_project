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

                                    <!-- input -->
                                    <div class="mb-3 col-lg-12 mt-5">
                                        <h4 class="mb-3 h5">Product Descriptions</h4>
                                        <div class="py-8 d-grid">
                                            <textarea class="form-control" id="editor" cols="10"></textarea>
                                        </div>
                                        <h4 class="mb-5 h5">Category Image</h4>
                                        <div class="d-grid"  id="image-dev" style="max-width: 400px">
                                            <input type="file" multiple class="" style="display:none" id="customFiles">
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
            $('#image-dev').spartanMultiImagePicker({
                fieldName: 'files[]',
                maxCount: 6,
            })
            document.getElementsByClassName('create-product').item(0).addEventListener('click', () => {

                let title = document.getElementById('name').value;
                let desc = document.getElementById('editor').value;
                let brand = document.getElementById('brand').value;
                let id = document.getElementById('category').value;
                let weight = document.getElementById('weight').value;
                let units = document.getElementById('units').value;
                let qty = document.getElementById('qty').value;
                let r_price = document.getElementById('r-price').value;
                let s_price = document.getElementById('s-price').value;
                let ship_price = document.getElementById('ship-price').value;

                let options = {
                    method: 'post',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        title:title,
                        desc:desc,
                        brand:brand,
                        id:id,
                        weight:weight,
                        units:units,
                        qty:qty,
                        r_price:r_price,
                        s_price:s_price,
                        ship_price:ship_price,
                    })
                }
                    secureFetch('${BASE_URL}vendor/api/add_product',options)
                        .then(response => response.json())
                        .then(data => {
                            console.log(data);
                            uploadImage(data.pid)
                        });

            });

            function uploadImage(id){
                let formData = new FormData();
                let inputs = document.querySelectorAll('input[type=file]');
                inputs.forEach((input, index) => {
                    if (index !== 0 && index !== inputs.length - 1) {
                        let file = input.files[0];
                        formData.append("files[]", file);
                    }
                })
                alert(inputs.length)
                alert(id)
                secureFetch('${BASE_URL}vendor/api/add_product/'+id+'/upload-image',{
                    method:'post',
                    body:formData,
                }).then( response =>{
                    if(!response.ok){
                        alert(response.text())
                    }
                    response.json()
                }).then(data=>{
                    console.log(data)
                    <%--window.location.href = '${BASE_URL}admin/categories';--%>
                })
            }


        </script>
    </layout:put>
</layout:extends>