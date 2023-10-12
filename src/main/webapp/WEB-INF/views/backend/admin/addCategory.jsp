<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<layout:extends name="admin_base">
    <layout:put block="content">
        <!-- main -->
        <main class="main-content-wrapper">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row mb-8">
                    <div class="col-md-12">
                        <div class="d-md-flex justify-content-between align-items-center">
                            <!-- page header -->
                            <div>
                                <h2>Add New Category</h2>
                                <!-- breacrumb -->

                            </div>
                            <div>
                                <a href="${BASE_URL}admin_categories" class="btn btn-light">Back to Categories</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-12">
                        <!-- card -->
                        <div class="card mb-6 shadow border-0">
                            <!-- card body -->
                            <div class="card-body p-6 ">

                                <h4 class="mb-4 h5 mt-5">Category Information</h4>

                                <div class="row">
                                    <!-- input -->
                                    <div class="mb-3 col-lg-6">
                                        <label class="form-label">Category Name</label>
                                        <input type="text" class="form-control" id="name" placeholder="Category Name"
                                               required>
                                    </div>
                                    <!-- input -->
                                    <div class="mb-3 col-lg-6">
                                        <label class="form-label">Slug</label>
                                        <input type="text" class="form-control" id="slug" placeholder="Slug" required>
                                    </div>
                                    <!-- input -->

                                    <div class="mb-3 col-lg-12 ">
                                        <label class="form-label">Descriptions</label>

                                        <div class="py-8 d-grid">
                                            <textarea class="form-control" id="editor" cols="10"></textarea>
                                        </div>
                                    </div>

                                    <!-- input -->
                                    <div class="mb-3 col-lg-12 ">
                                        <label class="form-label" id="productSKU">Status</label><br>
                                        <select class="form-select" id="status">
                                            <option value="status" selected>Status</option>
                                            <option value="Active">Active</option>
                                            <option value="Inactive">Inactive</option>
                                        </select>

                                    </div>

                                    <div class="col-lg-12">

                                        <a href="#" class="btn btn-secondary ms-2 category-btn">
                                            Save
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h4 class="mb-5 h5">Category Image</h4>
                        <div class="card" id="image-dev">
                            <input type="file" multiple class="custom-file-input" style="display:none" id="customFiles">
                        </div>
                    </div>


                </div>
            </div>
        </main>
    </layout:put>
    <layout:put block="script">
        <script>
            $('#image-dev').spartanMultiImagePicker({
                fieldName: 'files[]',
                maxCount: 2,
            })
            document.getElementsByClassName('category-btn').item(0).addEventListener('click', () => {
                let title = document.getElementById('name').value;
                let desc = document.getElementById('editor').value;
                let slug = document.getElementById('slug').value;
                let options = {
                    method: 'post',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        title:title,
                        desc:desc,
                        slug:slug
                    }),
                }

                secureFetch('${BASE_URL}admin/api/add_category', options)
                    .then(response => response.json())
                    .then(data => {
                        console.log(data);
                        uploadImage(data.cid)
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
                secureFetch('${BASE_URL}admin/api/add_category/'+id+'/upload-image',{
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